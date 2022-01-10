import 'package:flutter/material.dart';
import 'package:snam/custom_classes/drop_down_button.dart';
import 'package:snam/custom_classes/lists.dart';
import 'package:snam/most_used/common_methods.dart';
import 'package:snam/most_used/constants.dart';
import 'package:snam/screens/temp_screens/daily_report_page/components/BSheet_for_report.dart';
import 'package:snam/screens/temp_screens/daily_report_page/components/report_num.dart';

class ReportsList extends StatefulWidget {
  const ReportsList({
    Key? key,
    this.isEmpty,
  }) : super(key: key);
  final bool? isEmpty;
  @override
  State<ReportsList> createState() => _ReportsListState();
}

class _ReportsListState extends State<ReportsList> {
  String? _currentTimeInterval;

// for dropdown button width to change it only on overflowing items
  double _buttonWidth = 93;

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    print(_currentTimeInterval);
    // _currentTimeInterval = tr(context).day;
    return Expanded(
      child: Card(
        elevation: 5,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        child: Column(
          children: [
            _buildReportsTitle(context),
            Divider(
              thickness: 1,
              height: 0,
              color: kBorderColor,
            ),
            // kbigVerticalSpace,
            Expanded(
              child: widget.isEmpty ?? false
                  ? Center(
                      child: Text(
                        tr(context).noDateYet,
                        style: TextStyle(
                          fontFamily: kfontFamily,
                        ),
                      ),
                    )
                  : ListView.builder(
                      clipBehavior: Clip.antiAlias,
                      itemBuilder: (context, index) {
                        return _buildReport(context);
                      }),
            ),
          ],
        ),
      ),
    );
  }

  Column _buildReport(BuildContext context) {
    //this could be optimized
    return Column(
      //this Column is enirely for the ksimiBigVerticalSpace at the start
      // of each report
      children: [
        ksimiBigVerticalSpace,
        GestureDetector(
          onTap: () {
            buildBottomSheet(
                context: context, child: buildBSheatForReport(context));
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              kmediamHorizontalSpace,
              getProjectImg(
                  context: context,
                  size: 33,
                  imgUrl: 'assets/icons/notes.png',
                  borderColor: Colors.transparent),
              ksmallHorizontalSpace,
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      //this Row is enirely for the small horizontal padding at the end
                      // of each report
                      children: [
                        Expanded(
                          child: Column(
                            children: [
                              _buildReportFirstRow(context),
                              kminiVerticalSpace,
                              Text(
                                'هذا النص هو مثال لنص يمكن أن يستبدل في نفس المساحة، لقد تم توليد هذا ',
                                style: txMediamTextStyle,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                              kminiVerticalSpace,
                              _buildPdfRow(context)
                            ],
                          ),
                        ),
                        ksmallHorizontalSpace,
                      ],
                    ),
                    ksimiBigVerticalSpace,
                    Divider(
                      height: 5,
                      thickness: 1,
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ],
    );
  }

  Row _buildPdfRow(BuildContext context) {
    return Row(
      children: [
        getProjectImg(
            context: context,
            imgUrl: 'assets/icons/pdf.png',
            size: 19,
            borderColor: Colors.transparent),
        ksmallExtraHorizontalSpace,
        Text(
          tr(context).report,
          style: txAccentReportsListTitleStyle.copyWith(color: kprimaryColor),
        ),
        Spacer(),
        buildPDFText(context, hasFile: true),
      ],
    );
  }

  Row _buildReportFirstRow(BuildContext context) {
    return Row(
      children: [
        ...buildReportNum(context),
        Spacer(),
        Text(
          '22 - 08 - 2021',
          style: txAccentReportsListTitleStyle,
        ),
      ],
    );
  }

  Padding _buildReportsTitle(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(getRelativeWidth(16)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            '${tr(context).month}',
            style: txReportsListTitleStyle.copyWith(
                fontSize: getRelativeWidth(18)),
          ),
          StatefulBuilder(
              //to change the width of the button only
              builder: (context, _buttonSetState) {
            return Container(
              width: getRelativeWidth(_buttonWidth),
              height: getRelativeWidth(33),
              padding: const EdgeInsets.all(2),
              decoration: BoxDecoration(
                // color: kfillColor,
                borderRadius: BorderRadius.circular(getRelativeWidth(3)),
                // border: Border.all(
                //     width: getRelativeWidth(1), color: kBorderColor),
              ),
              child: CustomDropDown(
                isDense: true,
                context: context,
                items: isArLang(context) ? kmonthsAr : kmonthsEn,
                onChanged: (dynamic value) {
                  //these values overflow and i can't find the textstyle for them
                  //to change their font size so i am changing their container width
                  if (['February', 'September', 'November', 'December']
                      .any((e) => e == value)) {
                    _buttonSetState(() {
                      _buttonWidth = 113;
                    });
                  } else {
                    _buttonSetState(() {
                      _buttonWidth = 93;
                    });
                  }
                  setState(() {
                    _currentTimeInterval = value;
                  });
                },
                //inside calculate relative value
                labelFontSize: 15,
                selectedValue: _currentTimeInterval,
                hint: tr(context).month,
                noBorder: true,
                //these two are workaround to give padding
                prefix: SizedBox(
                  width: 0,
                ),
                prefixSize: getRelativeWidth(7),
              ),
            );
          })
        ],
      ),
    );
  }
}
