import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:app_wrapper/app_wrapper.dart';
import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:prohealth360_daktari/application/core/theme/app_themes.dart';
import 'package:prohealth360_daktari/application/redux/actions/flags/app_flags.dart';
import 'package:prohealth360_daktari/application/redux/actions/service_requests/fetch_assessment_responses_by_tool_action.dart';
import 'package:prohealth360_daktari/application/redux/actions/service_requests/fetch_available_facility_screening_tools_action.dart';
import 'package:prohealth360_daktari/application/redux/states/app_state.dart';
import 'package:prohealth360_daktari/application/redux/states/service_requests/tool_assessment_response.dart';
import 'package:prohealth360_daktari/application/redux/view_models/service_requests/service_requests_view_model.dart';
import 'package:prohealth360_daktari/domain/core/value_objects/app_asset_strings.dart';
import 'package:prohealth360_daktari/domain/core/value_objects/app_enums.dart';
import 'package:prohealth360_daktari/domain/core/value_objects/app_strings.dart';
import 'package:prohealth360_daktari/domain/core/value_objects/app_widget_keys.dart';
import 'package:prohealth360_daktari/presentation/core/app_bar/custom_app_bar.dart';
import 'package:prohealth360_daktari/presentation/service_requests/widgets/assessment_request_item_widget.dart';

class AssessmentToolResponsesPage extends StatefulWidget {
  const AssessmentToolResponsesPage({
    Key? key,
    required this.screeningToolsType,
  }) : super(key: key);
  final ScreeningToolsType screeningToolsType;
  @override
  State<AssessmentToolResponsesPage> createState() =>
      _AssessmentToolResponsesPageState();
}

class _AssessmentToolResponsesPageState
    extends State<AssessmentToolResponsesPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      StoreProvider.dispatch<AppState>(
        context,
        FetchAssessmentResponsesByToolAction(
          client: AppWrapperBase.of(context)!.graphQLClient,
          toolsType: widget.screeningToolsType,
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: getAssessmentScorePageTitle(
          screeningToolsType: widget.screeningToolsType,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: StoreConnector<AppState, ServiceRequestsViewModel>(
          converter: (Store<AppState> store) =>
              ServiceRequestsViewModel.fromStore(store),
          builder: (BuildContext context, ServiceRequestsViewModel vm) {
            final bool error = vm.errorFetchingServiceRequests ?? false;
            final List<ToolAssessmentResponse> responses =
                vm.screeningToolsState!.toolAssessmentResponses!;
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
                    if (responses.isNotEmpty)
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Text(
                          assessmentToolsResponsesPageDescription,
                          style: normalSize14Text(
                            AppColors.greyTextColor.withOpacity(0.5),
                          ),
                        ),
                      ),
                    if (vm.wait.isWaitingFor(
                      fetchAssessmentResponsesByToolFlag,
                    )) ...<Widget>{
                      const Padding(
                        padding: EdgeInsets.only(
                          top: 150,
                        ),
                        child: PlatformLoader(),
                      )
                    } else if (responses.isNotEmpty)
                      ...List<Widget>.generate(responses.length, (int index) {
                        return AssessmentRequestItemWidget(
                          screeningQuestionsList: responses[index],
                          toolsType: widget.screeningToolsType,
                        );
                      })
                    else
                      GenericErrorWidget(
                        type: GenericNoDataTypes.noData,
                        actionKey: helpNoDataWidgetKey,
                        actionText: thanksText,
                        recoverCallback: () {
                          StoreProvider.dispatch<AppState>(
                            context,
                            FetchAvailableFacilityScreeningToolsAction(
                              client: AppWrapperBase.of(context)!.graphQLClient,
                            ),
                          );
                          if (Navigator.canPop(context)) {
                            Navigator.of(context).pop();
                          }
                        },
                        messageTitle: getNoDataTile(
                          getAssessmentScorePageTitle(
                            screeningToolsType: widget.screeningToolsType,
                          ).toLowerCase(),
                        ),
                        messageBody: <TextSpan>[
                          TextSpan(
                            text: getAssessmentScoreNoDatBodyText(
                              screeningToolsType: widget.screeningToolsType,
                            ),
                            style: normalSize16Text(
                              AppColors.greyTextColor,
                            ),
                          ),
                        ],
                      )
                  } else ...<Widget>{
                    GenericErrorWidget(
                      messageTitle: genericErrorOccurred,
                      actionKey: helpNoDataWidgetKey,
                      recoverCallback: () {
                        StoreProvider.dispatch<AppState>(
                          context,
                          FetchAssessmentResponsesByToolAction(
                            client: AppWrapperBase.of(context)!.graphQLClient,
                            toolsType: widget.screeningToolsType,
                          ),
                        );
                      },
                      messageBody: <TextSpan>[
                        TextSpan(
                          text: getErrorMessage(
                            fetchingAssessmentResponsesString,
                          ),
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
