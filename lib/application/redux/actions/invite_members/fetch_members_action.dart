import 'dart:async';

import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:async_redux/async_redux.dart';
import 'package:flutter_graphql_client/graph_client.dart';
import 'package:healthcloud/application/core/graphql/queries.dart';
import 'package:healthcloud/application/redux/actions/core/batch_update_misc_state_action.dart';
import 'package:healthcloud/application/redux/actions/flags/app_flags.dart';
import 'package:healthcloud/application/redux/states/app_state.dart';
import 'package:healthcloud/domain/core/entities/community_members/list_members_response.dart';
import 'package:http/http.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

class FetchMembersAction extends ReduxAction<AppState> {
  final IGraphQlClient client;
  final void Function(String message)? onFailure;
  bool isSearching;
  String memberSearchName;

  FetchMembersAction({
    required this.client,
    this.isSearching = false,
    this.memberSearchName = '',
    this.onFailure,
  });

  @override
  void before() {
    super.before();
    dispatch(WaitAction<AppState>.add(fetchMembersFlag));
  }

  @override
  void after() {
    dispatch(WaitAction<AppState>.remove(fetchMembersFlag));
    super.after();
  }

  @override
  Future<AppState?> reduce() async {
    final bool hasConnection = state.connectivityState?.isConnected ?? false;
    if (!hasConnection) {
      onFailure?.call('connection failure');
      return null;
    }
    Map<String, dynamic> variables = <String, dynamic>{
      'input': <String, dynamic>{
        'filter': <String, dynamic>{
          'role': 'user',
        },
        'limit': 20
      },
    };

    if (isSearching) {
      variables = <String, dynamic>{
        'input': <String, dynamic>{
          'filter': <String, dynamic>{
            'role': 'user',
            'name': memberSearchName,
          },
          'limit': 20
        },
      };
    }

    final Response response = await client.query(listMembersQuery, variables);

    final ProcessedResponse processedResponse = processHttpResponse(response);

    if (processedResponse.ok) {
      final Map<String, dynamic> body = client.toMap(response);
      client.close();

      final String? errors = client.parseError(body);

      if (errors != null) {
        Sentry.captureException(
          UserException(errors),
        );

        throw UserException(getErrorMessage('fetching members'));
      }

      final ListMembersResponse membersData = ListMembersResponse.fromJson(
        body['data'] as Map<String, dynamic>,
      );

      dispatch(
        BatchUpdateMiscStateAction(communityMembers: membersData.members),
      );
    } else {
      throw UserException(processedResponse.message);
    }

    return null;
  }
}
