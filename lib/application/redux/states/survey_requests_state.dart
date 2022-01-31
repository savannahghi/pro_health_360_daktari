// Package imports:
import 'package:freezed_annotation/freezed_annotation.dart';

part 'survey_requests_state.freezed.dart';
part 'survey_requests_state.g.dart';

@freezed
class ServiceRequestState with _$ServiceRequestState {
  factory ServiceRequestState() = _ServiceRequestState;

  factory ServiceRequestState.fromJson(Map<String, dynamic> json) =>
      _$ServiceRequestStateFromJson(json);

  factory ServiceRequestState.initial() => ServiceRequestState();
}
