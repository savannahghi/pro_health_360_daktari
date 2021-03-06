import 'dart:async';

import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:app_wrapper/app_wrapper.dart';
import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_graphql_client/graph_client.dart';
import 'package:http/http.dart';
import 'package:prohealth360_daktari/application/core/graphql/queries.dart';
import 'package:prohealth360_daktari/application/redux/actions/communities/update_communities_state_action.dart';
import 'package:prohealth360_daktari/application/redux/actions/flags/app_flags.dart';
import 'package:prohealth360_daktari/application/redux/states/app_state.dart';
import 'package:prohealth360_daktari/domain/core/entities/community_members/community.dart';
import 'package:prohealth360_daktari/domain/core/entities/pending_invites_state.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

class FetchInvitedCommunitiesAction extends ReduxAction<AppState> {
  final BuildContext context;

  FetchInvitedCommunitiesAction({required this.context});

  @override
  void after() {
    dispatch(WaitAction<AppState>.remove(fetchInvitedCommunitiesFlag));
    super.after();
  }

  @override
  void before() {
    dispatch(WaitAction<AppState>.add(fetchInvitedCommunitiesFlag));
    super.before();
  }

  @override
  Future<AppState?> reduce() async {
    final String memberId = state.staffState!.id!;
    final Map<String, dynamic> variables = <String, dynamic>{
      'memberID': memberId,
      'input': <String, dynamic>{'limit': 20},
    };

    final IGraphQlClient _client = AppWrapperBase.of(context)!.graphQLClient;

    /// fetch the data from the api
    final Response response = await _client.query(
      listUserInvitedCommunitiesQuery,
      variables,
    );

    final Map<String, dynamic> responseMap = _client.toMap(response);
    final String? errors = parseError(responseMap);

    if (errors != null) {
      Sentry.captureException(UserException(errors));

      String? somethingWentWrongText;
      throw MyAfyaException(
        cause: fetchInvitedCommunitiesFlag,
        message: somethingWentWrongText,
      );
    }

    final Map<String, dynamic>? data =
        responseMap['data'] as Map<String, dynamic>?;

    if (data?['listPendingInvites'] != null) {
      if (data?['listPendingInvites'] is List &&
          (data?['listPendingInvites'] as List<dynamic>).isNotEmpty) {
        final PendingInvitesState communitiesMap = PendingInvitesState.fromJson(
          responseMap['data'] as Map<String, dynamic>,
        );

        dispatch(
          UpdateCommunitiesStateAction(
            communitiesList: communitiesMap.communitiesList ?? <Community>[],
          ),
        );
      } else {
        dispatch(
          UpdateCommunitiesStateAction(communitiesList: <Community>[]),
        );
      }
    } else {
      dispatch(
        UpdateCommunitiesStateAction(communitiesList: <Community>[]),
      );
    }

    return null;
  }
}
