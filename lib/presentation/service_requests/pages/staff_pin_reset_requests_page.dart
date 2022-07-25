import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:app_wrapper/app_wrapper.dart';
import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:prohealth360_daktari/application/core/services/helpers.dart';
import 'package:prohealth360_daktari/application/core/theme/app_themes.dart';
import 'package:prohealth360_daktari/application/redux/actions/flags/app_flags.dart';
import 'package:prohealth360_daktari/application/redux/actions/service_requests/fetch_service_requests_action.dart';
import 'package:prohealth360_daktari/application/redux/actions/service_requests/resolve_staff_pin_request_action.dart';
import 'package:prohealth360_daktari/application/redux/actions/service_requests/search_service_requests_action.dart';
import 'package:prohealth360_daktari/application/redux/states/app_state.dart';
import 'package:prohealth360_daktari/application/redux/view_models/service_requests/service_requests_view_model.dart';
import 'package:prohealth360_daktari/domain/core/entities/service_requests/service_request.dart';
import 'package:prohealth360_daktari/domain/core/value_objects/app_asset_strings.dart';
import 'package:prohealth360_daktari/domain/core/value_objects/app_enums.dart';
import 'package:prohealth360_daktari/domain/core/value_objects/app_strings.dart';
import 'package:prohealth360_daktari/domain/core/value_objects/app_widget_keys.dart';
import 'package:prohealth360_daktari/presentation/core/app_bar/custom_app_bar.dart';
import 'package:prohealth360_daktari/presentation/service_requests/widgets/staff_pin_reset_request_widget.dart';

class StaffPinResetRequestsPage extends StatefulWidget {
  const StaffPinResetRequestsPage({Key? key}) : super(key: key);

  @override
  State<StaffPinResetRequestsPage> createState() =>
      _StaffPinResetRequestsPageState();
}

class _StaffPinResetRequestsPageState extends State<StaffPinResetRequestsPage> {
  bool isSearching = false;
  String searchKeyWord = '';
  final TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    searchController.addListener(() async {
      if (searchController.text.isEmpty) {
        setState(() {
          isSearching = false;
          searchKeyWord = '';
        });
      } else {
        setState(() {
          isSearching = true;
          searchKeyWord = searchController.text;
        });
      }
    });
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
            onInit: (Store<AppState> store) {
              StoreProvider.dispatch(
                context,
                FetchServiceRequestsAction(
                  client: AppWrapperBase.of(context)!.graphQLClient,
                  serviceRequestStatus: RequestStatus.PENDING,
                  serviceRequestType: ServiceRequestType.STAFF_PIN_RESET,
                  flavour: Flavour.pro,
                ),
              );
            },
            builder: (BuildContext context, ServiceRequestsViewModel vm) {
              final bool error = vm.errorFetchingServiceRequests ?? false;
              final bool isLoading =
                  vm.wait.isWaitingFor(fetchServiceRequestFlag);

              final List<Widget> requestWidgetList = <Widget>[];
              final List<ServiceRequest>? serviceRequests =
                  vm.staffServiceRequests;

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
                        acceptKey:
                            ValueKey<String>('accept_key_$serviceRequestId'),
                        phoneNumber: phoneNumber,
                        name: name,
                        staffId: staffId,
                        isAccepting: vm.wait.isWaitingFor(
                          '${pinResetRequestFlag}_$serviceRequestId',
                        ),
                        onAccept: () => _resolvePinRequest(
                          staffId: staffId,
                          serviceRequestId: serviceRequestId,
                          phoneNumber: phoneNumber,
                          pinResetState: PinResetState.APPROVED,
                        ),
                      ),
                    ),
                  );
                },
              ).toList();

              return SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    if (!error) ...<Widget>{
                      Center(child: SvgPicture.asset(pinResetImageSvgPath)),
                      const SizedBox(height: 20),
                      if (!isLoading) ...<Widget>{
                        const Text(
                          staffPinResetRequestsMessage,
                          style: TextStyle(color: AppColors.grey50),
                        ),
                        mediumVerticalSizedBox,
                        CustomTextField(
                          controller: searchController,
                          hintText: redFlagsSearchBarString,
                          suffixIcon: Padding(
                            padding: const EdgeInsets.only(
                              right: 4.0,
                            ),
                            child: IconButton(
                              key: searchIconButtonKey,
                              onPressed: () => StoreProvider.dispatch(
                                context,
                                SearchServiceRequestsAction(
                                  client:
                                      AppWrapperBase.of(context)!.graphQLClient,
                                  flavour: Flavour.pro,
                                  serviceRequestType:
                                      ServiceRequestType.STAFF_PIN_RESET,
                                  searchTerm: searchKeyWord,
                                ),
                              ),
                              icon: const Icon(
                                Icons.search,
                                color: AppColors.searchIconColor,
                              ),
                            ),
                          ),
                          borderColor: Colors.transparent,
                          focusedBorderColor: Colors.transparent,
                          customFillColor: AppColors.searchBackgroundColor,
                          onChanged: (String val) {},
                        ),
                        const SizedBox(height: 20),
                      },
                      if (isLoading)
                        const PlatformLoader()
                      else if (vm.staffServiceRequests?.isEmpty ?? true)
                        GenericErrorWidget(
                          showPrimaryButton: !isSearching,
                          actionText: actionTextGenericNoData,
                          recoverCallback: () => Navigator.of(context).pop(),
                          type: GenericNoDataTypes.noData,
                          messageTitle: isSearching
                              ? noRecordFoundText
                              : getNoDataTile(staffPinResetRequestsTitle),
                          messageBody: isSearching
                              ? <TextSpan>[
                                  TextSpan(
                                    text: couldNotFindRedFlagsText,
                                    style: normalSize16Text(
                                      AppColors.greyTextColor,
                                    ),
                                  ),
                                  TextSpan(
                                    text: searchKeyWord,
                                    style: boldSize18Text(
                                      AppColors.greyTextColor,
                                    ),
                                  ),
                                  TextSpan(
                                    text: confirmTheCodeIsCorrectText,
                                    style: normalSize16Text(
                                      AppColors.greyTextColor,
                                    ),
                                  )
                                ]
                              : <TextSpan>[
                                  TextSpan(
                                    text: serviceRequestsNoDataBodyString,
                                    style: normalSize16Text(
                                      AppColors.greyTextColor,
                                    ),
                                  ),
                                ],
                        )
                      else
                        ...requestWidgetList,
                    } else
                      GenericErrorWidget(
                        actionKey: helpNoDataWidgetKey,
                        recoverCallback: () => StoreProvider.dispatch(
                          context,
                          FetchServiceRequestsAction(
                            client: AppWrapperBase.of(context)!.graphQLClient,
                            serviceRequestStatus: RequestStatus.PENDING,
                            serviceRequestType:
                                ServiceRequestType.STAFF_PIN_RESET,
                            flavour: Flavour.pro,
                          ),
                        ),
                        messageTitle: '',
                        messageBody: <TextSpan>[
                          TextSpan(
                            text: getErrorMessage(
                              fetchingStaffPINResetRequestsString,
                            ),
                            style: normalSize16Text(
                              AppColors.greyTextColor,
                            ),
                          ),
                        ],
                      ),
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
    required String staffId,
    required String serviceRequestId,
    required String phoneNumber,
    required PinResetState pinResetState,
  }) {
    StoreProvider.dispatch(
      context,
      ResolveStaffPinRequestAction(
        staffId: staffId,
        serviceRequestId: serviceRequestId,
        phoneNumber: phoneNumber,
        pinResetState: pinResetState,
        httpClient: AppWrapperBase.of(context)!.graphQLClient,
        onPinVerified: () {
          showTextSnackbar(
            ScaffoldMessenger.of(context),
            content: pinApprovedSuccessText,
          );
        },
      ),
    );
  }
}
