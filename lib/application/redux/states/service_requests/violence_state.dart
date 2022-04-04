import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mycarehubpro/application/redux/states/service_requests/screening_questions_list.dart';

part 'violence_state.g.dart';
part 'violence_state.freezed.dart';

@freezed
class ViolenceState with _$ViolenceState {
  factory ViolenceState({
    List<ScreeningQuestionsList>? screeningQuestionItems,
  }) = _ViolenceState;

  factory ViolenceState.fromJson(Map<String, dynamic> json) =>
      _$ViolenceStateFromJson(json);

  factory ViolenceState.initial() => ViolenceState(
        screeningQuestionItems: <ScreeningQuestionsList>[],
      );
}
