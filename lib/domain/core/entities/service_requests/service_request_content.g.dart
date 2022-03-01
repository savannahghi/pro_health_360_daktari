// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'service_request_content.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ServiceRequestContent _$$_ServiceRequestContentFromJson(
        Map<String, dynamic> json) =>
    _$_ServiceRequestContent(
      description: json['Request'] as String?,
      clientName: json['ClientName'] as String?,
      clientPhoneNumber: json['ClientContact'] as String?,
      serviceRequestType:
          $enumDecodeNullable(_$ServiceRequestTypeEnumMap, json['RequestType']),
      resolvedTime: json['ResolvedAt'] as String?,
      resolvedBy: json['ResolvedBy'] as String?,
    );

Map<String, dynamic> _$$_ServiceRequestContentToJson(
        _$_ServiceRequestContent instance) =>
    <String, dynamic>{
      'Request': instance.description,
      'ClientName': instance.clientName,
      'ClientContact': instance.clientPhoneNumber,
      'RequestType': _$ServiceRequestTypeEnumMap[instance.serviceRequestType],
      'ResolvedAt': instance.resolvedTime,
      'ResolvedBy': instance.resolvedBy,
    };

const _$ServiceRequestTypeEnumMap = {
  ServiceRequestType.RED_FLAG: 'RED_FLAG',
  ServiceRequestType.PIN_RESET: 'PIN_RESET',
  ServiceRequestType.PROFILE_UPDATE: 'PROFILE_UPDATE',
  ServiceRequestType.UNKNOWN: 'UNKNOWN',
};
