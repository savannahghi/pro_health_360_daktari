import 'package:bewell_pro_core/application/core/services/helpers.dart';
import 'package:flutter/material.dart';
import 'package:healthcloud/application/core/theme/app_themes.dart';
import 'package:healthcloud/domain/core/value_objects/app_strings.dart';
import 'package:healthcloud/domain/core/value_objects/app_widget_keys.dart';
import 'package:healthcloud/presentation/router/routes.dart';
import 'package:shared_themes/spaces.dart';
import 'package:shared_themes/text_themes.dart';

class ProfileUpdateRequestListItem extends StatelessWidget {
  /// [ProfileUpdateRequestListItem] is a shared widget used in [ProfileUpdateRequestsPage]
  ///
  ///It takes in a required [clientName] parameter
  const ProfileUpdateRequestListItem({
    required this.clientName,
  });
  final String clientName;

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
                          TextThemes.boldSize13Text(AppColors.blueBerryColor),
                    ),
                    TextSpan(
                      text: wantProfiledUpdatedString,
                      style: TextThemes.normalSize13Text(
                        AppColors.greyTextColor,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            GestureDetector(
              key: reachOutButtonKey,
              onTap: () => triggerNavigationEvent(
                context: context,
                route: clientHealthPage,
              ),
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 8),
                decoration: BoxDecoration(
                  color: AppColors.malachiteColor,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Text(
                  reviewString,
                  style: TextThemes.boldSize13Text(
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
