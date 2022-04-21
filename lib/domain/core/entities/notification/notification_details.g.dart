// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification_details.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_NotificationDetails _$$_NotificationDetailsFromJson(
        Map<String, dynamic> json) =>
    _$_NotificationDetails(
      id: json['id'] as String?,
      title: json['title'] as String?,
      body: json['body'] as String?,
      type: json['type'] as String?,
      isRead: json['isRead'] as bool? ?? false,
      icon: json['icon'] == null
          ? null
          : IconDetails.fromJson(json['icon'] as Map<String, dynamic>),
      date: json['date'] as String?,
      actions: (json['actions'] as List<dynamic>?)
          ?.map((e) => NotificationActions.fromJson(e as Map<String, dynamic>))
          .toList(),
      status: json['status'] as String?,
    );

Map<String, dynamic> _$$_NotificationDetailsToJson(
        _$_NotificationDetails instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'body': instance.body,
      'type': instance.type,
      'isRead': instance.isRead,
      'icon': instance.icon,
      'date': instance.date,
      'actions': instance.actions,
      'status': instance.status,
    };
