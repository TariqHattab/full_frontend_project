import 'package:flutter/material.dart';
import 'package:snam/custom_classes/date_picker_form.dart';
import 'package:snam/custom_classes/google_maps_form_field.dart';
import 'package:snam/custom_classes/ibanFormField.dart';
import 'package:snam/custom_classes/phone_number.dart';
import 'package:snam/most_used/common_methods.dart';
import 'package:snam/most_used/constants.dart';

class EditCompanyInfoForm extends StatefulWidget {
  const EditCompanyInfoForm({Key? key}) : super(key: key);

  @override
  State<EditCompanyInfoForm> createState() => _EditCompanyInfoFormState();
}

class _EditCompanyInfoFormState extends State<EditCompanyInfoForm> {
  List<String> nationalities = <String>['Egypt', 'Saudi', 'Jordan'];
  List<String> cities = <String>['جدة', 'الرياض', 'الدمام'];
  List<String> countriesEn = <String>['Egypt', 'Saudi Arabia', 'Jordan'];
  List<String> countriesAr = <String>['مصر', 'السعودية', 'الأردن'];

  String? selectedNationality;
  String? selectedCity;
  String? selectedCountry;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 23, vertical: 40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 92,
            height: 92,
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: kfillColor,
              shape: BoxShape.circle,
            ),
            child: getImgAsset(
              imgName: 'add_profile',
            ),
          ),
          kextraBigVerticalSpace,
          buildTextFormField(
              labelText: tr(context).commercialRegisterNum,
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

          // kbigVerticalSpace,
          // buildTextFormField(
          //   labelText: tr(context).nationalAddress,
          //   // image: getImgAsset(
          //   //   imgColor: kTextFieldIconColor,
          //   //   imgName: 'id',
          //   // ),
          // ),
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

          IBANFormField(),

          ksmallVerticalSpace,
          kextraBigVerticalSpace,
          buildFormSubmitButton(
              context: context,
              buttonText: tr(context).saveChanges,
              onPressed: () {
                nv(context).pop();
              }),
          kbigVerticalSpace,
        ],
      ),
    );
  }
}
