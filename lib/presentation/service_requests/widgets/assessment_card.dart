import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:flutter/material.dart';
import 'package:mycarehubpro/application/core/theme/app_themes.dart';
import 'package:mycarehubpro/application/redux/states/service_requests/assessment_question_response.dart';
import 'package:mycarehubpro/presentation/service_requests/widgets/assessment_list_item.dart';

class AssessmentCard extends StatelessWidget {
  final String username;
  final String description;
  final List<AssessmentQuestionResponse>? questionsResponses;
  final bool isLoading;

  const AssessmentCard({
    required this.username,
    required this.description,
    required this.questionsResponses,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    final List<AssessmentListItem> assessmentItems = <AssessmentListItem>[];
    for (final AssessmentQuestionResponse item
        in questionsResponses ?? <AssessmentQuestionResponse>[]) {
      assessmentItems.add(
        AssessmentListItem(
          assessmentResponse: '${item.index! + 1}. ${item.tool}',
          responseStatus: '${item.response}',
        ),
      );
    }
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
                if (isLoading) const PlatformLoader() else ...assessmentItems,
              ],
            ),
          )
        ],
      ),
    );
  }
}
