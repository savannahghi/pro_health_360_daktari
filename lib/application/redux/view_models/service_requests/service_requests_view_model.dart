import 'package:async_redux/async_redux.dart';
import 'package:myharehubpro/application/redux/states/app_state.dart';
import 'package:myharehubpro/domain/core/entities/service_requests/pending_service_requests.dart';
import 'package:myharehubpro/domain/core/entities/service_requests/service_request_content.dart';

class ServiceRequestsViewModel extends Vm {
  final Wait wait;
  final List<ServiceRequestContent?>? serviceRequests;
  final PendingServiceRequest? pendingServiceRequests;
  final bool? errorFetchingServiceRequests;

  ServiceRequestsViewModel({
    required this.wait,
    this.serviceRequests,
    this.pendingServiceRequests,
    this.errorFetchingServiceRequests,
  }) : super(
          equals: <Object?>[
            wait,
            serviceRequests,
            pendingServiceRequests,
            errorFetchingServiceRequests,
          ],
        );

  factory ServiceRequestsViewModel.fromStore(Store<AppState> store) {
    return ServiceRequestsViewModel(
      wait: store.state.wait!,
      serviceRequests: store.state.serviceRequestState?.serviceRequestContent,
      pendingServiceRequests:
          store.state.serviceRequestState?.pendingServiceRequests,
      errorFetchingServiceRequests:
          store.state.serviceRequestState?.errorFetchingServiceRequests,
    );
  }
}
