import 'package:async_redux/async_redux.dart';
import 'package:healthcloud/application/redux/states/app_state.dart';
import 'package:healthcloud/application/redux/states/service_requests_state.dart';
import 'package:healthcloud/domain/core/entities/service_requests/service_request_content.dart';

class UpdateServiceRequestsStateAction extends ReduxAction<AppState> {
  final List<ServiceRequestContent?>? serviceRequestContent;
  final bool? errorFetchingServiceRequests;

  UpdateServiceRequestsStateAction({
    this.serviceRequestContent,
    this.errorFetchingServiceRequests,
  });

  @override
  Future<AppState> reduce() async {
    final ServiceRequestState? serviceRequestsState =
        state.serviceRequestState?.copyWith(
      serviceRequestContent: serviceRequestContent ??
          state.serviceRequestState?.serviceRequestContent,
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
