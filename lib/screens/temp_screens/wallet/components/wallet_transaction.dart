import 'package:flutter/material.dart';
import 'package:snam/most_used/common_methods.dart';
import 'package:snam/most_used/constants.dart';

class WalletTransaction extends StatelessWidget {
  const WalletTransaction({
    Key? key,
    required this.context,
    required this.level,
    this.firstData = 'ا08  فبراير 2020',
    this.secondData = '16516656',
    this.thirdData = '5000',
    this.firstWidth = 120,
    this.secondWidth = 90,
    this.thirdWidth = 100,
  }) : super(key: key);

  final BuildContext context;
  final String firstData;
  final String secondData;
  final String thirdData;
  final double firstWidth;
  final double secondWidth;
  final double thirdWidth;
  final int level;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 46,
          child: Container(
            // color: Colors.amber,
            child: Row(
              children: [
                Expanded(
                  flex: 6,
                  child: buildOverFlowInnerInfo(
                    // intTransNum: level.toString(),
                    // spaceInMiddle: 6,
                    data: firstData,
                    title: '${tr(context).transactionDate} ',
                    width: firstWidth,
                    imgPath: 'assets/icons/calendar.png',
                    minFontSizeForData: 2,
                    // dataMaxLines: 1,
                  ),
                ),
                VerticalDivider(
                  color: kBorderColor,
                  thickness: 1,
                  width: 18,
                ),
                Expanded(
                  flex: 4,
                  child: buildOverFlowInnerInfo(
                    data: secondData,
                    title: '${tr(context).transactionNum}',
                    width: secondWidth,
                    // dataMaxLines: 1,

                    // minFontSizeForData: 0,
                    imgPath: 'assets/icons/number.png',
                  ),
                ),
                VerticalDivider(
                  color: kBorderColor,
                  width: 18,
                  thickness: 1,
                ),
                Expanded(
                  flex: 4,
                  child: buildOverFlowInnerInfo(
                    data: thirdData,
                    title: tr(context).transactionAmount,
                    width: thirdWidth,
                    minFontSizeForData: 2,
                    imgPath: 'assets/icons/transfare.png',
                  ),
                ),
              ],
            ),
          ),
        ),
        ksmallVerticalSpace,
        Row(
          //the text like this to change direction from english to arabic
          children: [
            Text(
              '${tr(context).operationNum}',
              style: txMediamTextStyle.copyWith(fontSize: getRelativeWidth(15)),
            ),
            Text(' : ',
                style:
                    txMediamTextStyle.copyWith(fontSize: getRelativeWidth(15))),
            Text('95412443544',
                style:
                    txMediamTextStyle.copyWith(fontSize: getRelativeWidth(15)))
          ],
        ),
        const SizedBox(
          height: 30,
        ),
        // kbigVerticalSpace,
      ],
    );
  }
}
