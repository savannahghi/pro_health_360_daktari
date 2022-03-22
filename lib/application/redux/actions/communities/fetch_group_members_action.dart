import 'dart:async';

import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_graphql_client/graph_client.dart';
import 'package:http/http.dart';
import 'package:mycarehubpro/application/core/graphql/queries.dart';
import 'package:mycarehubpro/application/redux/actions/communities/update_group_state_action.dart';
import 'package:mycarehubpro/application/redux/actions/flags/app_flags.dart';
import 'package:mycarehubpro/application/redux/states/app_state.dart';
import 'package:mycarehubpro/application/redux/states/groups_state.dart';
import 'package:mycarehubpro/domain/core/entities/community_members/group_member.dart';

class FetchGroupMembersAction extends ReduxAction<AppState> {
  final IGraphQlClient client;
  final Map<String, dynamic> variables;
  final void Function(String?)? onError;
  final BuildContext context;

  FetchGroupMembersAction(
    this.context, {
    required this.client,
    required this.variables,
    this.onError,
  });

  @override
  void after() {
    dispatch(WaitAction<AppState>.remove(fetchGroupMembersFlag));
    super.after();
  }

  @override
  void before() {
    dispatch(WaitAction<AppState>.add(fetchGroupMembersFlag));
    super.before();
  }

  @override
  Future<AppState?> reduce() async {
    final Response response = await client.query(
      listCommunityMembersQuery,
      variables,
    );
    client.close();

    final Map<String, dynamic> payLoad = client.toMap(response);

    final String? error = parseError(payLoad);

    if (error != null) {
      onError?.call(error);
      dispatch(
        UpdateGroupStateAction(
          groupMembers: <GroupMember>[],
        ),
      );
      return state;
    }

    final GroupState groupState = GroupState.fromJson(
      payLoad['data'] as Map<String, dynamic>,
    );
    final List<GroupMember?>? groupMembers = groupState.groupMembers;

    if (groupMembers != null && groupMembers.isNotEmpty) {
      dispatch(UpdateGroupStateAction(groupMembers: groupMembers));
    } else {
      dispatch(UpdateGroupStateAction(groupMembers: <GroupMember>[]));
    }

    return state;
  }
}
