import 'dart:async';

import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_graphql_client/graph_client.dart';
import 'package:http/http.dart';
import 'package:mycarehubpro/application/core/graphql/mutations.dart';
import 'package:mycarehubpro/application/redux/actions/flags/app_flags.dart';
import 'package:mycarehubpro/application/redux/states/app_state.dart';
import 'package:mycarehubpro/domain/core/entities/search_user/search_user_response.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

class InviteClientAction extends ReduxAction<AppState> {
  InviteClientAction({
    required this.clientResponse,
    required this.client,
    required this.onSuccess,
    required this.onFailure,
  });

  final IGraphQlClient client;
  final SearchUserResponse clientResponse;
  final VoidCallback? onSuccess;
  final VoidCallback? onFailure;

  @override
  void after() {
    dispatch(WaitAction<AppState>.remove(inviteClientFlag));
    super.after();
  }

  @override
  void before() {
    super.before();
    dispatch(WaitAction<AppState>.add(inviteClientFlag));
  }

  @override
  Future<AppState?> reduce() async {
    final Map<String, dynamic> variables = <String, dynamic>{
      'userID': clientResponse.user!.id,
      'flavour': Flavour.consumer.name,
      'phoneNumber': clientResponse.user?.primaryContact?.value
    };
    final Response response = await client.query(inviteUserMutation, variables);

    final ProcessedResponse processedResponse = processHttpResponse(response);

    if (processedResponse.ok) {
      final Map<String, dynamic> body = client.toMap(response);

      client.close();

      final String? errors = client.parseError(body);

      if (errors != null) {
        Sentry.captureException(
          UserException(errors),
        );

        throw UserException(getErrorMessage('inviting client'));
      }

      if (body['data'] != null &&
          body['data']['inviteUser'] != null &&
          body['data']['inviteUser'] is bool &&
          body['data']['inviteUser'] == true) {
        onSuccess?.call();
      } else {
        onFailure?.call();
      }
    } else {
      throw UserException(processedResponse.message);
    }
  }
}
