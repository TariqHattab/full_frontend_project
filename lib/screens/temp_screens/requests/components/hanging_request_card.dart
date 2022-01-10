import 'dart:developer';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:snam/dialogs/accept_offer_dialog.dart';
import 'package:snam/dialogs/delete_pdf_dialog.dart';
import 'package:snam/most_used/constants.dart';
import 'package:snam/screens/components/file_card.dart';
import 'package:snam/most_used/common_methods.dart';
import 'package:snam/screens/temp_screens/requests/components/rejection_resons.dart';
import 'package:snam/screens/temp_screens/temp_main_page.dart';

class HangingRequestCard extends StatefulWidget {
  const HangingRequestCard({Key? key}) : super(key: key);

  @override
  State<HangingRequestCard> createState() => _HangingRequestCardState();
}

class _HangingRequestCardState extends State<HangingRequestCard> {
  List<PDFModel>? _cards;
  bool didAddFile = false;

  bool shouldUpload = false;

  //this is for detecting if the user added from inside FileCard
  void _tempSetDidAddFile(bool isAdded) {
    setState(() {
      didAddFile = isAdded;

      //to remove the add file error
      _setError(false);
    });
  }

  void _setError(bool error) {
    setState(() {
      shouldUpload = error;
    });
  }

  @override
  void didChangeDependencies() {
    _cards = <PDFModel>[
      PDFModel(title: tr(context).electronicContract, hasFile: true),
      PDFModel(title: tr(context).digitalSignature, hasFile: false),
      PDFModel(title: tr(context).designs, hasFile: true),
    ];
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    // print('hanging request card rebuilt');
    return SizedBox(
      height: getRelativeWidth(514),
      child: Column(
        children: [
          Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
            getProjectImg(context: context),
            ksimiBigHorizontalSpace,
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 4),
              child: Text(
                '${tr(context).projectNum}: 5153202188',
                style: txSmallTitleTextStyle,
              ),
            )
          ]),
          kminiVerticalSpace,
          Expanded(
            child: GridView.builder(
              physics: NeverScrollableScrollPhysics(),
              itemCount: 3,
              padding: EdgeInsetsDirectional.only(
                start: 63,
              ),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 47,
                  mainAxisSpacing: 17,
                  childAspectRatio: kFileCardWidth / kFileCardHieght),
              itemBuilder: (context, index) => FileCard(
                tempSetDidAddFile: _tempSetDidAddFile,
                title: _cards![index].title,
                hasFileFromStart: _cards![index].hasFile,
                hasError: index == 1 ? shouldUpload : false,
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  // if (shouldUpload)
                  //   AutoSizeText(
                  //     errorMassage ?? 'errorMassage was null',
                  //     style:
                  //         txSmallButtonTextStyle.copyWith(color: krejectColor),
                  //   ),
                  Row(
                    children: [
                      _buildButton(
                          context: context,
                          onPressed: () {
                            if (didAddFile)
                              nv(context).pushReplacement(
                                  pageTransition(context, MainPage()));
                            // showDialog(
                            //     context: context,
                            //     builder: (context) {
                            //       return AcceptOfferDialog();
                            //     });
                            else
                              _setError(true);
                          },
                          isAccept: true),
                      kminiHorizontalSpace,
                      _buildButton(
                          context: context,
                          isAccept: false,
                          onPressed: () {
                            buildBottomSheet(
                                context: context,
                                child: RejectionResonsBSheet());
                          }),
                    ],
                  ),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }

  SizedBox _buildButton(
      {required BuildContext context,
      required void Function()? onPressed,
      required bool isAccept}) {
    return SizedBox(
      width: getRelativeWidth(99),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
            primary: isAccept ? kacceptColor : krejectColor,
            elevation: 0),
        child: FittedBox(
          child: Text(
            isAccept ? tr(context).accept : tr(context).reject,
            style: txSmallButtonTextStyle,
          ),
        ),
      ),
    );
  }
}
