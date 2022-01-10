import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:snam/most_used/constants.dart';
import 'package:snam/screens/components/app_bar.dart';
import 'package:snam/screens/temp_screens/requests/components/hanging_request_card.dart';
import 'package:snam/screens/components/main_drawer.dart';
import 'package:snam/screens/components/porject_card.dart';
import 'package:snam/screens/temp_screens/requests/components/rejected_request_card.dart';
import 'package:snam/most_used/common_methods.dart';
import 'package:snam/utils/enums.dart';

class RequestsPage extends StatefulWidget {
  const RequestsPage({Key? key}) : super(key: key);

  @override
  State<RequestsPage> createState() => _RequestsPageState();
}

class _RequestsPageState extends State<RequestsPage> {
  Requests _requestsState = Requests.Accepted;
  int _acceptedState = 0;
  bool _projectIsDone = false;
  Map<Requests, bool> _currentState = {
    Requests.Accepted: true,
    Requests.Hanging: false,
    Requests.Rejected: false,
  };

  List<bool> _acceptedReqsState = [true, false];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(pageTitle: tr(context).requests),
      drawer: MainDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            ksimiBigVerticalSpace,
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: _buildRequestsState(
                    reqText: tr(context).acceptedReqs,
                    isSelected: _currentState[Requests.Accepted]!,
                    onSelected: () => setRequestsState(Requests.Accepted),
                  ),
                ),
                kminiHorizontalSpace,
                Expanded(
                  child: _buildRequestsState(
                    reqText: tr(context).hangingReqs,
                    isSelected: _currentState[Requests.Hanging]!,
                    onSelected: () => setRequestsState(Requests.Hanging),
                  ),
                ),
                kminiHorizontalSpace,
                Expanded(
                  child: _buildRequestsState(
                    reqText: tr(context).rejectedReqs,
                    isSelected: _currentState[Requests.Rejected]!,
                    onSelected: () => setRequestsState(Requests.Rejected),
                  ),
                ),
              ],
            ),
            kextraBigVerticalSpace,
            const SizedBox(
              height: 12,
            ),
            ..._buildReqsBody(_requestsState),
          ],
        ),
      ),
    );
  }

  List<Widget> _buildReqsBody(Requests req) {
    switch (req) {
      case Requests.Accepted:
        return _buildAcceptedBody();
      case Requests.Hanging:
        return _buildHangingBody();
      case Requests.Rejected:
        return _buildRejectedBody();
      default:
        return _buildAcceptedBody();
    }
  }

  List<Widget> _buildAcceptedBody() {
    return <Widget>[
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _buildAcceptedState(
            isSelected: !_projectIsDone,
            onSelected: () => setAcceptedReqState(0),
            reqText: tr(context).acceptedCons,
            position: 0,
          ),
          _buildAcceptedState(
            isSelected: _projectIsDone,
            onSelected: () => setAcceptedReqState(1),
            reqText: tr(context).acceptedDone,
            position: 1,
          )
        ],
      ),
      kbigVerticalSpace,
      buildListviewOfCards(
          item: ProjectCard(
            isDone: _projectIsDone,
          ),
          dividerHieght: 42)
    ];
  }

  List<Widget> _buildRejectedBody() {
    return [
      buildListviewOfCards(
        // isEmpty: true,
        // isEmptyText: tr(context).noDateYet,
        item: RejectedRequestCard(),
      )
    ];
  }

  List<Widget> _buildHangingBody() {
    return [
      buildListviewOfCards(
          item: HangingRequestCard(), itemCount: 3, cacheExtent: 514 * 4)
    ];
  }

  void setAcceptedReqState(int position) {
    if (position == 0) {
      setState(() {
        _projectIsDone = false;
        _acceptedState = 0;
        _acceptedReqsState[0] = true;
        _acceptedReqsState[1] = false;
      });
    } else {
      setState(() {
        _projectIsDone = true;
        // _acceptedState = 1;
        // _acceptedReqsState[0] = false;
        // _acceptedReqsState[1] = true;
      });
    }
  }

  void setRequestsState(Requests requestsState) {
    _currentState.updateAll((key, value) => false);

    setState(() {
      _requestsState = requestsState;
      _currentState[requestsState] = true;
    });
  }

  Widget _buildAcceptedState(
      {required String reqText,
      required bool isSelected,
      required void Function() onSelected,
      required int position}) {
    //border raduis differ according to postion and direction
    var bRForFirst = position == 0 ? Radius.circular(16) : Radius.circular(0);
    var bRForSecond = position == 1 ? Radius.circular(16) : Radius.circular(0);

    double width = 148;

    print(width);
    width = getRelativeWidth(width);
    print(width);
    return GestureDetector(
      onTap: onSelected,
      child: Container(
        padding: const EdgeInsets.all(2),
        decoration: BoxDecoration(
            borderRadius: BorderRadiusDirectional.only(
              topEnd: bRForSecond,
              bottomEnd: bRForSecond,
              bottomStart: bRForFirst,
              topStart: bRForFirst,
            ),
            // border: Border.all(
            //     width: 1, color: isSelected ? kprimaryColor : kBorderColor),
            color: isSelected ? kprimaryColor : kfillColor),
        width: width,
        height: getRelativeWidth(30),
        alignment: Alignment.center,
        child: AutoSizeText(
          reqText,
          minFontSize: 10,
          maxLines: 1,
          style: txLightTitleStyle.copyWith(
            fontSize: getRelativeWidth(12),
            color: isSelected ? Colors.white : kprimaryTextColor,
          ),
        ),
      ),
    );
  }

  GestureDetector _buildRequestsState(
      {required String reqText,
      required bool isSelected,
      required Function() onSelected}) {
    return GestureDetector(
      onTap: onSelected,
      child: Container(
        padding: EdgeInsets.symmetric(
            vertical: getRelativeWidth(2), horizontal: getRelativeWidth(8)),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(getRelativeWidth(8)),
            border: Border.all(
                width: 1, color: isSelected ? kprimaryColor : kBorderColor),
            color: isSelected ? kprimaryColor : kfillColor),
        // width: double.infinity,
        height: getRelativeWidth(42),
        alignment: Alignment.center,
        child: FittedBox(
          child: Text(
            reqText,
            // minFontSize: 10,
            // maxLines: 1,
            style: txLightTitleStyle.copyWith(
              fontSize: 15,
              color: isSelected ? Colors.white : kprimaryTextColor,
            ),
          ),
        ),
      ),
    );
  }
}
