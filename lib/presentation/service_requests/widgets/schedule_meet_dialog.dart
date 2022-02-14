// Flutter imports:
import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:healthcloud/domain/core/value_objects/app_asset_strings.dart';

// Package imports:
import 'package:shared_themes/spaces.dart';

// Project imports:
import 'package:healthcloud/application/core/theme/app_themes.dart';
import 'package:healthcloud/domain/core/value_objects/app_strings.dart';
import 'package:healthcloud/domain/core/value_objects/app_widget_keys.dart';
import 'package:url_launcher/url_launcher.dart';

class ScheduleMeetDialog extends StatefulWidget {
  /// [ScheduleMeetDialog] is a shared widget used in [RedFlagsPage]
  final String phoneNumber;

  const ScheduleMeetDialog({required this.phoneNumber});
  @override
  State<ScheduleMeetDialog> createState() => _ScheduleMeetDialogState();
}

class _ScheduleMeetDialogState extends State<ScheduleMeetDialog> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      elevation: 1,
      backgroundColor: Colors.white,
      child: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SvgPicture.asset(
              callAssistantSvgPath,
              width: 180,
            ),
            smallVerticalSizedBox,
            Text(
              reachOutString,
              style: veryBoldSize15Text(
                AppColors.greyTextColor,
              ).copyWith(fontSize: 20),
            ),
            smallVerticalSizedBox,
            RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                text: reachOutDescriptionPart1String,
                style: normalSize15Text(
                  AppColors.greyTextColor,
                ),
                children: <TextSpan>[
                  TextSpan(
                    text: widget.phoneNumber,
                    style: boldSize15Text(
                      AppColors.greyTextColor,
                    ).copyWith(fontSize: 16),
                  ),
                  const TextSpan(
                    text: reachOutDescriptionPart2String,
                  ),
                ],
              ),
            ),
            smallVerticalSizedBox,
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: MyAfyaHubPrimaryButton(
                buttonKey: dialogCallButtonKey,
                borderColor: Colors.transparent,
                text: callString,
                buttonColor: Theme.of(context).primaryColor,
                textStyle: veryBoldSize14Text(
                  Colors.white,
                ),
                customPadding: const EdgeInsets.all(
                  5,
                ),
                onPressed: () async {
                  if (Navigator.canPop(context)) {
                    Navigator.of(context).pop();
                  }
                  await launch('tel:$widget.phoneNumber');
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
