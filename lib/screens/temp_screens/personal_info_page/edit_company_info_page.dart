import 'package:flutter/material.dart';
import 'package:snam/most_used/common_methods.dart';

import 'package:snam/screens/components/app_bar.dart';
import 'package:snam/screens/components/main_drawer.dart';
import 'package:snam/screens/forms/edit_company_info_form.dart';
import 'package:snam/screens/forms/edit_personal_info_form.dart';
import 'package:snam/screens/forms/land_info_form.dart';

class CompanyInfoPage extends StatelessWidget {
  const CompanyInfoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        pageTitle: tr(context).personalFile,
        // showLeadingButton: false,
      ),
      drawer: MainDrawer(),
      body: EditCompanyInfoForm(),
    );
  }
}
