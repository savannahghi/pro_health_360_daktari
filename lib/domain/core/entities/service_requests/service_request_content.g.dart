// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'service_request_content.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ServiceRequestContent _$$_ServiceRequestContentFromJson(
        Map<String, dynamic> json) =>
    _$_ServiceRequestContent(
      id: json['ID'] as String?,
      description: json['Request'] as String?,
      serviceRequestType:
          $enumDecodeNullable(_$ServiceRequestTypeEnumMap, json['RequestType']),
      clientId: json['ClientID'] as String?,
      clientName: json['ClientName'] as String?,
      clientPhoneNumber: json['ClientContact'] as String?,
      status: $enumDecodeNullable(_$RequestStatusEnumMap, json['Status']),
      cccNumber: json['CCCNumber'] as String?,
      resolvedTime: json['ResolvedAt'] as String?,
      resolvedBy: json['ResolvedBy'] as String?,
    );

Map<String, dynamic> _$$_ServiceRequestContentToJson(
        _$_ServiceRequestContent instance) =>
    <String, dynamic>{
      'ID': instance.id,
      'Request': instance.description,
      'RequestType': _$ServiceRequestTypeEnumMap[instance.serviceRequestType],
      'ClientID': instance.clientId,
      'ClientName': instance.clientName,
      'ClientContact': instance.clientPhoneNumber,
      'Status': _$RequestStatusEnumMap[instance.status],
      'CCCNumber': instance.cccNumber,
      'ResolvedAt': instance.resolvedTime,
      'ResolvedBy': instance.resolvedBy,
    };

const _$ServiceRequestTypeEnumMap = {
  ServiceRequestType.RED_FLAG: 'RED_FLAG',
  ServiceRequestType.PIN_RESET: 'PIN_RESET',
  ServiceRequestType.PROFILE_UPDATE: 'PROFILE_UPDATE',
  ServiceRequestType.UNKNOWN: 'UNKNOWN',
};

const _$RequestStatusEnumMap = {
  RequestStatus.PENDING: 'PENDING',
  RequestStatus.RESOLVED: 'RESOLVED',
  RequestStatus.IN_PROGRESS: 'IN_PROGRESS',
  RequestStatus.UNKNOWN: 'UNKNOWN',
};
