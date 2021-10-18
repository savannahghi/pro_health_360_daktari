// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification_details.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_NotificationDetails _$_$_NotificationDetailsFromJson(
    Map<String, dynamic> json) {
  return _$_NotificationDetails(
    icon: IconDetails.fromJson(json['icon'] as Map<String, dynamic>),
    description: json['description'] as String,
    date: json['date'] as String,
    actions: (json['actions'] as List<dynamic>?)
        ?.map((e) => NotificationActions.fromJson(e as Map<String, dynamic>))
        .toList(),
    status: json['status'] as String?,
  );
}

Map<String, dynamic> _$_$_NotificationDetailsToJson(
        _$_NotificationDetails instance) =>
    <String, dynamic>{
      'icon': instance.icon,
      'description': instance.description,
      'date': instance.date,
      'actions': instance.actions,
      'status': instance.status,
    };
