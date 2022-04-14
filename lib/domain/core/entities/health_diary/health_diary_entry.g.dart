// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'health_diary_entry.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_HealthDiaryEdge _$$_HealthDiaryEdgeFromJson(Map<String, dynamic> json) =>
    _$_HealthDiaryEdge(
      healthDiaryEntry: (json['getSharedHealthDiaryEntries'] as List<dynamic>)
          .map((e) => HealthDiaryEntry.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_HealthDiaryEdgeToJson(_$_HealthDiaryEdge instance) =>
    <String, dynamic>{
      'getSharedHealthDiaryEntries': instance.healthDiaryEntry,
    };

_$_HealthDiaryEntry _$$_HealthDiaryEntryFromJson(Map<String, dynamic> json) =>
    _$_HealthDiaryEntry(
      id: json['id'] as String?,
      mood: json['mood'] as String?,
      note: json['note'] as String?,
      sharedAt: json['sharedAt'] as String?,
      active: json['active'] as bool? ?? false,
    );

Map<String, dynamic> _$$_HealthDiaryEntryToJson(_$_HealthDiaryEntry instance) =>
    <String, dynamic>{
      'id': instance.id,
      'mood': instance.mood,
      'note': instance.note,
      'sharedAt': instance.sharedAt,
      'active': instance.active,
    };
