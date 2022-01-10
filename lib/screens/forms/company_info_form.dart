import 'package:flutter/material.dart';
import 'package:snam/custom_classes/date_picker_form.dart';
import 'package:snam/custom_classes/google_maps_form_field.dart';
import 'package:snam/custom_classes/ibanFormField.dart';
import 'package:snam/custom_classes/phone_number.dart';
import 'package:snam/most_used/common_methods.dart';
import 'package:snam/most_used/constants.dart';
import 'package:snam/screens/forms/attach_requirements.dart';
import 'package:snam/screens/forms/land_info_form.dart';
import 'package:snam/screens/temp_screens/register_page/register_page.dart';

class CompanyInfoForm extends StatefulWidget {
  CompanyInfoForm({
    Key? key,
  }) : super(key: key);

  @override
  State<CompanyInfoForm> createState() => _CompanyInfoFormState();
}

class _CompanyInfoFormState extends State<CompanyInfoForm> {
  List<String> nationalities = <String>['Egypt', 'Saudi', 'Jordan'];
  List<String> countriesEn = <String>['Egypt', 'Saudi Arabia', 'Jordan'];
  List<String> countriesAr = <String>['مصر', 'السعودية', 'الأردن'];
  List<String> bankNames = <String>['الأهلي', 'ساب', 'الراجحي'];
  List<String> cities = <String>['جدة', 'الرياض', 'الدمام'];

  String? selectedInvestmentType;
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
          buildTextFormField(
              labelText: tr(context).commercialRegister,
              image: getImgAsset(
                imgColor: kTextFieldIconColor,
                imgName: 'id',
              )),
          kbigVerticalSpace,
          DatePickerFormField(),

          kbigVerticalSpace,
          buildTextFormField(
              labelText: tr(context).companyName,
              image: getImgAsset(
                imgColor: kTextFieldIconColor,
                imgName: 'company_name',
              )),
          kbigVerticalSpace,
          buildTextFormField(
              labelText: tr(context).companyActivity,
              image: getImgAsset(
                imgColor: kTextFieldIconColor,
                imgName: 'company_name',
              )),
          kbigVerticalSpace,
          Row(
            children: [
              Expanded(
                child: buildDropDownButtonFromPackage(
                  context: context,
                  items: cities,
                  onChanged: (dynamic value) {
                    setState(() {
                      selectedCountry = value;
                    });
                  },
                  selectedValue: selectedCountry,
                  hint: tr(context).city,
                  imgName: 'compass',
                ),
              ),
              kmediamHorizontalSpace,
              Expanded(
                child: buildDropDownButtonFromPackage(
                  context: context,
                  items: cities,
                  onChanged: (dynamic value) {
                    setState(() {
                      selectedCountry = value;
                    });
                  },
                  selectedValue: selectedCountry,
                  hint: tr(context).district,
                  imgName: 'compass',
                ),
              ),
            ],
          ),

          // buildTextField(
          //     labelText: tr(context).investmentType, showSuffixIcon: true),
          kbigVerticalSpace,
          buildTextFormField(
            labelText: tr(context).nationalAddress,
            // image: getImgAsset(
            //   imgColor: kTextFieldIconColor,
            //   imgName: 'id',
            // ),
          ),
          kbigVerticalSpace,
          LocationFormField(),
          kbigVerticalSpace,
          buildTextFormField(
              labelText: tr(context).websiteIfAny,
              image: getImgAsset(
                imgColor: kTextFieldIconColor,
                imgName: 'www',
              )),
          kbigVerticalSpace,
          PhoneNumberFormField(),
          kbigVerticalSpace,
          buildTextFormField(
              labelText: tr(context).phoneNumber,
              image: getImgAsset(
                imgColor: kTextFieldIconColor,
                imgName: 'phone',
              )),
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
          ksmallVerticalSpace,
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
            },
          ),
          kbigVerticalSpace,
        ],
      ),
    );
  }
}
