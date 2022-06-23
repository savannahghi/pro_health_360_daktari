import 'dart:async';

import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_graphql_client/graph_client.dart';
import 'package:http/http.dart';
import 'package:prohealth360_daktari/application/redux/actions/flags/app_flags.dart';
import 'package:prohealth360_daktari/application/redux/actions/search_users/update_search_user_response_state_action.dart';
import 'package:prohealth360_daktari/application/redux/states/app_state.dart';
import 'package:prohealth360_daktari/domain/core/entities/search_user/search_user_response.dart';
import 'package:prohealth360_daktari/domain/core/value_objects/app_strings.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

class ReactivateClientAction extends ReduxAction<AppState> {
  ReactivateClientAction({
    required this.client,
    required this.searchUserResponse,
    required this.optInEndpoint,
    this.onError,
    this.onSuccess,
  });

  final IGraphQlClient client;
  final VoidCallback? onError;
  final VoidCallback? onSuccess;
  final SearchUserResponse searchUserResponse;
  final String optInEndpoint;

  @override
  void after() {
    dispatch(WaitAction<AppState>.remove(reactivateClientFlag));
    super.after();
  }

  @override
  void before() {
    super.before();
    dispatch(WaitAction<AppState>.add(reactivateClientFlag));
  }

  @override
  Future<AppState?> reduce() async {
    final Map<String, dynamic> variables = <String, dynamic>{
      'phoneNumber': searchUserResponse.user?.primaryContact?.value ?? '',
      'flavour': Flavour.consumer.name,
    };
    final Response response = await client.callRESTAPI(
      endpoint: optInEndpoint,
      method: httpPOST,
      variables: variables,
    );
    client.close();
    final Map<String, dynamic> payLoad = client.toMap(response);
    final ProcessedResponse processedResponse = processHttpResponse(response);
    if (processedResponse.ok) {
      final bool? status = payLoad['status'] as bool?;
      if (status ?? false) {
        dispatch(
          UpdateSearchUserResponseStateAction(
            selectedSearchUserResponse: searchUserResponse.copyWith(
              isActive: status,
            ),
          ),
        );
        onSuccess?.call();

        return state;
      }
    }

    final String? error = parseError(payLoad);
    onError?.call();
    Sentry.captureException(
      error ?? 'Reactivating client failed',
      hint: 'PIN service request failed',
    );

    return null;
  }
}
