import 'dart:async';

import 'package:async_redux/async_redux.dart';
import 'package:flutter_graphql_client/graph_client.dart';
import 'package:healthcloud/application/core/graphql/queries.dart';
import 'package:healthcloud/application/redux/actions/flags/app_flags.dart';
import 'package:healthcloud/application/redux/actions/service_requests/update_service_requests_state_action.dart';
import 'package:healthcloud/application/redux/states/app_state.dart';
import 'package:healthcloud/application/redux/states/service_requests_state.dart';
import 'package:healthcloud/domain/core/entities/service_requests/pending_service_requests.dart';
import 'package:http/http.dart';
import 'package:misc_utilities/misc.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

class FetchServiceRequestsCountAction extends ReduxAction<AppState> {
  final IGraphQlClient client;
  final Map<String, dynamic> variables;

  FetchServiceRequestsCountAction(
      {required this.client, required this.variables,});

  @override
  void before() {
    super.before();
    dispatch(
      UpdateServiceRequestsStateAction(errorFetchingServiceRequests: false),
    );
    dispatch(WaitAction<AppState>.add(fetchServiceRequestsCountFlag));
  }

  @override
  void after() {
    dispatch(WaitAction<AppState>.remove(fetchServiceRequestsCountFlag));
    super.after();
  }

  @override
  Future<AppState?> reduce() async {
    final Response response = await client.query(
      getPendingServiceRequestsCountQuery,
      variables,
    );
    client.close();

    final Map<String, dynamic> payLoad = client.toMap(response);

    final String? error = parseError(payLoad);

    if (error != null) {
      Sentry.captureException(
        UserException(error),
      );

      dispatch(
        UpdateServiceRequestsStateAction(errorFetchingServiceRequests: true),
      );

      return null;
    }

    final ServiceRequestState serviceRequests = ServiceRequestState.fromJson(
      payLoad['data'] as Map<String, dynamic>,
    );

    if (serviceRequests.pendingServiceRequests != null) {
      final PendingServiceRequest? pendingServiceRequests =
          serviceRequests.pendingServiceRequests;
      dispatch(
        UpdateServiceRequestsStateAction(
          pendingServiceRequests: pendingServiceRequests,
        ),
      );
    } else {
      dispatch(
        UpdateServiceRequestsStateAction(
          pendingServiceRequests: PendingServiceRequest.initial(),
        ),
      );
    }

    return state;
  }
}
