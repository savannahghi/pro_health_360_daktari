import 'dart:convert';

import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:app_wrapper/app_wrapper.dart';
import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_graphql_client/graph_client.dart';
import 'package:healthcloud/application/core/services/utils.dart';
import 'package:healthcloud/application/redux/actions/flags/app_flags.dart';
import 'package:healthcloud/application/redux/actions/onboarding/update_onboarding_state_action.dart';
import 'package:healthcloud/application/redux/states/app_state.dart';
import 'package:healthcloud/domain/core/value_objects/app_asset_strings.dart';
import 'package:healthcloud/domain/core/value_objects/app_strings.dart';
import 'package:http/http.dart';

class VerifyOTPAction extends ReduxAction<AppState> {
  VerifyOTPAction({
    required this.context,
    required this.otp,
  });

  final BuildContext context;
  final String otp;

  @override
  void after() {
    dispatch(WaitAction<AppState>.remove(verifyOTPFlag));
    super.after();
  }

  @override
  void before() {
    super.before();
    dispatch(WaitAction<AppState>.add(verifyOTPFlag));
  }

  @override
  Future<AppState?> reduce() async {
    final String userID = state.staffState?.user?.userId ?? UNKNOWN;
    final String phoneNumber =
        state.staffState?.user?.primaryContact?.value ?? UNKNOWN;

    if (userID != UNKNOWN && phoneNumber != UNKNOWN) {
      final String sendOTPEndpoint =
          AppWrapperBase.of(context)!.customContext!.verifyContactOTPEndpoint;

      final Map<String, dynamic> variables = <String, dynamic>{
        'user_id': userID,
        'otp': otp,
        'phoneNumber': phoneNumber,
        'flavour': Flavour.pro.name,
      };

      final IGraphQlClient httpClient =
          AppWrapperBase.of(context)!.graphQLClient;

      final Response httpResponse = await httpClient.callRESTAPI(
        endpoint: sendOTPEndpoint,
        method: httpPOST,
        variables: variables,
      );

      final ProcessedResponse processedResponse =
          processHttpResponse(httpResponse);

      if (processedResponse.ok) {
        final bool isValid =
            jsonDecode(httpResponse.body)['data']['verifyOTP'] as bool;

        if (isValid) {
          dispatch(
            UpdateOnboardingStateAction(
              isPhoneVerified: isValid,
            ),
          );

          final OnboardingPathConfig onboardingPathConfig =
              getOnboardingPath(state: state);

          dispatch(
            NavigateAction<AppState>.pushNamed(onboardingPathConfig.route),
          );

          return state;
        } else {
          throw MyAfyaException(
            cause: 'verify_otp_error',
            message: invalidCode,
          );
        }
      } else {
        throw MyAfyaException(
          error: processedResponse.response,
          cause: 'verify_otp_error',
          message: processedResponse.message,
        );
      }
    }
  }

  @override
  Object wrapError(dynamic error) async {
    if (error.runtimeType == MyAfyaException) {
      feedbackBottomSheet(
        context: context,
        modalContent: error.message.toString(),
        imageAssetPath: errorIconUrl,
      );
    }
    return error;
  }
}
