import 'package:async_redux/async_redux.dart';
import 'package:mycarehubpro/application/redux/states/app_state.dart';
import 'package:mycarehubpro/domain/core/entities/service_requests/pending_service_request_count.dart';
import 'package:mycarehubpro/domain/core/entities/service_requests/service_request.dart';

class ServiceRequestsViewModel extends Vm {
  final Wait wait;
  final List<ServiceRequest>? clientServiceRequests;

  final List<ServiceRequest>? staffServiceRequests;

  final PendingServiceRequestCount? pendingServiceRequestCount;

  final bool? errorFetchingServiceRequests;
  ServiceRequestsViewModel({
    required this.wait,
    this.clientServiceRequests,
    this.staffServiceRequests,
    this.pendingServiceRequestCount,
    this.errorFetchingServiceRequests,
  }) : super(
          equals: <Object?>[
            wait,
            clientServiceRequests,
            staffServiceRequests,
            pendingServiceRequestCount,
            errorFetchingServiceRequests,
          ],
        );

  factory ServiceRequestsViewModel.fromStore(Store<AppState> store) {
    return ServiceRequestsViewModel(
      wait: store.state.wait!,
      clientServiceRequests:
          store.state.serviceRequestState?.clientServiceRequests,
      pendingServiceRequestCount:
          store.state.serviceRequestState?.pendingServiceRequestsCount,
      errorFetchingServiceRequests:
          store.state.serviceRequestState?.errorFetchingPendingServiceRequests,
    );
  }
}
