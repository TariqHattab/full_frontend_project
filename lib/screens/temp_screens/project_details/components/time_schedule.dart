import 'package:flutter/material.dart';
import 'package:snam/most_used/common_methods.dart';
import 'package:snam/most_used/constants.dart';
import 'package:snam/screens/temp_screens/project_details/components/timetabe_level.dart';

class TimeSchedule extends StatelessWidget {
  const TimeSchedule({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(getRelativeWidth(32)),
      height: screenHeight(context) * .85,
      width: screenWidth(context),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              tr(context).timetable,
              style: txMediamTextStyle.copyWith(fontSize: 19),
            ),
            Divider(
              color: kBorderColor,
              height: 16,
              thickness: 1,
            ),
            kbigVerticalSpace,
            for (int i = 0; i < 9; i++) ...[
              TimeTableLevel(context: context, level: i),
              kbigVerticalSpace
            ]
          ],
        ),
      ),
    );
  }
}
