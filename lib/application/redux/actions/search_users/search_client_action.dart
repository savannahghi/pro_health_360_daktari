import 'dart:async';

import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:async_redux/async_redux.dart';
import 'package:flutter_graphql_client/graph_client.dart';
import 'package:http/http.dart';
import 'package:mycarehubpro/application/core/graphql/queries.dart';
import 'package:mycarehubpro/application/redux/actions/flags/app_flags.dart';
import 'package:mycarehubpro/application/redux/states/app_state.dart';
import 'package:mycarehubpro/domain/core/entities/search_user/search_user_response.dart';
import 'package:mycarehubpro/domain/core/entities/search_user/searched_clients.dart';
import 'package:mycarehubpro/domain/core/value_objects/app_strings.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

class SearchClientAction extends ReduxAction<AppState> {
  final IGraphQlClient client;
  final void Function(String message)? onFailure;
  final void Function(List<SearchUserResponse> clientResponse)? onSuccess;
  final void Function()? clientNotFound;
  String cccNumber;

  SearchClientAction({
    required this.client,
    required this.cccNumber,
    this.onSuccess,
    this.onFailure,
    this.clientNotFound,
  });

  @override
  void before() {
    super.before();
    dispatch(WaitAction<AppState>.add(searchClientFlag));
  }

  @override
  void after() {
    dispatch(WaitAction<AppState>.remove(searchClientFlag));
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
      'CCCNumber': cccNumber,
    };

    final Response response = await client.query(searchClientQuery, variables);

    final ProcessedResponse processedResponse = processHttpResponse(response);

    if (processedResponse.ok) {
      final Map<String, dynamic> body = client.toMap(response);
      client.close();

      final String? errors = client.parseError(body);

      if (errors != null) {
        Sentry.captureException(
          UserException(errors),
        );

        throw UserException(getErrorMessage('fetching clients'));
      }

      final SearchedClients clientResponse = SearchedClients.fromJson(
        body['data'] as Map<String, dynamic>,
      );

      if (clientResponse.clients == null) {
        clientNotFound?.call();
        return null;
      }

      onSuccess?.call(clientResponse.clients ?? <SearchUserResponse>[]);
    } else {
      throw UserException(processedResponse.message);
    }

    return null;
  }
}
