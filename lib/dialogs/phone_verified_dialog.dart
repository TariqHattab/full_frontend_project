import 'package:flutter/material.dart';
import 'package:snam/most_used/common_methods.dart';
import 'package:snam/most_used/constants.dart';

class PhoneVerifiedDialog extends StatelessWidget {
  const PhoneVerifiedDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      title: Text(
        'Phone Verified',
        style: TextStyle(color: kprimaryTextColor, fontFamily: kfontFamily),
      ),
      content: Container(
          height: 70,
          child: Center(
              child: Text('Phone Verified Succefully',
                  style: TextStyle(
                      color: kprimaryTextColor, fontFamily: kfontFamily)))),
      actions: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 32),
          width: double.infinity,
          // height: 52,
          child: ElevatedButton(
              onPressed: () {
                nv(context).pop();
              },
              style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(3)),
                  primary: kprimaryColor),
              child: Text('Ok', style: txSmallButtonTextStyle)),
        )
      ],
    );
  }
}
