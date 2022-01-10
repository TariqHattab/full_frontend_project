import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:snam/app/AppLanguage.dart';
import 'package:snam/most_used/constants.dart';
import 'package:snam/screens/components/badge.dart';
import 'package:snam/most_used/common_methods.dart';

class CustomAppBar extends AppBar {
  final String pageTitle;
  final bool showLeadingButton;
  final bool showActions;
  final Widget? backButton;

  CustomAppBar({
    Key? key,
    required this.pageTitle,
    this.showLeadingButton = true,
    this.showActions = true,
    this.backButton,
  }) : super(
          key: key,
          titleSpacing: 0,
          leading: showLeadingButton
              ? Builder(builder: (context) {
                  if (backButton != null) return backButton;
                  return IconButton(
                    onPressed: () => Scaffold.of(context).openDrawer(),
                    icon: Icon(
                      Icons.more_vert,
                      color: kprimaryTextColor,
                    ),
                  );
                })
              : null,
          title: Transform(
            // you can forcefully translate values left side using Transform
            transform: Matrix4.translationValues(0.0, 0.0, 0.0),

            child: Text(
              pageTitle,
              style: txPrimaryTitleTextStyle.copyWith(
                  fontSize: getRelativeWidth(23)),
            ),
          ),
          actions: showActions
              ? [
                  IconButton(
                    onPressed: () {},
                    // icon: Icon(Icons.notifications_none),
                    icon: Badge(
                      value: '2',
                      color: kBadgeColor,
                      child: Image.asset(
                        'assets/icons/notification.png',
                        width: getRelativeWidth(27),
                        height: getRelativeWidth(27),
                        color: kprimaryColor,
                      ),
                    ),
                  ),
                  Builder(builder: (context) {
                    return IconButton(
                      onPressed: () {
                        Provider.of<AppLanguage>(context, listen: false)
                            .toggleLang();
                      },
                      // icon: Icon(Icons.notifications_none),
                      icon: FittedBox(
                        child: AutoSizeText(
                          tr(context).langLetter,
                          // maxLines: 1,
                          // minFontSize: 2,
                          // maxFontSize: 32,
                          style: TextStyle(
                              color: kprimaryTextColor,
                              fontFamily: kpoppinsFontFamily,
                              fontWeight: FontWeight.bold,
                              fontSize: getRelativeWidth(20)),
                        ),
                      ),
                    );
                  }),
                ]
              : null,
          elevation: 0,
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: Colors.transparent,
            statusBarIconBrightness: Brightness.dark,
          ),
        );
}
