import 'dart:async';

import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:async_redux/async_redux.dart';
import 'package:flutter_graphql_client/graph_client.dart';
import 'package:mycarehubpro/application/core/graphql/queries.dart';
import 'package:mycarehubpro/application/redux/actions/flags/app_flags.dart';
import 'package:mycarehubpro/application/redux/actions/service_requests/update_service_requests_state_action.dart';
import 'package:mycarehubpro/application/redux/states/app_state.dart';
import 'package:http/http.dart';
import 'package:mycarehubpro/domain/core/entities/service_requests/service_request_response.dart';
import 'package:mycarehubpro/domain/core/value_objects/app_enums.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

class FetchServiceRequestsAction extends ReduxAction<AppState> {
  final IGraphQlClient client;
  final RequestStatus serviceRequestStatus;
  final ServiceRequestType? serviceRequestType;

  FetchServiceRequestsAction({
    required this.client,
    required this.serviceRequestStatus,
    this.serviceRequestType,
  });

  @override
  void before() {
    super.before();
    dispatch(
      UpdateServiceRequestsStateAction(errorFetchingServiceRequests: false),
    );
    dispatch(WaitAction<AppState>.add(fetchServiceRequestFlag));
  }

  @override
  void after() {
    dispatch(WaitAction<AppState>.remove(fetchServiceRequestFlag));
    super.after();
  }

  @override
  Future<AppState?> reduce() async {
    final String facilityID = state.staffState?.defaultFacility ?? '';

    final Map<String, dynamic> variables = <String, dynamic>{
      'status': serviceRequestStatus.name,
      'facilityID': facilityID,
      'type': serviceRequestType?.name
    };

    final Response response = await client.query(
      getServiceRequestsQuery,
      variables,
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

    final ServiceRequestResponse serviceRequests =
        ServiceRequestResponse.fromJson(
      payLoad['data'] as Map<String, dynamic>,
    );

    dispatch(
      UpdateServiceRequestsStateAction(
        serviceRequestContent: serviceRequests.serviceRequestContent,
      ),
    );

    return state;
  }
}
