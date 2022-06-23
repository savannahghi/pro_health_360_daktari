import 'dart:async';

import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:async_redux/async_redux.dart';
import 'package:flutter_graphql_client/graph_client.dart';
import 'package:http/http.dart';
import 'package:prohealth360_daktari/application/core/graphql/mutations.dart';
import 'package:prohealth360_daktari/application/redux/actions/flags/app_flags.dart';
import 'package:prohealth360_daktari/application/redux/states/app_state.dart';
import 'package:prohealth360_daktari/domain/core/entities/search_user/search_user_response.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

class InviteStaffAction extends ReduxAction<AppState> {
  InviteStaffAction({
    required this.clientResponse,
    required this.client,
    required this.onSuccess,
    required this.onFailure,
    this.reinvite = false,
  });

  final IGraphQlClient client;
  final SearchUserResponse clientResponse;
  final void Function(String name)? onSuccess;
  final void Function()? onFailure;
  final bool reinvite;

  @override
  void after() {
    dispatch(
      WaitAction<AppState>.remove(
        reinvite ? reinviteStaffFlag : inviteStaffFlag,
      ),
    );
    super.after();
  }

  @override
  void before() {
    super.before();
    dispatch(
      WaitAction<AppState>.add(
        reinvite ? reinviteStaffFlag : inviteStaffFlag,
      ),
    );
  }

  @override
  Future<AppState?> reduce() async {
    final Map<String, dynamic> variables = <String, dynamic>{
      'userID': clientResponse.user!.id,
      'flavour': Flavour.pro.name,
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

        throw UserException(getErrorMessage('inviting staff'));
      }

      if (body['data'] != null &&
          body['data']['inviteUser'] != null &&
          body['data']['inviteUser'] is bool &&
          body['data']['inviteUser'] == true) {
        onSuccess?.call(clientResponse.user?.userName ?? UNKNOWN);
      } else {
        onFailure?.call();
      }
    } else {
      throw UserException(processedResponse.message);
    }
  }
}
