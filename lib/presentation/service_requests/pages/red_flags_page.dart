import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:app_wrapper/app_wrapper.dart';
import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:prohealth360_daktari/application/core/theme/app_themes.dart';
import 'package:prohealth360_daktari/application/redux/actions/flags/app_flags.dart';
import 'package:prohealth360_daktari/application/redux/actions/service_requests/fetch_service_requests_action.dart';
import 'package:prohealth360_daktari/application/redux/states/app_state.dart';
import 'package:prohealth360_daktari/application/redux/view_models/service_requests/service_requests_view_model.dart';
import 'package:prohealth360_daktari/domain/core/entities/service_requests/service_request.dart';
import 'package:prohealth360_daktari/domain/core/value_objects/app_asset_strings.dart';
import 'package:prohealth360_daktari/domain/core/value_objects/app_enums.dart';
import 'package:prohealth360_daktari/domain/core/value_objects/app_strings.dart';
import 'package:prohealth360_daktari/domain/core/value_objects/app_widget_keys.dart';
import 'package:prohealth360_daktari/presentation/core/app_bar/custom_app_bar.dart';
import 'package:prohealth360_daktari/presentation/router/routes.dart';
import 'package:prohealth360_daktari/presentation/service_requests/widgets/red_flag_list_item.dart';

class RedFlagsPage extends StatelessWidget {
  const RedFlagsPage({Key? key}) : super(key: key);

  // [RedFlagsPage] is used to display a list of red
  /// flags that demand immediate attention
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const CustomAppBar(
        title: '${redFlagString}s',
        showNotificationIcon: true,
      ),
      body: StoreConnector<AppState, ServiceRequestsViewModel>(
        converter: (Store<AppState> store) =>
            ServiceRequestsViewModel.fromStore(store),
        onInit: (Store<AppState> store) {
          StoreProvider.dispatch<AppState>(
            context,
            FetchServiceRequestsAction(
              client: AppWrapperBase.of(context)!.graphQLClient,
              serviceRequestStatus: RequestStatus.PENDING,
              serviceRequestType: ServiceRequestType.RED_FLAG,
              flavour: Flavour.consumer,
            ),
          );
        },
        builder: (BuildContext context, ServiceRequestsViewModel vm) {
          final bool error = vm.errorFetchingServiceRequests ?? false;
          return RefreshIndicator(
            onRefresh: () async {
              StoreProvider.dispatch<AppState>(
                context,
                FetchServiceRequestsAction(
                  client: AppWrapperBase.of(context)!.graphQLClient,
                  serviceRequestStatus: RequestStatus.PENDING,
                  serviceRequestType: ServiceRequestType.RED_FLAG,
                  flavour: Flavour.consumer,
                ),
              );
            },
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  if (!error) ...<Widget>{
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 30),
                      child: Center(
                        child:
                            SvgPicture.asset(redFlagStressSvgPath, width: 200),
                      ),
                    ),
                    if (vm.wait
                        .isWaitingFor(fetchServiceRequestFlag)) ...<Widget>{
                      const Padding(
                        padding: EdgeInsets.only(top: 150),
                        child: PlatformLoader(),
                      )
                    } else if (vm.clientServiceRequests?.isEmpty ??
                        true) ...<Widget>{
                      GenericErrorWidget(
                        actionKey: helpNoDataWidgetKey,
                        actionText: actionTextGenericNoData,
                        type: GenericNoDataTypes.noData,
                        recoverCallback: () => Navigator.of(context).pop(),
                        messageTitle:
                            getNoDataTile(redFlagString.toLowerCase()),
                        messageBody: <TextSpan>[
                          TextSpan(
                            text: serviceRequestsNoDataBodyString,
                            style: normalSize16Text(
                              AppColors.greyTextColor,
                            ),
                          ),
                        ],
                      )
                    } else
                      ...List<Widget>.generate(
                          vm.clientServiceRequests?.length ?? 0, (int index) {
                        final List<ServiceRequest>? entries =
                            vm.clientServiceRequests;

                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20.0),
                          child: GestureDetector(
                            onTap: () => Navigator.of(context).pushNamed(
                              AppRoutes.redFlagActionsPage,
                              arguments: entries?.elementAt(index),
                            ),
                            child: RedFlagListItem(
                              serviceRequest: entries?.elementAt(index),
                            ),
                          ),
                        );
                      }),
                  } else ...<Widget>{
                    GenericErrorWidget(
                      actionKey: helpNoDataWidgetKey,
                      recoverCallback: () {
                        StoreProvider.dispatch<AppState>(
                          context,
                          FetchServiceRequestsAction(
                            client: AppWrapperBase.of(context)!.graphQLClient,
                            serviceRequestStatus: RequestStatus.PENDING,
                            serviceRequestType: ServiceRequestType.RED_FLAG,
                            flavour: Flavour.consumer,
                          ),
                        );
                      },
                      messageBody: <TextSpan>[
                        TextSpan(
                          text: getErrorMessage(fetchingResolvedRedFlagsString),
                          style: normalSize16Text(
                            AppColors.greyTextColor,
                          ),
                        ),
                      ],
                    )
                  },
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
