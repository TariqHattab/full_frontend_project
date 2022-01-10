import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:snam/most_used/common_methods.dart';
import 'package:snam/most_used/constants.dart';

class RegisteredDialog extends StatelessWidget {
  const RegisteredDialog({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      children: [
        Container(
          width: screenWidth(context) - 36,
          // decoration: BoxDecoration(
          //     // borderRadius: BorderRadius.circular(20)
          //     ),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 30),
          child: Column(
            children: [
              getImgAsset(imgName: 'timer', size: 150),
              kextraBigVerticalSpace,
              AutoSizeText(
                tr(context).registerRequestSent,
                textAlign: TextAlign.center,
                style: txOTPTitleTextStyle,
                maxLines: 2,
                minFontSize: 3,
              ),
              const SizedBox(
                height: 40,
              ),
              buildFormSubmitButton(
                context: context,
                onPressed: () => nv(context).pop(),
                buttonText: tr(context).agree,
              ),
            ],
          ),
        )
      ],
    );
  }
}
