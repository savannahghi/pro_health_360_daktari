import 'dart:async';

import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:async_redux/async_redux.dart';
import 'package:flutter_graphql_client/graph_client.dart';
import 'package:http/http.dart';
import 'package:prohealth360_daktari/application/core/graphql/queries.dart';
import 'package:prohealth360_daktari/application/redux/actions/communities/update_group_state_action.dart';
import 'package:prohealth360_daktari/application/redux/actions/flags/app_flags.dart';
import 'package:prohealth360_daktari/application/redux/states/app_state.dart';
import 'package:prohealth360_daktari/domain/community/entities/list_group_info_response.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

class FetchGroupMembersAction extends ReduxAction<AppState> {
  final IGraphQlClient client;
  final String channelId;
  final void Function(String?)? onError;

  FetchGroupMembersAction({
    required this.client,
    required this.channelId,
    this.onError,
  });

  @override
  void before() {
    super.before();
    dispatch(WaitAction<AppState>.add(fetchGroupMembersFlag));
  }

  @override
  void after() {
    dispatch(WaitAction<AppState>.remove(fetchGroupMembersFlag));
    super.after();
  }

  @override
  Future<AppState?> reduce() async {
    final Map<String, dynamic> variables = <String, dynamic>{
      'communityID': channelId,
      'communityMembersFilter': <String, dynamic>{
        'filter': <String, String>{'invite': 'accepted'}
      },
      'listCommunitiesFilter': <String, dynamic>{
        'filter': <String, String>{'id': channelId}
      }
    };

    final Response response = await client.query(
      listCommunityMembersQuery,
      variables,
    );
    client.close();

    final Map<String, dynamic> payLoad = client.toMap(response);

    final String? error = parseError(payLoad);

    if (error != null) {
      onError?.call(error);
      Sentry.captureException(
        error,
        hint: <String, dynamic>{
          'variables': variables,
          'query': listCommunityMembersQuery,
          'response': response.body,
        },
      );

      dispatch(UpdateGroupStateAction(groupMembers: <GroupMember>[]));
      return state;
    }

    final ListGroupInfoResponse groupInfoResponse =
        ListGroupInfoResponse.fromJson(
      payLoad['data'] as Map<String, dynamic>,
    );

    dispatch(
      UpdateGroupStateAction(
        groupMembers: groupInfoResponse.groupMembers,
        communities: groupInfoResponse.communities,
      ),
    );

    return state;
  }

  @override
  Object? wrapError(dynamic error) {
    Sentry.captureException(error);
    return UserException(getErrorMessage());
  }
}
