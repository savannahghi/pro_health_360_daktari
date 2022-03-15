import 'package:app_wrapper/app_wrapper.dart';
import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:mycarehubpro/application/redux/actions/service_requests/fetch_service_request_count_action.dart';
import 'package:mycarehubpro/application/redux/states/app_state.dart';
import 'package:mycarehubpro/application/redux/view_models/service_requests/service_requests_view_model.dart';
import 'package:mycarehubpro/domain/core/entities/service_requests/pending_service_requests.dart';
import 'package:mycarehubpro/domain/core/value_objects/app_asset_strings.dart';
import 'package:mycarehubpro/domain/core/value_objects/app_strings.dart';
import 'package:mycarehubpro/presentation/engagement/home/widgets/action_card.dart';
import 'package:mycarehubpro/presentation/router/routes.dart';

class ServiceRequestActionCard extends StatefulWidget {
  const ServiceRequestActionCard({Key? key}) : super(key: key);

  @override
  State<ServiceRequestActionCard> createState() =>
      _ServiceRequestActionCardState();
}

class _ServiceRequestActionCardState extends State<ServiceRequestActionCard> {
  ///
  /// [ServiceRequestActionCardState] provides a clickable card to perform the action displayed.

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance?.addPostFrameCallback((Duration timeStamp) async {
      StoreProvider.dispatch<AppState>(
        context,
        FetchServiceRequestsCountAction(
          client: AppWrapperBase.of(context)!.graphQLClient,
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, ServiceRequestsViewModel>(
      converter: (Store<AppState> store) =>
          ServiceRequestsViewModel.fromStore(store),
      builder: (BuildContext context, ServiceRequestsViewModel vm) {
        final int count = vm.pendingServiceRequests?.total ?? 0;
        return ActionCard(
          count: count,
          iconUrl: serviceRequestsIconSvg,
          title: serviceRequestsText,
          onTap: () => Navigator.of(context).pushNamed(
            AppRoutes.serviceRequestsPage,
            arguments: PendingServiceRequest.initial(),
          ),
        );
      },
    );
  }
}
