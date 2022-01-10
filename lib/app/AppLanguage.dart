import 'package:flutter/material.dart';
// import 'package:shared_preferences/shared_preferences.dart';

class AppLanguage extends ChangeNotifier {
  Locale _appLocale = Locale('ar');

  Locale get getAppLocal => _appLocale;

  String _selectedLanguage = "";

  String get getSelectedLanguage => _selectedLanguage;

  // fetchLocale() async {
  //   var prefs = await SharedPreferences.getInstance();
  //   if (prefs.getString('language_code') == "ar") {
  //     _appLocale = Locale('ar');
  //     // print("iam in fetch locale and the locale is" + _appLocale.toString());

  //     notifyListeners();
  //     return _appLocale;
  //   } else {
  //     _appLocale = Locale("en");
  //     notifyListeners();
  //     // print("iam in fetch locale and the locale is" + _appLocale.toString());
  //     return _appLocale;
  //   }
  // }

  void changeLanguage(Locale type) async {
    // var prefs = await SharedPreferences.getInstance();
    if (_appLocale == type) {
      return;
    }
    _appLocale = type;
    // await prefs.setString('language_code', type.languageCode);
    notifyListeners();
  }

  void toggleLang() async {
    // var prefs = await SharedPreferences.getInstance();
    if (_appLocale == Locale('en')) {
      _appLocale = Locale('ar');
    } else {
      _appLocale = Locale('en');
    }
    // await prefs.setString('language_code', type.languageCode);
    notifyListeners();
  }
}
