// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notifications_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_NotificationsData _$$_NotificationsDataFromJson(Map<String, dynamic> json) =>
    _$_NotificationsData(
      notifications: (json['notifications'] as List<dynamic>)
          .map((e) => NotificationDetails.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_NotificationsDataToJson(
        _$_NotificationsData instance) =>
    <String, dynamic>{
      'notifications': instance.notifications,
    };
