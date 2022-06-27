// Flutter imports:
import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_svg/flutter_svg.dart';

// Project imports:
import 'package:prohealth360_daktari/application/core/theme/app_themes.dart';
import 'package:prohealth360_daktari/domain/core/value_objects/app_asset_strings.dart';
import 'package:prohealth360_daktari/domain/core/value_objects/app_strings.dart';
import 'package:prohealth360_daktari/presentation/core/app_bar/custom_app_bar.dart';
import 'package:prohealth360_daktari/presentation/surveys/widgets/share_classification_widget.dart';
import 'package:prohealth360_daktari/presentation/surveys/widgets/survey_link_input_widget.dart';

class ShareSurveyPage extends StatelessWidget {
  const ShareSurveyPage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: shareSurveyString,
        showNotificationIcon: true,
      ),
      backgroundColor: Theme.of(context).backgroundColor,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: <Widget>[
              mediumVerticalSizedBox,
              SvgPicture.asset(
                surveysImageSvgPath,
                height: 140,
                width: 155,
              ),
              smallVerticalSizedBox,
              SurveyLinkInputWidget(
                hintText: surveyLinkString,
                onChanged: (String value) {
                  ScaffoldMessenger.maybeOf(context)?.showSnackBar(
                    const SnackBar(
                      content: Text(comingSoonText),
                    ),
                  );
                },
              ),
              mediumVerticalSizedBox,
              const ShareClassificationWidget(),
              veryLargeVerticalSizedBox,
              Padding(
                padding: const EdgeInsets.only(bottom: 30),
                child: SizedBox(
                  width: 224,
                  height: 50,
                  child: MyAfyaHubPrimaryButton(
                    buttonColor: AppColors.easternBlueColor,
                    text: confirmString,
                    onPressed: () {
                      ScaffoldMessenger.maybeOf(context)?.showSnackBar(
                        const SnackBar(
                          content: Text(comingSoonText),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
