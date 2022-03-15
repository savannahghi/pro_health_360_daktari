import 'dart:async';

import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:async_redux/async_redux.dart';
import 'package:flutter_graphql_client/graph_client.dart';
import 'package:mycarehubpro/application/core/graphql/queries.dart';
import 'package:mycarehubpro/application/redux/actions/flags/app_flags.dart';
import 'package:mycarehubpro/application/redux/actions/service_requests/update_service_requests_state_action.dart';
import 'package:mycarehubpro/application/redux/states/app_state.dart';
import 'package:mycarehubpro/application/redux/states/service_requests_state.dart';
import 'package:http/http.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

class FetchServiceRequestsCountAction extends ReduxAction<AppState> {
  final IGraphQlClient client;

  FetchServiceRequestsCountAction({required this.client});

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
    final String facilityID = state.staffState?.defaultFacility ?? '';

    final Response response = await client.query(
      getPendingServiceRequestsCountQuery,
      <String, dynamic>{'facilityID': facilityID},
    );
    client.close();

    final Map<String, dynamic> payLoad = client.toMap(response);

    final String? error = parseError(payLoad);

    if (error != null) {
      Sentry.captureException(UserException(error));

      dispatch(
        UpdateServiceRequestsStateAction(errorFetchingServiceRequests: true),
      );

      return null;
    }

    final ServiceRequestState serviceRequests = ServiceRequestState.fromJson(
      payLoad['data'] as Map<String, dynamic>,
    );

    dispatch(
      UpdateServiceRequestsStateAction(
        pendingServiceRequests: serviceRequests.pendingServiceRequests,
      ),
    );

    return state;
  }
}
