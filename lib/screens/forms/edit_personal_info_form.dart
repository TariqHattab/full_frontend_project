import 'package:flutter/material.dart';
import 'package:snam/custom_classes/ibanFormField.dart';
import 'package:snam/most_used/common_methods.dart';
import 'package:snam/most_used/constants.dart';

class EditPersonalInfoForm extends StatefulWidget {
  const EditPersonalInfoForm({Key? key}) : super(key: key);

  @override
  State<EditPersonalInfoForm> createState() => _EditPersonalInfoFormState();
}

class _EditPersonalInfoFormState extends State<EditPersonalInfoForm> {
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
          buildTextFormField(
              labelText: tr(context).email,
              image: getImgAsset(
                imgColor: kTextFieldIconColor,
                imgName: 'message',
              )),
          kbigVerticalSpace,
          buildDropDownButtonFromPackage(
              context: context,
              items: nationalities,
              onChanged: (dynamic value) {
                setState(() {
                  selectedNationality = value;
                });
              },
              selectedValue: selectedNationality,
              hint: tr(context).nationality,
              imgName: 'nationality',
              prefixSize: 30),
          kbigVerticalSpace,
          buildTextFormField(
              labelText: tr(context).city,
              image: getImgAsset(
                imgColor: kTextFieldIconColor,
                imgName: 'location',
              )),
          kbigVerticalSpace,
          IBANFormField(),
          kextraBigVerticalSpace,
          buildFormSubmitButton(
              context: context,
              onPressed: () {
                nv(context).pop();
              },
              buttonText: tr(context).saveChanges),
          ktinyVerticalSpace,
        ],
      ),
    );
  }
}
