import 'package:flutter/material.dart';
import 'package:snam/common_workflows/workflows.dart';
import 'package:snam/custom_classes/phone_number.dart';
import 'package:snam/most_used/common_methods.dart';
import 'package:snam/most_used/constants.dart';
import 'package:snam/bottom_sheets/otp_2.dart';
import 'package:snam/bottom_sheets/reset_password.dart';

class PhoneOtp extends StatelessWidget {
  final int numberOfPagesToPop;

  const PhoneOtp({
    Key? key,
    this.numberOfPagesToPop = 3,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        top: 32,
        right: 32,
        left: 32,
        bottom: 32 + MediaQuery.of(context).viewInsets.bottom,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            tr(context).enterPhoneNum,
            style: txOTPTitleTextStyle,
          ),
          const SizedBox(
            height: 14,
          ),
          Text(
            tr(context).pleaseEnterPhone,
            style: txOTPBodyTextStyle,
          ),
          const SizedBox(
            height: 18,
          ),
          PhoneNumberFormField(
            numberOfPagesToPop: 3,
            toChangePassword: true,
          ),
          kextraBigVerticalSpace,
          kextraBigVerticalSpace,
          buildFormSubmitButton(
            context: context,
            buttonText: tr(context).confirm,
            onPressed: () =>
                Workflows.confirmPhoneOrPassword(context, forPassword: true),
          ),
        ],
      ),
    );
  }
}
