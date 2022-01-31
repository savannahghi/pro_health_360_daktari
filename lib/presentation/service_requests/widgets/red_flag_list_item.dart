// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:afya_moja_core/text_themes.dart';
import 'package:shared_themes/spaces.dart';

// Project imports:
import 'package:healthcloud/application/core/theme/app_themes.dart';
import 'package:healthcloud/domain/core/value_objects/app_strings.dart';
import 'package:healthcloud/domain/core/value_objects/app_widget_keys.dart';
import 'package:healthcloud/presentation/service_requests/widgets/schedule_meet_dialog.dart';

class RedFlagListItem extends StatelessWidget {
  /// [RedFlagListItem] is a shared widget used in [RedFlagsPage]
  ///
  ///It takes in two required [clientName] and [phoneNumber] parameters
  const RedFlagListItem({
    required this.clientName,
    required this.feelingDescription,
  });
  final String clientName;
  final String feelingDescription;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Flexible(
              child: RichText(
                text: TextSpan(
                  children: <TextSpan>[
                    TextSpan(
                      text: clientName,
                      style:
                          boldSize13Text(AppColors.blueBerryColor),
                    ),
                    TextSpan(
                      text: needsAttentionString,
                      style: normalSize13Text(
                        AppColors.greyTextColor,
                      ),
                    ),
                    TextSpan(
                      text: ' [$feelingDescription]',
                      style: boldSize14Text(
                        Colors.red,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            GestureDetector(
              key: reachOutButtonKey,
              onTap: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return ScheduleMeetDialog();
                  },
                );
              },
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 8),
                decoration: BoxDecoration(
                  color: AppColors.malachiteColor,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Text(
                  reachOutString,
                  style: boldSize13Text(
                    Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
        smallVerticalSizedBox,
      ],
    );
  }
}
