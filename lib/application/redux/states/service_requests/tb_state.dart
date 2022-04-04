import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mycarehubpro/application/redux/states/service_requests/screening_questions_list.dart';

part 'tb_state.g.dart';
part 'tb_state.freezed.dart';

@freezed
class TBState with _$TBState {
  factory TBState({
    List<ScreeningQuestionsList>? screeningQuestionItems,
  }) = _TBState;

  factory TBState.fromJson(Map<String, dynamic> json) =>
      _$TBStateFromJson(json);

  factory TBState.initial() => TBState(
        screeningQuestionItems: <ScreeningQuestionsList>[],
      );
}
