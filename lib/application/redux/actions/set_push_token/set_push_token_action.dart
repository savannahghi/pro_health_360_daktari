import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:async_redux/async_redux.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_graphql_client/graph_client.dart';
import 'package:http/http.dart';
import 'package:prohealth360_daktari/application/core/graphql/mutations.dart';
import 'package:prohealth360_daktari/application/redux/actions/core/update_credentials_action.dart';
import 'package:prohealth360_daktari/application/redux/states/app_state.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

class SetPushToken extends ReduxAction<AppState> {
  SetPushToken({required this.client, required this.firebaseMessaging});

  final IGraphQlClient client;
  final FirebaseMessaging firebaseMessaging;

  @override
  Future<AppState?> reduce() async {
    if (state.credentials?.isSignedIn ?? false) {
      final String? token = await firebaseMessaging.getToken();
      final String tokenFromState = state.credentials?.pushToken ?? UNKNOWN;

      if (tokenFromState.compareTo(token ?? '') == 0) return null;

      final Map<String, dynamic> variables = <String, dynamic>{'token': token};
      final Response response =
          await client.query(setPushTokenMutation, variables);

      final ProcessedResponse processed = processHttpResponse(response);

      if (processed.ok) {
        final Map<String, dynamic> responseBody = client.toMap(response);

        final String? errors = client.parseError(responseBody);

        if (errors != null) {
          Sentry.captureException(
            errors,
            hint: <String, dynamic>{
              'request': setPushTokenMutation,
              'variables': variables,
              'response': response,
            },
          );
        }
        dispatch(
          UpdateCredentialsAction(pushToken: token),
        );

        return null;
      } else {
        Sentry.captureException(
          UserException(getErrorMessage()),
          hint: <String, dynamic>{
            'request': setPushTokenMutation,
            'variables': variables,
            'response': response,
          },
        );
      }

      return null;
    }
  }

  @override
  Object? wrapError(dynamic error) {
    Sentry.captureException(error);
    return UserException(getErrorMessage());
  }
}
