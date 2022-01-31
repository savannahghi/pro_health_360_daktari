// Dart imports:
import 'dart:async';

// Package imports:
import 'package:app_wrapper/app_wrapper.dart';
import 'package:async_redux/async_redux.dart';
// Flutter imports:
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_graphql_client/graph_client.dart';
// Project imports:
import 'package:healthcloud/application/core/services/helpers.dart';
import 'package:healthcloud/application/core/services/onboarding.dart';
import 'package:healthcloud/application/redux/actions/core/auth_status_action.dart';
import 'package:healthcloud/application/redux/actions/user_state_actions/logout_action.dart';
import 'package:healthcloud/application/redux/states/app_state.dart';
import 'package:healthcloud/domain/core/entities/core/auth_credentials.dart';
import 'package:healthcloud/domain/core/entities/core/processed_response.dart';

/// [RefreshTokenAction] is used to refresh the Auth Token once it has expired
///
///
/// [context] is required to extract the necessary data to make the api call
class RefreshTokenAction extends ReduxAction<AppState> {
  RefreshTokenAction({required this.context});

  final BuildContext context;

  @override
  Future<AppState?> reduce() async {
    final IGraphQlClient _client = AppWrapperBase.of(context)!.graphQLClient;

    final String refreshTokenEndpoint =
        AppWrapperBase.of(context)!.customContext!.refreshTokenEndpoint;

    final Map<String, dynamic> refreshTokenVariables = <String, dynamic>{
      'refreshToken': store.state.credentials!.refreshToken
    };

    final ProcessedResponse processedResponse = processResponse(
      await _client.callRESTAPI(
        endpoint: refreshTokenEndpoint,
        method: 'POST',
        variables: refreshTokenVariables,
      ),
      context,
    );

    if (processedResponse.ok) {
      final Map<String, dynamic> body =
          _client.toMap(processedResponse.response);

      final AuthCredentials newAuth = AuthCredentials.fromJson(body);

      // update user state
      dispatch(
        AuthStatusAction(
          idToken: newAuth.idToken,
          refreshToken: newAuth.refreshToken,
          expiresIn: newAuth.expiresIn,
        ),
      );

      return state;
    } else {
      await captureException(
        'Error refreshing token',
        error: processedResponse.message,
        response: processedResponse.response.body,
        variables: refreshTokenVariables,
      );

      // logout the user if an error occurs
      dispatch(LogoutAction());

      return null;
    }
  }
}
