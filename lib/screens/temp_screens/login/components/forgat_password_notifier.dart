import 'package:flutter/material.dart';
import 'package:snam/common_workflows/workflows.dart';
import 'package:snam/most_used/common_methods.dart';
import 'package:snam/most_used/constants.dart';

class ForgatPasswordNotifier extends StatelessWidget {
  const ForgatPasswordNotifier({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<Object>(
        valueListenable: Workflows.changePasswordNotifier,
        builder: (BuildContext context, value, _) {
          if (value == 0)
            return SizedBox(height: getRelativeWidth(32));
          else if (value == 1)
            return _buildMassageBody(context, isSuccess: true);
          else
            return _buildMassageBody(context, isSuccess: false);
        });
  }

  Container _buildMassageBody(BuildContext context, {required bool isSuccess}) {
    return Container(
      height: getRelativeWidth(40),
      width: double.infinity,
      color: (isSuccess ? kacceptColor : krejectColor).withOpacity(.05),
      padding: EdgeInsets.symmetric(
          horizontal: getRelativeWidth(4), vertical: getRelativeWidth(4)),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(
            isSuccess ? Icons.check_circle : Icons.cancel,
            color: isSuccess ? kacceptColor : krejectColor,
          ),
          kminiHorizontalSpace,
          Text(
            isSuccess
                ? tr(context).passwordChangedSuccess
                : tr(context).passwordChangedFailed,
            style: txMediamTextStyle.copyWith(
                color: isSuccess ? kacceptColor : krejectColor,
                fontSize: getRelativeWidth(15)),
          ),
        ],
      ),
    );
  }
}
