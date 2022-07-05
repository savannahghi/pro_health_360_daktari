import 'package:async_redux/async_redux.dart';
import 'package:prohealth360_daktari/application/redux/states/app_state.dart';
import 'package:prohealth360_daktari/application/redux/states/service_requests/service_requests_state.dart';
import 'package:prohealth360_daktari/domain/core/entities/service_requests/pending_service_request_count.dart';
import 'package:prohealth360_daktari/domain/core/entities/service_requests/service_request.dart';

class UpdateServiceRequestsStateAction extends ReduxAction<AppState> {
  UpdateServiceRequestsStateAction({
    this.clientServiceRequests,
    this.errorFetchingPendingServiceRequests,
    this.staffServiceRequests,
    this.pendingServiceRequestsCount,
    this.resolvedServiceRequests,
  });

  final List<ServiceRequest>? clientServiceRequests;
  final bool? errorFetchingPendingServiceRequests;
  final List<ServiceRequest>? staffServiceRequests;
  final List<ServiceRequest>? resolvedServiceRequests;
  final PendingServiceRequestCount? pendingServiceRequestsCount;

  @override
  AppState reduce() {
    final ServiceRequestState? serviceRequestsState =
        state.serviceRequestState?.copyWith(
      clientServiceRequests: clientServiceRequests ??
          state.serviceRequestState?.clientServiceRequests,
      staffServiceRequests: staffServiceRequests ??
          state.serviceRequestState?.staffServiceRequests,
      resolvedServiceRequests: resolvedServiceRequests ??
          state.serviceRequestState?.resolvedServiceRequests,
      errorFetchingPendingServiceRequests:
          errorFetchingPendingServiceRequests ??
              state.serviceRequestState?.errorFetchingPendingServiceRequests,
      pendingServiceRequestsCount: pendingServiceRequestsCount ??
          state.serviceRequestState?.pendingServiceRequestsCount,
    );

    final AppState newState = state.copyWith(
      serviceRequestState: serviceRequestsState,
    );

    return newState;
  }
}
