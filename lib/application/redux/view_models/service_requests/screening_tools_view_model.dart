import 'package:async_redux/async_redux.dart';
import 'package:prohealth360_daktari/application/redux/states/app_state.dart';
import 'package:prohealth360_daktari/application/redux/states/service_requests/tool_assessment_response.dart';

class ScreeningToolsViewModel extends Vm {
  final Wait wait;
  final List<ToolAssessmentResponse>? toolAssessmentResponses;
  final bool? errorFetchingScreeningTools;
  ScreeningToolsViewModel({
    required this.wait,
    this.toolAssessmentResponses,
    this.errorFetchingScreeningTools,
  }) : super(
          equals: <Object?>[
            wait,
            toolAssessmentResponses,
            errorFetchingScreeningTools,
          ],
        );

  factory ScreeningToolsViewModel.fromStore(Store<AppState> store) {
    return ScreeningToolsViewModel(
      wait: store.state.wait!,
      toolAssessmentResponses: store.state.serviceRequestState
          ?.screeningToolsState?.toolAssessmentResponses,
    );
  }
}
