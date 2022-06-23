// Flutter imports:
import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:flutter/material.dart';
// Package imports:
import 'package:flutter_svg/flutter_svg.dart';
// Project imports:
import 'package:prohealth360_daktari/application/core/services/utils.dart';
import 'package:prohealth360_daktari/application/core/theme/app_themes.dart';
import 'package:prohealth360_daktari/domain/core/entities/health_diary/health_diary_entry.dart';
import 'package:prohealth360_daktari/domain/core/entities/health_diary/mood_item_data.dart';

class HealthDiaryEntryWidget extends StatelessWidget {
  const HealthDiaryEntryWidget({
    required this.diaryEntry,
    this.isDialog = false,
    this.index,
  });

  final HealthDiaryEntry diaryEntry;
  final bool isDialog;
  // this index is used to determine if the entry is the first one and hence whether to display share icon
  final int? index;

  @override
  Widget build(BuildContext context) {
    final Widget date = humanizeDate(
      dateTextStyle: normalSize12Text(AppColors.greyTextColor),
      loadedDate: diaryEntry.sharedAt!,
      showTime: true,
    );

    final String mood = removeUnderscores(diaryEntry.mood ?? '');
    final MoodItemData moodItemData = getMoodColor(mood);

    return Padding(
      padding: isDialog
          ? EdgeInsets.zero
          : const EdgeInsets.only(top: 5, left: 8, right: 8),
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.whiteColor,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: moodItemData.color,
          ),
        ),
        padding: isDialog
            ? const EdgeInsets.symmetric(vertical: 6, horizontal: 10)
            : const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: Row(
          children: <Widget>[
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
              decoration: BoxDecoration(
                color: moodItemData.color.withOpacity(0.1),
                borderRadius: BorderRadius.circular(8),
              ),
              child: SvgPicture.asset(
                moodItemData.svgIconUrl,
                height: isDialog ? 32 : 40,
                color: moodItemData.color,
              ),
            ),
            smallHorizontalSizedBox,
            Flexible(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  date,
                  verySmallVerticalSizedBox,
                  Text(
                    mood,
                    style: veryBoldSize14Text(moodItemData.color),
                    overflow: TextOverflow.ellipsis,
                  ),
                  verySmallVerticalSizedBox,
                  Text(
                    diaryEntry.note?.trim() ?? '',
                    style: normalSize12Text(
                      AppColors.blackColor,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
