import 'dart:async';

import 'package:async_redux/async_redux.dart';
import 'package:flutter_graphql_client/graph_client.dart';
import 'package:healthcloud/application/redux/states/app_state.dart';
import 'package:healthcloud/domain/core/entities/register_client/register_client_payload.dart';

class RegisterClientAction extends ReduxAction<AppState> {
  final RegisterClientPayload registerClientPayload;
  final IGraphQlClient client;

  RegisterClientAction({
    required this.registerClientPayload,
    required this.client,
  });

  @override
  Future<AppState?> reduce() async {
    // TODO: Implement action
    return null;
  }
}
