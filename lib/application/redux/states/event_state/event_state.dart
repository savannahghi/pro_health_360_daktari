// Package imports:
import 'package:domain_objects/value_objects.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'event_state.freezed.dart';
part 'event_state.g.dart';

@freezed
class EventState with _$EventState {
  factory EventState({String? eventName, String? eventPayload}) = _EventState;

  factory EventState.fromJson(Map<String, dynamic> json) =>
      _$EventStateFromJson(json);

  factory EventState.initial() => EventState(
        eventName: UNKNOWN,
        eventPayload: UNKNOWN,
      );
}
