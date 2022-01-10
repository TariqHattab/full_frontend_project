import 'package:flutter/material.dart';
import 'package:snam/custom_classes/google_maps_form_field.dart';
import 'package:snam/most_used/common_methods.dart';
import 'package:snam/most_used/constants.dart';
import 'package:snam/most_used/temp_changing_values.dart';
import 'package:snam/screens/forms/attach_requirements.dart';
import 'package:snam/screens/forms/company_info_form.dart';
import 'package:snam/screens/temp_screens/add_project_page/add_project_page.dart';
import 'package:snam/screens/temp_screens/register_page/register_page.dart';
import 'package:snam/utils/enums.dart';

class LandInfoForm extends StatefulWidget {
  LandInfoForm({Key? key, this.isInAddProject = false}) : super(key: key);
  final bool isInAddProject;
  @override
  State<LandInfoForm> createState() => _LandInfoFormState();
}

class _LandInfoFormState extends State<LandInfoForm> {
  List<String>? investmentTypes;
  List<String> cities = <String>['جدة', 'الرياض', 'الدمام'];

  String? selectedInvestmentType;
  String? selectedCity;
  String? selectedDistrict;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          buildDropDownButtonFromPackage(
              context: context,
              items: investmentTypes ??
                  [tr(context).individual, tr(context).commercial],
              onChanged: (dynamic value) {
                setState(() {
                  selectedInvestmentType = value;
                });
              },
              selectedValue: selectedInvestmentType,
              hint: tr(context).investmentType),
          // buildTextField(
          //     labelText: tr(context).investmentType, showSuffixIcon: true),
          kbigVerticalSpace,
          buildTextFormField(
            labelText: tr(context).electronicInstrumentNumber,
          ),
          kbigVerticalSpace,
          Row(
            children: [
              Expanded(
                child: buildDropDownButtonFromPackage(
                    context: context,
                    items: cities,
                    onChanged: (dynamic value) {
                      setState(() {
                        selectedCity = value;
                      });
                    },
                    selectedValue: selectedCity,
                    hint: tr(context).city,
                    imgName: 'compass',
                    prefixSize: 30),
              ),
              kmediamHorizontalSpace,
              Expanded(
                child: buildDropDownButtonFromPackage(
                    context: context,
                    items: cities,
                    onChanged: (dynamic value) {
                      setState(() {
                        selectedDistrict = value;
                      });
                    },
                    selectedValue: selectedDistrict,
                    hint: tr(context).district,
                    imgName: 'location',
                    prefixSize: 30),
              )
            ],
          ),
          kbigVerticalSpace,
          LocationFormField(),

          kbigVerticalSpace,
          Row(
            children: [
              Expanded(
                child: buildTextFormField(
                  labelText: tr(context).landLength,
                  image: getImgAsset(
                    imgColor: kTextFieldIconColor,
                    imgName: 'length',
                  ),
                ),
              ),
              kmediamHorizontalSpace,
              Expanded(
                child: buildTextFormField(
                  labelText: tr(context).landWidth,
                  image: getImgAsset(
                    imgColor: kTextFieldIconColor,
                    imgName: 'width',
                  ),
                ),
              )
            ],
          ),
          kbigVerticalSpace,
          buildTextFormField(
            labelText: tr(context).otherDetails,
          ),
          kbigVerticalSpace,
          buildFormSubmitButton(
              context: context,
              onPressed: () {
                if (widget.isInAddProject) {
                  print('in add project');
                  nv(context).push(
                    pageTransition(
                        context,
                        AddProjectPage(
                            form: AttachRequirementsForm(
                          isInAddProject: true,
                        ))),
                  );
                  return;
                } else {
                  print('not in it ');
                  bool isCompany;

                  if (kpCurrentUser == CurrentUser.landOwner) {
                    isCompany = false;
                  } else {
                    isCompany = true;
                  }

                  nv(context).push(pageTransition(
                    context,
                    RegisterPage(
                      forms: [
                        CompanyInfoForm(),
                        LandInfoForm(),
                        AttachRequirementsForm(
                          isCompany: isCompany,
                        ),
                      ],
                      selectedForm: 3,
                    ),
                  ));
                }
              })
        ],
      ),
    );
  }
}
