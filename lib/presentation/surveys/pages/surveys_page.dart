// Flutter imports:
import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_svg/flutter_svg.dart';

// Project imports:
import 'package:myharehubpro/application/core/theme/app_themes.dart';
import 'package:myharehubpro/domain/core/value_objects/app_asset_strings.dart';
import 'package:myharehubpro/domain/core/value_objects/app_strings.dart';
import 'package:myharehubpro/presentation/core/app_bar/custom_app_bar.dart';

class SurveysPage extends StatelessWidget {
  const SurveysPage();

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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            SvgPicture.asset(
              surveysImageSvgPath,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                toCreateNewSurveyDescriptionString,
                textAlign: TextAlign.center,
                style: normalSize16Text(),
              ),
            ),
            SizedBox(
              width: 224,
              height: 50,
              child: MyAfyaHubPrimaryButton(
                buttonColor: AppColors.mountainMeadowColor,
                text: createSurveyString,
                onPressed: () {
                  ScaffoldMessenger.maybeOf(context)?.showSnackBar(
                    const SnackBar(
                      content: Text('$createSurveyString $comingSoonText'),
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                alreadyHaveYourSurveyLinkString,
                textAlign: TextAlign.center,
                style: normalSize16Text(),
              ),
            ),
            SizedBox(
              width: 224,
              height: 50,
              child: MyAfyaHubPrimaryButton(
                buttonColor: AppColors.easternBlueColor,
                text: shareSurveyString,
                onPressed: () {
                  ScaffoldMessenger.maybeOf(context)?.showSnackBar(
                    const SnackBar(
                      content: Text('$shareSurveyString $comingSoonText'),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
