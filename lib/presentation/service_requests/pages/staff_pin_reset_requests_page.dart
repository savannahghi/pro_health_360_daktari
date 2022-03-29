import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:app_wrapper/app_wrapper.dart';
import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mycarehubpro/application/core/theme/app_themes.dart';
import 'package:mycarehubpro/application/redux/actions/flags/app_flags.dart';
import 'package:mycarehubpro/application/redux/actions/service_requests/fetch_service_requests_action.dart';
import 'package:mycarehubpro/application/redux/states/app_state.dart';
import 'package:mycarehubpro/application/redux/view_models/service_requests/service_requests_view_model.dart';
import 'package:mycarehubpro/domain/core/entities/service_requests/service_request.dart';
import 'package:mycarehubpro/domain/core/value_objects/app_asset_strings.dart';
import 'package:mycarehubpro/domain/core/value_objects/app_enums.dart';
import 'package:mycarehubpro/domain/core/value_objects/app_strings.dart';
import 'package:mycarehubpro/presentation/core/app_bar/custom_app_bar.dart';
import 'package:mycarehubpro/presentation/service_requests/widgets/staff_pin_reset_request_widget.dart';

class StaffPinResetRequestsPage extends StatefulWidget {
  const StaffPinResetRequestsPage({Key? key}) : super(key: key);

  @override
  State<StaffPinResetRequestsPage> createState() =>
      _StaffPinResetRequestsPageState();
}

class _StaffPinResetRequestsPageState extends State<StaffPinResetRequestsPage> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    StoreProvider.dispatch(
      context,
      FetchServiceRequestsAction(
        client: AppWrapperBase.of(context)!.graphQLClient,
        serviceRequestStatus: RequestStatus.PENDING,
        serviceRequestType: ServiceRequestType.STAFF_PIN_RESET,
        flavour: Flavour.pro,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: staffPinResetRequestsTitle),
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
              final List<ServiceRequest>? serviceRequests =
                  vm.staffServiceRequests;

              if (
                  vm.staffServiceRequests?.isNotEmpty ?? false) {

                serviceRequests
                    ?.where(
                      (ServiceRequest request) =>
                          request.serviceRequestType ==
                          ServiceRequestType.STAFF_PIN_RESET,
                    )
                    .toList()
                    .map(
                  (ServiceRequest request) {
                    final String name = request.staffName ?? UNKNOWN;
                    final String phoneNumber =
                        request.staffPhoneNumber ?? UNKNOWN;
                    final String staffId = request.staffId ?? '';
                    final String serviceRequestId = request.id ?? '';

                    requestWidgetList.add(
                      Padding(
                        padding: const EdgeInsets.only(bottom: 10.0),
                        child: StaffPinResetRequestWidget(
                          serviceRequestId: serviceRequestId,
                          acceptKey: ValueKey<String>('accept_key_$serviceRequestId'),
                          phoneNumber: phoneNumber,
                          name: name,
                          staffId: staffId,
                        ),
                      ),
                    );
  },
                ).toList();
              } else {
                return GenericErrorWidget(
                  headerIconSvgUrl: noDataImageSvgPath,
                  actionText: actionTextGenericNoData,
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
                      staffPinResetRequestsMessage,
                      style: TextStyle(color: AppColors.grey50),
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
