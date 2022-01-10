import 'package:auto_size_text/auto_size_text.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:snam/most_used/common_methods.dart';
import 'package:snam/most_used/constants.dart';
import 'package:snam/screens/components/app_bar.dart';
import 'package:snam/screens/components/main_drawer.dart';
import 'package:snam/screens/temp_screens/daily_report_page/components/reports_list.dart';

class DailyReportPage extends StatelessWidget {
  const DailyReportPage({Key? key, this.pageIsEmpty = false}) : super(key: key);
  final bool pageIsEmpty;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        pageTitle: tr(context).dailyReport,
        showLeadingButton: false,
      ),
      // drawer: MainDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(16),
              width: screenWidth(context),
              decoration: BoxDecoration(
                  color: kfillColor,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(width: 1, color: kBorderColor)),
              height: getRelativeWidth(184),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(child: _buildChart(isEmpty: pageIsEmpty)),
                  _buildSmallTextBelowChart(context, isEmpty: pageIsEmpty)
                ],
              ),
              // color: Colors.amberAccent,
            ),
            kbigVerticalSpace,
            ReportsList(
              isEmpty: pageIsEmpty,
            )
          ],
        ),
      ),
    );
  }

  Container _buildSmallTextBelowChart(BuildContext context,
      {bool? isEmpty = false}) {
    return Container(
      // color: Colors.blue,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          AutoSizeText(
            isEmpty ?? false ? '0K' : '30K',
            style: txChartNumTextStyle,
            maxFontSize: 40,
          ),
          Text(
            tr(context).thisMonth,
            style: txChartTxTextStyle,
          ),
        ],
      ),
    );
  }

  LineChart _buildChart({bool? isEmpty = false}) => LineChart(
        LineChartData(
          //this is just to show horizontal line when empty
          maxX: isEmpty ?? true ? 30 : null,
          minX: isEmpty ?? true ? 0 : null,
          maxY: isEmpty ?? true ? 0 : null,
          minY: isEmpty ?? true ? 10 : null,

          gridData: FlGridData(
            show: false,

            drawVerticalLine: false,

            // },
          ),
          borderData: FlBorderData(
            show: false,

            // border: Border.all(color: const Color(0xff37434d), width: 1),
          ),
          axisTitleData: FlAxisTitleData(show: false),
          titlesData: FlTitlesData(show: false),
          lineTouchData: LineTouchData(
              handleBuiltInTouches: true,
              touchTooltipData: LineTouchTooltipData(
                tooltipRoundedRadius: 8,
              )),
          lineBarsData: [
            LineChartBarData(
              spots: (isEmpty ?? true)
                  ? [
                      FlSpot(0, 5),
                      FlSpot(30, 5),
                    ]
                  : [
                      FlSpot(0, 3),
                      FlSpot(2.6, 2),
                      FlSpot(4.9, 5),
                      FlSpot(6.8, 2.5),
                      FlSpot(8, 4),
                      FlSpot(9.5, 3),
                      FlSpot(11, 4),
                    ],
              isCurved: true,
              curveSmoothness: .4,
              dotData: FlDotData(show: false),
              // colorStops: Colors.transparent,
              colors: [
                kBorderColor,
                kaccentTextColor,
                kBorderColor,
                kaccentTextColor,
                kBorderColor,
              ],

              // isStepLineChart: true,
              barWidth: 5,
              // dotData: FlDotData(show: false),
              belowBarData: BarAreaData(
                show: false,
                // colors: gradientColors
                //     .map((color) => color.withOpacity(0.3))
                //     .toList(),
              ),
            ),
          ],
        ),
      );
}
