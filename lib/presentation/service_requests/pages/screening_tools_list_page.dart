import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:app_wrapper/app_wrapper.dart';
import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:prohealth360_daktari/application/core/theme/app_themes.dart';
import 'package:prohealth360_daktari/application/redux/actions/flags/app_flags.dart';
import 'package:prohealth360_daktari/application/redux/actions/service_requests/fetch_available_facility_screening_tools_action.dart';
import 'package:prohealth360_daktari/application/redux/states/app_state.dart';
import 'package:prohealth360_daktari/application/redux/view_models/service_requests/service_requests_view_model.dart';
import 'package:prohealth360_daktari/domain/core/entities/service_requests/tool_type.dart';
import 'package:prohealth360_daktari/domain/core/value_objects/app_asset_strings.dart';
import 'package:prohealth360_daktari/domain/core/value_objects/app_enums.dart';
import 'package:prohealth360_daktari/domain/core/value_objects/app_strings.dart';
import 'package:prohealth360_daktari/domain/core/value_objects/app_widget_keys.dart';
import 'package:prohealth360_daktari/presentation/core/app_bar/custom_app_bar.dart';
import 'package:prohealth360_daktari/presentation/service_requests/widgets/screening_tools_item_widget.dart';

class ScreeningToolsListPage extends StatefulWidget {
  const ScreeningToolsListPage({Key? key}) : super(key: key);

  @override
  State<ScreeningToolsListPage> createState() => _ScreeningToolsListPageState();
}

class _ScreeningToolsListPageState extends State<ScreeningToolsListPage> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      StoreProvider.dispatch<AppState>(
        context,
        FetchAvailableFacilityScreeningToolsAction(
          client: AppWrapperBase.of(context)!.graphQLClient,
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: screeningToolsTitle),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: StoreConnector<AppState, ServiceRequestsViewModel>(
          converter: (Store<AppState> store) =>
              ServiceRequestsViewModel.fromStore(store),
          builder: (BuildContext context, ServiceRequestsViewModel vm) {
            final bool error = vm.errorFetchingServiceRequests ?? false;
            final List<ToolType> toolTypes =
                vm.screeningToolsState?.availableTools ?? <ToolType>[];
            return SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  if (!error) ...<Widget>{
                    smallVerticalSizedBox,
                    SvgPicture.asset(
                      screeningToolsImage,
                      height: 150,
                    ),
                    smallVerticalSizedBox,
                    if (toolTypes.isNotEmpty)
                      Center(
                        child: Text(
                          screeningToolsPageLongDescription,
                          style: normalSize14Text(
                            AppColors.greyTextColor.withOpacity(0.5),
                          ),
                        ),
                      ),
                    if (vm.wait.isWaitingFor(
                      fetchAvailableScreeningToolsFlag,
                    )) ...<Widget>{
                      const Padding(
                        padding: EdgeInsets.only(
                          top: 150,
                        ),
                        child: PlatformLoader(),
                      )
                    } else if (toolTypes.isEmpty)
                      GenericErrorWidget(
                        type: GenericNoDataTypes.noData,
                        actionKey: helpNoDataWidgetKey,
                        actionText: thanksText,
                        recoverCallback: () {
                          if (Navigator.canPop(context)) {
                            Navigator.of(context).pop();
                          }
                        },
                        messageTitle: getNoDataTile(
                          screeningToolsTitle.toLowerCase(),
                        ),
                        messageBody: <TextSpan>[
                          TextSpan(
                            text: screeningToolsNoDatBodyText,
                            style: normalSize16Text(
                              AppColors.greyTextColor,
                            ),
                          ),
                        ],
                      )
                    else
                      ...List<Widget>.generate(toolTypes.length, (int index) {
                        final ScreeningToolsType currentToolType =
                            toolTypes[index].toolType!;
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20.0),
                          child: ScreeningToolsItemWidget(
                            title: getScreeningToolTitle(currentToolType),
                            description:
                                getScreeningToolDescription(currentToolType),
                            screeningToolsType: currentToolType,
                          ),
                        );
                      })
                  } else ...<Widget>{
                    GenericErrorWidget(
                      messageTitle: genericErrorOccurred,
                      actionKey: helpNoDataWidgetKey,
                      recoverCallback: () {
                        StoreProvider.dispatch<AppState>(
                          context,
                          FetchAvailableFacilityScreeningToolsAction(
                            client: AppWrapperBase.of(context)!.graphQLClient,
                          ),
                        );
                      },
                      messageBody: <TextSpan>[
                        TextSpan(
                          text: getErrorMessage(fetchingScreeningToolsString),
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
