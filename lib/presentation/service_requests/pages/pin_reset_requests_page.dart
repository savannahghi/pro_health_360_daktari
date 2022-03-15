import 'dart:ui';

import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:app_wrapper/app_wrapper.dart';
import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mycarehubpro/application/redux/actions/flags/app_flags.dart';
import 'package:mycarehubpro/application/redux/actions/service_requests/fetch_service_requests_action.dart';
import 'package:mycarehubpro/application/redux/states/app_state.dart';
import 'package:mycarehubpro/application/redux/view_models/service_requests/service_requests_view_model.dart';
import 'package:mycarehubpro/domain/core/entities/service_requests/service_request_content.dart';
import 'package:mycarehubpro/domain/core/value_objects/app_asset_strings.dart';
import 'package:mycarehubpro/domain/core/value_objects/app_enums.dart';
import 'package:mycarehubpro/domain/core/value_objects/app_strings.dart';
import 'package:mycarehubpro/presentation/core/app_bar/custom_app_bar.dart';
import 'package:mycarehubpro/presentation/service_requests/widgets/pin_reset_request_widget.dart';

class PinResetRequestsPage extends StatefulWidget {
  const PinResetRequestsPage({Key? key}) : super(key: key);

  @override
  State<PinResetRequestsPage> createState() => _PinResetRequestsPageState();
}

class _PinResetRequestsPageState extends State<PinResetRequestsPage> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    StoreProvider.dispatch(
      context,
      FetchServiceRequestsAction(
        client: AppWrapperBase.of(context)!.graphQLClient,
        serviceRequestStatus: RequestStatus.PENDING,
        serviceRequestType: ServiceRequestType.PIN_RESET,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: pinResetRequestsTitle),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: StoreConnector<AppState, ServiceRequestsViewModel>(
            converter: (Store<AppState> store) {
              return ServiceRequestsViewModel.fromStore(store);
            },
            builder: (BuildContext context, ServiceRequestsViewModel vm) {
              if (vm.wait.isWaitingFor(fetchServiceRequestFlag)) {
                return const PlatformLoader();
              }

              final List<Widget> requestWidgetList = <Widget>[];
              final List<ServiceRequestContent?>? serviceRequests =
                  vm.serviceRequests;

              if (vm.serviceRequests != null &&
                  vm.serviceRequests!.isNotEmpty) {
                for (int i = 0; i < serviceRequests!.length; i++) {
                  final ServiceRequestContent? request = serviceRequests[i];
                  if (request?.serviceRequestType ==
                      ServiceRequestType.PIN_RESET) {
                    final String name = request?.clientName ?? UNKNOWN;
                    final String phoneNumber =
                        request?.clientPhoneNumber ?? UNKNOWN;

                    requestWidgetList.add(
                      PinResetRequestWidget(
                        acceptKey: ValueKey<String>('accept_key_$i'),
                        rejectKey: ValueKey<String>('reject_key_$i'),
                        phoneNumber: phoneNumber,
                        name: name,
                      ),
                    );

                    if (i != serviceRequests.length - 1) {
                      requestWidgetList.add(const SizedBox(height: 20));
                    }
                  }
                }
              }

              return SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    Center(child: SvgPicture.asset(pinResetImageSvgPath)),
                    const SizedBox(height: 20),
                    const Text(
                      pinResetRequestsLeading,
                      style: TextStyle(color: Color(0xFF7A7B8E)),
                    ),
                    const SizedBox(height: 20),
                    ...requestWidgetList,
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
