import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:mycarehubpro/application/redux/actions/onboarding/update_onboarding_state_action.dart';
import 'package:mycarehubpro/application/redux/states/app_state.dart';
import 'package:mycarehubpro/domain/core/value_objects/app_strings.dart';
import 'package:mycarehubpro/domain/core/value_objects/app_widget_keys.dart';
import 'package:mycarehubpro/presentation/router/routes.dart';

class PhoneLoginErrorWidget extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  final String? phone;

  const PhoneLoginErrorWidget({required this.formKey, this.phone});

  @override
  Widget build(BuildContext context) {
    return LoginErrorWidget(
      title: invalidCredentialSting,
      message: invalidCredentialsErrorMsg,
      actionText: resetPINString,
      actionKey: resetPINButtonKey,
      actionCallback: () {
        final bool? isFormValid = formKey.currentState?.validate();

        if (isFormValid != null &&
            isFormValid &&
            phone != null &&
            phone != UNKNOWN) {
          StoreProvider.dispatch<AppState>(
            context,
            UpdateOnboardingStateAction(invalidCredentials: false),
          );
          Navigator.of(context).pushReplacementNamed(AppRoutes.forgotPinPage);
        }
      },
    );
  }
}
