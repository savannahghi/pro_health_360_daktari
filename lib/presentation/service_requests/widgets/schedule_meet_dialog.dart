import 'package:afya_moja_core/buttons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:healthcloud/application/core/theme/app_themes.dart';
import 'package:healthcloud/domain/core/value_objects/app_asset_strings.dart';
import 'package:healthcloud/domain/core/value_objects/app_enums.dart';
import 'package:healthcloud/domain/core/value_objects/app_strings.dart';
import 'package:healthcloud/domain/core/value_objects/app_widget_keys.dart';
import 'package:shared_themes/spaces.dart';
import 'package:shared_themes/text_themes.dart';

class ScheduleMeetDialog extends StatefulWidget {
  /// [ScheduleMeetDialog] is a shared widget used in [RedFlagsPage]
  @override
  State<ScheduleMeetDialog> createState() => _ScheduleMeetDialogState();
}

class _ScheduleMeetDialogState extends State<ScheduleMeetDialog> {
  late MeetingType selectedType = MeetingType.Unknown;
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
            Text(
              scheduleString,
              style: TextThemes.boldSize15Text(
                AppColors.greyTextColor,
              ),
            ),
            smallVerticalSizedBox,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                GestureDetector(
                  key: googleMeetButtonKey,
                  onTap: () {
                    setState(() {
                      selectedType = MeetingType.GoogleMeet;
                    });
                  },
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        width: 2.0,
                        color: selectedType == MeetingType.GoogleMeet
                            ? AppColors.malachiteColor
                            : Colors.transparent,
                      ),
                    ),
                    child: SvgPicture.asset(
                      googleMeetImageSvgPath,
                      width: 120,
                    ),
                  ),
                ),
                GestureDetector(
                  key: zoomButtonKey,
                  onTap: () {
                    setState(() {
                      selectedType = MeetingType.Zoom;
                    });
                  },
                  child: Container(
                    padding: const EdgeInsets.all(14),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: selectedType == MeetingType.Zoom
                            ? AppColors.malachiteColor
                            : Colors.transparent,
                        width: 2.0,
                      ),
                    ),
                    child: SvgPicture.asset(
                      zoomLogoImageSvgPath,
                      width: 70,
                    ),
                  ),
                ),
              ],
            ),
            smallVerticalSizedBox,
            Text(
              forString,
              style: TextThemes.boldSize15Text(
                AppColors.greyTextColor,
              ),
            ),
            smallVerticalSizedBox,
            Text(
              meetingTimString,
              style: TextThemes.boldSize15Text(
                AppColors.blueBerryColor,
              ),
              textAlign: TextAlign.center,
            ),
            smallVerticalSizedBox,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                MyAfyaHubPrimaryButton(
                  buttonKey: dialogCancelButtonKey,
                  borderColor: Colors.transparent,
                  text: cancelString,
                  buttonColor: Colors.red,
                  textStyle: TextThemes.veryBoldSize14Text(
                    Colors.white,
                  ),
                  customPadding: const EdgeInsets.all(
                    3,
                  ),
                  onPressed: () {
                    if (Navigator.canPop(context)) {
                      Navigator.of(context).pop();
                    }
                  },
                ),
                MyAfyaHubPrimaryButton(
                  buttonKey: dialogConfirmButtonKey,
                  borderColor: Colors.transparent,
                  text: confirmString,
                  buttonColor: selectedType == MeetingType.Unknown
                      ? Colors.grey.withOpacity(0.8)
                      : AppColors.malachiteColor,
                  textStyle: TextThemes.veryBoldSize14Text(
                    Colors.white,
                  ),
                  onPressed: () {
                    if (Navigator.canPop(context) &&
                        selectedType != MeetingType.Unknown) {
                      Navigator.of(context).pop();
                    }
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
