// Dart imports:
import 'dart:async';
import 'dart:convert';

// Flutter imports:
import 'package:afya_moja_core/afya_moja_core.dart';
// Package imports:
import 'package:async_redux/async_redux.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_graphql_client/graph_client.dart';
import 'package:prohealth360_daktari/application/core/graphql/mutations.dart';
import 'package:prohealth360_daktari/application/core/services/analytics_service.dart';
import 'package:prohealth360_daktari/application/core/services/utils.dart';
import 'package:prohealth360_daktari/application/redux/actions/core/batch_update_misc_state_action.dart';
import 'package:prohealth360_daktari/application/redux/actions/flags/app_flags.dart';
import 'package:prohealth360_daktari/application/redux/actions/terms/update_terms_action.dart';
import 'package:prohealth360_daktari/application/redux/states/app_state.dart';
import 'package:prohealth360_daktari/domain/core/entities/core/onboarding_path_info.dart';
import 'package:prohealth360_daktari/domain/core/entities/terms/accept_terms_response.dart';
import 'package:prohealth360_daktari/domain/core/value_objects/app_enums.dart';
import 'package:prohealth360_daktari/domain/core/value_objects/app_events.dart';
import 'package:prohealth360_daktari/domain/core/value_objects/app_strings.dart';
import 'package:http/http.dart' as http;
import 'package:sentry_flutter/sentry_flutter.dart';

class AcceptTermAction extends ReduxAction<AppState> {
  AcceptTermAction({required this.client});

  final IGraphQlClient client;

  @override
  void before() {
    super.before();
    dispatch(WaitAction<AppState>.add(acceptTermsFlag));
    dispatch(BatchUpdateMiscStateAction(error: UNKNOWN));
  }

  @override
  void after() {
    dispatch(WaitAction<AppState>.remove(acceptTermsFlag));
    super.after();
  }

  @override
  Future<AppState?> reduce() async {
    final int? acceptedTermsID =
        state.onboardingState?.termsAndConditions?.termsId;
    final String? userID = state.staffState?.user?.userId;

    final http.Response result = await client.query(
      acceptTermsAndConditionsMutation,
      getTermsVariables(termsId: acceptedTermsID, userId: userID),
    );

    final Map<String, dynamic> body = client.toMap(result);
    client.close();

    final Map<String, dynamic> responseMap =
        json.decode(result.body) as Map<String, dynamic>;

    final String? error = client.parseError(body);
    if (error != null || responseMap.isEmpty) {
      dispatch(BatchUpdateMiscStateAction(error: somethingWentWrongText));

      Sentry.captureException(UserException(error));

      return null;
    }

    final AcceptTermsResponse acceptTermsAndConditionsResponse =
        AcceptTermsResponse.fromJson(
      responseMap['data'] as Map<String, dynamic>,
    );

    dispatch(
      UpdateTermsAndConditionsAction(
        isAccepted: acceptTermsAndConditionsResponse.acceptTerms,
      ),
    );

    final OnboardingPathInfo onboardingPathConfig =
        getOnboardingPath(state: state);
    final CurrentOnboardingStage? currentOnboardingStage =
        state.onboardingState?.currentOnboardingStage;

    dispatch(
      NavigateAction<AppState>.pushNamedAndRemoveUntil(
        onboardingPathConfig.nextRoute,
        (Route<dynamic> route) => false,
        arguments: onboardingPathConfig.arguments,
      ),
    );
    await AnalyticsService().logEvent(
      name: acceptTermsEvent,
      eventType: AnalyticsEventType.ONBOARDING,
      parameters: <String, dynamic>{
        'next_page': onboardingPathConfig.nextRoute,
        'current_onboarding_workflow': describeEnum(currentOnboardingStage!),
      },
    );
    return state;
  }
}
