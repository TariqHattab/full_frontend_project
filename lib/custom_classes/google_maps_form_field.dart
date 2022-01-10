import 'package:flutter/material.dart';
import 'package:snam/most_used/common_methods.dart';
import 'package:snam/most_used/constants.dart';
import 'package:snam/screens/temp_screens/location_page/location_page.dart';

class LocationFormField extends StatefulWidget {
  LocationFormField({
    Key? key,
  }) : super(key: key);

  @override
  State<LocationFormField> createState() => _LocationFormFieldState();
}

class _LocationFormFieldState extends State<LocationFormField> {
  // final _formKey = GlobalKey<FormState>();
  TextEditingController _locationController = TextEditingController();
  String? selectedLocation;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _selectLocation(context),
      child: AbsorbPointer(
        child: buildTextFormField(
          // onSaved: (val) {
          //  selectedLocation;
          // },
          controller: _locationController,
          image: getImgAsset(
            imgColor: kTextFieldIconColor,
            imgName: 'link',
          ),
          labelText: tr(context).locationForTextfield,

          onValidate: (value) {
            if (value == null || value.isEmpty) return "Choose a location";
            return null;
          },
        ),
      ),
    );
  }

  _selectLocation(BuildContext context) async {
    final dynamic picked =
        await nv(context).push(pageTransition(context, LocationPage()));

    print(picked);
    if (picked != null && picked != selectedLocation)
      setState(() {
        selectedLocation = picked;

        _locationController.text = picked;
      });
  }
}
