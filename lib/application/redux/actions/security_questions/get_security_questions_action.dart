// Dart imports:
import 'dart:async';
import 'dart:convert';

// Package imports:
import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:app_wrapper/app_wrapper.dart';
import 'package:async_redux/async_redux.dart';
import 'package:domain_objects/failures.dart';
// Flutter imports:
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_graphql_client/graph_client.dart';
import 'package:healthcloud/application/core/graphql/queries.dart';
import 'package:healthcloud/application/redux/actions/flags/app_flags.dart';
import 'package:healthcloud/application/redux/actions/update_onboarding_state.dart';
import 'package:healthcloud/application/redux/states/app_state.dart';
import 'package:healthcloud/domain/core/value_objects/app_strings.dart';
import 'package:http/http.dart' as http;
import 'package:misc_utilities/misc.dart';
// Project imports:
import 'package:shared_themes/colors.dart';
import 'package:shared_themes/constants.dart';

class GetSecurityQuestionsAction extends ReduxAction<AppState> {
  GetSecurityQuestionsAction({
    required this.context,
  });

  final BuildContext context;

  @override
  void after() {
    dispatch(WaitAction<AppState>.remove(getSecurityQuestionsFlag));
    super.after();
  }

  @override
  void before() {
    dispatch(WaitAction<AppState>.add(getSecurityQuestionsFlag));
    super.before();
  }

  @override
  Future<AppState> reduce() async {
    final IGraphQlClient _client = AppWrapperBase.of(context)!.graphQLClient;

    final http.Response result =
        await _client.query(getSecurityQuestionsQuery, <String, dynamic>{
      'flavour': Flavour.consumer.name,
    });
    final Map<String, dynamic> body = _client.toMap(result);

    final Map<String, dynamic> responseMap =
        json.decode(result.body) as Map<String, dynamic>;

    if (_client.parseError(body) != null || responseMap.isEmpty) {
      throw SILException(
        cause: getSecurityQuestionsFlag,
        message: somethingWentWrongText,
      );
    }

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
