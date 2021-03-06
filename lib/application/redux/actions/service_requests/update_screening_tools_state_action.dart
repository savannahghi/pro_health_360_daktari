import 'package:async_redux/async_redux.dart';
import 'package:prohealth360_daktari/application/redux/states/app_state.dart';
import 'package:prohealth360_daktari/application/redux/states/service_requests/screening_tools_state.dart';
import 'package:prohealth360_daktari/application/redux/states/service_requests/tool_assessment_response.dart';
import 'package:prohealth360_daktari/domain/core/entities/service_requests/tool_type.dart';

class UpdateScreeningToolsStateAction extends ReduxAction<AppState> {
  UpdateScreeningToolsStateAction({
    this.availableTools,
    this.toolAssessmentResponses,
    this.errorFetchingScreeningTools,
  });

  List<ToolType>? availableTools;
  List<ToolAssessmentResponse>? toolAssessmentResponses;
  bool? errorFetchingScreeningTools;

  @override
  Future<AppState> reduce() async {
    final ScreeningToolsState? screeningToolsState =
        state.serviceRequestState?.screeningToolsState?.copyWith(
      toolAssessmentResponses: toolAssessmentResponses ??
          state.serviceRequestState?.screeningToolsState
              ?.toolAssessmentResponses,
      availableTools: availableTools ??
          state.serviceRequestState?.screeningToolsState?.availableTools,
    );

    final AppState newState = state.copyWith(
      serviceRequestState: state.serviceRequestState
          ?.copyWith(screeningToolsState: screeningToolsState),
    );

    return newState;
  }
}
