import 'package:flutter/material.dart';
import 'package:snam/most_used/common_methods.dart';
import 'package:snam/most_used/constants.dart';

class IBANFormField extends StatelessWidget {
  const IBANFormField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return buildTextFormField(
        suffix: Container(
          // decoration: BoxDecoration(
          //     borderRadius: BorderRadius.circular(5),
          //     border: Border.all(
          //       width: 1,
          //     )),
          // padding: const EdgeInsets.symmetric(horizontal: 5),
          child: Text('SA'),
        ),
        // suffixText: 'SA',
        labelText: tr(context).iBANnumber,
        image: getImgAsset(
          imgColor: kTextFieldIconColor,
          imgName: 'bank',
        ));
  }
}
