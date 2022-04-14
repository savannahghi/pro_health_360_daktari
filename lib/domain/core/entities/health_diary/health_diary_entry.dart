// Package imports:

import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'health_diary_entry.freezed.dart';
part 'health_diary_entry.g.dart';

@freezed
class HealthDiaryEdge with _$HealthDiaryEdge {
  factory HealthDiaryEdge({
    @JsonKey(name: 'getSharedHealthDiaryEntries')
        required List<HealthDiaryEntry> healthDiaryEntry,
  }) = _HealthDiaryEdge;

  factory HealthDiaryEdge.fromJson(Map<String, dynamic> json) =>
      _$HealthDiaryEdgeFromJson(json);
}

@freezed
class HealthDiaryEntry with _$HealthDiaryEntry {
  factory HealthDiaryEntry({
    @JsonKey(name: 'id') String? id,
    @JsonKey(name: 'mood') String? mood,
    @JsonKey(name: 'note') String? note,
    @JsonKey(name: 'sharedAt') String? sharedAt,
    @JsonKey(name: 'active', defaultValue: false) bool? active,
  }) = _HealthDiaryEntry;

  factory HealthDiaryEntry.fromJson(Map<String, dynamic> json) =>
      _$HealthDiaryEntryFromJson(json);

  factory HealthDiaryEntry.initial() => HealthDiaryEntry(
        mood: UNKNOWN,
        note: UNKNOWN,
        sharedAt: UNKNOWN,
        active: false,
        id: UNKNOWN,
      );
}
