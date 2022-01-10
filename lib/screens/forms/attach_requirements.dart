import 'dart:io';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:snam/custom_classes/pdf_upload.dart';
import 'package:snam/dialogs/register_dialog.dart';
import 'package:snam/most_used/common_methods.dart';
import 'package:snam/most_used/constants.dart';
import 'package:snam/screens/temp_screens/login/login_page.dart';
import 'package:snam/screens/temp_screens/temp_main_page.dart';

class AttachRequirementsForm extends StatefulWidget {
  AttachRequirementsForm(
      {Key? key, this.isCompany = false, this.isInAddProject = false})
      : super(key: key);
  final bool isCompany;
  final bool isInAddProject;
  @override
  State<AttachRequirementsForm> createState() => _AttachRequirementsFormState();
}

class _AttachRequirementsFormState extends State<AttachRequirementsForm> {
  bool _didAcknowledge = false;

  @override
  Widget build(BuildContext context) {
    if (widget.isInAddProject)
      return Padding(
        padding: const EdgeInsets.all(24.0),
        child: _buildFormColumn(context),
      );
    else
      return SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: _buildFormColumn(context),
      );
  }

  Column _buildFormColumn(BuildContext context) {
    return Column(
      children: [
        // kmediamVerticalSpace,
        Container(
          constraints: BoxConstraints(maxHeight: 400, minHeight: 200),
          // color: Colors.blueGrey,
          child: SingleChildScrollView(
            child: Column(
              children: [
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
              ],
            ),
          ),
        ),

        kextraBigVerticalSpace,
        if (!widget.isInAddProject) ...[
          if (!widget.isCompany) ...[
            RegistrationMethod(),
            kextraBigVerticalSpace,
          ],
          Row(
            children: [
              Checkbox(
                  value: _didAcknowledge,
                  fillColor: MaterialStateProperty.all(kprimaryColor),
                  onChanged: (value) {
                    setState(() {
                      _didAcknowledge = value ?? false;
                      print(_didAcknowledge);
                    });
                  }),
              Expanded(
                child: AutoSizeText(
                  tr(context).acknowledge,
                  minFontSize: 2,
                  maxLines: 2,
                  style: txAcknowledgeTextStyle,
                ),
              ),
            ],
          ),
        ],

        if (widget.isInAddProject) Spacer(),
        kextraBigVerticalSpace,

        Builder(builder: (context) {
          print(_didAcknowledge);
          return buildFormSubmitButton(
              context: context,
              onPressed: (!widget.isInAddProject && !_didAcknowledge)
                  ? null
                  : () {
                      Navigator.of(context).popUntil((route) => route.isFirst);

                      if (widget.isInAddProject) {
                        nv(context).pushReplacement(
                            pageTransition(context, MainPage()));
                        return;
                      }
                      nv(context).pushReplacement(
                          pageTransition(context, LoginPage()));
                      showDialog(
                          context: context,
                          builder: (context) {
                            return RegisteredDialog();
                          });
                    },
              buttonText: widget.isInAddProject
                  ? tr(context).addProject
                  : tr(context).register);
        })
      ],
    );
  }
}

class RegistrationMethod extends StatefulWidget {
  const RegistrationMethod({
    Key? key,
  }) : super(key: key);

  @override
  State<RegistrationMethod> createState() => _RegistrationMethodState();
}

class _RegistrationMethodState extends State<RegistrationMethod> {
  String _selectedValue = '';
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              //طريقة التسجيل
              children: [
                Text(
                  tr(context).registrationMethod,
                  style: txReportsListTitleStyle.copyWith(
                      fontSize: getRelativeWidth(18)),
                ),
                Text(
                  ' : ',
                  style: txReportsListTitleStyle.copyWith(
                      fontSize: getRelativeWidth(18)),
                ),
              ],
            ),
            Expanded(
              flex: 0,
              child: Row(
                //radio buttons
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomRadioButton<String>(
                    value: 'personal',
                    onChanged: (value) {
                      setState(() {
                        _selectedValue = value ?? '';
                      });
                    },
                    groupValue: _selectedValue,
                    text: tr(context).personal,
                  ),
                  // kextraBigHorizontalSpace,
                  CustomRadioButton<String>(
                    value: 'company',
                    onChanged: (value) {
                      setState(() {
                        _selectedValue = value ?? '';
                      });
                    },
                    groupValue: _selectedValue,
                    text: tr(context).otherCompany,
                  ),
                ],
              ),
            ),
          ],
        ),
        // AnimatedSwitcher(//this adds animation to the appearance of textfield
        //   duration: Duration(milliseconds: 100),
        //   child: _selectedValue == 'company'
        //       ? Column(
        //           children: [
        //             kextraBigVerticalSpace,
        //             buildDropDownButtonFromPackage(
        //               context: context,
        //               items: [
        //                 'شركة 1',
        //                 'شركة 2',
        //                 'شركة 3',
        //               ],
        //               onChanged: (value) {},
        //               hint: tr(context).selectCompany,
        //             )
        //           ],
        //         )
        //       : const SizedBox.shrink(),
        // )
        if (_selectedValue == 'company') ...[
          kextraBigVerticalSpace,
          buildDropDownButtonFromPackage(
            context: context,
            items: [
              'شركة 1',
              'شركة 2',
              'شركة 3',
            ],
            onChanged: (value) {},
            hint: tr(context).selectCompany,
          )
        ]
      ],
    );
  }
}

class CustomRadioButton<T> extends StatelessWidget {
  const CustomRadioButton(
      {Key? key,
      required this.value,
      this.groupValue,
      // required this.label,
      required this.text,
      required this.onChanged})
      : super(key: key);

  final T value;
  final T? groupValue;
  // final String label;
  final String text;
  final ValueChanged<T?> onChanged;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onChanged(value);
      },
      child: SizedBox(
        width: getRelativeWidth(85),
        child: Row(children: [
          _buildRadio(),
          SizedBox(
            width: getRelativeWidth(5),
          ),
          Expanded(
            child: AutoSizeText(
              text,
              style: txRadioTextStyle,
              minFontSize: 2,
              maxLines: 1,
            ),
          )
        ]),
      ),
    );
  }

  _buildRadio() {
    final bool isSelected = value == groupValue;
    return isSelected
        ? getImgAsset(imgName: 'selected')
        : getImgAsset(imgName: 'unselected');
  }
}
