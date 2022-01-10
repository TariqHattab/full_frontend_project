import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:snam/custom_classes/drop_down_button.dart';
import 'package:snam/custom_classes/ibanFormField.dart';
import 'package:snam/custom_classes/phone_number.dart';
import 'package:snam/most_used/common_methods.dart';
import 'package:snam/most_used/constants.dart';
import 'package:snam/screens/forms/attach_requirements.dart';
import 'package:snam/screens/forms/company_info_form.dart';
import 'package:snam/screens/forms/land_info_form.dart';
import 'package:snam/screens/temp_screens/register_page/register_page.dart';

class LandOwnerInfoForm extends StatefulWidget {
  LandOwnerInfoForm({
    Key? key,
  }) : super(key: key);

  @override
  State<LandOwnerInfoForm> createState() => _LandOwnerInfoFormState();
}

class _LandOwnerInfoFormState extends State<LandOwnerInfoForm> {
  List<String>? nationalities = [
    'Egypt',
    'Saudi',
    'مصري',
    'اردني',
    'يمني',
    'امريكي',
  ];

  List<FocusNode> _focusNodes = [
    FocusNode(),
    FocusNode(),
    FocusNode(),
  ];

  List<String> countriesEn = <String>['Egypt', 'Saudi Arabia', 'Jordan'];
  List<String> countriesAr = <String>['مصر', 'السعودية', 'الأردن'];
  List<String> bankNames = <String>['الأهلي', 'ساب', 'الراجحي'];
  List<String> cities = <String>['جدة', 'الرياض', 'الدمام'];

  // String? selectedInvestmentType;
  String? selectedNationality;
  String? selectedCity;
  String? selectedCountry;
  String? selectedBankName;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: buildTextFormField(
                    labelText: tr(context).firstName,
                    image: getImgAsset(
                      imgColor: kTextFieldIconColor,
                      imgName: 'user',
                    )),
              ),
              kmediamHorizontalSpace,
              Expanded(
                child: buildTextFormField(
                    labelText: tr(context).lastName,
                    image: getImgAsset(
                      imgColor: kTextFieldIconColor,
                      imgName: 'user',
                    )),
              )
            ],
          ),
          kbigVerticalSpace,
          buildTextFormField(
              labelText: tr(context).nationalIdintityNumber,
              image: getImgAsset(
                imgColor: kTextFieldIconColor,
                imgName: 'id',
              )),
          kbigVerticalSpace,
          PhoneNumberFormField(),
          kbigVerticalSpace,
          buildTextFormField(
              labelText: tr(context).email,
              image: getImgAsset(
                imgColor: kTextFieldIconColor,
                imgName: 'message',
              )),
          kbigVerticalSpace,
          buildDropDownButtonFromPackage(
              context: context,
              items: nationalities ?? [],
              onChanged: (dynamic value) {
                setState(() {
                  selectedNationality = value;
                });
              },
              selectedValue: selectedNationality,
              hint: tr(context).nationality,
              // prefix: Icon(
              //   Icons.language_outlined,
              // ),
              imgName: 'nationality',
              prefixSize: 30),
          kbigVerticalSpace,
          buildDropDownButtonFromPackage(
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
          ),
          kbigVerticalSpace,
          buildTextFormField(
            labelText: tr(context).nationalAddress,
          ),
          kbigVerticalSpace,
          buildDropDownButtonFromPackage(
              context: context,
              items: bankNames,
              onChanged: (dynamic value) {
                setState(() {
                  selectedBankName = value;
                });
              },
              selectedValue: selectedBankName,
              hint: tr(context).bankName,
              imgName: 'bank',
              prefixSize: 30),
          kbigVerticalSpace,
          IBANFormField(),
          kbigVerticalSpace,
          buildTextFormField(
              labelText: tr(context).password,
              image: getImgAsset(
                imgColor: kTextFieldIconColor,
                imgName: 'lock',
              )),
          kbigVerticalSpace,
          buildTextFormField(
              labelText: tr(context).confirmPassword,
              image: getImgAsset(
                imgColor: kTextFieldIconColor,
                imgName: 'lock',
              )),
          kextraBigVerticalSpace,
          buildFormSubmitButton(
              context: context,
              onPressed: () {
                nv(context).push(pageTransition(
                  context,
                  RegisterPage(
                    forms: [
                      CompanyInfoForm(),
                      LandInfoForm(),
                      AttachRequirementsForm(
                        isCompany: true,
                      ),
                    ],
                    selectedForm: 2,
                  ),
                ));
              })
        ],
      ),
    );
  }
}
