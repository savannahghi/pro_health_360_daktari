// Dart imports:
import 'dart:async';
import 'dart:convert';

// Flutter imports:
import 'package:afya_moja_core/afya_moja_core.dart';
// Package imports:
import 'package:async_redux/async_redux.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_graphql_client/graph_client.dart';
import 'package:mycarehubpro/application/core/graphql/mutations.dart';
import 'package:mycarehubpro/application/core/services/utils.dart';
import 'package:mycarehubpro/application/redux/actions/core/batch_update_misc_state_action.dart';
import 'package:mycarehubpro/application/redux/actions/flags/app_flags.dart';
import 'package:mycarehubpro/application/redux/actions/terms/update_terms_action.dart';
import 'package:mycarehubpro/application/redux/states/app_state.dart';
import 'package:mycarehubpro/domain/core/entities/core/onboarding_path_info.dart';
import 'package:mycarehubpro/domain/core/entities/terms/accept_terms_response.dart';
import 'package:mycarehubpro/domain/core/value_objects/app_strings.dart';
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

    dispatch(
      NavigateAction<AppState>.pushNamedAndRemoveUntil(
        onboardingPathConfig.nextRoute,
        (Route<dynamic> route) => false,
        arguments: onboardingPathConfig.arguments,
      ),
    );

    return state;
  }
}
