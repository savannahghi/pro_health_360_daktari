// Dart imports:
import 'dart:async';
import 'dart:convert';

// Package imports:
import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:async_redux/async_redux.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_graphql_client/graph_client.dart';
import 'package:http/http.dart' as http;
import 'package:prohealth360_daktari/application/core/services/analytics_service.dart';
import 'package:prohealth360_daktari/application/core/services/utils.dart';
import 'package:prohealth360_daktari/application/redux/actions/flags/app_flags.dart';
import 'package:prohealth360_daktari/application/redux/actions/onboarding/update_onboarding_state_action.dart';
import 'package:prohealth360_daktari/application/redux/states/app_state.dart';
import 'package:prohealth360_daktari/domain/core/entities/core/onboarding_path_info.dart';
import 'package:prohealth360_daktari/domain/core/value_objects/app_enums.dart';
import 'package:prohealth360_daktari/domain/core/value_objects/app_events.dart';
import 'package:prohealth360_daktari/domain/core/value_objects/app_strings.dart';
import 'package:prohealth360_daktari/presentation/router/routes.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

/// [VerifySecurityQuestionAction] is a Redux Action whose job is to verify responses for recorded
///  security questions responses if pin reset is true.
///
/// Otherwise delightfully notify user of any Error that might occur during the process

class VerifySecurityQuestionAction extends ReduxAction<AppState> {
  VerifySecurityQuestionAction({
    required this.client,
    required this.verifySecurityQuestionsEndpoint,
  });

  final IGraphQlClient client;
  final String verifySecurityQuestionsEndpoint;

  @override
  void before() {
    dispatch(WaitAction<AppState>.add(verifySecurityQuestionsFlag));
  }

  @override
  void after() {
    dispatch(WaitAction<AppState>.remove(verifySecurityQuestionsFlag));
    super.after();
  }

  @override
  Future<AppState?> reduce() async {
    final String? phone = state.onboardingState?.phoneNumber;
    final List<SecurityQuestionResponse> securityQuestionsResponses =
        state.onboardingState!.securityQuestionResponses!;

    final List<Map<String, dynamic>> _variables = <Map<String, dynamic>>[];

    for (int i = 0; i < securityQuestionsResponses.length; i++) {
      _variables.add(<String, dynamic>{
        'questionID':
            securityQuestionsResponses[i].securityQuestionID.toString(),
        'flavour': Flavour.pro.name,
        'response': securityQuestionsResponses[i].response.toString(),
        'phoneNumber': phone,
      });
    }

    final http.Response result = await client.callRESTAPI(
      endpoint: verifySecurityQuestionsEndpoint,
      method: httpPOST,
      variables: <String, dynamic>{
        'verifySecurityQuestionsInput': _variables,
      },
    );

    client.close();

    final ProcessedResponse processedResponse = processHttpResponse(result);

    final Map<String, dynamic> responseMap =
        client.toMap(processedResponse.response);

    if (processedResponse.ok) {
      final Map<String, dynamic> responseMap =
          json.decode(result.body) as Map<String, dynamic>;

      final Map<String, dynamic>? data =
          responseMap['data'] as Map<String, dynamic>?;

      if (data?['verifySecurityQuestionResponses'] != null) {
        dispatch(
          UpdateOnboardingStateAction(
            hasVerifiedSecurityQuestions:
                data?['verifySecurityQuestionResponses'] as bool,
          ),
        );

        final OnboardingPathInfo path = getOnboardingPath(state: state);
        final CurrentOnboardingStage? currentOnboardingStage =
            state.onboardingState?.currentOnboardingStage;

        dispatch(
          NavigateAction<AppState>.pushReplacementNamed(path.nextRoute),
        );
        await AnalyticsService().logEvent(
          name: verifySecurityQuestionsEvent,
          eventType: AnalyticsEventType.ONBOARDING,
          parameters: <String, dynamic>{
            'next_page': path.nextRoute,
            'current_onboarding_workflow':
                describeEnum(currentOnboardingStage!),
          },
        );
      }
      return state;
    } else {
      final String? errors = client.parseError(responseMap);

      // check if the user has exceeded their
      if (processedResponse.code == 77) {
        // Navigate to ServiceRequest page
        dispatch(
          NavigateAction<AppState>.pushNamed(
            AppRoutes.verifySecurityQuestionsHelpPage,
          ),
        );
        await AnalyticsService().logEvent(
          name: securityQuestionThresholdEvent,
          eventType: AnalyticsEventType.ONBOARDING,
        );
      } else if (errors != null || responseMap['error'] != null) {
        dispatch(
          UpdateOnboardingStateAction(hasVerifiedSecurityQuestions: false),
        );

        Sentry.captureException(UserException(errors));
        throw const UserException(responseNotMatchingText);
      }
    }
    return state;
  }
}
