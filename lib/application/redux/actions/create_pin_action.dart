import 'dart:convert';

import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:async_redux/async_redux.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_graphql_client/graph_client.dart';
import 'package:prohealth360_daktari/application/core/graphql/mutations.dart';
import 'package:prohealth360_daktari/application/core/services/analytics_service.dart';
import 'package:prohealth360_daktari/application/core/services/utils.dart';
import 'package:prohealth360_daktari/application/redux/actions/core/batch_update_misc_state_action.dart';
import 'package:prohealth360_daktari/application/redux/actions/flags/app_flags.dart';
import 'package:prohealth360_daktari/application/redux/actions/onboarding/update_onboarding_state_action.dart';
import 'package:prohealth360_daktari/application/redux/states/app_state.dart';
import 'package:prohealth360_daktari/domain/core/entities/core/onboarding_path_info.dart';
import 'package:prohealth360_daktari/domain/core/value_objects/app_enums.dart';
import 'package:prohealth360_daktari/domain/core/value_objects/app_events.dart';
import 'package:prohealth360_daktari/domain/core/value_objects/app_strings.dart';
import 'package:http/http.dart' as http;
import 'package:prohealth360_daktari/domain/core/value_objects/error_tags.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

/// [CreatePINAction] is a Redux Action whose job is to update a users PIN from an old one,
///  to the new provided one
///
/// Otherwise delightfully notify user of any Error that might occur during update PIN process
///
/// should initiate change PIN process

class CreatePINAction extends ReduxAction<AppState> {
  CreatePINAction({
    required this.client,
    required this.onSuccess,
    required this.onError,
    required this.resetPinEndpoint,
  });

  final IGraphQlClient client;
  final void Function()? onSuccess;
  final void Function(String? error)? onError;
  final String resetPinEndpoint;

  @override
  void after() {
    dispatch(WaitAction<AppState>.remove(createPinFlag));
    super.after();
  }

  /// [wrapError] used to wrap error thrown during execution of the `reduce()` method
  /// returns a bottom sheet that gives the user a friendly message and an option to create an account
  @override
  void before() {
    dispatch(WaitAction<AppState>.add(createPinFlag));
  }

  @override
  Future<AppState?> reduce() async {
    final String? userID = state.staffState?.user?.userId;

    final String? newPIN = state.onboardingState?.pin;
    final String? confirmPIN = state.onboardingState?.confirmPIN;

    final bool isResetPIN = state.onboardingState?.currentOnboardingStage ==
        CurrentOnboardingStage.ResetPIN;
    final bool isChangingPIN = state.onboardingState?.currentOnboardingStage ==
        CurrentOnboardingStage.PINExpired;

    /// This value is used to indicate whether the user is resetting their PIN
    /// or changing it after it has expired
    ///
    ///  We call REST for both cases hence why this boolean is important

    final String? phone = state.onboardingState?.phoneNumber;
    final String? otp = state.onboardingState?.otp;

    // check if the new PIN matches the confirmed PIN entered by the user
    if ((newPIN != UNKNOWN && confirmPIN != UNKNOWN) && newPIN == confirmPIN) {
      // initializing of the updateUserPin mutation
      final Map<String, String?> _updateUserPinVariables = <String, String?>{
        'userID': userID,
        'pin': newPIN,
        'confirmPIN': confirmPIN,
        'flavour': Flavour.pro.name,
      };

      // initializing of the reset_pin mutation
      final Map<String, String?> _resetPinVariables = <String, String?>{
        'phonenumber': phone,
        'flavour': Flavour.pro.name,
        'pin': newPIN,
        'otp': otp,
      };

      final bool isResetOrChangePIN = isResetPIN || isChangingPIN;

      final http.Response result = isResetOrChangePIN
          ? await client.callRESTAPI(
              endpoint: resetPinEndpoint,
              method: httpPOST,
              variables: _resetPinVariables,
            )
          : await client.query(
              setUserPINMutation,
              setUserPINMutationVariables(_updateUserPinVariables),
            );

      final Map<String, dynamic> body = client.toMap(result);

      client.close();

      final Map<String, dynamic> responseMap =
          json.decode(result.body) as Map<String, dynamic>;

      final String? error = client.parseError(body);

      if (error != null) {
        dispatch(BatchUpdateMiscStateAction(error: somethingWentWrongText));
        Sentry.captureException(UserException(error));
        throw MyAfyaException(
          cause:
              isResetOrChangePIN ? updateOrResetPinErrorTag : createPinErrorTag,
          message: somethingWentWrongText,
        );
      }

      if (responseMap['data']['setUserPIN'] == true) {
        onSuccess?.call();
        dispatch(UpdateOnboardingStateAction(hasSetPin: true));
        final OnboardingPathInfo path = getOnboardingPath(state: state);
        dispatch(NavigateAction<AppState>.pushNamed(path.nextRoute));
        final CurrentOnboardingStage? currentOnboardingStage =
            state.onboardingState?.currentOnboardingStage;
        await AnalyticsService().logEvent(
          name: setUserPINEvent,
          eventType: AnalyticsEventType.ONBOARDING,
          parameters: <String, dynamic>{
            'next_page': path.nextRoute,
            'current_onboarding_workflow':
                describeEnum(currentOnboardingStage!),
          },
        );
      } else if (responseMap['data']['resetPIN'] == true) {
        onError
            ?.call(isResetPIN ? pinResetSuccessString : pinChangeSuccessString);

        dispatch(UpdateOnboardingStateAction(hasSetPin: true));

        final OnboardingPathInfo navConfig = getOnboardingPath(state: state);

        dispatch(
          NavigateAction<AppState>.pushReplacementNamed(navConfig.nextRoute),
        );

        return state;
      }
    } else {
      onError?.call(pinMustMatchString);
      return null;
    }

    return state;
  }

  @override
  Object wrapError(dynamic error) async {
    if (error.runtimeType == MyAfyaException) {
      return error;
    }
    return error;
  }
}
