import 'package:app_wrapper/app_wrapper.dart';
import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:healthcloud/application/redux/actions/service_requests/fetch_service_request_count_action.dart';
import 'package:healthcloud/application/redux/states/app_state.dart';
import 'package:healthcloud/application/redux/view_models/service_requests/service_requests_view_model.dart';
import 'package:healthcloud/domain/core/entities/service_requests/pending_service_requests.dart';
import 'package:healthcloud/domain/core/value_objects/app_asset_strings.dart';
import 'package:healthcloud/domain/core/value_objects/app_strings.dart';
import 'package:healthcloud/presentation/engagement/home/widgets/action_card.dart';
import 'package:healthcloud/presentation/router/routes.dart';

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
      final String facilityID =
          StoreProvider.state<AppState>(context)?.staffState?.defaultFacility ??
              '';
      StoreProvider.dispatch<AppState>(
        context,
        FetchServiceRequestsCountAction(
          client: AppWrapperBase.of(context)!.graphQLClient,
          variables: <String, dynamic>{
            'facilityID': facilityID,
          },
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
          counter: count.toString(),
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
