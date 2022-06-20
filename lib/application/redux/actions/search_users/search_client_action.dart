import 'dart:async';

import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:async_redux/async_redux.dart';
import 'package:flutter_graphql_client/graph_client.dart';
import 'package:http/http.dart';
import 'package:mycarehubpro/application/core/graphql/queries.dart';
import 'package:mycarehubpro/application/redux/actions/flags/app_flags.dart';
import 'package:mycarehubpro/application/redux/actions/search_users/update_search_user_response_state_action.dart';
import 'package:mycarehubpro/application/redux/states/app_state.dart';
import 'package:mycarehubpro/domain/core/entities/search_user/search_user_response.dart';
import 'package:mycarehubpro/domain/core/entities/search_user/searched_clients.dart';
import 'package:mycarehubpro/domain/core/value_objects/app_strings.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

class SearchClientAction extends ReduxAction<AppState> {
  SearchClientAction({required this.client, required this.searchParameter});

  final IGraphQlClient client;
  String searchParameter;

  @override
  void after() {
    dispatch(WaitAction<AppState>.remove(searchClientFlag));
    super.after();
  }

  @override
  void before() {
    super.before();
    dispatch(
      UpdateSearchUserResponseStateAction(
        searchUserResponses: <SearchUserResponse>[],
        errorSearchingUser: false,
        noUserFound: false,
        timeoutSearchingUser: false,
      ),
    );
    dispatch(WaitAction<AppState>.add(searchClientFlag));
  }

  @override
  Future<AppState?> reduce() async {
    final Map<String, dynamic> variables = <String, dynamic>{
      'searchParameter': searchParameter,
    };

    final Response response = await client.query(searchClientQuery, variables);

    final ProcessedResponse processedResponse = processHttpResponse(response);

    if (processedResponse.ok) {
      final Map<String, dynamic> body = client.toMap(response);
      client.close();

      final String? errors = client.parseError(body);

      if (errors != null) {
        Sentry.captureException(UserException(errors));

        throw UserException(getErrorMessage('fetching clients'));
      }

      final SearchedClients clientResponse =
          SearchedClients.fromJson(body['data'] as Map<String, dynamic>);

      if (clientResponse.clients == null) {
        dispatch(UpdateSearchUserResponseStateAction(noUserFound: true));
        return null;
      }

      dispatch(
        UpdateSearchUserResponseStateAction(
          searchUserResponses: clientResponse.clients ?? <SearchUserResponse>[],
        ),
      );
    } else {
      Sentry.captureException(
        somethingWentWrongText,
        hint: <String, dynamic>{
          'query': searchClientQuery,
          'variables': variables,
          'response': response
        },
      );
      throw UserException(processedResponse.message);
    }

    return null;
  }

  @override
  Object? wrapError(dynamic error) {
    if (error.runtimeType == UserException) {
      return error;
    }

    Sentry.captureException(error);
    return UserException(getErrorMessage());
  }
}
