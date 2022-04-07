import 'package:async_redux/async_redux.dart';
import 'package:mycarehubpro/application/redux/states/app_state.dart';
import 'package:mycarehubpro/application/redux/states/service_requests/alcohol_substance_use_state.dart';
import 'package:mycarehubpro/application/redux/states/service_requests/contraceptive_state.dart';
import 'package:mycarehubpro/application/redux/states/service_requests/screening_tools_state.dart';
import 'package:mycarehubpro/application/redux/states/service_requests/tb_state.dart';
import 'package:mycarehubpro/application/redux/states/service_requests/violence_state.dart';
import 'package:mycarehubpro/domain/core/entities/service_requests/tool_type.dart';

class UpdateScreeningToolsStateAction extends ReduxAction<AppState> {
  UpdateScreeningToolsStateAction({
    this.availableTools,
    this.violenceState,
    this.alcoholSubstanceUseState,
    this.contraceptiveState,
    this.tbState,
  });

  List<ToolType>? availableTools;
  ViolenceState? violenceState;
  ContraceptiveState? contraceptiveState;
  TBState? tbState;
  AlcoholSubstanceUseState? alcoholSubstanceUseState;

  @override
  Future<AppState> reduce() async {
    final ScreeningToolsState? screeningToolsState =
        state.serviceRequestState?.screeningToolsState?.copyWith(
      availableTools: availableTools ??
          state.serviceRequestState?.screeningToolsState?.availableTools,
      violenceState: violenceState ??
          state.serviceRequestState?.screeningToolsState?.violenceState,
      alcoholSubstanceUseState: alcoholSubstanceUseState ??
          state.serviceRequestState?.screeningToolsState
              ?.alcoholSubstanceUseState,
      contraceptiveState: contraceptiveState ??
          state.serviceRequestState?.screeningToolsState?.contraceptiveState,
      tbState:
          tbState ?? state.serviceRequestState?.screeningToolsState?.tbState,
    );

    final AppState newState = state.copyWith(
      serviceRequestState: state.serviceRequestState
          ?.copyWith(screeningToolsState: screeningToolsState),
    );

    return newState;
  }
}
