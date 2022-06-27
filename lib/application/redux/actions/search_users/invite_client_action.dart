import 'dart:async';

import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_graphql_client/graph_client.dart';
import 'package:http/http.dart';
import 'package:prohealth360_daktari/application/core/graphql/mutations.dart';
import 'package:prohealth360_daktari/application/redux/actions/flags/app_flags.dart';
import 'package:prohealth360_daktari/application/redux/states/app_state.dart';
import 'package:prohealth360_daktari/domain/core/entities/search_user/search_user_response.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

class InviteClientAction extends ReduxAction<AppState> {
  InviteClientAction({
    required this.clientResponse,
    required this.client,
    required this.onSuccess,
    required this.onFailure,
    this.reinvite = false,
  });

  final IGraphQlClient client;
  final SearchUserResponse clientResponse;
  final VoidCallback? onSuccess;
  final VoidCallback? onFailure;

  /// Used to indicate whether the invite should be sent using an alternative
  /// route
  final bool reinvite;

  @override
  void after() {
    dispatch(
      WaitAction<AppState>.remove(
        reinvite ? resendClientInviteFlag : inviteClientFlag,
      ),
    );
    super.after();
  }

  @override
  void before() {
    super.before();
    dispatch(
      WaitAction<AppState>.add(
        reinvite ? resendClientInviteFlag : inviteClientFlag,
      ),
    );
  }

  @override
  Future<AppState?> reduce() async {
    final Map<String, dynamic> variables = <String, dynamic>{
      'userID': clientResponse.user!.id,
      'flavour': Flavour.consumer.name,
      'phoneNumber': clientResponse.user?.primaryContact?.value,
      'reinvite': reinvite,
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

      final Map<String, dynamic>? data = body['data'] as Map<String, dynamic>?;

      if (data != null &&
          data['inviteUser'] != null &&
          data['inviteUser'] is bool &&
          data['inviteUser'] == true) {
        onSuccess?.call();
      } else {
        onFailure?.call();
      }
    } else {
      throw UserException(processedResponse.message);
    }

    return null;
  }
}
