import 'package:flutter/material.dart';
import 'package:snam/most_used/common_methods.dart';

class Badge extends StatelessWidget {
  const Badge({
    Key? key,
    required this.child,
    required this.value,
    this.color,
  }) : super(key: key);

  final Widget child;
  final String value;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.center,
      children: [
        child,
        Positioned.directional(
          textDirection: getTextDirection(context),
          end: getRelativeWidth(4),
          top: -getRelativeWidth(2),
          child: Container(
            // padding: EdgeInsets.all(4.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              color: color ?? Theme.of(context).colorScheme.secondary,
            ),
            width: getRelativeWidth(9),
            height: getRelativeWidth(9),
          ),
        )
      ],
    );
  }
}
