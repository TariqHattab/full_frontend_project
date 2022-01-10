import 'package:flutter/material.dart';
import 'package:intl/intl.dart' as intl;

import 'package:snam/most_used/common_methods.dart';
import 'package:snam/most_used/constants.dart';

class DatePickerFormField extends StatefulWidget {
  DatePickerFormField({
    Key? key,
  }) : super(key: key);

  @override
  State<DatePickerFormField> createState() => _DatePickerFormFieldState();
}

class _DatePickerFormFieldState extends State<DatePickerFormField> {
  DateTime selectedDate = DateTime.now();
  final _formKey = GlobalKey<FormState>();
  TextEditingController _dateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    TextDirection textDirection = getTextDirection(context);
    return GestureDetector(
      onTap: () => _selectDate(context, textDirection),
      child: AbsorbPointer(
        child: buildTextFormField(
          // onSaved: (val) {
          //  selectedDate;
          // },
          controller: _dateController,
          image: getImgAsset(
            imgColor: kTextFieldIconColor,
            imgName: 'add_date',
          ),
          labelText: tr(context).recordDate,

          onValidate: (value) {
            if (value == null || value.isEmpty) return "Please enter a date";
            return null;
          },
        ),
      ),
    );
  }

  _selectDate(BuildContext context, TextDirection textDirection) async {
    final DateTime? picked = await showDatePicker(
        textDirection: TextDirection.ltr, // textDirection,
        context: context,
        initialEntryMode: DatePickerEntryMode.calendarOnly,
        initialDate: selectedDate,
        firstDate: DateTime.now(),
        lastDate: DateTime(2030));
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
        var date =
            "${picked.toLocal().day}/${picked.toLocal().month}/${picked.toLocal().year}";
        _dateController.text = date;
      });
  }
}
