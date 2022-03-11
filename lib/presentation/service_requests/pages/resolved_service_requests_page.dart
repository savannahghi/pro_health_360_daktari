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
import 'package:mycarehubpro/domain/core/value_objects/app_asset_strings.dart';
import 'package:mycarehubpro/domain/core/value_objects/app_enums.dart';
import 'package:mycarehubpro/domain/core/value_objects/app_strings.dart';
import 'package:mycarehubpro/domain/core/value_objects/app_widget_keys.dart';
import 'package:mycarehubpro/presentation/core/app_bar/custom_app_bar.dart';
import 'package:mycarehubpro/presentation/service_requests/widgets/red_flag_list_item.dart';

class ResolvedServiceRequestsPage extends StatefulWidget {
  const ResolvedServiceRequestsPage({Key? key}) : super(key: key);

  @override
  State<ResolvedServiceRequestsPage> createState() =>
      _ResolvedServiceRequestsPageState();
}

class _ResolvedServiceRequestsPageState
    extends State<ResolvedServiceRequestsPage> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance?.addPostFrameCallback((Duration timeStamp) async {
      final String facilityID =
          StoreProvider.state<AppState>(context)?.staffState?.defaultFacility ??
              '';
      StoreProvider.dispatch<AppState>(
        context,
        FetchServiceRequestsAction(
          client: AppWrapperBase.of(context)!.graphQLClient,
          variables: <String, dynamic>{
            'status': RequestStatus.RESOLVED.name,
            'facilityID': facilityID,
          },
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const CustomAppBar(
        title: resolvedRequestsString,
        showNotificationIcon: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
        ),
        child: StoreConnector<AppState, ServiceRequestsViewModel>(
          converter: (Store<AppState> store) =>
              ServiceRequestsViewModel.fromStore(store),
          builder: (BuildContext context, ServiceRequestsViewModel vm) {
            final bool error = vm.errorFetchingServiceRequests ?? false;
            return SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  if (!error) ...<Widget>{
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 30,
                      ),
                      child: Center(
                        child: SvgPicture.asset(
                          resolvedServiceRequestsImageSvgPath,
                          width: 200,
                        ),
                      ),
                    ),
                    if (vm.wait
                        .isWaitingFor(fetchServiceRequestFlag)) ...<Widget>{
                      const Padding(
                        padding: EdgeInsets.only(
                          top: 150,
                        ),
                        child: PlatformLoader(),
                      )
                    } else if (vm.serviceRequests?.isEmpty ?? true) ...<Widget>{
                      GenericErrorWidget(
                        actionKey: helpNoDataWidgetKey,
                        actionText: actionTextGenericNoData,
                        type: GenericNoDataTypes.noData,
                        recoverCallback: () {
                          if (Navigator.canPop(context)) {
                            Navigator.of(context).pop();
                          }
                        },
                        messageTitle:
                            getNoDataTile(serviceRequestsText.toLowerCase()),
                        messageBody: <TextSpan>[
                          TextSpan(
                            text: resolvedServiceRequestsNoDataBodyString,
                            style: normalSize16Text(
                              AppColors.greyTextColor,
                            ),
                          ),
                        ],
                      )
                    } else
                      ...List<Widget>.generate(vm.serviceRequests?.length ?? 0,
                          (int index) {
                        final String clientName =
                            vm.serviceRequests?.elementAt(index)?.clientName ??
                                '';
                        final String clientPhoneNumber = vm.serviceRequests
                                ?.elementAt(index)
                                ?.clientPhoneNumber ??
                            '';
                        final String description =
                            vm.serviceRequests?.elementAt(index)?.description ??
                                '';
                        final String resolvedTime = vm.serviceRequests
                                ?.elementAt(index)
                                ?.resolvedTime ??
                            '';

                        final String resolvedBy =
                            vm.serviceRequests?.elementAt(index)?.resolvedBy ??
                                '';

                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20.0),
                          child: RedFlagListItem(
                            isResolved: true,
                            clientName: clientName,
                            feelingDescription: description,
                            phoneNumber: clientPhoneNumber,
                            resolvedAt: resolvedTime,
                            resolvedBy: resolvedBy,
                          ),
                        );
                      }),
                  } else ...<Widget>{
                    GenericErrorWidget(
                      actionKey: helpNoDataWidgetKey,
                      recoverCallback: () async {
                        final String facilityID =
                            StoreProvider.state<AppState>(context)
                                    ?.staffState
                                    ?.defaultFacility ??
                                '';
                        StoreProvider.dispatch<AppState>(
                          context,
                          FetchServiceRequestsAction(
                            client: AppWrapperBase.of(context)!.graphQLClient,
                            variables: <String, dynamic>{
                              'status': RequestStatus.RESOLVED.name,
                              'facilityID': facilityID,
                            },
                          ),
                        );
                      },
                      messageBody: <TextSpan>[
                        TextSpan(
                          text: getErrorMessage(fetchingResolvedRequestsString),
                          style: normalSize16Text(
                            AppColors.greyTextColor,
                          ),
                        ),
                      ],
                    )
                  },
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
