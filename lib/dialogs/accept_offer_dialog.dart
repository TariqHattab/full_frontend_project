import 'package:flutter/material.dart';
import 'package:snam/most_used/common_methods.dart';
import 'package:snam/most_used/constants.dart';
import 'package:snam/screens/temp_screens/temp_main_page.dart';

class AcceptOfferDialog extends StatelessWidget {
  const AcceptOfferDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      title: Text(
        tr(context).acceptOfferTitle,
        style: TextStyle(fontFamily: kfontFamily, color: kprimaryTextColor),
      ),
      content: Container(
          height: 70,
          child: Center(
              child: Text(tr(context).acceptOfferContent,
                  style: TextStyle(
                      color: kprimaryTextColor, fontFamily: kfontFamily)))),
      actionsAlignment: MainAxisAlignment.spaceAround,
      actions: [
        Container(
          // padding: const EdgeInsets.symmetric(horizontal: 32),
          width: 100,
          // height: 52,
          child: ElevatedButton(
            onPressed: () async {
              nv(context).pushReplacement(pageTransition(context, MainPage()));
            },
            style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(3)),
                primary: kacceptColor),
            child: Text(tr(context).accept, style: txSmallButtonTextStyle),
          ),
        ),
        Container(
          // padding: const EdgeInsets.symmetric(horizontal: 32),
          width: 100,
          // height: 52,
          child: ElevatedButton(
              onPressed: () async {
                nv(context).pop();
              },
              style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(3)),
                  primary: krejectColor),
              child: Text(tr(context).back, style: txSmallButtonTextStyle)),
        )
      ],
    );
  }
}
