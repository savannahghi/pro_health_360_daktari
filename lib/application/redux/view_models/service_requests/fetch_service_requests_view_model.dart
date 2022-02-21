import 'package:async_redux/async_redux.dart';
import 'package:healthcloud/application/redux/states/app_state.dart';
import 'package:healthcloud/domain/core/entities/service_requests/service_request_content.dart';

class ListServiceRequestsViewModel extends Vm {
  final Wait wait;
  final List<ServiceRequestContent?>? serviceRequests;
  final bool? errorFetchingServiceRequests;

  ListServiceRequestsViewModel({
    required this.wait,
    this.serviceRequests,
    this.errorFetchingServiceRequests,
  }) : super(
          equals: <Object?>[
            wait,
            serviceRequests,
            errorFetchingServiceRequests,
          ],
        );

  factory ListServiceRequestsViewModel.fromStore(Store<AppState> store) {
    return ListServiceRequestsViewModel(
      wait: store.state.wait!,
      serviceRequests: store.state.serviceRequestState?.serviceRequestContent,
      errorFetchingServiceRequests:
          store.state.serviceRequestState?.errorFetchingServiceRequests,
    );
  }
}
