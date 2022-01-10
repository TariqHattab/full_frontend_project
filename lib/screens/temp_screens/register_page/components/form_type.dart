import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:snam/most_used/common_methods.dart';
import 'package:snam/most_used/constants.dart';

class FormType extends StatelessWidget {
  const FormType({
    Key? key,
    required this.isActive,
    required this.info,
    required this.imgSize,
  }) : super(key: key);

  final bool isActive;
  final String info;
  final double imgSize;

  @override
  Widget build(BuildContext context) {
    double textContainerWidth = 100;
    double textStart = (textContainerWidth / 2) - (imgSize / 2);

    return Stack(
      clipBehavior: Clip.none,
      children: [
        getImgAsset(
            imgName: isActive ? 'active_step' : 'unactive_step', size: imgSize),
        ksmallExtraVerticalSpace,
        PositionedDirectional(
          bottom: -90,
          start: -textStart,
          child: Container(
            // color: Colors.red,
            width: 100,
            alignment: Alignment.topCenter,
            height: 80,
            child: AutoSizeText(
              info,
              textAlign: TextAlign.center,
              maxLines: 2,
              style: isActive
                  ? txActiveStepsInfoTextStyle
                  : txUnActiveStepsInfoTextStyle,
            ),
          ),
        )
      ],
    );
  }
}
