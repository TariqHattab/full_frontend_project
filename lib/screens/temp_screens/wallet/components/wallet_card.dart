import 'dart:math';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:snam/most_used/constants.dart';
import 'package:snam/most_used/common_methods.dart';
import 'package:snam/screens/temp_screens/wallet/components/wallet_transaction.dart';

class WalletCard extends StatelessWidget {
  const WalletCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var totalDue2 = tr(context).totalDue;

    double? footerHieght = getRelativeWidth(58);

    return Card(
      elevation: 5,
      shadowColor: kElevationShadowColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Container(
        padding: const EdgeInsetsDirectional.only(
            top: 16, bottom: 16, start: 16, end: 8),
        // height: 586,
        // width: double.infinity,
        child: Column(
          children: [
            _buildCardTitle(context),
            kmediamVerticalSpace,
            ..._buildTransactionList(context),
            Divider(
              thickness: 1,
              height: 1,
            ),
            kmediamVerticalSpace,
            SizedBox(
              height: footerHieght,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                      child: _buildFooterItem(
                          data: '30K', title: tr(context).amountDue)),
                  VerticalDivider(
                    color: kSecondaryBorderColor,
                    thickness: 1,
                    width: getRelativeWidth(34),
                    endIndent: footerHieght - getRelativeWidth(45),
                  ),
                  Expanded(
                      child: _buildFooterItem(
                          data: '25K', title: tr(context).amountPaid)),
                  VerticalDivider(
                    color: kSecondaryBorderColor,
                    thickness: 1,
                    width: getRelativeWidth(34),
                    endIndent: footerHieght - getRelativeWidth(45),
                  ),
                  Expanded(
                    child: _buildFooterItem(
                        data: '5K', title: tr(context).amountRemained),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Column _buildFooterItem({required String data, required String title}) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AutoSizeText(
          data,
          // minFontSize: 10,
          // maxFontSize: 32,
          style: txWalletFooterNumberTextStyle.copyWith(
              fontSize: getRelativeWidth(20)),
        ),
        const SizedBox(
          height: 6,
        ),
        AutoSizeText(title,
            // minFontSize: 10,
            // maxFontSize: 40,
            maxLines: 1,
            style: txWalletFooterTextStyle.copyWith(
                fontSize: getRelativeWidth(14))),
      ],
    );
  }

  Row _buildCardTitle(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        getProjectImg(
            context: context,
            imgUrl: 'assets/icons/earning.png',
            borderColor: Colors.transparent,
            size: 39),
        kmediamHorizontalSpace,
        getProjectTite(context: context),
      ],
    );
  }

  _buildTransactionList(BuildContext context) {
    var transactionsLength = 5;
    return [
      WalletTransaction(context: context, thirdData: '10000', level: 1),
      for (var items = 2; items < transactionsLength; items++)
        WalletTransaction(context: context, level: items),
      WalletTransaction(
          context: context,
          firstData: '-',
          secondData: '-',
          thirdData: 'لم يتم التحويل',
          level: transactionsLength),
    ];
  }

//   _buildTransaction(
//     BuildContext context, {
//     String firstData = 'ا08  فبراير 2020',
//     String secondData = '16516656',
//     String thirdData = '5000',
//     double firstWidth = 120,
//     double secondWidth = 90,
//     double thirdWidth = 100,
//     required int level,
//   }) =>
//       ;
}
