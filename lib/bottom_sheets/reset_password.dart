import 'package:flutter/material.dart';
import 'package:snam/dialogs/password_dialog.dart';
import 'package:snam/most_used/common_methods.dart';
import 'package:snam/most_used/constants.dart';

class ResetPassword extends StatelessWidget {
  const ResetPassword({
    Key? key,
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
            tr(context).setPassword,
            style: txOTPTitleTextStyle,
          ),
          const SizedBox(
            height: 18,
          ),
          buildTextFormField(
              labelText: tr(context).password,
              image: getImgAsset(
                imgColor: kTextFieldIconColor,
                imgName: 'lock',
              )),
          kmediamVerticalSpace,
          buildTextFormField(
              labelText: tr(context).confirmPassword,
              image: getImgAsset(
                imgColor: kTextFieldIconColor,
                imgName: 'lock',
              )),
          kextraBigVerticalSpace,
          const SizedBox(
            height: 18,
          ),
          buildFormSubmitButton(
            context: context,
            buttonText: tr(context).confirm,
            onPressed: () {
              var passwordIsChanged = true;
              nv(context).pop(passwordIsChanged);
            },
          ),
          kmediamVerticalSpace,
        ],
      ),
    );
  }
}
