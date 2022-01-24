// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'event_object.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_EventObject _$_$_EventObjectFromJson(Map<String, dynamic> json) {
  return _$_EventObject(
    firstName: json['first_name'] as String?,
    lastName: json['last_name'] as String?,
    uid: json['uid'] as String?,
    route: json['route'] as String?,
    primaryPhoneNumber: json['primary_phonenumber'] as String?,
    timestamp: json['timestamp'] == null
        ? null
        : DateTime.parse(json['timestamp'] as String),
    flavour: json['flavour'] as String?,
    appVersion: json['app_version'] as String? ?? 'dev-build',
  );
}

Map<String, dynamic> _$_$_EventObjectToJson(_$_EventObject instance) =>
    <String, dynamic>{
      'first_name': instance.firstName,
      'last_name': instance.lastName,
      'uid': instance.uid,
      'route': instance.route,
      'primary_phonenumber': instance.primaryPhoneNumber,
      'timestamp': instance.timestamp?.toIso8601String(),
      'flavour': instance.flavour,
      'app_version': instance.appVersion,
    };
