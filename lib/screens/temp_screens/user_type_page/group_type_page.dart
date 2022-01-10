import 'package:flutter/material.dart';
import 'package:snam/most_used/common_methods.dart';
import 'package:snam/most_used/constants.dart';
import 'package:snam/most_used/temp_changing_values.dart';
import 'package:snam/screens/components/app_bar.dart';
import 'package:snam/screens/components/main_drawer.dart';
import 'package:snam/screens/forms/attach_requirements.dart';
import 'package:snam/screens/forms/company_info_form.dart';
import 'package:snam/screens/forms/land_info_form.dart';
import 'package:snam/screens/forms/land_owner_info_form.dart';
import 'package:snam/screens/forms/pdf_files_form.dart';
import 'package:snam/screens/temp_screens/add_project_page/add_project_page.dart';
import 'package:snam/screens/temp_screens/personal_info_page/edit_company_info_page.dart';
import 'package:snam/screens/temp_screens/personal_info_page/edit_personal_info_page.dart';
import 'package:snam/screens/temp_screens/register_page/register_page.dart';
import 'package:snam/utils/enums.dart';

class GroupTypePage extends StatelessWidget {
  const GroupTypePage({Key? key, this.isFromEditPage = false})
      : super(key: key);

  //this check in case this page was called from the drawer
  final bool isFromEditPage;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        pageTitle: tr(context).selectUserType,
        showLeadingButton: false,
        showActions: false,
      ),
      // drawer: MainDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildGroupType(
                context: context,
                currentUser: CurrentUser.landOwner,
                goToPage: isFromEditPage
                    ? PersonalInfoPage()
                    : RegisterPage(forms: [
                        LandOwnerInfoForm(),
                        LandInfoForm(),
                        AttachRequirementsForm(
                          isCompany: false,
                        ),
                      ]),
                imgName: 'one',
                data: tr(context).individual),
            kextraBigVerticalSpace,
            _buildGroupType(
                context: context,
                currentUser: CurrentUser.company,
                goToPage: isFromEditPage
                    ? CompanyInfoPage()
                    : RegisterPage(forms: [
                        CompanyInfoForm(),
                        LandInfoForm(),
                        AttachRequirementsForm(
                          isCompany: true,
                        ),
                      ]),
                imgName: 'group',
                data: tr(context).company,
                imgColor: kprimaryTextColor),
          ],
        ),
      ),
    );
  }

  GestureDetector _buildGroupType({
    required BuildContext context,
    required String imgName,
    required String data,
    Color? imgColor,
    required CurrentUser currentUser,
    required Widget goToPage,
  }) {
    return GestureDetector(
      onTap: () {
        kpCurrentUser = currentUser;
        nv(context).push(pageTransition(context, goToPage));
        print(kpCurrentUser);
      },
      child: Container(
        height: 171,
        width: double.infinity,
        decoration: BoxDecoration(color: kfillColor),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            getImgAsset(imgName: imgName, size: 75, imgColor: imgColor),
            ksmallVerticalSpace,
            Text(
              data,
              style: txGroupTypeTextStyle,
            )
          ],
        ),
      ),
    );
  }
}
