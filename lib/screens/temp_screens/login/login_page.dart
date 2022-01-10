import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:snam/most_used/common_methods.dart';
import 'package:snam/most_used/constants.dart';
import 'package:snam/bottom_sheets/otp_1.dart';
import 'package:snam/screens/temp_screens/user_type_page/user_type_page.dart';

import 'package:snam/screens/temp_screens/login/components/contacts.dart';
import 'package:snam/screens/temp_screens/login/components/forgat_password_notifier.dart';
import 'package:snam/screens/temp_screens/login/components/login_form.dart';
import 'package:snam/screens/temp_screens/login/components/login_logo.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      // Status bar brightness (optional)
      statusBarIconBrightness: Brightness.light, // For Android (dark icons)
      statusBarBrightness: Brightness.light, // For iOS (dark icons)
    ));
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            //-###-### Logo
            LoginLogo(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(height: getRelativeWidth(39)),
                  Text(
                    tr(context).signIn,
                    style: txLoginTextStyle.copyWith(
                        fontSize: getRelativeWidth(34)),
                  ),
                  SizedBox(height: getRelativeWidth(16)),

                  //-###-### changed The password
                  ForgatPasswordNotifier(),
                  SizedBox(height: getRelativeWidth(8)),

                  //-###-### formFields and button
                  LoginForm(),

                  //-###-### forgat The password
                  _buildForgetPassword(context),
                  SizedBox(height: getRelativeWidth(18)),

                  //-###-### new register
                  _buildNewRegister(context),
                  SizedBox(height: getRelativeWidth(60)),

                  //-###-### Contacts
                  Contacts(),
                  SizedBox(height: getRelativeWidth(19)),
                  //-###-### Terms of use
                  _buildTermsOfUse(context),
                  SizedBox(height: getRelativeWidth(32)),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  GestureDetector _buildTermsOfUse(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Text(
        tr(context).privacyAndTermsOfUse,
        style: txTermsOfUseTextStyle.copyWith(fontSize: 15),
      ),
    );
  }

  Container _buildNewRegister(BuildContext context) {
    return Container(
      height: getRelativeWidth(48),
      color: kfillColor,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            tr(context).noAccount,
            style: txMediamTextStyle.copyWith(
              fontSize: getRelativeWidth(15),
            ),
          ),
          SizedBox(width: getRelativeWidth(8)),
          GestureDetector(
            onTap: () =>
                nv(context).push(pageTransition(context, UserTypePage())),
            child: Text(
              tr(context).signUp,
              style: txMediamTextStyle.copyWith(
                fontSize: getRelativeWidth(15),
                color: kprimaryColor,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Align _buildForgetPassword(BuildContext context) {
    return Align(
        alignment: AlignmentDirectional.centerStart,
        child: GestureDetector(
          onTap: () => buildBottomSheet<bool>(
            context: context,
            child: PhoneOtp(),
            backgroundColor: Colors.white,
          ),
          child: Text(
            tr(context).forgetThePassword,
            style: txMediamTextStyle.copyWith(fontSize: getRelativeWidth(15)),
          ),
        ));
  }
}
