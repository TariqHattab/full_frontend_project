import 'package:flutter/material.dart';
import 'package:snam/most_used/common_methods.dart';
import 'package:snam/most_used/constants.dart';
import 'package:snam/screens/components/app_bar.dart';
import 'package:snam/screens/components/main_drawer.dart';
import 'package:snam/screens/forms/land_info_form.dart';
import 'package:snam/screens/forms/land_owner_info_form.dart';
import 'package:snam/screens/forms/pdf_files_form.dart';
import 'package:snam/screens/temp_screens/user_type_page/group_type_page.dart';

class UserTypePage extends StatelessWidget {
  const UserTypePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var sizedBox = SizedBox(height: getRelativeWidth(24));
    //to make it expanded
    int flex = screenHeight(context) < 684 ? 1 : 0;
    return Scaffold(
      appBar: CustomAppBar(
        pageTitle: tr(context).selectUserType,
        showLeadingButton: false,
        showActions: false,
      ),
      // drawer: MainDrawer(),
      body: Padding(
        padding: EdgeInsets.all(getRelativeWidth(24)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildUserType(
                flex: flex,
                context: context,
                imgName: 'owner',
                data: tr(context).landOwner),
            sizedBox,
            _buildUserType(
              flex: flex,
              context: context,
              imgName: 'constructor',
              imgSize: 72,
              sizedBoxHeight: 3,
              data: tr(context).constructor,
            ),
            sizedBox,
            _buildUserType(
                flex: flex,
                context: context,
                imgName: 'engineer',
                data: tr(context).engineer),
            sizedBox,
            _buildUserType(
              flex: flex,
              context: context,
              imgName: 'company',
              imgSize: 90,
              data: tr(context).buildingResourcesCorporation,
            ),
          ],
        ),
      ),
    );
  }

  Expanded _buildUserType({
    required BuildContext context,
    required String imgName,
    double imgSize = 75,
    double? sizedBoxHeight = 0,
    required String data,
    Color? imgColor,
    int flex = 0,
    double textFontSize = 15,
  }) {
    imgSize = getRelativeWidth(imgSize);
    return Expanded(
      flex: flex,
      child: GestureDetector(
        onTap: () => nv(context).push(pageTransition(context, GroupTypePage())),
        child: Container(
          padding: EdgeInsets.all(getRelativeWidth(13)),
          height: getRelativeWidth(120),
          width: double.infinity,
          decoration: BoxDecoration(color: kfillColor),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                  child: getImgAsset(
                      imgName: imgName, size: imgSize, imgColor: imgColor)),
              SizedBox(
                height: sizedBoxHeight,
              ),
              Text(
                data,
                style: txUserTypeTextStyle.copyWith(fontSize: textFontSize),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
