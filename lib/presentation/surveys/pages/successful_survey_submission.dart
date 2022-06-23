// Flutter imports:
import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:prohealth360_daktari/application/core/theme/app_themes.dart';
import 'package:prohealth360_daktari/domain/core/value_objects/app_asset_strings.dart';
import 'package:prohealth360_daktari/domain/core/value_objects/app_strings.dart';
import 'package:prohealth360_daktari/presentation/router/routes.dart';

class SuccessfulSurveySubmission extends StatelessWidget {
  const SuccessfulSurveySubmission({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Container(
          padding: const EdgeInsets.only(left: 30, right: 30, top: 28),
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                const SizedBox(height: 30),
                SvgPicture.asset(
                  hotBeverageImagePath,
                  height: 286.0,
                  width: 286.0,
                ),
                const SizedBox(height: 20),
                Text.rich(
                  TextSpan(
                    children: <TextSpan>[
                      TextSpan(
                        text: surveySentText,
                        style: veryBoldSize20Text(),
                      ),
                      const TextSpan(text: '\n\n'),
                      TextSpan(
                        text: surveySentDescriptionText,
                        style: normalSize16Text(
                          const Color(0xff707070),
                        ),
                      ),
                      const TextSpan(text: '\n\n'),
                      TextSpan(
                        text: takeACupOfCoffeeText,
                        style: normalSize16Text(
                          const Color(0xff707070),
                        ),
                      )
                    ],
                  ),
                  textAlign: TextAlign.center,
                ),
                largeVerticalSizedBox,
                SizedBox(
                  width: double.infinity,
                  height: 48,
                  child: MyAfyaHubPrimaryButton(
                    text: okThanksText,
                    textColor: AppColors.whiteColor,
                    buttonColor: Theme.of(context).primaryColor,
                    borderColor: Theme.of(context).primaryColor,
                    onPressed: () {
                      Navigator.of(context).pushNamedAndRemoveUntil(
                        AppRoutes.homePage,
                        (Route<dynamic> route) => false,
                      );
                    },
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
