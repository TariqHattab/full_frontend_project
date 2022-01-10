import 'package:flutter/material.dart';
import 'package:snam/most_used/common_methods.dart';
import 'package:snam/most_used/constants.dart';

class Contacts extends StatelessWidget {
  const Contacts({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: kfillColor,
      padding: const EdgeInsets.all(16),
      child: Directionality(
        textDirection: TextDirection.ltr,
        child: Column(
          children: [
            _buildContactRow(
                imgName: 'mail', contactText: 'Contact@sanm.com.sa'),
            SizedBox(height: getRelativeWidth(6)),
            _buildContactRow(imgName: 'twitter', contactText: '@SanmApp'),
            SizedBox(height: getRelativeWidth(6)),
            _buildContactRow(imgName: 'whatsapp', contactText: '8007287777'),
          ],
        ),
      ),
    );
  }

  Row _buildContactRow({
    required String imgName,
    required String contactText,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        getImgAsset(imgName: imgName, size: 19),
        ksmallExtraHorizontalSpace,
        Text(
          contactText,
          style: txContactTextStyle.copyWith(fontSize: getRelativeWidth(18)),
        ),
      ],
    );
  }
}
