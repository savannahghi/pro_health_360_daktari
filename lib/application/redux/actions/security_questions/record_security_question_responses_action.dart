// Dart imports:
import 'dart:async';

// Package imports:
import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:app_wrapper/app_wrapper.dart';
import 'package:async_redux/async_redux.dart';
// Flutter imports:
import 'package:flutter/material.dart';
import 'package:flutter_graphql_client/graph_client.dart';
import 'package:http/http.dart' as http;
import 'package:mycarehubpro/application/core/graphql/mutations.dart';
import 'package:mycarehubpro/application/core/services/utils.dart' as utils;
import 'package:mycarehubpro/application/redux/actions/flags/app_flags.dart';
import 'package:mycarehubpro/application/redux/actions/onboarding/update_onboarding_state_action.dart';
import 'package:mycarehubpro/application/redux/states/app_state.dart';
import 'package:mycarehubpro/domain/core/value_objects/app_strings.dart';
// Project imports:
import 'package:shared_themes/colors.dart';
import 'package:shared_themes/constants.dart';

/// [RecordSecurityQuestionResponsesAction] is a Redux Action whose job is to
/// update security questions responses.
///
/// Otherwise delightfully notify user of any Error that might occur during
/// the process
class RecordSecurityQuestionResponsesAction extends ReduxAction<AppState> {
  RecordSecurityQuestionResponsesAction({
    required this.context,
  });

  final BuildContext context;

  @override
  void before() {
    super.before();
    dispatch(WaitAction<AppState>.add(recordSecurityQuestionsFlag));
  }

  @override
  void after() {
    dispatch(WaitAction<AppState>.remove(recordSecurityQuestionsFlag));
    super.after();
  }

  @override
  Future<AppState> reduce() async {
    final List<SecurityQuestionResponse> securityQuestionsResponses =
        state.onboardingState!.securityQuestionResponses!;

    final List<Map<String, dynamic>> vars = <Map<String, dynamic>>[];
    for (final SecurityQuestionResponse response
        in securityQuestionsResponses) {
      vars.add(response.toJson());
    }

    final Map<String, dynamic> _variables = <String, dynamic>{
      'input': vars,
      'flavour': Flavour.pro.name,
    };

    final IGraphQlClient client = AppWrapperBase.of(context)!.graphQLClient;

    final http.Response result = await client.query(
      recordSecurityQuestionResponsesMutation,
      _variables,
    );

    final Map<String, dynamic> body = client.toMap(result);
    client.close();

    if (client.parseError(body) != null) {
      throw MyAfyaException(
        cause: recordSecurityQuestionsFlag,
        message: somethingWentWrongText,
      );
    }

    final RecordSecurityQuestionResponsesData responseMap =
        RecordSecurityQuestionResponsesData.fromJson(
      body['data'] as Map<String, dynamic>,
    );

    if (responseMap.recordSecurityQuestionResponses.isNotEmpty) {
      dispatch(UpdateOnboardingStateAction(hasSetSecurityQuestions: true));

      final String route = utils.getOnboardingPath(state: state).nextRoute;

      Navigator.pushReplacementNamed(
        context,
        route,
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
