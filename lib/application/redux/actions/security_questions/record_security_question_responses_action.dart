// Dart imports:
import 'dart:async';
import 'dart:convert';

// Package imports:
import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:app_wrapper/app_wrapper.dart';
import 'package:async_redux/async_redux.dart';
import 'package:domain_objects/failures.dart';
// Flutter imports:
import 'package:flutter/material.dart';
import 'package:flutter_graphql_client/graph_client.dart';
import 'package:healthcloud/application/core/graphql/mutations.dart';
import 'package:healthcloud/application/core/services/utils.dart';
import 'package:healthcloud/application/redux/actions/flags/app_flags.dart';
import 'package:healthcloud/application/redux/actions/update_onboarding_state.dart';
import 'package:healthcloud/application/redux/states/app_state.dart';
import 'package:healthcloud/domain/core/value_objects/app_strings.dart';
import 'package:http/http.dart' as http;
import 'package:misc_utilities/misc.dart';
// Project imports:
import 'package:shared_themes/colors.dart';
import 'package:shared_themes/constants.dart';

/// [RecordSecurityQuestionResponsesAction] is a Redux Action whose job is to update security questions responses.
///
/// Otherwise delightfully notify user of any Error that might occur during the process
class RecordSecurityQuestionResponsesAction extends ReduxAction<AppState> {
  RecordSecurityQuestionResponsesAction({
    required this.context,
  });

  final BuildContext context;

  @override
  void after() {
    dispatch(WaitAction<AppState>.remove(recordSecurityQuestionsFlag));
    super.after();
  }

  @override
  void before() {
    dispatch(WaitAction<AppState>.add(recordSecurityQuestionsFlag));
    super.before();
  }

  @override
  Future<AppState> reduce() async {
    final List<SecurityQuestionResponse> securityQuestionsResponses =
        state.onboardingState!.securityQuestionResponses!;

    // initializing of the RecordSecurityQuestionResponses mutation
    final Map<String, dynamic> _variables = <String, dynamic>{
      'input': securityQuestionsResponses
    };
    final IGraphQlClient _client = AppWrapperBase.of(context)!.graphQLClient;

    final http.Response result = await _client.query(
      recordSecurityQuestionResponsesMutation,
      _variables,
    );

    final Map<String, dynamic> body = _client.toMap(result);

    _client.close();

    final Map<String, dynamic> responseMap =
        json.decode(result.body) as Map<String, dynamic>;

    if (_client.parseError(body) != null || responseMap['errors'] != null) {
      throw SILException(
        cause: recordSecurityQuestionsFlag,
        message: somethingWentWrongText,
      );
    }

    dispatch(
      UpdateOnboardingStateAction(
        hasSetSecurityQuestions: true,
      ),
    );

    final String route = getOnboardingPath(state: state).route;

    Navigator.pushReplacementNamed(
      context,
      route,
    );

    return state;
  }

  @override
  Object wrapError(dynamic error) async {
    if (error.runtimeType == SILException) {
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
