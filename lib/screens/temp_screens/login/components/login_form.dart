import 'package:flutter/material.dart';
import 'package:snam/most_used/common_methods.dart';
import 'package:snam/most_used/constants.dart';
import 'package:snam/screens/temp_screens/temp_main_page.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          buildTextFormField(
              labelText: tr(context).nationalIdintityNumber,
              image: getImgAsset(
                imgColor: kTextFieldIconColor,
                imgName: 'id',
              )),
          SizedBox(height: getRelativeWidth(24)),
          buildTextFormField(
              labelText: tr(context).password,
              image: getImgAsset(
                imgColor: kTextFieldIconColor,
                imgName: 'lock',
              )),
          SizedBox(height: getRelativeWidth(32)),
          buildFormSubmitButton(
            context: context,
            buttonText: tr(context).enter,
            onPressed: () {
              nv(context).pushReplacement(pageTransition(context, MainPage()));
            },
          ),
          SizedBox(height: getRelativeWidth(12)),
        ],
      ),
    );
  }
}
