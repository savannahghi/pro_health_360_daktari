import 'dart:async';

import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:async_redux/async_redux.dart';
import 'package:flutter_graphql_client/graph_client.dart';
import 'package:http/http.dart';
import 'package:prohealth360_daktari/application/core/graphql/mutations.dart';
import 'package:prohealth360_daktari/application/redux/states/app_state.dart';
import 'package:prohealth360_daktari/domain/core/value_objects/app_strings.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

class AcceptCommunitiesInviteAction extends ReduxAction<AppState> {
  final String communityID;
  final IGraphQlClient client;
  final void Function()? onFailure;
  final void Function()? onSuccess;

  AcceptCommunitiesInviteAction({
    required this.communityID,
    required this.client,
    this.onFailure,
    this.onSuccess,
  });
  @override
  Future<AppState?> reduce() async {
    final String memberId = state.staffState!.id!;
    final Map<String, dynamic> variables = <String, dynamic>{
      'memberID': memberId,
      'communityID': communityID,
    };

    /// fetch the data from the api
    final Response response = await client.query(
      acceptInvitationMutation,
      variables,
    );

    final Map<String, dynamic> responseMap = client.toMap(response);
    final String? errors = parseError(responseMap);

    if (errors != null) {
      Sentry.captureException(UserException(errors));

      onFailure?.call();

      throw const UserException(somethingWentWrongText);
    }

    final Map<String, dynamic>? data =
        responseMap['data'] as Map<String, dynamic>?;

    if ((data?['acceptInvitation'] ?? false) == true) {
      onSuccess?.call();
    } else {
      onFailure?.call();
      throw const UserException(genericErrorOccurred);
    }

    return null;
  }
}
