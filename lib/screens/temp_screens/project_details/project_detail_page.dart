import 'package:flutter/material.dart';
import 'package:snam/most_used/common_methods.dart';
import 'package:snam/most_used/constants.dart';
import 'package:snam/screens/components/app_bar.dart';
import 'package:snam/screens/components/file_card.dart';
import 'package:snam/screens/temp_screens/camera_page/camera_page.dart';
import 'package:snam/screens/temp_screens/daily_report_page/daily_report.dart';
import 'package:snam/screens/temp_screens/project_details/components/time_schedule.dart';

class ProjectDetailsPage extends StatelessWidget {
  ProjectDetailsPage({Key? key}) : super(key: key);
  List<PDFModel>? _cards;
  @override
  Widget build(BuildContext context) {
    _cards = <PDFModel>[
      PDFModel(title: tr(context).electronicContract, hasFile: true),
      PDFModel(title: tr(context).digitalSignature, hasFile: true),
      PDFModel(title: tr(context).certifiedFingerprintAppraisal, hasFile: true),
      PDFModel(title: tr(context).organizationalSketch, hasFile: true),
      PDFModel(title: tr(context).designs, hasFile: true),
    ];
    return Scaffold(
      appBar: CustomAppBar(
        pageTitle: tr(context).projectDetails,
        showLeadingButton: false,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: SingleChildScrollView(
          child: Column(
            children: [
              kmediamVerticalSpace,
              _buildProjectInfo(context),
              ksimiBigVerticalSpace,
              _buildButtons(context),
              kmediamVerticalSpace,
            ],
          ),
        ),
      ),
    );
  }

  Container _buildProjectInfo(BuildContext context) {
    return Container(
      // color: Colors.amber,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          getProjectImg(
              context: context, imgUrl: 'assets/icons/add_project.png'),
          ksimiBigHorizontalSpace,
          Expanded(
            child: Container(
              // color: Colors.cyan,

              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 3,
                  ),
                  getProjectTite(context: context),
                  ksimiBigVerticalSpace,
                  _buildInfoRow(
                    context: context,
                    firstTitle: tr(context).projectType,
                    firstData: 'عمارة',
                    secondTitle: tr(context).unitsNum,
                    secondData: '6',
                  ),
                  kmediamVerticalSpace,
                  _buildInfoRow(
                      context: context,
                      firstTitle: tr(context).electronicInstrumentNumber,
                      firstData: '265161',
                      secondTitle: tr(context).city,
                      secondData: 'الرياض',
                      fontSize: isArLang(context) ? 11 : 7),
                  kmediamVerticalSpace,
                  _buildInfoRow(
                    context: context,
                    firstTitle: tr(context).district,
                    firstData: 'اسم الحي',
                    secondTitle: tr(context).location,
                    secondData: 'google map link',
                  ),
                  kmediamVerticalSpace,
                  _buildInfoRow(
                    context: context,
                    firstTitle: tr(context).landLength,
                    firstData: '100',
                    secondTitle: tr(context).landWidth,
                    secondData: '150',
                  ),
                  kmediamVerticalSpace,
                  _buildInfoRow(
                    context: context,
                    firstTitle: tr(context).landValueWithProfits,
                    firstData: 'ريال 1500000',
                    onlyFirst: true,
                    fontSize: 11,
                    secondTitle: '',
                    secondData: '',
                  ),
                  kmediamVerticalSpace,
                  _buildFileCards(),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  GridView _buildFileCards() {
    return GridView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: _cards?.length ?? 3,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 47,
          mainAxisSpacing: 24,
          childAspectRatio: 126 / 168),
      itemBuilder: (context, index) => FileCard(
        title: _cards![index].title,
        hasFileFromStart: _cards![index].hasFile,
      ),
    );
  }

  SizedBox _buildButtons(BuildContext context) {
    return SizedBox(
      height: getRelativeWidth(52),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: ElevatedButton(
              onPressed: () {
                buildBottomSheet(context: context, child: TimeSchedule());
              },
              style: ElevatedButton.styleFrom(primary: kprimaryColor),
              child: Text(
                tr(context).timetable,
                style: txTimeTableButtonTextStyle,
              ),
            ),
          ),
          ksmallExtraHorizontalSpace,
          SizedBox(
            width: getRelativeWidth(52),
            child: ElevatedButton(
              onPressed: () {
                nv(context).push(pageTransition(context, DailyReportPage()));
              },
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.all(0),
                primary: kprimaryColor,
              ),
              child: getImgAsset(imgName: 'timeline', size: 27),
            ),
          ),
          ksmallExtraHorizontalSpace,
          SizedBox(
            width: getRelativeWidth(52),
            child: ElevatedButton(
              onPressed: () {
                nv(context).push(pageTransition(context, CameraPage()));
              },
              style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.all(0), primary: kprimaryColor),
              child: getImgAsset(imgName: 'camera', size: 24),
            ),
          )
        ],
      ),
    );
  }

  SizedBox _buildInfoRow({
    required BuildContext context,
    required String firstTitle,
    required String secondTitle,
    required String firstData,
    required String secondData,
    bool onlyFirst = false,
    double fontSize = 10,
  }) {
    return SizedBox(
      height: 43,
      child: Container(
        // color: Colors.orange,
        child: Row(
          children: [
            buildOverFlowInnerInfo(
                data: firstData,
                title: firstTitle,
                width: getRelativeWidth(115),
                removeImage: true,
                dataMaxLines: 1,
                minFontSize: fontSize),
            if (!onlyFirst) ...[
              VerticalDivider(
                color: kBorderColor,
                width: 25,
              ),
              buildOverFlowInnerInfo(
                data: secondData,
                title: secondTitle,
                width: getRelativeWidth(115),
                removeImage: true,
                minFontSize: fontSize,
                dataMaxLines: 1,
              ),
            ]
          ],
        ),
      ),
    );
  }
}
