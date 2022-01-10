// import 'package:charm/App/Localisation/AppLanguage.dart';
// import 'package:charm/App/Theme/theme.dart';
// import 'package:charm/Core/Models/Profile/signUp_data.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:intl/intl.dart';

import 'dart:io';

// import 'package:dropdown_search/dropdown_search.dart';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:snam/app/AppLanguage.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:snam/custom_classes/drop_down_button.dart';
import 'package:snam/dialogs/delete_pdf_dialog.dart';
import 'package:snam/most_used/constants.dart';
import 'package:snam/most_used/temp_changing_values.dart';
import 'package:snam/screens/temp_screens/requests/components/rejected_request_card.dart';

TextDirection setTextDirection(BuildContext context) =>
    (Provider.of<AppLanguage>(context).getAppLocal == Locale("en"))
        ? TextDirection.ltr
        : TextDirection.rtl;

bool isArLang(BuildContext context) =>
    (Provider.of<AppLanguage>(context).getAppLocal == Locale("ar"));

TextDirection getTextDirection(BuildContext context) =>
    isArLang(context) ? TextDirection.rtl : TextDirection.ltr;

EdgeInsets paddingActions(BuildContext context) => EdgeInsets.only(
      right: isArLang(context) ? 0 : 20,
      left: isArLang(context) ? 20.0 : 0,
    );

EdgeInsets paddingLeadings(BuildContext context) => EdgeInsets.only(
      right: isArLang(context) ? 20.0 : 0,
      left: isArLang(context) ? 0 : 20,
    );

bool isIPhoneX(MediaQueryData mediaQuery) {
  if (Platform.isIOS) {
    var size = mediaQuery.size;
    if (size.height >= 812.0) {
      return true;
    }
  }
  return false;
}

double screenWidth(BuildContext context) => MediaQuery.of(context).size.width;

double screenHeight(BuildContext context) => MediaQuery.of(context).size.height;

double percentFromWidth(BuildContext context, double width) =>
    width / screenWidth(context);

double kwidthFromPercent(BuildContext context, double percent) =>
    screenWidth(context) * percent;

double kheightFromPercent(BuildContext context, double percent) =>
    screenHeight(context) * percent;

AppLocalizations tr(BuildContext context) => AppLocalizations.of(context)!;

double getRelativeWidth(double width) {
  //to enable relative sizes when screen is less
  // than 411 or the value in kpRelativeScreenWidth
  // if (kpIsSmallScreen) {
  var relativeSizePercent = width / kpRelativeScreenWidth;
  width = kpCurrentUserScreenWidth * relativeSizePercent;
  // }
  return width;
}

double getHeightIfSmall({
  required double height,
  //WidthOnMyScreen
  double? wOnMyScreen,
  //WidthOnOtherUsersScreens,
  double? wOnOtherUsersScreens,
}) {
  //calculate relative height with the width that the height is in
  if (wOnMyScreen == null) wOnMyScreen = kpRelativeScreenWidth;
  if (wOnOtherUsersScreens == null)
    wOnOtherUsersScreens = kpCurrentUserScreenWidth;

  if (kpIsSmallScreen) {
    // divide on width of Height on my screen
    var relativeSizePercent = height / wOnMyScreen;
    // multibly by width of Height on others screen
    height = wOnOtherUsersScreens * relativeSizePercent;
  }
  return height;
}

Widget dummyContainer() => Container(
      width: 50,
      height: 50,
      color: Colors.red,
    );

Widget getProjectImg({
  required BuildContext context,
  String imgUrl = 'assets/icons/project.png',
  Color borderColor = const Color(0xFFD7DEF0),
  double size = 46,
}) {
  size = getRelativeWidth(size);

  return Container(
    height: size,
    width: size,
    decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage(
          imgUrl,
        )),
        borderRadius: BorderRadius.circular(6),
        color: borderColor),
  );
}

Widget buildListviewOfCards({
  bool? isEmpty = false,
  String? isEmptyText,
  required Widget item,
  int itemCount = 10,
  double? dividerHieght = 61,
  double? cacheExtent,
}) =>
    (isEmpty ?? false)
        ? Text(
            isEmptyText ?? 'No data yet',
          )
        : Expanded(
            child: ListView.separated(
              cacheExtent: cacheExtent,
              itemCount: itemCount,
              itemBuilder: (BuildContext context, int index) {
                return item;
              },
              separatorBuilder: (BuildContext context, int index) {
                return Divider(
                  thickness: 1,
                  height: getRelativeWidth(dividerHieght ?? 61),
                );
              },
            ),
          );

Widget buildInnerInfo(
        {required String title,
        String imgPath = 'assets/icons/number.png',
        required String data,
        required double width,
        bool removeImage = false,
        bool useIcon = false,
        IconData icon = Icons.close}) =>
    SizedBox(
      width: width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: txInnerTitleStyle,
          ),
          Row(
            children: [
              if (!removeImage) ...[
                Image.asset(
                  imgPath,
                  height: 16,
                ),
                const SizedBox(
                  width: 10,
                )
              ],
              if (useIcon) ...[
                Icon(
                  icon,
                  size: 16,
                ),
                const SizedBox(
                  width: 10,
                )
              ],
              Text(
                data,
                style: TextStyle(
                  // fontFamily: kfontFamily,
                  color: kprimaryTextColor,
                ),
              )
            ],
          )
        ],
      ),
    );

Widget buildOverFlowInnerInfo({
  required String title,
  String imgPath = 'assets/icons/number.png',
  required String data,
  required double width,
  bool removeImage = false,
  int dataMaxLines = 2,
  int titleMaxLines = 1,
  double minFontSize = 11,
  double minFontSizeForData = 12,
  bool useIcon = false,
  IconData icon = Icons.close,
  Color iconColor = ksecondaryFillColor,
  final double spaceInMiddle = 12,
  double textHeight = 1.00,
  TextStyle? titleTextStyle,
  TextStyle? dataTextStyle,
  String? intTransNum,
  CrossAxisAlignment dataCrossAxisAlignment = CrossAxisAlignment.center,
}) =>
    LayoutBuilder(builder: (context, constraints) {
      // print(constraints);
      return SizedBox(
        width: width,
        // height: 20,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              children: [
                //if it is used in transaction number
                if (intTransNum != null) ...[
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 2),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(
                          width: .5,
                        ),
                        borderRadius: BorderRadius.circular(3)),
                    child: AutoSizeText(
                      '100',
                      style: TextStyle(color: Colors.black54),
                    ),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                ],
                Expanded(
                  child: AutoSizeText(
                    title,
                    style: titleTextStyle ??
                        txInnerTitleStyle.copyWith(
                            fontSize: getRelativeWidth(11)),
                    maxLines: titleMaxLines,

                    minFontSize:
                        //this becuase stepGranularity needs minFontSize to be multible of 1
                        getRelativeWidth(minFontSize).floor().toDouble(),
                    // maxFontSize: 15,
                  ),
                ),
              ],
            ),

            // kminiVerticalSpace,
            SizedBox(
              height: spaceInMiddle,
            ),
            Expanded(
              child: Row(
                crossAxisAlignment: dataCrossAxisAlignment,
                children: [
                  if (!removeImage) ...[
                    Image.asset(
                      imgPath,
                      height: getRelativeWidth(16),
                      width: getRelativeWidth(17),
                    ),
                    SizedBox(
                      width: getRelativeWidth(9),
                    ),
                  ],
                  if (useIcon) ...[
                    Icon(
                      icon,
                      size: getRelativeWidth(20),
                      color: iconColor,
                    ),
                    const SizedBox(
                      width: 10,
                    )
                  ],
                  Expanded(
                    child: AutoSizeText(
                      data,
                      minFontSize: minFontSizeForData,
                      maxLines: dataMaxLines,
                      overflow: TextOverflow.ellipsis,
                      style: dataTextStyle ??
                          TextStyle(
                            height: textHeight,
                            fontFamily: kfontFamily,
                            fontSize: getRelativeWidth(17),
                            color: kprimaryTextColor,
                          ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      );
    });

Container buildTotalAmountCard({
  required BuildContext context,
  required String imgPath,
  required String totalNum,
  required String descMessage,
  double fontSize = 15,
}) {
  double cardWidth = getRelativeWidth(109); //kwidthFromPercent(context, .2906);

  double iconWidth = kwidthFromPercent(context, .0720);
  // screenWidth(context) < 460 ? kwidthFromPercent(context, .0720) : 60;
  return Container(
    width: cardWidth,
    height: cardWidth,
    // constraints: BoxConstraints(
    //     // maxHeight: constraints.maxHeight,
    //     // maxWidth: constraints.maxWidth,
    //     minHeight: 50,
    //     minWidth: 50),
    padding: EdgeInsets.all(getRelativeWidth(8)),
    decoration: BoxDecoration(
      color: kfillColor,
      borderRadius: BorderRadius.circular(getRelativeWidth(20)),
      border: Border.all(color: kBorderColor),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          // mainAxisAlignment: MainAxisAlignment.s,
          children: [
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: Image.asset(
                imgPath,
                color: kprimaryTextColor,
                width: iconWidth,
                height: iconWidth,
              ),
            ),
            kminiHorizontalSpace,
            Expanded(
              child: Container(
                // height: double.infinity,
                // width: double.infinity,
                child: AutoSizeText(
                  totalNum,
                  maxLines: 1,
                  // presetFontSizes: [2,8,16,24],
                  style: txPoppinsTitleTextStyle.copyWith(
                      fontSize: getRelativeWidth(22)),
                ),
              ),
            )
          ],
        ),
        kminiVerticalSpace,
        AutoSizeText(
          descMessage,
          style: TextStyle(
            fontSize: getRelativeWidth(fontSize),
            fontFamily: kfontFamily,
            fontWeight: klightFontWeight,
            color: kprimaryTextColor,
          ),
          overflow: TextOverflow.visible,
          minFontSize: 1,
          maxLines: 2,
        ),
      ],
    ),
  );
}

getProjectTite({required BuildContext context}) => Text(
      tr(context).projectName,
      style: txSmallTitleTextStyle.copyWith(fontSize: getRelativeWidth(16)),
    );

// buildInnerInforRow({required BuildContext context, double width = 115}) =>
//     SizedBox(
//       height: 37,
//       child: Container(
//         // color: Colors.amber,
//         child: Row(
//           children: [
//             buildInnerInfo(
//                 data: '5153202188',
//                 title: tr(context).projectNum,
//                 width: width,
//                 imgPath: 'assets/icons/number.png'),
//             VerticalDivider(
//               color: kBorderColor,
//               width: 25,
//             ),
//             buildInnerInfo(
//                 data: '60%',
//                 title: tr(context).completionRate,
//                 width: width,
//                 imgPath: 'assets/icons/accomplish.png'),
//           ],
//         ),
//       ),
//     );

//when calling this function it throw error if not passed T in <T>
Future<bool?> buildBottomSheet<bool>(
    {required BuildContext context,
    required Widget child,
    Color? backgroundColor}) {
  var bgColor = backgroundColor ?? kfillColor;

  return showModalBottomSheet<bool>(
    context: context,
    isScrollControlled: true,
    enableDrag: true,
    // barrierColor: kfillColor.withOpacity(.0),
    backgroundColor: bgColor,
    // isDismissible: false,
    elevation: 100,
    shape: RoundedRectangleBorder(
      borderRadius: new BorderRadius.only(
          topLeft: const Radius.circular(20.0),
          topRight: const Radius.circular(20.0)),
    ),
    builder: (context) => child,
  );
}

SizedBox buildPDFText(BuildContext context,
    {required bool hasFile, bool isError = false}) {
  return SizedBox(
    height: 18,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          hasFile
              ? 'assets/icons/file_download.png'
              : 'assets/icons/file_upload.png',
          color: isError ? krejectColor : null,
        ),
        kminiHorizontalSpace,
        Text(
          hasFile ? tr(context).download : tr(context).upload,
          style: txPDFTextStyle.copyWith(
              color: isError ? krejectColor : kPDFTextColor),
        )
      ],
    ),
  );
}

// Widget getImgAsset2({
//   String imgName = 'project',
//   Color borderColor = const Color(0xFFD7DEF0),
//   double size = 20,
// }) =>
//     Container(
//       height: size,
//       width: size,
//       decoration: BoxDecoration(
//         image: DecorationImage(
//             image: AssetImage(
//           'assets/icons/$imgName.png',
//         )),
//         borderRadius: BorderRadius.circular(6),
//         color: borderColor,
//       ),
//     );
Widget getImgAsset({
  String imgName = 'project',
  double size = 12,
  double? height,
  Color? imgColor,
}) {
  size = getRelativeWidth(size);
  if (height != null) getRelativeWidth(height);
  return Image.asset(
    'assets/icons/$imgName.png',
    height: height ?? size,
    width: size,
    color: imgColor,
  );
}

TextField buildNormalTextField({
  required String labelText,
  // bool showSuffixIcon = false,
  IconData? prefixIcon,
  bool showImage = false,
  double size = 30,
  Widget? image,
  void Function(String)? onChanged,
}) {
  var iconWithPadding = prefixIcon == null
      ? null
      : Padding(
          padding: const EdgeInsetsDirectional.only(end: 10),
          child: image ?? Icon(prefixIcon));
  var imageWithPadding = image == null
      ? null
      : Padding(
          padding: const EdgeInsetsDirectional.only(end: 10), child: image);

  return TextField(
    onChanged: onChanged,
    decoration: InputDecoration(
      // contentPadding: const EdgeInsets.symmetric(horizontal: 30),
      labelText: labelText,
      labelStyle:
          txTextFieldLabelStyle.copyWith(fontSize: getRelativeWidth(16)),

      // suffixIcon: showSuffixIcon ? Icon(Icons.chevron_right) : null,
      prefixIcon: imageWithPadding ?? iconWithPadding, // prefixIcon,
      prefixIconConstraints: BoxConstraints(
        maxHeight: size,
        minHeight: size,
        minWidth: size,
        maxWidth: size,
      ),
    ),
  );
}

TextFormField buildTextFormField({
  String? labelText,

  // bool showSuffixIcon = false,
  IconData? prefixIcon,
  String? prefixText,
  TextStyle? prefixTextStyle,
  TextStyle? labelStyle,
  TextStyle? floatingLabelStyle,
  TextStyle? errorStyle,
  TextStyle? suffixStyle,
  bool showImage = false,
  FocusNode? focusNode,
  TextEditingController? controller,
  double size = 30,
  Widget? image,
  bool? enabled,
  Widget? suffix,
  AutovalidateMode? autovalidateMode,
  TextInputType? keyboardType,
  String? suffixText,
  void Function(String)? onChanged,
  String? Function(String?)? onValidate,
  void Function(String?)? onSaved,
}) {
  size = getRelativeWidth(size);

  var iconWithPadding = prefixIcon == null
      ? null
      : Padding(
          padding: EdgeInsetsDirectional.only(end: getRelativeWidth(10)),
          child: image ?? Icon(prefixIcon));

  var imageWithPadding = image == null
      ? null
      : Padding(
          padding: EdgeInsetsDirectional.only(end: getRelativeWidth(10)),
          child: image);

  labelStyle = labelStyle ??
      txTextFieldLabelStyle.copyWith(fontSize: getRelativeWidth(16));

  return TextFormField(
    controller: controller,
    focusNode: focusNode,
    autovalidateMode: autovalidateMode,
    onChanged: onChanged,
    validator: onValidate,
    onSaved: onSaved,
    keyboardType: keyboardType,
    decoration: InputDecoration(
      suffixText: suffixText,
      suffixStyle: suffixStyle,
      enabled: enabled ?? true,
      // contentPadding: const EdgeInsets.symmetric(horizontal: 30),
      labelText: labelText,
      labelStyle: labelStyle,
      floatingLabelStyle: floatingLabelStyle,
      // isDense: true,
      prefixText: prefixText,
      errorStyle: errorStyle,
      prefixStyle: prefixTextStyle,
      suffix: suffix,
      // suffixIcon: showSuffixIcon ? Icon(Icons.chevron_right) : null,
      prefixIcon: imageWithPadding ?? iconWithPadding, // prefixIcon,
      prefixIconConstraints: BoxConstraints(
        maxHeight: size,
        minHeight: size,
        minWidth: size,
        maxWidth: size,
      ),
    ),
  );
}

buildDropDownButton({
  required BuildContext context,
  required List items,
  required void Function(dynamic?) onChanged,
  dynamic selectedValue,
  required String hint,
  Widget? prefix,
  double? prefixSize = 30,
  bool withPadding = true,
}) {
  var prefixWithPadding = prefix;
  if (withPadding) {
    var prefixWithPadding = prefix == null
        ? null
        : Padding(
            padding: EdgeInsetsDirectional.only(end: getRelativeWidth(10)),
            child: prefix);
  }

  return DropdownButtonFormField<dynamic>(
    isExpanded: true,
    decoration: InputDecoration(
      prefixIcon: prefixWithPadding,
      prefixIconConstraints: prefixSize != null
          ? BoxConstraints(
              maxHeight: prefixSize,
              maxWidth: prefixSize,
              minHeight: prefixSize,
              minWidth: prefixSize,
            )
          : null,
    ),
    hint: Text(
      hint,
      style: txTextFieldLabelStyle.copyWith(
          fontSize: getRelativeWidth(16)), //.copyWith(fontSize: 14),
    ),

    items: items
        .map((e) => DropdownMenuItem<dynamic>(
              alignment: Alignment.center,
              child: Text(
                e,
                style: txTextFieldLabelStyle.copyWith(
                    fontSize: getRelativeWidth(16),
                    color: Colors.black), //.copyWith(fontSize: 14),
              ),
              value: e,
            ))
        .toList(),
    icon: Icon(Icons.chevron_right),

    focusColor: kBorderColor,
    // underline: Container(color: Colors.grey, height: 1.0),
    value: selectedValue,
    onChanged: onChanged,
  );
}

buildDropDownButtonFromPackage({
  required BuildContext context,
  required List<String> items,
  required void Function(dynamic?) onChanged,
  dynamic selectedValue,
  required String hint,
  // Widget? prefix,
  double? prefixSize = 30,
  FocusNode? focusNode,
  String? imgName,
}) {
  // var prefixWithPadding = prefix == null
  //     ? null
  //     : Padding(
  //         padding: const EdgeInsetsDirectional.only(end: 10), child: prefix);
  Widget? prefix = imgName != null
      ? getImgAsset(imgName: imgName, imgColor: kTextFieldIconColor)
      : null;

  return CustomDropDown(
      focusNode: focusNode,
      context: context,
      items: items,
      onChanged: onChanged,
      selectedValue: selectedValue,
      hint: hint,
      prefix: prefix,
      prefixSize: 30);
}

SizedBox buildFormSubmitButton({
  required BuildContext context,
  void Function()? onPressed,
  String? buttonText,
}) {
  String text = buttonText ?? tr(context).next;
  return SizedBox(
    height: getRelativeWidth(52),
    width: double.infinity,
    child: ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        primary: kprimaryColor,
      ),
      child: Text(
        text,
        style: txTextFieldLabelStyle.copyWith(
            fontSize: getRelativeWidth(16), color: Colors.white),
      ),
    ),
  );
}

NavigatorState nv(BuildContext context) {
  return Navigator.of(context);
}

MaterialPageRoute<dynamic> pageTransition(BuildContext context, goToPage,
    {bool fadeIn = false}) {
  if (fadeIn) {
    return MaterialPageRoute(builder: (context) => goToPage);
  } else {
    return MaterialPageRoute(builder: (context) => goToPage);
  }
}
