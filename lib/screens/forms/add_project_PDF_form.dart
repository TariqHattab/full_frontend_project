import 'package:flutter/material.dart';
import 'package:snam/custom_classes/pdf_upload.dart';
import 'package:snam/most_used/common_methods.dart';
import 'package:snam/most_used/constants.dart';
import 'package:snam/screens/forms/pdf_files_form.dart';

class AddProjectPdfForm extends StatelessWidget {
  const AddProjectPdfForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        children: [
          kmediamVerticalSpace,
          PdfUploadField(
              context: context,
              title: tr(context).certifiedFingerprintAppraisal,
              filesNumber: 2),
          kextraBigVerticalSpace,
          PdfUploadField(
              context: context,
              title: tr(context).electronicInstrument,
              filesNumber: 1),
          kextraBigVerticalSpace,
          PdfUploadField(
              context: context,
              title: tr(context).organizationalSketch,
              filesNumber: 1),
          kextraBigVerticalSpace,
          buildFormSubmitButton(context: context, onPressed: () {}),
        ],
      ),
    );
  }
}
