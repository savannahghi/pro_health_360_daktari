// Flutter imports:
import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:app_wrapper/app_wrapper.dart';
import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
// Package imports:
import 'package:flutter_svg/flutter_svg.dart';
import 'package:myharehubpro/application/core/theme/app_themes.dart';
import 'package:myharehubpro/application/redux/actions/flags/app_flags.dart';
import 'package:myharehubpro/application/redux/actions/service_requests/fetch_service_request_count_action.dart';
import 'package:myharehubpro/application/redux/states/app_state.dart';
import 'package:myharehubpro/application/redux/view_models/service_requests/service_requests_view_model.dart';
import 'package:myharehubpro/domain/core/entities/service_requests/request_count_content.dart';
// Project imports:
import 'package:myharehubpro/domain/core/value_objects/app_asset_strings.dart';
import 'package:myharehubpro/domain/core/value_objects/app_enums.dart';
import 'package:myharehubpro/domain/core/value_objects/app_strings.dart';
import 'package:myharehubpro/domain/core/value_objects/app_widget_keys.dart';
import 'package:myharehubpro/presentation/core/app_bar/custom_app_bar.dart';
import 'package:myharehubpro/presentation/engagement/home/widgets/action_card.dart';
import 'package:myharehubpro/presentation/router/routes.dart';

class ServiceRequestsPage extends StatefulWidget {
  const ServiceRequestsPage({Key? key}) : super(key: key);

  @override
  State<ServiceRequestsPage> createState() => _ServiceRequestsPageState();
}

class _ServiceRequestsPageState extends State<ServiceRequestsPage> {
  /// [ServiceRequestsPage] is used to display the user information
  ///
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
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const CustomAppBar(
        title: serviceRequestString,
        showNotificationIcon: true,
      ),
      body: StoreConnector<AppState, ServiceRequestsViewModel>(
        converter: (Store<AppState> store) =>
            ServiceRequestsViewModel.fromStore(store),
        builder: (BuildContext context, ServiceRequestsViewModel vm) {
          final bool error = vm.errorFetchingServiceRequests ?? false;
          final int total = vm.pendingServiceRequests?.total ?? 0;
          final int? redFlagCount =
              vm.pendingServiceRequests?.serviceRequestsCount
                  ?.singleWhere(
                    (RequestCountContent? element) =>
                        element?.requestType == ServiceRequestType.RED_FLAG,
                    orElse: () => RequestCountContent.initial(),
                  )
                  .count;
          //todo(byron) return this when backend workflow is done
          // final int? pinResetCount =
          //     vm.pendingServiceRequests?.serviceRequestsCount
          //         ?.singleWhere(
          //           (RequestCountContent? element) =>
          //               element?.requestType == ServiceRequestType.PIN_RESET,
          //           orElse: () => RequestCountContent.initial(),
          //         )
          //         .count;
          final int? profileUpdateCount = vm
              .pendingServiceRequests?.serviceRequestsCount
              ?.singleWhere(
                (RequestCountContent? element) =>
                    element?.requestType == ServiceRequestType.PROFILE_UPDATE,
                orElse: () => RequestCountContent.initial(),
              )
              .count;

          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                if (!error) ...<Widget>{
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 30,
                    ),
                    child: Center(
                      child: SvgPicture.asset(
                        serviceRequestsIconSvg,
                        width: 200,
                      ),
                    ),
                  ),
                  if (vm.wait
                      .isWaitingFor(fetchServiceRequestsCountFlag)) ...<Widget>{
                    const Padding(
                      padding: EdgeInsets.only(
                        top: 150,
                      ),
                      child: PlatformLoader(),
                    )
                  } else if (total > 0) ...<Widget>{
                    Container(
                      padding: const EdgeInsets.only(
                        top: 16.0,
                        left: 16.0,
                        right: 16.0,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Wrap(
                            children: <Widget>[
                              // todo(byron) return this when the workflow is done and implemented on backend
                              // if (pinResetCount != null && pinResetCount > 0)
                              //   ActionCard(
                              //     counter: pinResetCount.toString(),
                              //     iconUrl: pinResetImageSvgPath,
                              //     title: pinResetString,
                              //     backgroundColor: Theme.of(context)
                              //         .primaryColor
                              //         .withOpacity(0.2),
                              //     onTap: () => Navigator.pushNamed(
                              //       context,
                              //       AppRoutes.pinResetRequestsPage,
                              //     ),
                              //   ),
                              if (redFlagCount != null && redFlagCount > 0)
                                ActionCard(
                                  counter: redFlagCount.toString(),
                                  iconUrl: redFlagStressSvgPath,
                                  title: redFlagString,
                                  backgroundColor: Theme.of(context)
                                      .primaryColor
                                      .withOpacity(0.2),
                                  onTap: () => Navigator.pushNamed(
                                    context,
                                    AppRoutes.redFlagsPage,
                                  ),
                                ),
                              if (profileUpdateCount != null &&
                                  profileUpdateCount > 0)
                                ActionCard(
                                  counter: profileUpdateCount.toString(),
                                  iconUrl: profileUpdateImageSvgPath,
                                  title: profileUpdateString,
                                  backgroundColor: Theme.of(context)
                                      .primaryColor
                                      .withOpacity(0.2),
                                  onTap: () => Navigator.pushNamed(
                                    context,
                                    AppRoutes.profileUpdateRequestsPage,
                                  ),
                                )
                            ],
                          ),
                        ],
                      ),
                    )
                  } else ...<Widget>{
                    GenericErrorWidget(
                      actionKey: helpNoDataWidgetKey,
                      actionText: actionTextGenericNoData,
                      type: GenericNoDataTypes.noData,
                      recoverCallback: () {
                        if (Navigator.canPop(context)) {
                          Navigator.of(context).pop();
                        }
                      },
                      messageTitle: getNoDataTile(redFlagString.toLowerCase()),
                      messageBody: <TextSpan>[
                        TextSpan(
                          text: serviceRequestsNoDataBodyString,
                          style: normalSize16Text(
                            AppColors.greyTextColor,
                          ),
                        ),
                      ],
                    )
                  }
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
                        FetchServiceRequestsCountAction(
                          client: AppWrapperBase.of(context)!.graphQLClient,
                          variables: <String, dynamic>{
                            'facilityID': facilityID,
                          },
                        ),
                      );
                    },
                    messageBody: <TextSpan>[
                      TextSpan(
                        text: getErrorMessage(fetchingPendingServiceString),
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
    );
  }
}
