import 'package:flutter/material.dart';
import 'package:snam/most_used/common_methods.dart';
import 'package:snam/most_used/constants.dart';

List<Widget> buildReportNum(BuildContext context, {TextStyle? style}) {
  TextStyle textStyle = style ?? txAccentReportsListTitleStyle;
  return [
    Text(
      tr(context).reportNum,
      style: textStyle,
    ),
    Text(
      ' : ',
      style: textStyle,
    ),
    Text(
      '1565',
      style: textStyle,
    ),
  ];
}
