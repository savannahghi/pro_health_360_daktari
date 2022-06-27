import 'dart:async';

import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:async_redux/async_redux.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_graphql_client/graph_client.dart';
import 'package:http/http.dart';
import 'package:prohealth360_daktari/application/core/graphql/mutations.dart';
import 'package:prohealth360_daktari/application/redux/actions/core/update_user_action.dart';
import 'package:prohealth360_daktari/application/redux/actions/flags/app_flags.dart';
import 'package:prohealth360_daktari/application/redux/states/app_state.dart';
import 'package:prohealth360_daktari/domain/core/entities/core/user.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

class AssignRolesAction extends ReduxAction<AppState> {
  AssignRolesAction({
    required this.client,
    required this.userId,
    required this.roles,
    required this.onSuccess,
    required this.noPermissionsCallBack,
    required this.onFailure,
  });

  final IGraphQlClient client;
  final VoidCallback? noPermissionsCallBack;
  final VoidCallback? onFailure;
  final VoidCallback? onSuccess;
  final List<RoleValue> roles;
  final String? userId;

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
    final List<String> newRolesStrings =
        roles.map((RoleValue role) => describeEnum(role)).toList();

    final Map<String, dynamic> variables = <String, dynamic>{
      'userID': userId,
      'roles': newRolesStrings
    };
    final Response response =
        await client.query(assignOrRevokeRoles, variables);

    final ProcessedResponse processedResponse = processHttpResponse(response);

    if (processedResponse.ok) {
      final Map<String, dynamic> body = client.toMap(response);

      final String? errors = client.parseError(body);

      if (errors != null) {
        if (errors.contains('65: user not authorized:')) {
          noPermissionsCallBack?.call();
          return null;
        }
        Sentry.captureException(
          UserException(errors),
        );

        throw UserException(getErrorMessage('assigning roles'));
      }

      final Map<String, dynamic>? data = body['data'] as Map<String, dynamic>?;
      if (data != null &&
          data['assignOrRevokeRoles'] != null &&
          data['assignOrRevokeRoles'] is bool &&
          data['assignOrRevokeRoles'] == true) {
        final User? user = state.staffState?.user;

        final List<Role> newRoles = roles.map((RoleValue roleValue) {
          return Role(name: roleValue, active: true);
        }).toList();

        dispatch(UpdateUserAction(user: user?.copyWith(roles: newRoles)));

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
