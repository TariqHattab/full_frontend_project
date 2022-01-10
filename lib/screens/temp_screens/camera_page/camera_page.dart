import 'package:flutter/material.dart';
import 'package:snam/most_used/common_methods.dart';
import 'package:snam/screens/components/app_bar.dart';
import 'package:snam/screens/components/main_drawer.dart';

class CameraPage extends StatelessWidget {
  const CameraPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        pageTitle: tr(context).camera,
        backButton: BackButton(
          onPressed: () => nv(context).pop(),
        ),
      ),
      // drawer: MainDrawer(),
      body: Center(
        child: Text('Camera Page'),
      ),
    );
  }
}
