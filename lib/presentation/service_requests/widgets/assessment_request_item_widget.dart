import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:flutter/material.dart';
import 'package:mycarehubpro/application/core/theme/app_themes.dart';
import 'package:mycarehubpro/application/redux/states/service_requests/screening_questions_list.dart';
import 'package:mycarehubpro/domain/core/value_objects/app_strings.dart';
import 'package:mycarehubpro/presentation/router/routes.dart';
import 'package:shared_themes/spaces.dart';

class AssessmentRequestItemWidget extends StatelessWidget {
  const AssessmentRequestItemWidget({
    Key? key,
    required this.screeningQuestionsList,
  }) : super(key: key);

  final ScreeningQuestionsList screeningQuestionsList;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () =>
          Navigator.pushNamed(context, AppRoutes.screeningToolsAssessmentPage),
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              screeningQuestionsList.name ?? '',
              style: veryBoldSize16Text(AppColors.greyTextColor),
            ),
            verySmallVerticalSizedBox,
            Text(
              screeningQuestionsList.date ?? '',
              style: normalSize13Text(
                AppColors.greyTextColor.withOpacity(0.5),
              ),
            ),
            size15VerticalSizedBox,
            Text(
              assessmentRequestItemDescriptionString,
              style: normalSize14Text(AppColors.greyTextColor),
            ),
          ],
        ),
      ),
    );
  }
}
