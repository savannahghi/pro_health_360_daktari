// Dart imports:
import 'dart:async';
import 'dart:convert';

// Flutter imports:
import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:domain_objects/value_objects.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:async_redux/async_redux.dart';
import 'package:domain_objects/failures.dart';
import 'package:flutter_graphql_client/graph_client.dart';
import 'package:healthcloud/application/core/graphql/mutations.dart';
import 'package:healthcloud/application/core/services/utils.dart';
import 'package:healthcloud/application/redux/actions/core/batch_update_misc_state_action.dart';
import 'package:healthcloud/application/redux/actions/flags/app_flags.dart';
import 'package:healthcloud/application/redux/actions/terms/update_terms_action.dart';
import 'package:healthcloud/application/redux/states/app_state.dart';
import 'package:healthcloud/domain/core/entities/terms/accept_terms_response.dart';
import 'package:healthcloud/domain/core/value_objects/app_strings.dart';
import 'package:healthcloud/domain/core/value_objects/error_tags.dart';
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

      Sentry.captureException(
        SILException(cause: acceptTermsErrorTag, message: error),
      );

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

    final OnboardingPathConfig onboardingPathConfig =
        getOnboardingPath(state: state);

    dispatch(
      NavigateAction<AppState>.pushNamedAndRemoveUntil(
        onboardingPathConfig.route,
        (Route<dynamic> route) => false,
        arguments: onboardingPathConfig.argumets,
      ),
    );

    return state;
  }
}
