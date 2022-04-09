// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'health_diary_entry.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_HealthDiaryEdge _$$_HealthDiaryEdgeFromJson(Map<String, dynamic> json) =>
    _$_HealthDiaryEdge(
      healthDiaryEntry: HealthDiaryEntry.fromJson(
          json['getSharedHealthDiaryEntry'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_HealthDiaryEdgeToJson(_$_HealthDiaryEdge instance) =>
    <String, dynamic>{
      'getSharedHealthDiaryEntry': instance.healthDiaryEntry,
    };

_$_HealthDiaryEntry _$$_HealthDiaryEntryFromJson(Map<String, dynamic> json) =>
    _$_HealthDiaryEntry(
      id: json['id'] as String?,
      mood: json['mood'] as String?,
      note: json['note'] as String?,
      entryType: json['entryType'] as String?,
      createdAt: json['createdAt'] as String?,
      active: json['active'] as bool? ?? false,
    );

Map<String, dynamic> _$$_HealthDiaryEntryToJson(_$_HealthDiaryEntry instance) =>
    <String, dynamic>{
      'id': instance.id,
      'mood': instance.mood,
      'note': instance.note,
      'entryType': instance.entryType,
      'createdAt': instance.createdAt,
      'active': instance.active,
    };
