import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:app_wrapper/app_wrapper.dart';
import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mycarehubpro/application/core/theme/app_themes.dart';
import 'package:mycarehubpro/application/redux/actions/flags/app_flags.dart';
import 'package:mycarehubpro/application/redux/actions/service_requests/fetch_assessment_responses_by_tool_action.dart';
import 'package:mycarehubpro/application/redux/states/app_state.dart';
import 'package:mycarehubpro/application/redux/states/service_requests/tool_assessment_response.dart';
import 'package:mycarehubpro/application/redux/view_models/service_requests/service_requests_view_model.dart';
import 'package:mycarehubpro/domain/core/value_objects/app_asset_strings.dart';
import 'package:mycarehubpro/domain/core/value_objects/app_enums.dart';
import 'package:mycarehubpro/domain/core/value_objects/app_strings.dart';
import 'package:mycarehubpro/domain/core/value_objects/app_widget_keys.dart';
import 'package:mycarehubpro/presentation/core/app_bar/custom_app_bar.dart';
import 'package:mycarehubpro/presentation/service_requests/widgets/assessment_request_item_widget.dart';
import 'package:shared_themes/spaces.dart';

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
    WidgetsBinding.instance?.addPostFrameCallback((_) async {
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
                    } else
                      ...List<Widget>.generate(responses.length, (int index) {
                        return AssessmentRequestItemWidget(
                          screeningQuestionsList: responses[index],
                          toolsType: widget.screeningToolsType,
                        );
                      })
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
