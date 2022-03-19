import 'dart:async';

import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:async_redux/async_redux.dart';
import 'package:flutter_graphql_client/graph_client.dart';
import 'package:http/http.dart';
import 'package:mycarehubpro/application/core/graphql/queries.dart';
import 'package:mycarehubpro/application/redux/actions/flags/app_flags.dart';
import 'package:mycarehubpro/application/redux/states/app_state.dart';
import 'package:mycarehubpro/domain/core/entities/search_user/search_user_response.dart';
import 'package:mycarehubpro/domain/core/entities/search_user/searched_staff_members.dart';
import 'package:mycarehubpro/domain/core/value_objects/app_strings.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

class SearchStaffMemberAction extends ReduxAction<AppState> {
  final IGraphQlClient client;
  final void Function(String message)? onFailure;
  final void Function(List<SearchUserResponse>? staffMembers)? onSuccess;
  final void Function()? staffNotFound;
  String staffNumberQuery;

  SearchStaffMemberAction({
    required this.client,
    required this.staffNumberQuery,
    this.onSuccess,
    this.onFailure,
    this.staffNotFound,
  });

  @override
  void before() {
    super.before();
    dispatch(WaitAction<AppState>.add(searchStaffMemberFlag));
  }

  @override
  void after() {
    dispatch(WaitAction<AppState>.remove(searchStaffMemberFlag));
    super.after();
  }

  @override
  Future<AppState?> reduce() async {
    final bool hasConnection = state.connectivityState?.isConnected ?? false;
    if (!hasConnection) {
      onFailure?.call(connectionLostText);
      return null;
    }

    final Map<String, dynamic> variables = <String, dynamic>{
      'staffNumber': staffNumberQuery,
    };

    final Response response =
        await client.query(searchStaffMemberQuery, variables);

    final ProcessedResponse processedResponse = processHttpResponse(response);

    if (processedResponse.ok) {
      final Map<String, dynamic> body = client.toMap(response);
      client.close();

      final String? errors = client.parseError(body);

      if (errors != null) {
        Sentry.captureException(
          UserException(errors),
        );

        throw UserException(getErrorMessage('fetching staff members'));
      }

      final SearchedStaffMembers staffMembersResponse =
          SearchedStaffMembers.fromJson(
        body['data'] as Map<String, dynamic>,
      );

      if (staffMembersResponse.staffMembers == null) {
        staffNotFound?.call();
      }
      onSuccess?.call(staffMembersResponse.staffMembers);
    } else {
      throw UserException(processedResponse.message);
    }

    return null;
  }
}
