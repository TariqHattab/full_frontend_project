import 'package:flutter/material.dart';
import 'package:snam/most_used/constants.dart';
import 'package:snam/screens/components/app_bar.dart';
import 'package:snam/screens/components/main_drawer.dart';
import 'package:snam/screens/temp_screens/wallet/components/wallet_card.dart';
import 'package:snam/most_used/common_methods.dart';

class WalletPage extends StatelessWidget {
  const WalletPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(pageTitle: tr(context).wallet),
      drawer: MainDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            kmediamVerticalSpace,
            Builder(builder: (context) {
              //control cards width when screen is less than their width
              var flexNum = screenWidth(context) < 410 ? 1 : 0;
              return Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    flex: flexNum,
                    child: buildTotalAmountCard(
                      context: context,
                      imgPath: 'assets/icons/money.png',
                      totalNum: '60K',
                      descMessage: tr(context).totalDue,
                    ),
                  ),
                  ksmallHorizontalSpace,
                  Expanded(
                    flex: flexNum,
                    child: buildTotalAmountCard(
                      context: context,
                      imgPath: 'assets/icons/wallet.png',
                      totalNum: '50K',
                      descMessage: tr(context).amountPaidAll,
                    ),
                  ),
                  ksmallHorizontalSpace,
                  Expanded(
                    flex: flexNum,
                    child: buildTotalAmountCard(
                      context: context,
                      imgPath: 'assets/icons/tick.png',
                      totalNum: '10K',
                      descMessage: tr(context).amountRemainedAll,
                    ),
                  ),
                ],
              );
            }),
            ksimiBigVerticalSpace,
            buildListviewOfCards(item: WalletCard(), itemCount: 4),
          ],
        ),
      ),
    );
  }
}
