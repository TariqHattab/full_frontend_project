import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:snam/most_used/constants.dart';
import 'package:snam/most_used/temp_changing_values.dart';
import 'package:snam/screens/components/file_card.dart';
import 'package:snam/most_used/common_methods.dart';

class RejectedRequestCard extends StatelessWidget {
  RejectedRequestCard({Key? key}) : super(key: key);

  List<PDFModel>? _cards;
  //image width will be resized in getProjectImg
  var imageWidth = getRelativeWidth(48);
  var sizedBoxWidth = getRelativeWidth(20);

  var extraWidthOnMySC = 48 + 20;

  //need to be initilized at the start
  var wocOnOthers;
  //widthOfColumnOnMyScreen
  var wocOnMyScreen;

  void initWidth() {
    wocOnMyScreen = kpRelativeScreenWidth - extraWidthOnMySC;
    wocOnOthers = kpCurrentUserScreenWidth - (imageWidth + sizedBoxWidth);
  }

  double _calculateHeight(double height) => getHeightIfSmall(
        height: height,
        wOnMyScreen: wocOnMyScreen,
        wOnOtherUsersScreens: wocOnOthers,
      );

  @override
  Widget build(BuildContext context) {
    initWidth();
    var relativeHeightOC = _calculateHeight(400);

    _cards = <PDFModel>[
      PDFModel(title: tr(context).electronicContract, hasFile: true),
      PDFModel(title: tr(context).designs, hasFile: true),
    ];
    return Container(
      height: relativeHeightOC,
      // width: double.infinity,
      // height: 360,
      // color: Colors.amberAccent,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          getProjectImg(context: context, size: 48),
          SizedBox(
            width: sizedBoxWidth,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  tr(context).projectName,
                  style: txSmallTitleTextStyle,
                ),
                SizedBox(
                  height: _calculateHeight(27),
                ),
                Container(
                  height: 40,
                  child: buildOverFlowInnerInfo(
                      data: '5153202188',
                      minFontSizeForData: 15,
                      title: tr(context).projectNum,
                      width: 115,
                      imgPath: 'assets/icons/number.png'),
                ),
                SizedBox(
                  height: _calculateHeight(22),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    FileCard(
                        hasFileFromStart: _cards![0].hasFile,
                        title: _cards![0].title),
                    FileCard(
                        hasFileFromStart: _cards![1].hasFile,
                        title: _cards![1].title),
                  ],
                ),
                SizedBox(
                  height: _calculateHeight(20),
                ),
                Expanded(
                  child: Row(
                    children: [
                      buildOverFlowInnerInfo(
                        data: 'منصة سنم',
                        title: tr(context).rejectionParty,
                        width: getRelativeWidth(115),
                        imgPath: 'assets/icons/number.png',
                        removeImage: true,
                        useIcon: true,
                        icon: Icons.highlight_off,
                        textHeight: 1.31,
                        dataCrossAxisAlignment: CrossAxisAlignment.start,
                      ),
                      VerticalDivider(
                        color: kBorderColor,
                        width: getRelativeWidth(25),
                        //60 for this row height - 37 for amount of indent
                        endIndent: _calculateHeight(23),
                      ),
                      GestureDetector(
                        onTap: () {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return buildSimpleDailog(context);
                            },
                          );
                        },
                        child: buildOverFlowInnerInfo(
                          data: 'عرض غير  مجدي اقتصاديا وماليا',
                          title: tr(context).rejectionReson,
                          width: getRelativeWidth(130),
                          imgPath: 'assets/icons/number.png',
                          // minFontSize: 2,
                          minFontSizeForData: 11,
                          dataMaxLines: 2,
                          removeImage: true,
                          useIcon: true,

                          icon: Icons.help_outline,
                          textHeight: 1.40,
                          dataCrossAxisAlignment: CrossAxisAlignment.start,
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  SimpleDialog buildSimpleDailog(BuildContext context) {
    return SimpleDialog(
      backgroundColor: kfillColor,

      // titlePadding: const EdgeInsets.all(16),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      title: Text(
        tr(context).rejectionResonsProject,
        style: txMediamTextStyle.copyWith(
            fontSize: 19, fontWeight: FontWeight.bold),
      ),
      children: [
        Divider(
          thickness: 1,
        ),
        Container(
          color: kfillColor,
          padding: const EdgeInsets.all(16),
          // height: 300,
          // alignment: AlignmentDirectional.centerStart,
          width: screenWidth(context) * .6,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Icon(
              //   Icons.help_outline,
              //   size: 50,
              //   color: ksecondaryFillColor,
              // ),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                child: AutoSizeText(
                  '''هذا النص أو العديد من النصوص الأخرى إضافة إلى زيادة عدد الحروف التى يولدها التطبيق.
إذا كنت تحتاج إلى عدد أكبر من الفقرات يتيح لك مولد النص العربى زيادة عدد الفقرات كما تريد،''',
                  // overflowReplacement: ,
                  maxLines: 20,
                  minFontSize: 16,

                  style: TextStyle(
                    height: 1.5,
                    fontSize: 18,
                    fontFamily: kfontFamily,
                    color: kprimaryTextColor,
                  ),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
