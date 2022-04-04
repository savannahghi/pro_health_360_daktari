import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:flutter/material.dart';
import 'package:mycarehubpro/application/core/theme/app_themes.dart';
import 'package:mycarehubpro/domain/core/value_objects/app_strings.dart';
import 'package:mycarehubpro/presentation/core/app_bar/custom_app_bar.dart';
import 'package:mycarehubpro/presentation/service_requests/widgets/assessment_card.dart';
import 'package:mycarehubpro/presentation/service_requests/widgets/reach_out_widget.dart';
import 'package:shared_themes/spaces.dart';

class ScreeningToolsAssessmentPage extends StatelessWidget {
  const ScreeningToolsAssessmentPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TargetPlatform _platform = Theme.of(context).platform;
    return Scaffold(
      appBar: const CustomAppBar(title: screeningToolsAssessmentCardTitle),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              RichText(
                text: TextSpan(
                  children: <TextSpan>[
                    TextSpan(
                      text: hereIsWhatString,
                      style: normalSize14Text(AppColors.greyTextColor),
                    ),
                    TextSpan(
                      text: 'John Doe',
                      style: veryBoldSize14Text(AppColors.greyTextColor),
                    ),
                    TextSpan(
                      text: respondedInAssessmentToolString,
                      style: normalSize14Text(AppColors.greyTextColor),
                    ),
                    TextSpan(
                      text: '2 April, 2022',
                      style: veryBoldSize14Text(AppColors.greyTextColor),
                    ),
                  ],
                ),
              ),
              mediumVerticalSizedBox,
              Text(
                assessmentCardString,
                style: veryBoldSize20Text(AppColors.greyTextColor),
              ),
              smallVerticalSizedBox,
              const AssessmentCard(
                username: 'John Doe',
                description: 'Contraceptive assessment card',
              ),
              mediumVerticalSizedBox,
              ReachOutWidget(
                platform: _platform,
                phoneNumber: '',
                clientName: '',
                staffFirstName: '',
                staffLastName: '',
              )
            ],
          ),
        ),
      ),
    );
  }
}
