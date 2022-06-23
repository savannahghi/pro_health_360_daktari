// Dart imports:
import 'dart:async';
import 'dart:convert';

// Package imports:
import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:app_wrapper/app_wrapper.dart';
import 'package:async_redux/async_redux.dart';
// Flutter imports:
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_graphql_client/graph_client.dart';
import 'package:http/http.dart' as http;
import 'package:prohealth360_daktari/application/core/graphql/queries.dart';
import 'package:prohealth360_daktari/application/redux/actions/flags/app_flags.dart';
import 'package:prohealth360_daktari/application/redux/actions/onboarding/update_onboarding_state_action.dart';
import 'package:prohealth360_daktari/application/redux/states/app_state.dart';
import 'package:prohealth360_daktari/domain/core/value_objects/app_enums.dart';
import 'package:prohealth360_daktari/domain/core/value_objects/app_strings.dart';
// Project imports:
import 'package:shared_themes/colors.dart';
import 'package:shared_themes/constants.dart';

class GetSecurityQuestionsAction extends ReduxAction<AppState> {
  GetSecurityQuestionsAction({required this.context});

  final BuildContext context;

  @override
  void before() {
    super.before();
    dispatch(
      UpdateOnboardingStateAction(
        securityQuestions: <SecurityQuestion>[],
        securityQuestionsResponses: <SecurityQuestionResponse>[],
      ),
    );
    dispatch(WaitAction<AppState>.add(getSecurityQuestionsFlag));
  }

  @override
  void after() {
    dispatch(WaitAction<AppState>.remove(getSecurityQuestionsFlag));
    super.after();
  }

  @override
  Future<AppState> reduce() async {
    final bool isResetPin = state.onboardingState?.currentOnboardingStage ==
        CurrentOnboardingStage.ResetPIN;
    final IGraphQlClient client = AppWrapperBase.of(context)!.graphQLClient;
    final String getRecordedSecurityQuestions = AppWrapperBase.of(context)!
        .customContext!
        .respondedSecurityQuestionsEndpoint!;

    final String? otp = state.onboardingState?.otp;
    final String? phone = state.onboardingState?.phoneNumber;

    final Map<String, dynamic> getRecordedQuestionsVariables =
        <String, dynamic>{
      'phoneNumber': phone,
      'flavour': Flavour.pro.name,
      'otp': otp,
    };

    final http.Response result = isResetPin
        ? await client.callRESTAPI(
            endpoint: getRecordedSecurityQuestions,
            method: httpPOST,
            variables: getRecordedQuestionsVariables,
          )
        : await client.query(
            getSecurityQuestionsQuery,
            <String, dynamic>{'flavour': Flavour.pro.name},
          );

    final Map<String, dynamic> body = client.toMap(result);

    final Map<String, dynamic> responseMap =
        json.decode(result.body) as Map<String, dynamic>;

    if (client.parseError(body) != null || responseMap.isEmpty) {
      throw MyAfyaException(
        cause: getSecurityQuestionsFlag,
        message: somethingWentWrongText,
      );
    }

    if (isResetPin) {
      final RespondedSecurityQuestionsData responseData =
          RespondedSecurityQuestionsData.fromJson(
        responseMap['data'] as Map<String, dynamic>,
      );

      final List<SecurityQuestionResponse> responses =
          <SecurityQuestionResponse>[];
      for (int i = 0; i < responseData.securityQuestions.length; i++) {
        responses.add(SecurityQuestionResponse.initial());
      }

      dispatch(
        UpdateOnboardingStateAction(
          securityQuestions: responseData.securityQuestions,
          securityQuestionsResponses: responses,
        ),
      );

      return state;
    } else {
      final SecurityQuestionsData securityQuestionsData =
          SecurityQuestionsData.fromJson(
        responseMap['data'] as Map<String, dynamic>,
      );

      final List<SecurityQuestionResponse> responses =
          <SecurityQuestionResponse>[];
      for (int i = 0; i < securityQuestionsData.securityQuestions.length; i++) {
        responses.add(SecurityQuestionResponse.initial());
      }

      dispatch(
        UpdateOnboardingStateAction(
          securityQuestions: securityQuestionsData.securityQuestions,
          securityQuestionsResponses: responses,
        ),
      );
    }
    return state;
  }

  @override
  Object wrapError(dynamic error) async {
    if (error.runtimeType == MyAfyaException) {
      ScaffoldMessenger.of(context)
        ..hideCurrentSnackBar()
        ..showSnackBar(
          SnackBar(
            content: Text(error.message.toString()),
            duration: const Duration(seconds: kShortSnackBarDuration),
            action: dismissSnackBar(closeString, white, context),
          ),
        );
      return error;
    }
    return error;
  }
}
