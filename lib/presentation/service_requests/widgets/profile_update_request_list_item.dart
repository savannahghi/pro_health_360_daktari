// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:afya_moja_core/text_themes.dart';
import 'package:shared_themes/spaces.dart';

// Project imports:
import 'package:healthcloud/application/core/services/helpers.dart';
import 'package:healthcloud/application/core/theme/app_themes.dart';
import 'package:healthcloud/domain/core/value_objects/app_strings.dart';
import 'package:healthcloud/domain/core/value_objects/app_widget_keys.dart';
import 'package:healthcloud/presentation/router/routes.dart';

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
                          boldSize13Text(AppColors.blueBerryColor),
                    ),
                    TextSpan(
                      text: wantProfiledUpdatedString,
                      style: normalSize13Text(
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
                route: AppRoutes.clientHealthPage,
              ),
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 8),
                decoration: BoxDecoration(
                  color: AppColors.malachiteColor,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Text(
                  reviewString,
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
