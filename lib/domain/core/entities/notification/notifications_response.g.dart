// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notifications_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_NotificationsResponse _$$_NotificationsResponseFromJson(
        Map<String, dynamic> json) =>
    _$_NotificationsResponse(
      data: NotificationsData.fromJson(
          json['fetchNotifications'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_NotificationsResponseToJson(
        _$_NotificationsResponse instance) =>
    <String, dynamic>{
      'fetchNotifications': instance.data,
    };
