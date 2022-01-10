import 'package:flutter/material.dart';
import 'package:snam/most_used/common_methods.dart';
import 'package:snam/most_used/constants.dart';
import 'package:snam/screens/temp_screens/daily_report_page/components/report_num.dart';

buildBSheatForReport(BuildContext context) => Container(
    // height: screenHeight(context) * .75,
    width: screenWidth(context),
    padding: const EdgeInsets.all(32),
    child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: buildReportNum(
              context,
              style: txWalletFooterNumberTextStyle.copyWith(
                  fontWeight: FontWeight.normal),
            ),
          ),
          Divider(
            thickness: 2,
            height: 30,
          ),
          Text(
            '''هذا النص هو مثال لنص يمكن أن يستبدل في نفس المساحة، لقد تم توليد هذا النص من مولد النص العربى، حيث يمكنك أن تولد مثل هذا النص أو العديد من النصوص الأخرى إضافة إلى زيادة عدد الحروف التى يولدها التطبيق.
إذا كنت تحتاج إلى عدد أكبر من الفقرات يتيح لك مولد النص العربى زيادة عدد الفقرات كما تريد،''',
            style: txMediamTextStyle.copyWith(fontSize: 19),
          ),
          kmediamVerticalSpace,
        ]));
