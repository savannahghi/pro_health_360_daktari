import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:flutter/material.dart';
import 'package:mycarehubpro/application/core/theme/app_themes.dart';
import 'package:mycarehubpro/domain/core/value_objects/app_enums.dart';
import 'package:mycarehubpro/presentation/router/routes.dart';

class ScreeningToolsItemWidget extends StatelessWidget {
  final String title;
  final String description;
  final ScreeningToolsType screeningToolsType;

  const ScreeningToolsItemWidget({
    required this.title,
    required this.description,
    required this.screeningToolsType,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.pushNamed(
        context,
        AppRoutes.assessmentToolResponsesPage,
        arguments: screeningToolsType,
      ),
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).primaryColor.withOpacity(0.14),
          borderRadius: const BorderRadius.all(Radius.circular(8)),
          border: Border.all(
            color: Theme.of(context).primaryColor.withOpacity(0.3),
          ),
        ),
        padding: const EdgeInsets.all(18),
        margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            // Text column
            Flexible(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    title,
                    style: boldSize18Text(AppColors.greyTextColor),
                  ),
                  smallVerticalSizedBox,
                  Text(
                    description,
                    style: normalSize14Text(
                      AppColors.greyTextColor.withOpacity(0.5),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
