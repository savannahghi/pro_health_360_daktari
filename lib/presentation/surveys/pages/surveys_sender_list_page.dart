// Flutter imports:
import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:flutter/material.dart';
// Package imports:
import 'package:flutter_svg/flutter_svg.dart';
// Project imports:
import 'package:prohealth360_daktari/application/core/theme/app_themes.dart';
import 'package:prohealth360_daktari/domain/core/entities/surveys/survey.dart';
import 'package:prohealth360_daktari/domain/core/value_objects/app_asset_strings.dart';
import 'package:prohealth360_daktari/domain/core/value_objects/app_strings.dart';
import 'package:prohealth360_daktari/domain/core/value_objects/app_widget_keys.dart';
import 'package:prohealth360_daktari/presentation/core/app_bar/custom_app_bar.dart';
import 'package:prohealth360_daktari/presentation/router/routes.dart';
import 'package:prohealth360_daktari/presentation/surveys/widgets/surveys_card.dart';

class SurveysSenderListPage extends StatelessWidget {
  const SurveysSenderListPage({required this.survey});

  final Survey survey;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: surveysString,
        showNotificationIcon: true,
      ),
      backgroundColor: Theme.of(context).backgroundColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              SvgPicture.asset(
                surveysImagePath,
              ),
              mediumVerticalSizedBox,
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  surveySenderListDescriptionString,
                  textAlign: TextAlign.center,
                  style: normalSize14Text(AppColors.greyTextColor),
                ),
              ),
              mediumVerticalSizedBox,
              SurveysCard(
                title: clients,
                message: sendToClientsDescriptionString,
                buttonKey: sendToAllButtonKey,
                buttonText: sendToClientsString,
                onPressButton: () => Navigator.of(context).pushNamed(
                  AppRoutes.surveysSendConfigurationsPage,
                  arguments: survey,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
