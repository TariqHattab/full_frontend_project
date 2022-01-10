import 'package:flutter/material.dart';
import 'package:snam/most_used/common_methods.dart';
import 'package:snam/most_used/constants.dart';

class LoginLogo extends StatelessWidget {
  const LoginLogo({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: getRelativeWidth(195),
      padding: EdgeInsets.only(
        top: getRelativeWidth(60),
        bottom: getRelativeWidth(60),
        right: getRelativeWidth(60),
        left: getRelativeWidth(60),
      ),
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
            // tileMode: TileMode.repeated,
            colors: kloginGradient,
            begin: AlignmentDirectional.topEnd,
            end: AlignmentDirectional.bottomStart),
      ),
      child: getImgAsset(imgName: 'logo', size: getRelativeWidth(6)),
    );
  }
}
