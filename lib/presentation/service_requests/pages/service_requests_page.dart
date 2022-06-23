import 'package:app_wrapper/app_wrapper.dart';
import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:prohealth360_daktari/application/redux/actions/flags/app_flags.dart';
import 'package:prohealth360_daktari/application/redux/actions/service_requests/fetch_service_request_count_action.dart';
import 'package:prohealth360_daktari/application/redux/states/app_state.dart';
import 'package:prohealth360_daktari/application/redux/view_models/service_requests/service_requests_view_model.dart';
import 'package:prohealth360_daktari/domain/core/value_objects/app_strings.dart';
import 'package:prohealth360_daktari/presentation/core/app_bar/custom_app_bar.dart';
import 'package:prohealth360_daktari/presentation/service_requests/widgets/service_requests_widget.dart';

class ServiceRequestsPage extends StatelessWidget {
  const ServiceRequestsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const CustomAppBar(
        title: serviceRequestString,
        showNotificationIcon: true,
      ),
      body: StoreConnector<AppState, ServiceRequestsViewModel>(
        onInit: (Store<AppState> store) {
          StoreProvider.dispatch<AppState>(
            context,
            FetchServiceRequestsCountAction(
              client: AppWrapperBase.of(context)!.graphQLClient,
            ),
          );
        },
        converter: (Store<AppState> store) =>
            ServiceRequestsViewModel.fromStore(store),
        builder: (BuildContext context, ServiceRequestsViewModel vm) {
          return ServiceRequestsWidget(
            isLoading: vm.wait.isWaitingFor(fetchServiceRequestsCountFlag),
            errorFetchingServiceRequests: vm.errorFetchingServiceRequests,
            pendingServiceRequestCount: vm.pendingServiceRequestCount,
          );
        },
      ),
    );
  }
}
