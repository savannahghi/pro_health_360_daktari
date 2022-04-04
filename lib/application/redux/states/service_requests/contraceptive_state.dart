import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mycarehubpro/application/redux/states/service_requests/screening_questions_list.dart';

part 'contraceptive_state.g.dart';
part 'contraceptive_state.freezed.dart';

@freezed
class ContraceptiveState with _$ContraceptiveState {
  factory ContraceptiveState({
    List<ScreeningQuestionsList>? screeningQuestionItems,
  }) = _ContraceptiveState;

  factory ContraceptiveState.fromJson(Map<String, dynamic> json) =>
      _$ContraceptiveStateFromJson(json);

  factory ContraceptiveState.initial() => ContraceptiveState(
        screeningQuestionItems: <ScreeningQuestionsList>[],
      );
}
