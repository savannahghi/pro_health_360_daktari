// Dart imports:
import 'dart:async';
import 'dart:convert';

// Package imports:
import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:async_redux/async_redux.dart';
import 'package:flutter_graphql_client/graph_client.dart';
import 'package:http/http.dart' as http;
import 'package:mycarehubpro/application/core/services/utils.dart';
import 'package:mycarehubpro/application/redux/actions/flags/app_flags.dart';
import 'package:mycarehubpro/application/redux/actions/onboarding/update_onboarding_state_action.dart';
import 'package:mycarehubpro/application/redux/states/app_state.dart';
import 'package:mycarehubpro/domain/core/entities/core/onboarding_path_info.dart';
import 'package:mycarehubpro/domain/core/value_objects/app_strings.dart';
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
  Future<AppState> reduce() async {
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

      if (responseMap['data']['verifySecurityQuestionResponses'] != null) {
        dispatch(
          UpdateOnboardingStateAction(
            hasVerifiedSecurityQuestions:
                responseMap['data']['verifySecurityQuestionResponses'] as bool,
          ),
        );

        final OnboardingPathInfo path = getOnboardingPath(state: state);

        dispatch(
          NavigateAction<AppState>.pushReplacementNamed(path.nextRoute),
        );
      }
      return state;
    } else {
      final String? errors = client.parseError(responseMap);

      // check for code 77 here
      // if (processedResponse.code == 77) {
      //   // Navigate to ServiceRequest page

      // } else

      if (errors != null || responseMap['error'] != null) {
        dispatch(
          UpdateOnboardingStateAction(hasVerifiedSecurityQuestions: false),
        );

        Sentry.captureException(
          UserException(errors),
        );
        if (responseMap['error'] != null) {
          throw const UserException(responseNotMatchingText);
        }

        throw const UserException(somethingWentWrongText);
      }
    }
  }
}
