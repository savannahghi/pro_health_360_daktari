// Flutter imports:
import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:shared_themes/spaces.dart';

// Project imports:
import 'package:healthcloud/application/core/theme/app_themes.dart';
import 'package:healthcloud/domain/core/value_objects/app_widget_keys.dart';
import 'package:healthcloud/presentation/service_requests/widgets/schedule_meet_dialog.dart';

/// [RedFlagListItem] is a shared widget used in [RedFlagsPage]
///
///It takes in two required [clientName] and [feeling] parameters
class RedFlagListItem extends StatelessWidget {
  const RedFlagListItem({
    required this.clientName,
    required this.feelingDescription,
    required this.feeling,
  });

  final String clientName;
  final String feelingDescription;
  final String feeling;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      key: redFlagItemKey,
      onTap: () => showDialog(
        context: context,
        builder: (BuildContext context) {
          return ScheduleMeetDialog();
        },
      ),
      child: Column(
        children: <Widget>[
          Container(
            padding: const EdgeInsets.all(15),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      clientName,
                      style: veryBoldSize15Text(AppColors.greyTextColor),
                    ),
                    verySmallVerticalSizedBox,
                    Text(
                      feelingDescription,
                      style: normalSize15Text(
                        AppColors.greyTextColor,
                      ),
                    ),
                  ],
                ),
                Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
                  decoration: BoxDecoration(
                    color: AppColors.lightRedColor,
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: Text(
                    feeling,
                    style: normalSize12Text(
                      AppColors.redColor,
                    ),
                  ),
                ),
              ],
            ),
          ),
          size15VerticalSizedBox,
        ],
      ),
    );
  }
}
