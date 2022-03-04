import 'package:async_redux/async_redux.dart';
import 'package:myharehubpro/application/redux/states/app_state.dart';
import 'package:myharehubpro/application/redux/states/service_requests_state.dart';
import 'package:myharehubpro/domain/core/entities/service_requests/pending_service_requests.dart';
import 'package:myharehubpro/domain/core/entities/service_requests/service_request_content.dart';

class UpdateServiceRequestsStateAction extends ReduxAction<AppState> {
  final List<ServiceRequestContent?>? serviceRequestContent;
  final bool? errorFetchingServiceRequests;
  final PendingServiceRequest? pendingServiceRequests;

  UpdateServiceRequestsStateAction({
    this.serviceRequestContent,
    this.errorFetchingServiceRequests,
    this.pendingServiceRequests,
  });

  @override
  Future<AppState> reduce() async {
    final ServiceRequestState? serviceRequestsState =
        state.serviceRequestState?.copyWith(
      serviceRequestContent: serviceRequestContent ??
          state.serviceRequestState?.serviceRequestContent,
      pendingServiceRequests: pendingServiceRequests ??
          state.serviceRequestState?.pendingServiceRequests,
      errorFetchingServiceRequests: errorFetchingServiceRequests ??
          state.serviceRequestState?.errorFetchingServiceRequests ??
          false,
    );

    final AppState newState = state.copyWith(
      serviceRequestState: serviceRequestsState,
    );

    return newState;
  }
}
