// Dart imports:
import 'dart:async';
import 'dart:convert';

// Package imports:
import 'package:async_redux/async_redux.dart';
import 'package:domain_objects/failures.dart';
// Flutter imports:
import 'package:flutter/material.dart';
import 'package:flutter_graphql_client/graph_client.dart';
import 'package:healthcloud/application/core/graphql/mutations.dart';
import 'package:healthcloud/application/redux/actions/complete_onboarding_tour.dart';
import 'package:healthcloud/application/redux/actions/flags/app_flags.dart';
import 'package:healthcloud/application/redux/actions/onboarding/update_onboarding_state_action.dart';
import 'package:healthcloud/application/redux/states/app_state.dart';
import 'package:healthcloud/domain/core/value_objects/app_strings.dart';
import 'package:healthcloud/presentation/router/routes.dart';
import 'package:http/http.dart' as http;
import 'package:sentry_flutter/sentry_flutter.dart';

/// [SetNicknameAction] is a Redux Action whose job is to update a users
/// nickname. Otherwise delightfully notify user of any Error that might occur
///  during the process. shouldNavigate is by default set to true unless when
///  the action does not navigate to home page
class SetNicknameAction extends ReduxAction<AppState> {
  SetNicknameAction({
    required this.client,
    this.onSuccess,
    this.shouldNavigate = true,
  });

  final bool shouldNavigate;
  final IGraphQlClient client;
  final void Function()? onSuccess;

  @override
  void before() {
    super.before();
    dispatch(WaitAction<AppState>.add(setNickNameFlag));
  }

  @override
  void after() {
    dispatch(WaitAction<AppState>.remove(setNickNameFlag));
    super.after();
  }

  @override
  Future<AppState> reduce() async {
    final String? userID = state.staffState?.user?.userId;
    final String? userName = state.staffState?.user?.username;

    final Map<String, String?> variables = <String, String?>{
      'userID': userID,
      'nickname': userName,
    };

    final http.Response result = await client.query(
      setNickNameMutation,
      variables,
    );

    final Map<String, dynamic> body = client.toMap(result);
    client.close();

    final Map<String, dynamic> responseMap =
        json.decode(result.body) as Map<String, dynamic>;

    final String? errors = client.parseError(body);

    if (errors != null) {
      Sentry.captureException(
        UserException(errors),
      );

      throw SILException(
        cause: setNickNameFlag,
        message: somethingWentWrongText,
      );
    }

    if (responseMap['data']['setNickName'] != null &&
        responseMap['data']['setNickName'] == true) {
      dispatch(
        UpdateOnboardingStateAction(hasSetNickName: true),
      );

      onSuccess?.call();

      await dispatch(
        CompleteOnboardingTourAction(userID: userID, client: client),
      );

      if (shouldNavigate) {
        dispatch(
          NavigateAction<AppState>.pushNamedAndRemoveUntil(
            AppRoutes.homePage,
            (Route<dynamic> route) => false,
          ),
        );
      }
    }

    return state;
  }
}
