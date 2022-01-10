import 'package:flutter/material.dart';
import 'package:snam/most_used/constants.dart';
import 'package:snam/most_used/common_methods.dart';
import 'package:snam/screens/temp_screens/project_details/project_detail_page.dart';

class ProjectCard extends StatelessWidget {
  const ProjectCard({Key? key, required this.isDone}) : super(key: key);

  final bool isDone;
  @override
  Widget build(BuildContext context) {
    var city = 'الرياض';

    return Stack(
      //used Stack so that the city location does not overlap with the column
      children: [
        GestureDetector(
          onTap: () =>
              nv(context).push(pageTransition(context, ProjectDetailsPage())),
          child: Container(
            width: screenWidth(context),
            height: getRelativeWidth(90),
            // color: Colors.green,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                getProjectImg(context: context),
                ksimiBigHorizontalSpace,
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        tr(context).projectName,
                        style: txSmallTitleTextStyle.copyWith(
                            fontSize: getRelativeWidth(15)),
                      ),
                      SizedBox(
                        height: getRelativeWidth(46),
                        child: Container(
                          // color: Colors.amber,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Expanded(
                                flex: 5,
                                child: buildOverFlowInnerInfo(
                                    data: '5153202188',
                                    title: tr(context).projectNum,
                                    width: 100,
                                    spaceInMiddle: 10,
                                    // dataMaxLines: 1,
                                    minFontSizeForData: 2,
                                    imgPath: 'assets/icons/number.png'),
                              ),
                              VerticalDivider(
                                color: kBorderColor,
                                width: getRelativeWidth(25),
                              ),
                              Expanded(
                                flex: 3,
                                child: buildOverFlowInnerInfo(
                                    data: isDone ? '100%' : '60%',
                                    title: tr(context).completionRate,
                                    spaceInMiddle: 10,
                                    width: 60,
                                    imgPath: 'assets/icons/accomplish.png'),
                              ),
                              if (isDone)
                                VerticalDivider(
                                  color: kBorderColor,
                                  width: getRelativeWidth(25),
                                ),
                              Expanded(
                                flex: isDone ? 4 : 2,
                                child: isDone
                                    ? buildOverFlowInnerInfo(
                                        data: tr(context).finished,
                                        // dataTextStyle: TextStyle(
                                        //   // height: textHeight,

                                        //   fontFamily: kfontFamily,
                                        //   color: Colors.green[700],
                                        // ),
                                        title: tr(context).projectStatus,
                                        spaceInMiddle: 10,
                                        width: 95,
                                        minFontSizeForData: 12,
                                        useIcon: true,
                                        removeImage: true,
                                        icon: Icons.check_circle_outline,
                                        iconColor: Colors.green.shade400)
                                    : Container(),
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        Positioned.directional(
            textDirection: getTextDirection(context),
            end: 5,
            top: 0,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset(
                  'assets/icons/location.png',
                  height: getRelativeWidth(18),
                  width: getRelativeWidth(15),
                ),
                SizedBox(
                  width: getRelativeWidth(8),
                ),
                Text(
                  city,
                  overflow: TextOverflow.visible,
                  style: txSmallTitleTextStyle.copyWith(
                      fontSize: getRelativeWidth(15), color: kprimaryColor),
                )
              ],
            ))
      ],
    );
  }
}
