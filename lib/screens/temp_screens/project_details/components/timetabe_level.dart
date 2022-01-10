import 'package:flutter/material.dart';
import 'package:snam/custom_classes/lists.dart';
import 'package:snam/most_used/common_methods.dart';
import 'package:snam/most_used/constants.dart';

class TimeTableLevel extends StatelessWidget {
  const TimeTableLevel({Key? key, required this.context, required this.level})
      : super(key: key);

  final BuildContext context;
  final int level;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (level > 2)
          Icon(
            Icons.check_circle,
            size: getRelativeWidth(22),
            color: Colors.grey,
          ),
        if (!(level > 2))
          getProjectImg(
              context: context,
              imgUrl: 'assets/icons/active_step.png',
              size: 21,
              borderColor: Colors.transparent),
        SizedBox(width: getRelativeWidth(16)),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'المرحلة ${klevelsAR[level]}',
                style: txMediamTextStyle.copyWith(fontSize: 15),
              ),
              kminiVerticalSpace,
              _buildDateRow(context),
              kmediamVerticalSpace,
              SizedBox(
                height: 50,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    buildOverFlowInnerInfo(
                        title: tr(context).executionTime,
                        data: 'ثلاث شهور',
                        width: getRelativeWidth(80),
                        removeImage: true),
                    VerticalDivider(
                      width: getRelativeWidth(32),
                      color: kBorderColor,
                    ),
                    buildOverFlowInnerInfo(
                        title: tr(context).completionRate,
                        data: '60%',
                        width: getRelativeWidth(70),
                        removeImage: true,
                        minFontSize: isArLang(context) ? 11 : 8),
                    VerticalDivider(
                      width: getRelativeWidth(32),
                      color: kBorderColor,
                    ),
                    buildOverFlowInnerInfo(
                        title: tr(context).actualCompletionRate,
                        data: '60%',
                        width: getRelativeWidth(95),
                        titleTextStyle: txInnerTitleStyle.copyWith(
                            fontSize: getRelativeWidth(11)),
                        removeImage: true,
                        minFontSize: isArLang(context) ? 5 : 7),
                  ],
                ),
              )
            ],
          ),
        )
      ],
    );
  }

  Row _buildDateRow(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _buildTimeDate(dateSince: tr(context).from),
        _buildTimeDate(dateSince: tr(context).to),
      ],
    );
  }

  SizedBox _buildTimeDate({required String dateSince}) {
    return SizedBox(
      width: getRelativeWidth(140),
      child: Row(
        children: [
          Image.asset(
            'assets/icons/calendar.png',
            height: getRelativeWidth(14),
            width: getRelativeWidth(14),
          ),
          ksmallExtraHorizontalSpace,
          Expanded(
            flex: 2,
            child: FittedBox(
              child: Text(
                dateSince,
                style: txTimeStyle,
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: FittedBox(
              child: Text(
                ' : ',
                style: txTimeStyle,
              ),
            ),
          ),
          Expanded(
            flex: 8,
            child: FittedBox(
              child: Text(
                'ء08  يوليو 2020',
                style: txTimeStyle,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
