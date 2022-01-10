import 'package:flutter/material.dart';
import 'package:snam/most_used/common_methods.dart';
import 'package:snam/most_used/constants.dart';
import 'package:snam/screens/temp_screens/temp_main_page.dart';

class DeletePDFDialog extends StatelessWidget {
  const DeletePDFDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Icon(
            Icons.delete_outlined,
            size: 23,
            color: kTextFieldIconColor,
          ),
          SizedBox(
            width: 3,
          ),
          Text(
            tr(context).deletePdf,
            style: TextStyle(color: kprimaryTextColor, fontFamily: kfontFamily),
          ),
        ],
      ),
      contentPadding: const EdgeInsets.all(14),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Divider(
            thickness: 1,
          ),
          Container(
              height: 70,
              child: Center(
                child: Text(
                  tr(context).deletePdfContent,
                  style: TextStyle(
                    color: kprimaryTextColor,
                    fontFamily: kfontFamily,
                  ),
                ),
              )),
        ],
      ),
      actionsAlignment: MainAxisAlignment.spaceAround,
      actions: [
        Container(
          // padding: const EdgeInsets.symmetric(horizontal: 32),
          width: 100,
          // height: 52,
          child: ElevatedButton(
              onPressed: () async {
                nv(context).pop(true);
              },
              style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(3)),
                  primary: kacceptColor),
              child: Text(tr(context).delete, style: txSmallButtonTextStyle)),
        ),
        Container(
          // padding: const EdgeInsets.symmetric(horizontal: 32),
          width: 100,
          // height: 52,
          child: ElevatedButton(
              onPressed: () async {
                nv(context).pop(false);
              },
              style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(3)),
                  primary: krejectColor),
              child: Text(tr(context).cancel, style: txSmallButtonTextStyle)),
        )
      ],
    );
  }
}
