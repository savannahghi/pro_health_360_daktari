import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:app_wrapper/app_wrapper.dart';
import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:prohealth360_daktari/application/core/services/helpers.dart';
import 'package:prohealth360_daktari/application/core/theme/app_themes.dart';
import 'package:prohealth360_daktari/application/redux/actions/flags/app_flags.dart';
import 'package:prohealth360_daktari/application/redux/actions/service_requests/resolve_pin_request_action.dart';
import 'package:prohealth360_daktari/application/redux/actions/service_requests/fetch_service_requests_action.dart';
import 'package:prohealth360_daktari/application/redux/actions/service_requests/search_service_requests_action.dart';
import 'package:prohealth360_daktari/application/redux/states/app_state.dart';
import 'package:prohealth360_daktari/application/redux/view_models/service_requests/service_requests_view_model.dart';
import 'package:prohealth360_daktari/domain/core/entities/service_requests/service_request.dart';
import 'package:prohealth360_daktari/domain/core/value_objects/app_asset_strings.dart';
import 'package:prohealth360_daktari/domain/core/value_objects/app_enums.dart';
import 'package:prohealth360_daktari/domain/core/value_objects/app_strings.dart';
import 'package:prohealth360_daktari/domain/core/value_objects/app_widget_keys.dart';
import 'package:prohealth360_daktari/presentation/core/app_bar/custom_app_bar.dart';
import 'package:prohealth360_daktari/presentation/service_requests/widgets/identity_verification_action_dialog.dart';
import 'package:prohealth360_daktari/presentation/service_requests/widgets/pin_reset_request_widget.dart';

class PinResetRequestsPage extends StatefulWidget {
  const PinResetRequestsPage({Key? key}) : super(key: key);

  @override
  State<PinResetRequestsPage> createState() => _PinResetRequestsPageState();
}

class _PinResetRequestsPageState extends State<PinResetRequestsPage> {
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
      appBar: const CustomAppBar(title: pinResetRequestsTitle),
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
                  serviceRequestType: ServiceRequestType.PIN_RESET,
                  flavour: Flavour.consumer,
                ),
              );
            },
            builder: (BuildContext context, ServiceRequestsViewModel vm) {
              final bool error = vm.errorFetchingServiceRequests ?? false;
              final List<Widget> requestWidgetList = <Widget>[];
              final List<ServiceRequest>? serviceRequests =
                  vm.clientServiceRequests;
              final bool isLoading =
                  vm.wait.isWaitingFor(fetchServiceRequestFlag);

              serviceRequests
                  ?.where(
                    (ServiceRequest request) =>
                        request.serviceRequestType ==
                        ServiceRequestType.PIN_RESET,
                  )
                  .toList()
                  .map(
                (ServiceRequest request) {
                  final String name = request.clientName ?? UNKNOWN;
                  final String phoneNumber =
                      request.clientPhoneNumber ?? UNKNOWN;
                  final String clientId = request.clientId ?? '';
                  final String serviceRequestId = request.id ?? '';
                  final String cccNumber = request.meta?.cccNumber ?? '';
                  final bool isCccNumberVerified =
                      request.meta?.isCccNumberValid ?? false;

                  requestWidgetList.add(
                    Padding(
                      padding: const EdgeInsets.only(bottom: 10.0),
                      child: PinResetRequestWidget(
                        clientId: clientId,
                        serviceRequestId: serviceRequestId,
                        cccNumber: cccNumber,
                        acceptKey:
                            ValueKey<String>('accept_key_$serviceRequestId'),
                        rejectKey:
                            ValueKey<String>('reject_key_$serviceRequestId'),
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
                          isCccNumberVerified
                              ? _resolvePinRequest(
                                  clientId: clientId,
                                  serviceRequestId: serviceRequestId,
                                  cccNumber: cccNumber,
                                  phoneNumber: phoneNumber,
                                  pinResetState: PinResetState.APPROVED,
                                )
                              : showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return IdentityVerificationActionDialog(
                                      clientId: clientId,
                                      serviceRequestId: serviceRequestId,
                                      cccNumber: cccNumber,
                                      phoneNumber: phoneNumber,
                                      pinResetState: PinResetState.APPROVED,
                                    );
                                  },
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
                    ),
                  );
                },
              ).toList();

              return SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    if (!error) ...<Widget>{
                      Center(child: SvgPicture.asset(pinResetImageSvgPath)),
                      const SizedBox(
                        height: 20,
                      ),
                      if (!isLoading) ...<Widget>{
                        const Text(
                          pinResetRequestsLeading,
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
                                  flavour: Flavour.consumer,
                                  serviceRequestType:
                                      ServiceRequestType.PIN_RESET,
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
                        const SizedBox(
                          height: 20,
                        ),
                      },
                      if (isLoading)
                        const PlatformLoader()
                      else if (vm.clientServiceRequests?.isEmpty ?? true)
                        GenericErrorWidget(
                          showPrimaryButton: !isSearching,
                          actionText: actionTextGenericNoData,
                          recoverCallback: () => Navigator.of(context).pop(),
                          type: GenericNoDataTypes.noData,
                          messageTitle: isSearching
                              ? noRecordFoundText
                              : getNoDataTile('service requests'),
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
                        recoverCallback: () {
                          StoreProvider.dispatch(
                            context,
                            FetchServiceRequestsAction(
                              client: AppWrapperBase.of(context)!.graphQLClient,
                              serviceRequestStatus: RequestStatus.PENDING,
                              serviceRequestType: ServiceRequestType.PIN_RESET,
                              flavour: Flavour.consumer,
                            ),
                          );
                        },
                        messageTitle: '',
                        messageBody: <TextSpan>[
                          TextSpan(
                            text:
                                getErrorMessage(fetchingPINResetRequestsString),
                            style: normalSize16Text(
                              AppColors.greyTextColor,
                            ),
                          ),
                        ],
                      )
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
