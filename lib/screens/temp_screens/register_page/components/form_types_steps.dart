import 'package:flutter/material.dart';
import 'package:snam/most_used/constants.dart';
import 'package:snam/screens/temp_screens/register_page/components/form_type.dart';

class FormTypesSteps extends StatelessWidget {
  FormTypesSteps({
    Key? key,
    required this.items,
    required this.currentSelectedItem,
  }) : super(key: key);

  double lineHeight = 2;

  double bigLineWidth = 57;
  double smallLineWidth = 40;

  double bigImgSize = 45;
  double smallImgSize = 37;

  double? lineWidth;
  double? imgSize;

  List<String> items;
  int currentSelectedItem;

  void setVariables() {
    lineWidth = items.length <= 3 ? bigLineWidth : smallLineWidth;
    imgSize = items.length <= 3 ? bigImgSize : smallImgSize;
  }

  bool isActive(int index) => index <= (currentSelectedItem - 1);

  @override
  Widget build(BuildContext context) {
    setVariables();
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Container(
        // height: 170,
        // color: Colors.white,
        padding: const EdgeInsetsDirectional.only(
            top: 16, start: 16, end: 16, bottom: 25),
        child: Wrap(
          runAlignment: WrapAlignment.start,
          runSpacing: 40,
          crossAxisAlignment: WrapCrossAlignment.center,
          children: [
            FormType(
              isActive: true,
              info: items[0],
              imgSize: imgSize ?? bigImgSize,
            ),
            for (var i = 1; i < items.length; i++) ...[
              if (i != 4) ...[
                kminiHorizontalSpace,
                Container(
                  width: lineWidth,
                  height: lineHeight,
                  color: isActive(i) ? kacceptColor : kBorderColor,
                ),
                kminiHorizontalSpace,
              ],
              FormType(
                isActive: isActive(i),
                info: items[i],
                imgSize: imgSize ?? bigImgSize,
              ),
            ]
          ],
        ),
      ),
    );
  }
}
