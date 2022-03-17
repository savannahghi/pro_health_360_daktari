import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:app_wrapper/app_wrapper.dart';
import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mycarehubpro/application/core/theme/app_themes.dart';
import 'package:mycarehubpro/application/redux/actions/flags/app_flags.dart';
import 'package:mycarehubpro/application/redux/actions/service_requests/fetch_service_request_count_action.dart';
import 'package:mycarehubpro/application/redux/states/app_state.dart';
import 'package:mycarehubpro/application/redux/view_models/service_requests/service_requests_view_model.dart';
import 'package:mycarehubpro/domain/core/entities/service_requests/request_count_content.dart';
import 'package:mycarehubpro/domain/core/value_objects/app_asset_strings.dart';
import 'package:mycarehubpro/domain/core/value_objects/app_enums.dart';
import 'package:mycarehubpro/domain/core/value_objects/app_strings.dart';
import 'package:mycarehubpro/domain/core/value_objects/app_widget_keys.dart';
import 'package:mycarehubpro/presentation/core/app_bar/custom_app_bar.dart';
import 'package:mycarehubpro/presentation/engagement/home/widgets/action_card.dart';
import 'package:mycarehubpro/presentation/router/routes.dart';

class ServiceRequestsPage extends StatefulWidget {
  const ServiceRequestsPage({Key? key}) : super(key: key);

  @override
  State<ServiceRequestsPage> createState() => _ServiceRequestsPageState();
}

class _ServiceRequestsPageState extends State<ServiceRequestsPage> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    StoreProvider.dispatch<AppState>(
      context,
      FetchServiceRequestsCountAction(
        client: AppWrapperBase.of(context)!.graphQLClient,
      ),
    );
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
          final List<RequestCountContent>? serviceRequestsCount =
              vm.pendingServiceRequests?.serviceRequestsCount;

          final int redFlagCount = _getServiceRequestTypeCount(
            serviceRequestsCount,
            ServiceRequestType.RED_FLAG,
          );

          final int pinResetCount = _getServiceRequestTypeCount(
            serviceRequestsCount,
            ServiceRequestType.PIN_RESET,
          );

          final int profileUpdateCount = _getServiceRequestTypeCount(
            serviceRequestsCount,
            ServiceRequestType.PROFILE_UPDATE,
          );

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
                              if (redFlagCount > 0)
                                ActionCard(
                                  count: redFlagCount,
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
                              if (pinResetCount > 0)
                                ActionCard(
                                  count: pinResetCount,
                                  iconUrl: pinResetImageSvgPath,
                                  title: pinResetString,
                                  backgroundColor: Theme.of(context)
                                      .primaryColor
                                      .withOpacity(0.2),
                                  onTap: () => Navigator.pushNamed(
                                    context,
                                    AppRoutes.pinResetRequestsPage,
                                  ),
                                ),
                              if (profileUpdateCount > 0)
                                ActionCard(
                                  count: profileUpdateCount,
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
                        Navigator.of(context).pop();
                      },
                      messageTitle: getNoDataTile('Service requests'),
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
                    recoverCallback: () {
                      StoreProvider.dispatch<AppState>(
                        context,
                        FetchServiceRequestsCountAction(
                          client: AppWrapperBase.of(context)!.graphQLClient,
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

  int _getServiceRequestTypeCount(
    List<RequestCountContent>? requests,
    ServiceRequestType type,
  ) {
    return requests
            ?.singleWhere(
              (RequestCountContent? element) => element?.requestType == type,
              orElse: () => RequestCountContent.initial(),
            )
            .count ??
        0;
  }
}
