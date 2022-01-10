import 'package:flutter/material.dart';
import 'package:snam/most_used/common_methods.dart';
import 'package:snam/most_used/constants.dart';

//this import for mapIndexed function to get the index
import 'package:collection/collection.dart';

class RejectionResonsBSheet extends StatefulWidget {
  const RejectionResonsBSheet({Key? key}) : super(key: key);

  @override
  State<RejectionResonsBSheet> createState() => _RejectionResonsBSheetState();
}

class _RejectionResonsBSheetState extends State<RejectionResonsBSheet> {
  bool showTextField = false;

  Map<int, bool> choosenResons = {
    for (var i = 0; i < 5; i++) i: false,
  };
  List<String> rejectionResons = [
    'غير مجدي اقتصاديا وماليا عرض سنم',
    'عدم استلام دفعة اولى عند توقيع العقد',
    'طول فترة تنفيذ المشروع',
    'عدم مناسبة التصاميم',
    'اخرى ( اذكر السبب )',
  ];

  @override
  Widget build(BuildContext context) {
    print(choosenResons);

    return Container(
      // height: screenHeight(context) * .75,
      width: screenWidth(context),
      padding: EdgeInsets.only(
        top: 32,
        right: 32,
        left: 32,
        bottom: 32 + MediaQuery.of(context).viewInsets.bottom,
      ),
      // padding: const EdgeInsets.all(32),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              tr(context).rejectionResonsProject,
              style: txMediamTextStyle.copyWith(fontSize: 19),
            ),
            Divider(
              thickness: 1,
              height: 16,
            ),
            //mapIndexed is from collection lib
            ...rejectionResons.mapIndexed(_buildCheckTile),
            //  Container(
            //       margin: const EdgeInsets.symmetric(vertical: 0),
            //       padding: const EdgeInsets.all(0),
            //       child: TextButton(
            //         // style: TextButton.styleFrom(padding: const EdgeInsets.all(0)),
            //         onPressed: () {
            //           if (reson == 'اخرى ( اذكر السبب )') {
            //             setState(() {
            //               showTextField = !showTextField;
            //             });
            //           }
            //         },
            //         child: Text(reson,
            //             style: txSecondaryTitleStyle.copyWith(fontSize: 15)),
            //       ),
            //     )),
            if (showTextField)
              buildNormalTextField(labelText: tr(context).rejectionReson),
            ksmallVerticalSpace,
            if (!showTextField)
              Divider(
                thickness: 1,
                height: 0,
              ),
            kbigVerticalSpace,
            kbigVerticalSpace,
            SizedBox(
              height: 48,
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(primary: kprimaryColor),
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text(
                  tr(context).agree,
                  style: TextStyle(
                      fontFamily: kfontFamily,
                      fontSize: 16,
                      fontWeight: FontWeight.normal,
                      color: Colors.white),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildCheckTile(int index, String reson) => CheckboxListTile(
        title: Text(reson, style: txSecondaryTitleStyle.copyWith(fontSize: 15)),
        value: choosenResons[index],
        onChanged: (newValue) {
          if (newValue == null) return;
          setState(() {
            choosenResons[index] = newValue;
          });
          if (reson == 'اخرى ( اذكر السبب )') {
            setState(() {
              showTextField = !showTextField;
            });
          }
        },
        contentPadding: const EdgeInsets.all(0),
        controlAffinity:
            ListTileControlAffinity.leading, //  <-- leading Checkbox
      );
}
