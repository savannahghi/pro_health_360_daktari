import 'dart:async';

import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:async_redux/async_redux.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_graphql_client/graph_client.dart';
import 'package:http/http.dart';
import 'package:mycarehubpro/application/core/graphql/mutations.dart';
import 'package:mycarehubpro/application/redux/actions/core/update_user_action.dart';
import 'package:mycarehubpro/application/redux/actions/flags/app_flags.dart';
import 'package:mycarehubpro/application/redux/states/app_state.dart';
import 'package:mycarehubpro/domain/core/entities/core/role.dart';
import 'package:mycarehubpro/domain/core/entities/core/user.dart';
import 'package:mycarehubpro/domain/core/value_objects/app_enums.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

class AssignRolesAction extends ReduxAction<AppState> {
  AssignRolesAction({
    required this.client,
    required this.userId,
    required this.roles,
    required this.onSuccess,
    required this.onFailure,
  });

  final VoidCallback? onSuccess;
  final VoidCallback? onFailure;
  final IGraphQlClient client;
  final List<RoleValue> roles;
  final String? userId;

  @override
  void before() {
    super.before();
    dispatch(WaitAction<AppState>.add(assignRolesFlag));
  }

  @override
  void after() {
    dispatch(WaitAction<AppState>.remove(assignRolesFlag));
    super.after();
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
        Sentry.captureException(
          UserException(errors),
        );

        throw UserException(getErrorMessage('assigning roles'));
      }
      if (body['data'] != null &&
          body['data']['assignOrRevokeRoles'] != null &&
          body['data']['assignOrRevokeRoles'] is bool &&
          body['data']['assignOrRevokeRoles'] == true) {
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
  }
}
