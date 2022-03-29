import 'package:async_redux/async_redux.dart';
import 'package:mycarehubpro/application/redux/states/app_state.dart';
import 'package:mycarehubpro/application/redux/states/service_requests_state.dart';
import 'package:mycarehubpro/domain/core/entities/service_requests/pending_service_requests.dart';
import 'package:mycarehubpro/domain/core/entities/service_requests/service_request.dart';

class UpdateServiceRequestsStateAction extends ReduxAction<AppState> {
  UpdateServiceRequestsStateAction({
    this.clientServiceRequests,
    this.errorFetchingPendingServiceRequests,
    this.pendingServiceRequests,
    this.staffServiceRequests,
  });

  final List<ServiceRequest>? clientServiceRequests;
  final bool? errorFetchingPendingServiceRequests;
  final PendingServiceRequest? pendingServiceRequests;
  final List<ServiceRequest>? staffServiceRequests;

  @override
  Future<AppState> reduce() async {
    final ServiceRequestState? serviceRequestsState =
        state.serviceRequestState?.copyWith(
      clientServiceRequests: clientServiceRequests ??
          state.serviceRequestState?.clientServiceRequests,
      staffServiceRequests: staffServiceRequests ??
          state.serviceRequestState?.staffServiceRequests,
      errorFetchingPendingServiceRequests:
          errorFetchingPendingServiceRequests ??
              state.serviceRequestState?.errorFetchingPendingServiceRequests,
    );

    final AppState newState = state.copyWith(
      serviceRequestState: serviceRequestsState,
    );

    return newState;
  }
}
