import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:snam/app/AppLanguage.dart';
import 'package:snam/most_used/constants.dart';
import 'package:snam/most_used/common_methods.dart';
import 'package:snam/most_used/temp_changing_values.dart';
import 'package:snam/screens/forms/company_info_form.dart';
import 'package:snam/screens/forms/edit_personal_info_form.dart';
import 'package:snam/screens/temp_screens/login/login_page.dart';
import 'package:snam/screens/temp_screens/personal_info_page/edit_company_info_page.dart';
import 'package:snam/screens/temp_screens/personal_info_page/edit_personal_info_page.dart';
import 'package:snam/screens/temp_screens/requests/requests_page.dart';
import 'package:snam/screens/temp_screens/temp_main_page.dart';
import 'package:snam/screens/temp_screens/user_type_page/group_type_page.dart';
import 'package:snam/screens/temp_screens/wallet/wallet.dart';
import 'package:snam/utils/enums.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var divider = Divider(
      color: kBorderColor,
      thickness: 1,
    );
    return Container(
      width: screenWidth(context) * .554,
      child: Drawer(
        child: Container(
          color: kfillColor,
          child: Builder(builder: (context) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 16.0, vertical: 24),
                  child: IconButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    icon: Icon(
                      Icons.close,
                      size: getRelativeWidth(30),
                    ),
                  ),
                ),
                _buildDrawerItem(
                    imagePath: 'assets/icons/home.png',
                    text: tr(context).home,
                    onTap: () {
                      nv(context).pop();
                      nv(context)
                          .pushReplacement(pageTransition(context, MainPage()));
                    }),
                divider,
                _buildDrawerItem(
                  imagePath: 'assets/icons/profile.png',
                  text: tr(context).personalFile,
                  onTap: () {
                    nv(context).pop();
                    // nv(context).push(pageTransition(
                    //     context,
                    //     GroupTypePage(
                    //       isFromEditPage: true,
                    //     )));

                    if (kpCurrentUser == CurrentUser.landOwner) {
                      nv(context)
                          .push(pageTransition(context, PersonalInfoPage()));
                    } else {
                      nv(context)
                          .push(pageTransition(context, CompanyInfoPage()));
                    }
                  },
                ),
                divider,
                _buildDrawerItem(
                  imagePath: 'assets/icons/order.png',
                  text: tr(context).requests,
                  onTap: () {
                    nv(context).pop();
                    nv(context).pushReplacement(
                        pageTransition(context, RequestsPage()));
                  },
                ),
                divider,
                _buildDrawerItem(
                  imagePath: 'assets/icons/my_wallet.png',
                  text: tr(context).wallet,
                  onTap: () {
                    nv(context).pop();
                    nv(context)
                        .pushReplacement(pageTransition(context, WalletPage()));
                  },
                ),
                divider,
                _buildDrawerItem(
                  imagePath: 'assets/icons/logout.png',
                  text: tr(context).logout,
                  onTap: () {
                    nv(context).pop();
                    Navigator.of(context).popUntil((route) => route.isFirst);
                    nv(context)
                        .pushReplacement(pageTransition(context, LoginPage()));
                  },
                ),
                // divider,
                // _buildDrawerItem(
                //   imagePath: 'assets/icons/profile.png',
                //   text: kpCurrentUser == CurrentUser.landOwner
                //       ? tr(context).company
                //       : tr(context).landOwner,
                //   onTap: () {
                //     // kpCurrentUser == CurrentUser.landOwner
                //     //     ? kpCurrentUser = CurrentUser.company
                //     //     : kpCurrentUser = CurrentUser.landOwner;
                //     nv(context).pushReplacement(pageTransition(
                //         context,
                //         GroupTypePage(
                //           isFromEditPage: true,
                //         )));
                //   },
                // ),
                divider,
                // _buildDrawerItem(
                //     imagePath: 'assets/icons/logout.png',
                //     text: tr(context).language,
                //     onTap: () {
                //       // nv(context).pop();
                //       Provider.of<AppLanguage>(context, listen: false)
                //           .toggleLang();
                //     }),
                // divider,
              ],
            );
          }),
        ),
      ),
    );
  }

  Material _buildDrawerItem(
      {required String imagePath,
      required String text,
      required void Function() onTap}) {
    return Material(
      color: kfillColor,
      child: InkWell(
        // highlightColor: kBorderColor,
        // overlayColor: MaterialStateProperty.all(Colors.red),
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(8.3),
          child: Row(
            children: [
              Image.asset(
                imagePath,
                height: getRelativeWidth(24),
                width: getRelativeWidth(24),
              ),
              kmediamHorizontalSpace,
              Text(
                text,
                style:
                    txDrawerTitleStyle.copyWith(fontSize: getRelativeWidth(15)),
              )
            ],
          ),
        ),
      ),
    );
  }
}
