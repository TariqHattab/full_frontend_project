import 'package:flutter/material.dart';

const Color kprimaryColor = Color(0xFF265c7c);
// const Color kaccentColor = Color(0xFF97aabd);

const Color kbackgroundColor = Color(0xFFFFFFFF);
const Color kfillColor = Color(0xFFF5F7FC);
const Color ksecondaryFillColor = Color(0xFFD7DEF0);

const Color kprimaryTextColor = Color(0xFF354952);
const Color ksecondaryPrimaryTextColor = Color(0xFF6D7C82);
const Color kthirdPrimaryTextColor = Color(0xFF4F6168);

const Color kaccentTextColor = Color(0xFF97AABD);
const Color ksecondaryAccentTextColor = Color(0xFF7E7779);

const Color kacceptColor = Color(0xFF69d821);
const Color krejectColor = Color(0xFFC30000);

const Color kBorderColor = Color(0xFFD7DEF0);
const Color kSecondaryBorderColor = Color(0xFFD2D9EA);

const Color kPDFTextColor = Color(0xFF5F8190);
const Color kPDFFormTextColor = Color(0xFF5D5D5D);
const Color kPDFFormUploadTextColor = Color(0xFF4177FB);

const Color kBadgeColor = Color(0xFFF66666);
const Color kWalletFooterColor = Color(0xFF272D3B);
const Color kOTPTitleSendColor = Color(0xFF272D3B);
const Color kUnActiveStepColor = Color(0xFF707070);
const Color kChartNumberColor = Color(0xFF74B64E);

final Color kElevationShadowColor = kfillColor.withOpacity(.5);

// const Color kSelectedTextFieldColor = Colors.black38;
// const Color kSelectedTextFieldColor = Colors.grey[400];
// const Color kSelectedTextFieldColor = Color(0xFFBDBDBD);

const Color kSelectedTextFieldColor = Colors.blue;

// const Color kTextFieldIconColor =
// kaccentTextColor; // ksecondaryFillColor; //Colors.grey;
// const Color? kTextFieldLabelColor = ksecondaryFillColor;
const Color kTextFieldIconColor = Colors.grey;
const Color? kTextFieldLabelColor = null;

const String kfontFamily = 'almarai';
const String kpoppinsFontFamily = 'poppins';
const FontWeight klightFontWeight = FontWeight.w300;
const FontWeight kextraBoldFontWeight = FontWeight.w800;
const FontWeight ksimiBoldFontWeight = FontWeight.w600;

const double kFileCardWidth = 136;
const double kFileCardHieght = 188;

const List<Color> kloginGradient = const [
  Color(0xFF255673),
  Color(0xFF255673),
  Color(0xFF204E69),
  Color(0xFF0F3D56),
  Color(0xFF0A202B),
  Color(0xFF09212F),
  Color(0xFF09212F),
];

const Widget ktinyHorizontalSpace = const SizedBox(width: 4);
const Widget kminiHorizontalSpace = const SizedBox(width: 8);
const Widget ksmallExtraHorizontalSpace = const SizedBox(width: 10);
const Widget ksmallHorizontalSpace = const SizedBox(width: 12);
const Widget kmediamHorizontalSpace = const SizedBox(width: 16);
const Widget ksimiBigHorizontalSpace = const SizedBox(width: 20);
const Widget kbigHorizontalSpace = const SizedBox(width: 24);
const Widget kextraBigHorizontalSpace = const SizedBox(width: 32);

const Widget ktinyVerticalSpace = const SizedBox(height: 4);
const Widget kminiVerticalSpace = const SizedBox(height: 8);
const Widget ksmallExtraVerticalSpace = const SizedBox(height: 10);
const Widget ksmallVerticalSpace = const SizedBox(height: 12);
const Widget kmediamVerticalSpace = const SizedBox(height: 16);
const Widget ksimiBigVerticalSpace = const SizedBox(height: 20);
const Widget kbigVerticalSpace = const SizedBox(height: 24);
const Widget kextraBigVerticalSpace = const SizedBox(height: 32);

const TextStyle txUserTypeTextStyle = TextStyle(
  fontFamily: kfontFamily,
  fontWeight: FontWeight.bold,
  fontSize: 13,
  color: kprimaryColor,
);
const TextStyle txGroupTypeTextStyle = TextStyle(
  fontFamily: kfontFamily,
  fontWeight: FontWeight.bold,
  fontSize: 20,
  color: kprimaryColor,
);

const TextStyle txPrimaryTitleTextStyle = TextStyle(
    fontFamily: kfontFamily,
    fontWeight: FontWeight.bold,
    color: kprimaryTextColor,
    fontSize: 23);

const TextStyle txMediamTextStyle = TextStyle(
  fontFamily: kfontFamily,
  color: kprimaryTextColor,
  fontWeight: FontWeight.normal,
  fontSize: 15,
  height: 1.5,
  // overflow: TextOverflow.ellipsis,
);

const TextStyle txSmallTitleTextStyle = TextStyle(
  fontFamily: kfontFamily,
  color: kthirdPrimaryTextColor,
  fontWeight: FontWeight.bold,
  fontSize: 15,
);
const TextStyle txSecondaryTitleStyle = TextStyle(
  fontFamily: kfontFamily,
  fontWeight: FontWeight.normal,
  color: kprimaryTextColor,
);
const TextStyle txDrawerTitleStyle = TextStyle(
    fontFamily: kfontFamily,
    fontWeight: FontWeight.normal,
    color: kprimaryTextColor,
    fontSize: 15);

const TextStyle txLightTitleStyle = TextStyle(
  fontFamily: kfontFamily,
  fontWeight: klightFontWeight,
  color: kprimaryTextColor,
);

const TextStyle txInnerTitleStyle = TextStyle(
  fontFamily: kfontFamily,
  fontWeight: klightFontWeight,
  fontSize: 11,
  color: ksecondaryPrimaryTextColor,
);
const TextStyle txTimeStyle = TextStyle(
  fontFamily: kfontFamily,
  fontWeight: klightFontWeight,
  fontSize: 14,
  color: kthirdPrimaryTextColor,
);
const TextStyle txPDFTextStyle = TextStyle(
  fontFamily: kfontFamily,
  fontWeight: FontWeight.normal,
  fontSize: 15,
  color: kPDFTextColor,
  // decoration: TextDecoration.underline,
);
const TextStyle txPDFFormTextStyle = TextStyle(
  fontFamily: kfontFamily,
  fontWeight: FontWeight.normal,
  fontSize: 18,
  color: kPDFFormTextColor,
  // decoration: TextDecoration.underline,
);
const TextStyle txPDFFormUploadTextStyle = TextStyle(
  fontFamily: kfontFamily,
  fontWeight: FontWeight.normal,
  fontSize: 20,
  color: kPDFFormUploadTextColor,
  // decoration: TextDecoration.underline,
);
const TextStyle txWalletFooterTextStyle = TextStyle(
  fontFamily: kfontFamily,
  fontWeight: FontWeight.normal,
  fontSize: 14,
  color: kPDFTextColor,
);
const TextStyle txWalletFooterNumberTextStyle = TextStyle(
  fontFamily: kfontFamily,
  fontWeight: kextraBoldFontWeight,
  // fontSize: 20,
  color: kWalletFooterColor,
);
const TextStyle txPoppinsTitleTextStyle = TextStyle(
  fontFamily: kpoppinsFontFamily,
  fontWeight: ksimiBoldFontWeight,
  color: kprimaryTextColor,
  fontSize: 22,
);
const TextStyle txReportsListTitleStyle = TextStyle(
  fontFamily: kfontFamily,
  fontWeight: FontWeight.normal,
  color: kprimaryTextColor,
  fontSize: 18,
);
const TextStyle txAccentReportsListTitleStyle = TextStyle(
  fontFamily: kfontFamily,
  fontWeight: FontWeight.normal,
  color: kaccentTextColor,
  fontSize: 14,
);
const TextStyle txChartNumTextStyle = TextStyle(
  fontSize: 28,
  color: kChartNumberColor,
  fontFamily: kpoppinsFontFamily,
  fontWeight: kextraBoldFontWeight,
);
const TextStyle txChartTxTextStyle = TextStyle(
  fontSize: 14,
  color: kprimaryTextColor,
  fontFamily: kfontFamily,
  fontWeight: FontWeight.normal,
);
const TextStyle txTextFieldLabelStyle = TextStyle(
  fontFamily: kfontFamily,
  fontWeight: FontWeight.normal,
  color: kTextFieldLabelColor,
  fontSize: 16,
);
const TextStyle txFloatingLabelStyle = TextStyle(
  fontFamily: kfontFamily,
  fontWeight: FontWeight.normal,
  // color: kSelectedTextFieldColor,
  fontSize: 16,
);
const TextStyle txFloatingErrorStyle = TextStyle(
  fontFamily: kfontFamily,
  fontWeight: FontWeight.normal,
  color: krejectColor,
  fontSize: 16,
);
const TextStyle txTimeTableButtonTextStyle = TextStyle(
  fontFamily: kfontFamily,
  // color: kprimaryTextColor,
  fontWeight: FontWeight.normal,
  fontSize: 17,

  // overflow: TextOverflow.ellipsis,
);
const TextStyle txLoginTextStyle = TextStyle(
  fontFamily: kfontFamily,
  color: kprimaryColor,
  fontWeight: FontWeight.bold,
  fontSize: 34,

  // overflow: TextOverflow.ellipsis,
);
const TextStyle txContactTextStyle = TextStyle(
  fontFamily: kpoppinsFontFamily,
  fontWeight: FontWeight.normal,
  color: kaccentTextColor,
  fontSize: 18,
);
const TextStyle txTermsOfUseTextStyle = TextStyle(
    fontFamily: kfontFamily,
    fontWeight: FontWeight.bold,
    fontSize: 15,
    color: kprimaryColor,
    decoration: TextDecoration.underline);
const TextStyle txRadioTextStyle = TextStyle(
  fontFamily: kfontFamily,
  fontWeight: klightFontWeight,
  color: kprimaryTextColor,
  fontSize: 15,
);
const TextStyle txAcknowledgeTextStyle = TextStyle(
    fontFamily: kfontFamily,
    fontWeight: FontWeight.normal,
    color: kprimaryTextColor,
    fontSize: 13,
    wordSpacing: 1.6,
    height: 1.5);

const TextStyle txActiveStepsInfoTextStyle = TextStyle(
  fontFamily: kfontFamily,
  fontWeight: klightFontWeight,
  color: kacceptColor,
  fontSize: 11,
);
const TextStyle txUnActiveStepsInfoTextStyle = TextStyle(
  fontFamily: kfontFamily,
  fontWeight: klightFontWeight,
  color: kBorderColor,
  fontSize: 11,
);
const TextStyle txOTPTitleTextStyle = TextStyle(
    fontFamily: kfontFamily,
    fontWeight: FontWeight.bold,
    color: kOTPTitleSendColor,
    fontSize: 19,
    height: 1.5
    // wordSpacing: 2
    );

const TextStyle txOTPBodyTextStyle = TextStyle(
  fontFamily: kfontFamily,
  fontWeight: klightFontWeight,
  color: kaccentTextColor,
  fontSize: 13,
);
const TextStyle txSmallButtonTextStyle = TextStyle(
  fontFamily: kfontFamily,
  fontSize: 15,
  fontWeight: FontWeight.normal,
);
