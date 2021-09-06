import 'package:healthcloud/domain/core/value_objects/app_strings.dart';
import 'package:healthcloud/domain/core/value_objects/app_widget_keys.dart';
import 'package:flutter/material.dart';
import 'package:shared_themes/colors.dart';
import 'package:shared_ui_components/buttons.dart';

class KYCPagesBottomActions extends StatelessWidget {
  const KYCPagesBottomActions(
      {required this.onNextOrFinish, this.nextText = next});

  final Function onNextOrFinish;
  final String nextText;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        SILSecondaryButton(
          buttonColor: healthcloudPrimaryColor,
          borderColor: healthcloudPrimaryColor,
          textColor: healthcloudPrimaryColor,
          buttonKey: kycBackButtonKey,
          onPressed: () {
            Navigator.pop(context);
          },
          text: backText,
        ),
        SILPrimaryButton(
          buttonKey: kycNextButtonKey,
          onPressed: () => onNextOrFinish.call(),
          text: nextText,
        ),
      ],
    );
  }
}
