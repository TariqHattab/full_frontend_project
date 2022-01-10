import 'package:flutter/material.dart';
import 'package:snam/most_used/common_methods.dart';
import 'package:snam/most_used/constants.dart';
import 'package:snam/screens/components/app_bar.dart';
import 'package:snam/screens/components/main_drawer.dart';
import 'package:snam/screens/forms/land_info_form.dart';
import 'package:snam/screens/forms/land_owner_info_form.dart';
import 'package:snam/screens/forms/pdf_files_form.dart';

class AddProjectPage extends StatelessWidget {
  const AddProjectPage({Key? key, required this.form}) : super(key: key);
  final form;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        pageTitle: tr(context).addProject,
        showLeadingButton: false,
      ),
      // drawer: MainDrawer(),
      body: form,
    );
  }
}
