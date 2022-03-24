import 'dart:ui';

import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:app_wrapper/app_wrapper.dart';
import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mycarehubpro/application/core/services/helpers.dart';
import 'package:mycarehubpro/application/core/theme/app_themes.dart';
import 'package:mycarehubpro/application/redux/actions/flags/app_flags.dart';
import 'package:mycarehubpro/application/redux/actions/service_requests/resolve_pin_request_action.dart';
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
  const PinResetRequestsPage();

  @override
  State<PinResetRequestsPage> createState() => _PinResetRequestsPageState();
}

class _PinResetRequestsPageState extends State<PinResetRequestsPage> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // fetch staff PIN Reset Requests
    StoreProvider.dispatch(
      context,
      FetchServiceRequestsAction(
        client: AppWrapperBase.of(context)!.graphQLClient,
        serviceRequestStatus: RequestStatus.PENDING,
        serviceRequestType: ServiceRequestType.STAFF_PIN_RESET,
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
              final Map<String, ServiceRequestContent?>? serviceRequests =
                  vm.serviceRequests;

              if (vm.serviceRequests != null &&
                  vm.serviceRequests!.isNotEmpty) {
                final List<MapEntry<String, ServiceRequestContent?>> entries =
                    serviceRequests!.entries.toList();

                for (int i = 0; i < entries.length; i++) {
                  final ServiceRequestContent? request = entries[i].value;
                  if (request?.serviceRequestType ==
                      ServiceRequestType.CLIENT_PIN_RESET) {
                    final String name = request?.clientName ?? UNKNOWN;
                    final String phoneNumber =
                        request?.clientPhoneNumber ?? UNKNOWN;
                    final String clientId = request?.clientId ?? '';
                    final String serviceRequestId = request?.id ?? '';
                    final String cccNumber = request?.meta?.cccNumber ?? '';
                    final bool isCccNumberVerified =
                        request?.meta?.isCccNumberValid ?? false;

                    requestWidgetList.add(
                      PinResetRequestWidget(
                        clientId: clientId,
                        serviceRequestId: serviceRequestId,
                        cccNumber: cccNumber,
                        acceptKey: ValueKey<String>('accept_key_$i'),
                        rejectKey: ValueKey<String>('reject_key_$i'),
                        phoneNumber: phoneNumber,
                        name: name,
                        isCccNumberVerified: isCccNumberVerified,
                        isAccepting: vm.wait.isWaitingFor(
                          '${pinResetRequestFlag}_${serviceRequestId}_${PinResetState.APPROVED}',
                        ),
                        isRejecting: vm.wait.isWaitingFor(
                          '${pinResetRequestFlag}_${serviceRequestId}_${PinResetState.REJECTED}',
                        ),
                        onAccept: () {
                          _resolvePinRequest(
                            clientId: clientId,
                            serviceRequestId: serviceRequestId,
                            cccNumber: cccNumber,
                            phoneNumber: phoneNumber,
                            pinResetState: PinResetState.APPROVED,
                          );
                        },
                        onReject: () {
                          _resolvePinRequest(
                            clientId: clientId,
                            serviceRequestId: serviceRequestId,
                            cccNumber: cccNumber,
                            phoneNumber: phoneNumber,
                            pinResetState: PinResetState.REJECTED,
                          );
                        },
                      ),
                    );

                    if (i != serviceRequests.length - 1) {
                      requestWidgetList.add(const SizedBox(height: 20));
                    }
                  }
                }
              } else {
                return GenericErrorWidget(
                  headerIconSvgUrl: noDataImageSvgPath,
                  actionText: actionTextGenericNoData,
                  type: GenericNoDataTypes.noData,
                  recoverCallback: () => Navigator.of(context).pop(),
                  messageTitle: getNoDataTile('service requests'),
                  messageBody: <TextSpan>[
                    TextSpan(
                      text: serviceRequestsNoDataBodyString,
                      style: normalSize16Text(AppColors.greyTextColor),
                    ),
                  ],
                );
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

  void _resolvePinRequest({
    required String clientId,
    required String serviceRequestId,
    required String cccNumber,
    required String phoneNumber,
    required PinResetState pinResetState,
  }) {
    StoreProvider.dispatch(
      context,
      ResolvePinRequestAction(
        clientId: clientId,
        serviceRequestId: serviceRequestId,
        cccNumber: cccNumber,
        phoneNumber: phoneNumber,
        physicalIdentityVerified: true,
        pinResetState: pinResetState,
        httpClient: AppWrapperBase.of(context)!.graphQLClient,
        onPinVerified: () {
          showTextSnackbar(
            ScaffoldMessenger.of(context),
            content: pinResetState == PinResetState.APPROVED
                ? pinApprovedSuccessText
                : pinRejectedSuccessText,
          );
        },
      ),
    );
  }
}