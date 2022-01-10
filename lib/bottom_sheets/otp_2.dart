import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:snam/most_used/common_methods.dart';
import 'package:snam/most_used/constants.dart';
import 'package:snam/bottom_sheets/reset_password.dart';

class EnterOTP extends StatefulWidget {
  // final int numberOfPagesToPop;
  // final bool toChangePassword;

  const EnterOTP({
    Key? key,
    // required this.numberOfPagesToPop,
    // required this.toChangePassword,
  }) : super(key: key);

  @override
  State<EnterOTP> createState() => _EnterOTPState();
}

class _EnterOTPState extends State<EnterOTP> {
  static const _maxSeconds = 59;
  int _seconds = _maxSeconds;
  Timer? timer;

  ValueNotifier<int> rebuildTimer = ValueNotifier<int>(_maxSeconds);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _startTimer();
  }

  @override
  void dispose() {
    _stopTimer();
    // TODO: implement dispose
    super.dispose();
  }

  void _startTimer() {
    timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (_seconds >= 0) {
        rebuildTimer.value = _seconds; //value of seconds displayed
        _seconds--;
      } else {
        setState(() {
          _stopTimer();
        });
      }
    });
  }

  void _stopTimer() {
    timer?.cancel();
  }

  void _reStartTimer() {
    _stopTimer();
    _seconds = _maxSeconds;
    rebuildTimer.value = _seconds;

    _startTimer();
  }

  // _calculateProgress(int seconds) {
  //   return seconds / _maxSeconds;
  // }

  @override
  Widget build(BuildContext context) {
    print('perentRebuilt');
    return Container(
      padding: EdgeInsets.only(
        top: 32,
        right: 32,
        left: 32,
        bottom: 32 + MediaQuery.of(context).viewInsets.bottom,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            tr(context).confirmPhoneNum,
            style: txOTPTitleTextStyle,
          ),
          const SizedBox(
            height: 14,
          ),
          Wrap(children: [
            Text(
              tr(context).pleaseEnterOTP,
              style: txOTPBodyTextStyle,
            ),
            ksmallExtraHorizontalSpace,
            Text(
              '96623423423',
              style: txOTPBodyTextStyle,
            ),
            ktinyHorizontalSpace,
            GestureDetector(
              onTap: () => nv(context).pop(),
              child: Text(
                tr(context).changePhoneNum,
                style: txMediamTextStyle.copyWith(
                  fontSize: 13,
                  color: kprimaryColor,
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
          ]),
          const SizedBox(
            height: 18,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildPinField(),
              kmediamHorizontalSpace,
              _buildPinField(),
              kmediamHorizontalSpace,
              _buildPinField(),
              kmediamHorizontalSpace,
              _buildPinField(),
            ],
          ),
          kextraBigVerticalSpace,
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              if (_seconds <= 0) ...[
                Text(
                  '${tr(context).noCodeYet} ',
                  textDirection: getTextDirection(context),
                  style: txMediamTextStyle.copyWith(
                      fontSize: 15, color: kPDFFormTextColor),
                ),
                GestureDetector(
                  onTap: () {
                    _reStartTimer();
                    setState(() {});
                  },
                  child: Text(
                    tr(context).resend,
                    style: txMediamTextStyle.copyWith(
                        fontSize: 15,
                        color: kprimaryColor,
                        decoration: TextDecoration.underline),
                  ),
                ),
                ksmallHorizontalSpace,
              ],
              if (_seconds > 0)
                Text(
                  '${tr(context).sendNewCodeAfter} ',
                  textDirection: getTextDirection(context),
                  style: txMediamTextStyle.copyWith(
                      fontSize: 15, color: kPDFFormTextColor),
                ),
              ValueListenableBuilder(
                  //##### to only rebuild the timer
                  valueListenable: rebuildTimer,
                  builder: (BuildContext context, int secondsValue, __) {
                    String secondsString = _getSecondsString(secondsValue);
                    return Text(
                      '$secondsString',
                      style: txMediamTextStyle.copyWith(
                          fontSize: 15, color: kPDFFormTextColor),
                    );
                  }),
            ],
          ),
          kbigVerticalSpace,
          // kextraBigVerticalSpace,
          buildFormSubmitButton(
              context: context,
              buttonText: tr(context).confirm,
              onPressed: () {
                var correctPhone = true;
                nv(context).pop(correctPhone);
                // if (widget.toChangePassword)
                //   buildBottomSheet(
                //       context: context,
                //       child: ResetPassword(
                //           numberOfPagesToPop: widget.numberOfPagesToPop),
                //       backgroundColor: Colors.white);
                // else {
                //   nv(context).pop();
                // }
              })
        ],
      ),
    );
  }

  String _getSecondsString(int secondsValue) {
    if (secondsValue <= 0) return '';

    return secondsValue < 10
        ? '00:0${secondsValue.toString()}'
        : '00:${secondsValue.toString()}';
  }

  SizedBox _buildPinField() {
    return SizedBox(
        width: 31,
        child: TextField(
          decoration: InputDecoration(
            isDense: true,
            label: Align(
              alignment: Alignment.bottomCenter,
              child: Text(
                "*",
                textAlign: TextAlign.center,
              ),
            ),
            alignLabelWithHint: true,

            labelStyle: TextStyle(fontSize: 30),
            floatingLabelBehavior: FloatingLabelBehavior.never,
            // hintStyle: TextStyle(fontSize: 30),
          ),
        ));
  }
}
