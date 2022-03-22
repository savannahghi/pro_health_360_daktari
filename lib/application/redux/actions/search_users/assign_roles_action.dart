import 'dart:async';

import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:async_redux/async_redux.dart';
import 'package:flutter_graphql_client/graph_client.dart';
import 'package:http/http.dart';
import 'package:mycarehubpro/application/core/graphql/mutations.dart';
import 'package:mycarehubpro/application/redux/actions/flags/app_flags.dart';
import 'package:mycarehubpro/application/redux/states/app_state.dart';
import 'package:mycarehubpro/domain/core/entities/search_user/search_user_response.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

class AssignRolesAction extends ReduxAction<AppState> {
  AssignRolesAction({
    required this.client,
    required this.searchUserResponse,
    required this.roles,
    required this.onSuccess,
    required this.onFailure,
  });

  final void Function(String name)? onSuccess;
  final void Function()? onFailure;
  final IGraphQlClient client;
  final Map<String, bool> roles;
  final SearchUserResponse searchUserResponse;

  @override
  void after() {
    dispatch(WaitAction<AppState>.remove(assignRolesFlag));
    super.after();
  }

  @override
  void before() {
    super.before();
    dispatch(WaitAction<AppState>.add(assignRolesFlag));
  }

  @override
  Future<AppState?> reduce() async {
    final List<String> roleTitles = <String>[];
    roles.forEach((String key, bool value) {
      if (value == true) {
        switch (key) {
          case 'System administrator':
            roleTitles.add('SYSTEM_ADMINISTRATOR');
            break;

          case 'Community management':
            roleTitles.add('COMMUNITY_MANAGEMENT');
            break;

          case 'Content management':
            roleTitles.add('CONTENT_MANAGEMENT');
            break;

          case 'Client management':
            roleTitles.add('CLIENT_MANAGEMENT');
            break;
          default:
        }
      }
    });

    final Map<String, dynamic> variables = <String, dynamic>{
      'userID': searchUserResponse.user!.id!,
      'roles': roleTitles
    };
    final Response response = await client.query(assignRoleMutation, variables);

    final ProcessedResponse processedResponse = processHttpResponse(response);

    if (processedResponse.ok) {
      final Map<String, dynamic> body = client.toMap(response);

      final String? errors = client.parseError(body);

      if (errors != null) {
        Sentry.captureException(
          UserException(errors),
        );

        throw UserException(getErrorMessage('assigning roles'));
      }
      if (body['data'] != null &&
          body['data']['assignRoles'] != null &&
          body['data']['assignRoles'] is bool &&
          body['data']['assignRoles'] == true) {
        onSuccess?.call(searchUserResponse.user?.userName ?? UNKNOWN);
      } else {
        onFailure?.call();
      }
    } else {
      throw UserException(processedResponse.message);
    }
  }
}
