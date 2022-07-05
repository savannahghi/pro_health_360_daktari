import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:app_wrapper/app_wrapper.dart';
import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:prohealth360_daktari/application/core/theme/app_themes.dart';
import 'package:prohealth360_daktari/application/redux/actions/flags/app_flags.dart';
import 'package:prohealth360_daktari/application/redux/actions/service_requests/fetch_resolved_service_requests_action.dart';
import 'package:prohealth360_daktari/application/redux/states/app_state.dart';
import 'package:prohealth360_daktari/application/redux/view_models/service_requests/service_requests_view_model.dart';
import 'package:prohealth360_daktari/domain/core/entities/service_requests/service_request.dart';
import 'package:prohealth360_daktari/domain/core/value_objects/app_asset_strings.dart';
import 'package:prohealth360_daktari/domain/core/value_objects/app_strings.dart';
import 'package:prohealth360_daktari/domain/core/value_objects/app_widget_keys.dart';
import 'package:prohealth360_daktari/presentation/core/app_bar/custom_app_bar.dart';
import 'package:prohealth360_daktari/presentation/service_requests/widgets/resolved_service_request_list_item.dart';

class ResolvedServiceRequestsListPage extends StatefulWidget {
  const ResolvedServiceRequestsListPage({Key? key, required this.flavour})
      : super(key: key);
  final Flavour flavour;

  @override
  State<ResolvedServiceRequestsListPage> createState() =>
      _ResolvedServiceRequestsListPageState();
}

class _ResolvedServiceRequestsListPageState
    extends State<ResolvedServiceRequestsListPage> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((Duration timeStamp) async {
      StoreProvider.dispatch<AppState>(
        context,
        FetchResolvedServiceRequestsAction(
          client: AppWrapperBase.of(context)!.graphQLClient,
          flavour: widget.flavour,
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(
        title: getResolvedServiceRequestsListTitle(widget.flavour),
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
            final List<Widget> resolvedRequestsWidgetList = <Widget>[];
            final List<ServiceRequest>? serviceRequests =
                vm.resolvedServiceRequests;
            if (serviceRequests?.isNotEmpty ?? false) {
              serviceRequests!
                  .map(
                    (ServiceRequest request) => resolvedRequestsWidgetList.add(
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: ResolvedServiceRequestListItem(
                          flavour: widget.flavour,
                          serviceRequest: request,
                        ),
                      ),
                    ),
                  )
                  .toList();
            }
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
                    } else if (resolvedRequestsWidgetList.isEmpty) ...<Widget>{
                      GenericErrorWidget(
                        actionKey: helpNoDataWidgetKey,
                        actionText: actionTextGenericNoData,
                        type: GenericNoDataTypes.noData,
                        recoverCallback: () {
                          if (Navigator.canPop(context)) {
                            Navigator.of(context).pop();
                          }
                        },
                        messageTitle: getNoDataTile(
                          resolvedServiceRequestsString.toLowerCase(),
                        ),
                        messageBody: <TextSpan>[
                          TextSpan(
                            text: resolvedServiceRequestsNoDataBodyString,
                            style: normalSize16Text(
                              AppColors.greyTextColor,
                            ),
                          ),
                        ],
                      )
                    } else ...<Widget>{
                      mediumVerticalSizedBox,
                      Text(
                        getResolvedServiceRequestsListBodyString(
                          widget.flavour,
                        ),
                        style: const TextStyle(color: AppColors.grey50),
                        textAlign: TextAlign.center,
                      ),
                      size15VerticalSizedBox,
                      ...resolvedRequestsWidgetList,
                    }
                  } else ...<Widget>{
                    GenericErrorWidget(
                      actionKey: helpNoDataWidgetKey,
                      recoverCallback: () async {
                        StoreProvider.dispatch<AppState>(
                          context,
                          FetchResolvedServiceRequestsAction(
                            client: AppWrapperBase.of(context)!.graphQLClient,
                            flavour: Flavour.consumer,
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
