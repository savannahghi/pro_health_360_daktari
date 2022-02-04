import 'dart:convert';

import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:app_wrapper/app_wrapper.dart';
import 'package:async_redux/async_redux.dart';
import 'package:domain_objects/value_objects.dart';
import 'package:flutter/material.dart';
import 'package:flutter_graphql_client/graph_client.dart';
import 'package:healthcloud/application/core/services/utils.dart';
import 'package:healthcloud/application/redux/actions/flags/app_flags.dart';
import 'package:healthcloud/application/redux/actions/onboarding/update_onboarding_state_action.dart';
import 'package:healthcloud/application/redux/states/app_state.dart';
import 'package:healthcloud/domain/core/value_objects/app_asset_strings.dart';
import 'package:healthcloud/domain/core/value_objects/app_strings.dart';
import 'package:http/http.dart';
import 'package:misc_utilities/misc.dart';

class SendOTPAction extends ReduxAction<AppState> {
  SendOTPAction({
    required this.context,
    required this.resetPinPhoneNumber,
    bool? isResend,
    this.callBackFunction,
  }) : isResend = isResend ?? false;

  final BuildContext context;
  final String resetPinPhoneNumber;
  final Function? callBackFunction;
  bool isResend;

  @override
  void after() {
    final String flag = isResend ? resendOTPFlag : sendOTPFlag;
    dispatch(WaitAction<AppState>.remove(flag));

    ///Ensure the callBackFunction is not null
    callBackFunction?.call();
    super.after();
  }

  @override
  void before() {
    final String flag = isResend ? resendOTPFlag : sendOTPFlag;
    dispatch(WaitAction<AppState>.add(flag));
    super.before();
  }

  @override
  Future<AppState?> reduce() async {
    final bool isResetPin = state.onboardingState?.isResetPin ?? false;

    final String phoneNumber = isResetPin
        ? resetPinPhoneNumber
        : state.staffState!.user!.primaryContact!.value ?? UNKNOWN;

    if (phoneNumber != UNKNOWN) {
      final Map<String, dynamic> variables = <String, dynamic>{
        'phoneNumber': phoneNumber,
        'flavour': Flavour.pro.name,
      };

      //Incase of send/resend otp error it is cleared
      dispatch(UpdateOnboardingStateAction(failedToSendOTP: false));
      final IGraphQlClient _client = AppWrapperBase.of(context)!.graphQLClient;

      final Response httpResponse = await retrieveOTP(
        httpClient: _client,
        context: context,
        isResetPin: isResetPin,
        isResend: isResend,
        variables: variables,
      );

      final ProcessedResponse processedResponse =
          processHttpResponse(httpResponse);

      final Map<String, dynamic> payLoad = _client.toMap(httpResponse);

      final String? error = parseError(payLoad);

      if (error != null) {
        dispatch(UpdateOnboardingStateAction(failedToSendOTP: true));

        return null;
      }

      if (processedResponse.ok == true) {
        //Return OTP sent as string
        //OTP are stored on the backend with the username
        final Map<String, dynamic> parsed =
            jsonDecode(httpResponse.body) as Map<String, dynamic>;

        final String otp = isResetPin
            ? parsed['otp'] as String
            : isResend
                ? parsed['data']['sendRetryOTP'] as String
                : parsed['data']['sendOTP'] as String;

        // save the OTP to state
        dispatch(UpdateOnboardingStateAction(otp: otp));

        return state;
      } else {
        // exception thrown if the backend could not send an OTP
        feedbackBottomSheet(
          context: context,
          modalContent: processedResponse.message ?? defaultUserFriendlyMessage,
          imageAssetPath: errorIconUrl,
        );

        dispatch(UpdateOnboardingStateAction(failedToSendOTP: true));
      }
    } else {
      //Incase user's phone number is not found
      dispatch(UpdateOnboardingStateAction(failedToSendOTP: true));
    }
  }
}
