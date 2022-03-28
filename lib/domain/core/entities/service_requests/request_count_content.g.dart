// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'request_count_content.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_RequestCountContent _$$_RequestCountContentFromJson(
        Map<String, dynamic> json) =>
    _$_RequestCountContent(
      requestType:
          $enumDecodeNullable(_$ServiceRequestTypeEnumMap, json['requestType']),
      count: json['total'] as int?,
    );

Map<String, dynamic> _$$_RequestCountContentToJson(
        _$_RequestCountContent instance) =>
    <String, dynamic>{
      'requestType': _$ServiceRequestTypeEnumMap[instance.requestType],
      'total': instance.count,
    };

const _$ServiceRequestTypeEnumMap = {
  ServiceRequestType.RED_FLAG: 'RED_FLAG',
  ServiceRequestType.PIN_RESET: 'PIN_RESET',
  ServiceRequestType.PROFILE_UPDATE: 'PROFILE_UPDATE',
  ServiceRequestType.STAFF_PIN_RESET: 'STAFF_PIN_RESET',
  ServiceRequestType.UNKNOWN: 'UNKNOWN',
};
