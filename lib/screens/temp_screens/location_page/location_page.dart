import 'package:flutter/material.dart';
import 'package:snam/most_used/common_methods.dart';
import 'package:snam/screens/components/app_bar.dart';
import 'package:snam/screens/components/main_drawer.dart';

class LocationPage extends StatelessWidget {
  const LocationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        pageTitle: tr(context).locationOnGoogleMap,
        backButton: BackButton(
          onPressed: () => nv(context).pop('www.fakeLocationLink.com'),
        ),
      ),
      // drawer: MainDrawer(),
      body: Center(
        child: Text('Google Maps Page'),
      ),
    );
  }
}
