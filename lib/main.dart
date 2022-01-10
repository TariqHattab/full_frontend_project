import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'package:snam/app/AppLanguage.dart';
import 'package:snam/most_used/constants.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:snam/most_used/temp_changing_values.dart';
import 'package:snam/screens/page_view.dart';
import 'package:snam/screens/temp_screens/login/login_page.dart';

import 'package:snam/screens/temp_screens/temp_main_page.dart';
import 'package:snam/utils/color_scheme.dart';
import 'package:snam/most_used/common_methods.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => AppLanguage(),
      builder: (context, _) => MaterialApp(
        debugShowCheckedModeBanner: false,
        locale: Provider.of<AppLanguage>(context).getAppLocal,
        supportedLocales: [
          const Locale('en'),
          const Locale('ar'),
        ],
        localizationsDelegates: [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        title: 'Flutter Demo',
        theme: ThemeData(
            primarySwatch: kprimaryMaterialColor,
            colorScheme: ThemeData().colorScheme.copyWith(
                  primary: kSelectedTextFieldColor,
                ),
            // colorScheme: ColorScheme.fromSwatch(
            //   accentColor:
            //       Color(0xff936c3b), // but now it should be declared like this
            // ),
            scaffoldBackgroundColor: kbackgroundColor,
            backgroundColor: kbackgroundColor,
            inputDecorationTheme: InputDecorationTheme(
              labelStyle: txTextFieldLabelStyle.copyWith(
                  fontSize: getRelativeWidth(16)),
              errorStyle: txTextFieldLabelStyle.copyWith(
                  fontSize: getRelativeWidth(16)),
              floatingLabelStyle:
                  txFloatingLabelStyle.copyWith(fontSize: getRelativeWidth(16)),
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  // style: BorderStyle.none,
                  color: kTextFieldIconColor,
                ),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  style: BorderStyle.solid,
                  color: kSelectedTextFieldColor,
                ),
              ),
            ),
            appBarTheme: AppBarTheme(
                iconTheme: IconThemeData(
                  color: kprimaryTextColor,
                ),
                // color: kfillColor,
                backgroundColor: kfillColor)),
        builder: (context, child) {
          final mediaQueryData = MediaQuery.of(context);

          return MediaQuery(
            data: mediaQueryData.copyWith(textScaleFactor: 1),
            child: Builder(builder: (context) {
              //these are global values found at temp_changeing_values.dart file
              kpIsSmallScreen = screenWidth(context) < kpmiddelScreenWidth;
              kpCurrentUserScreenWidth = screenWidth(context);
              print('kpIsSmallScreen $kpIsSmallScreen');
              print('kpCurrentUserScreenWidth $kpCurrentUserScreenWidth');
              return child!;
            }),
          );
        },
        home: LoginPage(),
      ),
    );
  }
}
