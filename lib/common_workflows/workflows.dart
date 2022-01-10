import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:snam/dialogs/password_dialog.dart';
import 'package:snam/dialogs/phone_verified_dialog.dart';
import 'package:snam/most_used/common_methods.dart';
import 'package:snam/bottom_sheets/otp_1.dart';
import 'package:snam/bottom_sheets/otp_2.dart';
import 'package:snam/bottom_sheets/reset_password.dart';

class Workflows {
  //will emit 0 for nothing, 1 for did not change, 2 for changed Successfully
  static ValueNotifier<int> changePasswordNotifier = ValueNotifier<int>(0);

  static Future<bool> confirmPhoneOrPassword(BuildContext context,
      {required bool forPassword}) async {
    // bool confirmed;

    var _phoneVerified = await buildBottomSheet<bool>(
      context: context,
      child: EnterOTP(),
      backgroundColor: Colors.white,
    );

    if (_phoneVerified == null || _phoneVerified == false) return false;

    //now after here _phoneVerified is true

    if (!forPassword) {
      //now this is not forPassword and _phoneVerified is true

      await showDialog(
          context: context,
          builder: (context) {
            return PhoneVerifiedDialog();
          });

      return true;
    }

    //now after this forPassword is true
    bool? _chagedPassword = await buildBottomSheet<bool>(
        context: context,
        child: ResetPassword(),
        backgroundColor: Colors.white);

    //to close enter phone for verification bottomSheet
    //assuming every password change started from PhoneOtp
    if (forPassword) nv(context).pop();

    if (_chagedPassword == true) {
      //show success massage in login page
      changePasswordNotifier.value = 1;
      await Future.delayed(Duration(seconds: 2));
      changePasswordNotifier.value = 0;
    } else {
      //show failed massage in login page
      changePasswordNotifier.value = 2;
      await Future.delayed(Duration(seconds: 2));
      changePasswordNotifier.value = 0;
    }

    // await showDialog(
    //     context: context,
    //     builder: (context) {
    //       return PasswordChangedDialog();
    //     });

    return true;
  }
}
