import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:prohealth360_daktari/application/core/services/utils.dart';
import 'package:prohealth360_daktari/application/redux/actions/onboarding/update_onboarding_state_action.dart';
import 'package:prohealth360_daktari/application/redux/states/app_state.dart';
import 'package:prohealth360_daktari/domain/core/entities/core/onboarding_path_info.dart';
import 'package:prohealth360_daktari/domain/core/value_objects/app_asset_strings.dart';
import 'package:prohealth360_daktari/domain/core/value_objects/app_enums.dart';
import 'package:prohealth360_daktari/domain/core/value_objects/app_strings.dart';
import 'package:prohealth360_daktari/domain/core/value_objects/app_widget_keys.dart';

class PinExpiredPage extends StatelessWidget {
  const PinExpiredPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PINRequestScaffold(
      iconSvgPath: pinExpiredImage,
      title: pinExpiredTitle,
      message: pinExpiredDescription,
      actionText: changePinCTA,
      actionKey: changeMyPinButtonKey,
      actionCallback: () {
        StoreProvider.dispatch(
          context,
          UpdateOnboardingStateAction(
            currentOnboardingStage: CurrentOnboardingStage.PINExpired,
          ),
        );

        final OnboardingPathInfo config = getOnboardingPath(
          state: StoreProvider.state<AppState>(context)!,
        );

        Navigator.of(context).pushReplacementNamed(config.nextRoute);
      },
    );
  }
}
