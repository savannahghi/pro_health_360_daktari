import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:flutter/material.dart';
import 'package:prohealth360_daktari/application/core/theme/app_themes.dart';
import 'package:prohealth360_daktari/application/redux/states/service_requests/tool_assessment_response.dart';
import 'package:prohealth360_daktari/domain/core/value_objects/app_enums.dart';
import 'package:prohealth360_daktari/domain/core/value_objects/app_strings.dart';
import 'package:prohealth360_daktari/presentation/router/routes.dart';

class AssessmentRequestItemWidget extends StatelessWidget {
  const AssessmentRequestItemWidget({
    Key? key,
    required this.screeningQuestionsList,
    required this.toolsType,
  }) : super(key: key);

  final ToolAssessmentResponse screeningQuestionsList;
  final ScreeningToolsType toolsType;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.pushNamed(
        context,
        AppRoutes.assessmentCardAnswersPage,
        arguments: <String, dynamic>{
          'toolType': toolsType,
          'assessmentResponse': screeningQuestionsList,
        },
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              screeningQuestionsList.name ?? '',
              style: veryBoldSize16Text(AppColors.greyTextColor),
            ),
            verySmallVerticalSizedBox,
            humanizeDate(
              dateTextStyle: normalSize13Text(
                AppColors.greyTextColor.withOpacity(0.5),
              ),
              loadedDate: screeningQuestionsList.date ?? '',
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
