import 'package:flutter/material.dart';
import 'package:snam/common_workflows/workflows.dart';
import 'package:snam/most_used/common_methods.dart';
import 'package:snam/most_used/constants.dart';
import 'package:snam/bottom_sheets/otp_1.dart';
import 'package:snam/bottom_sheets/otp_2.dart';

class PhoneNumberFormField extends StatefulWidget {
  PhoneNumberFormField(
      {Key? key, this.numberOfPagesToPop = 2, this.toChangePassword = false})
      : super(key: key);

  //because the number of pages to pop deffers depending on which page used this feild ,
  final int numberOfPagesToPop;

  //to show differant dialogs and navigation
  final bool toChangePassword;

  @override
  State<PhoneNumberFormField> createState() => _PhoneNumberFormFieldState();
}

class _PhoneNumberFormFieldState extends State<PhoneNumberFormField> {
  FocusNode _phoneFocusNode = FocusNode();
  String? _phoneValue;

  //so it does not vrify number of inputs befor 9 or unfocus
  bool _phoneLengthVrify = false;
  // bool _enableVerifyButton = false;
  final _formKey = GlobalKey<FormState>();
  final ValueNotifier<bool> _enableVerifyButton = ValueNotifier<bool>(false);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _phoneFocusNode.addListener(() {
      print(
          "Has focus: ${_phoneFocusNode.hasFocus} and the hash is ${_phoneFocusNode.hashCode}");
      if (!_phoneFocusNode.hasFocus) validateOnUnfocus();
    });
  }

  @override
  void dispose() {
    _phoneFocusNode.dispose();
    super.dispose();
  }

  validateOnUnfocus() {
    _phoneLengthVrify = true;
    _formKey.currentState?.validate();
  }

  String? _validatePhone(String? value) {
    // print('strat validation of: $value');
    if (value == null) return null;

    //checked this at the top to make the verify button disabled again
    if (_phoneLengthVrify && value.length != 9)
      _enableVerifyButton.value = false;

    var onlyNumbers = int.tryParse(value);
    if (onlyNumbers == null) return 'enter only numbers';

    // when the length = 9 start validation of length
    if (value.length >= 9) _phoneLengthVrify = true;

    if (_phoneLengthVrify && value.length != 9) return 'Need 9 numbers';

    // make the button enabled
    if (_phoneLengthVrify && value.length == 9)
      _enableVerifyButton.value = true;

    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: buildTextFormField(
          focusNode: _phoneFocusNode,
          labelText: tr(context).mobileNumber,
          labelStyle:
              txTextFieldLabelStyle.copyWith(fontSize: getRelativeWidth(16)),
          // floatingLabelStyle: txFloatingLabelStyle,
          prefixText: '966+  ',
          onValidate: _validatePhone,
          onChanged: (value) {
            _phoneValue = value;
          },
          autovalidateMode: AutovalidateMode.onUserInteraction,
          keyboardType: TextInputType.phone,
          suffix: ValueListenableBuilder(
              valueListenable: _enableVerifyButton,
              builder: (context, bool value, child) {
                // print('started rebuilding');
                return InkWell(
                  onTap: value
                      ? () {
                          Workflows.confirmPhoneOrPassword(context,
                              forPassword: widget.toChangePassword);
                        }
                      : null,
                  child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 1),
                      child: Text(
                        tr(context).verify,
                        style: TextStyle(
                          fontSize: 15,
                          color: value ? Colors.blue : Colors.grey,
                          fontFamily: kfontFamily,
                          fontWeight: FontWeight.normal,
                        ),
                      )),
                );
              }),
          image: getImgAsset(
            imgColor: kTextFieldIconColor,
            imgName: 'phone',
          )),
    );
  }
}
