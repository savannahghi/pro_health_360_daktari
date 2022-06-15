// Flutter imports:
import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:async_redux/async_redux.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mycarehubpro/application/core/services/utils.dart';
import 'package:mycarehubpro/application/core/theme/app_themes.dart';
import 'package:mycarehubpro/application/redux/actions/onboarding/update_onboarding_state_action.dart';
import 'package:mycarehubpro/application/redux/states/app_state.dart';
import 'package:mycarehubpro/domain/core/entities/core/onboarding_path_info.dart';
import 'package:mycarehubpro/domain/core/value_objects/app_enums.dart';
import 'package:mycarehubpro/domain/core/value_objects/app_asset_strings.dart';
import 'package:mycarehubpro/domain/core/value_objects/app_strings.dart';
import 'package:mycarehubpro/domain/core/value_objects/app_widget_keys.dart';

class ForgotPinPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 24),
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                veryLargeVerticalSizedBox,
                SvgPicture.asset(
                  forgotPINImageSvgPath,
                  width: 260,
                ),
                largeVerticalSizedBox,
                Text(
                  forgotYourPINString,
                  style: heavySize20Text(),
                  textAlign: TextAlign.center,
                ),
                smallVerticalSizedBox,
                Text(
                  forgotPINPageMessageString,
                  style: normalSize14Text(
                    AppColors.greyTextColor,
                  ),
                ),
                mediumVerticalSizedBox,
                SizedBox(
                  width: double.infinity,
                  height: 48,
                  child: MyAfyaHubPrimaryButton(
                    buttonKey: resetPINButtonKey,
                    text: resetMyPINString,
                    onPressed: () {
                      StoreProvider.dispatch(
                        context,
                        UpdateOnboardingStateAction(
                          currentOnboardingStage:
                              CurrentOnboardingStage.ResetPIN,
                        ),
                      );
                      final OnboardingPathInfo config = getOnboardingPath(
                        state: StoreProvider.state<AppState>(context)!,
                      );

                      Navigator.of(context)
                          .pushReplacementNamed(config.nextRoute);
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
