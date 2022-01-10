import 'dart:ui';

import 'package:auto_size_text/auto_size_text.dart';
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
import 'package:snam/screens/temp_screens/register_page/components/form_types_steps.dart';
import 'package:snam/utils/enums.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({Key? key, this.selectedForm = 1, required this.forms})
      : super(key: key);

  final List<dynamic> forms;
  final int selectedForm;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        pageTitle: tr(context).register,
        showLeadingButton: false,
        showActions: false,
      ),
      // drawer: MainDrawer(),
      body: Column(
        children: [
          // kbigVerticalSpace,
          FormTypesSteps(
            items: [
              kpCurrentUser == CurrentUser.landOwner
                  ? tr(context).landOwnerInfo
                  : tr(context).companyInfo,
              tr(context).landInfo,
              tr(context).attachRequirements,
            ],
            currentSelectedItem: selectedForm,
          ),
          Expanded(child: forms[selectedForm - 1]),
        ],
      ),
    );
  }
}
