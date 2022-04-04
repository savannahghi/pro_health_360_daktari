import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mycarehubpro/application/redux/states/service_requests/screening_questions_list.dart';

part 'alcohol_substance_use_state.g.dart';
part 'alcohol_substance_use_state.freezed.dart';

@freezed
class AlcoholSubstanceUseState with _$AlcoholSubstanceUseState {
  factory AlcoholSubstanceUseState({
        List<ScreeningQuestionsList>? screeningQuestionItems,
  }) = _AlcoholSubstanceUseState;

  factory AlcoholSubstanceUseState.fromJson(Map<String, dynamic> json) =>
      _$AlcoholSubstanceUseStateFromJson(json);

  factory AlcoholSubstanceUseState.initial() => AlcoholSubstanceUseState(
        screeningQuestionItems: <ScreeningQuestionsList>[],
      );
}
