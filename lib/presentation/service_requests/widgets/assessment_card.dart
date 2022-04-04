import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:flutter/material.dart';
import 'package:mycarehubpro/application/core/services/utils.dart';
import 'package:mycarehubpro/application/core/theme/app_themes.dart';
import 'package:shared_themes/spaces.dart';

class AssessmentCard extends StatelessWidget {
  final String username;
  final String description;

  const AssessmentCard({
    required this.username,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor.withOpacity(0.14),
        borderRadius: const BorderRadius.all(Radius.circular(8)),
        border: Border.all(
          color: Theme.of(context).primaryColor.withOpacity(0.3),
        ),
      ),
      padding: const EdgeInsets.all(18),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  username,
                  style: boldSize18Text(AppColors.greyTextColor),
                ),
                smallVerticalSizedBox,
                Text(
                  description,
                  style: normalSize14Text(
                    AppColors.greyTextColor.withOpacity(0.5),
                  ),
                ),
                smallVerticalSizedBox,
                ...assessmentItems,
              ],
            ),
          )
        ],
      ),
    );
  }
}
