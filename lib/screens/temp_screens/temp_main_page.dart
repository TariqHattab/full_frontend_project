import 'dart:developer';
import 'dart:io';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'package:snam/most_used/constants.dart';

import 'package:snam/screens/components/app_bar.dart';
import 'package:snam/screens/components/porject_card.dart';
import 'package:snam/screens/components/main_drawer.dart';
import 'package:snam/most_used/common_methods.dart';
import 'package:snam/screens/forms/add_project_PDF_form.dart';
import 'package:snam/screens/forms/land_info_form.dart';
import 'package:snam/screens/temp_screens/add_project_page/add_project_page.dart';
import 'package:snam/screens/temp_screens/project_details/project_detail_page.dart';

class MainPage extends StatefulWidget {
  MainPage({Key? key, this.title}) : super(key: key);

  final String? title;

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _counter = 0;

  @override
  Widget build(BuildContext context) {
    print('screen width : ${screenWidth(context)}');
    print('screen height : ${screenHeight(context)}');
    return Scaffold(
      appBar: CustomAppBar(pageTitle: tr(context).home),
      drawer: MainDrawer(),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            _buildListTile(context),
            kmediamVerticalSpace,
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                buildTotalAmountCard(
                  context: context,
                  imgPath: 'assets/icons/wallet.png',
                  totalNum: '60K',
                  fontSize: 13,
                  descMessage: tr(context).totalIncome,
                ),
                ksmallHorizontalSpace,
                buildTotalAmountCard(
                  context: context,
                  imgPath: 'assets/icons/tick.png',
                  totalNum: '03',
                  fontSize: 13,
                  descMessage: tr(context).totalAcceptedRequestIncome,
                ),
              ],
            ),
            kextraBigVerticalSpace,
            buildListviewOfCards(
                item: ProjectCard(
              isDone: false,
            ))
          ],
        ),
      ),
      floatingActionButton: SizedBox(
        width: getRelativeWidth(56),
        height: getRelativeWidth(56),
        child: GestureDetector(
          onLongPress: () {},
          child: FloatingActionButton(
            backgroundColor: kprimaryColor,
            onPressed: () {
              nv(context).push(pageTransition(
                context,
                AddProjectPage(
                  form: LandInfoForm(
                    isInAddProject: true,
                  ),
                ),
              ));
            },
            tooltip: 'Increment',
            child: Icon(
              Icons.add,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }

  ListTile _buildListTile(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.all(0),
      leading: CircleAvatar(
        backgroundColor: kprimaryColor,
        radius: getRelativeWidth(25),
        child: Icon(Icons.person),
      ),
      title: Padding(
        padding: const EdgeInsetsDirectional.only(
          start: 2,
          bottom: 6,
        ),
        child: Text(
          tr(context).hello,
          style: TextStyle(
            fontFamily: kfontFamily,
            color: ksecondaryAccentTextColor,
            fontSize: getRelativeWidth(10),
          ),
        ),
      ),
      subtitle: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Text(
          'محمد طارق',
          style: txSecondaryTitleStyle.copyWith(fontSize: getRelativeWidth(15)),
        ),
      ),
    );
  }
}
