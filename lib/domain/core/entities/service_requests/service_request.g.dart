// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'service_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ServiceRequest _$$_ServiceRequestFromJson(Map<String, dynamic> json) =>
    _$_ServiceRequest(
      id: json['ID'] as String?,
      description: json['Request'] as String?,
      serviceRequestType:
          $enumDecodeNullable(_$ServiceRequestTypeEnumMap, json['RequestType']),
      clientId: json['ClientID'] as String?,
      clientName: json['ClientName'] as String?,
      clientPhoneNumber: json['ClientContact'] as String?,
      status: $enumDecodeNullable(_$RequestStatusEnumMap, json['Status']),
      resolvedTime: json['ResolvedAt'] as String?,
      resolvedBy: json['ResolvedBy'] as String?,
      resolvedByName: json['ResolvedByName'] as String?,
      createdAt: json['CreatedAt'] as String?,
      meta: json['Meta'] == null
          ? null
          : ServiceRequestMeta.fromJson(json['Meta'] as Map<String, dynamic>),
      staffId: json['StaffID'] as String?,
      staffName: json['StaffName'] as String?,
      staffPhoneNumber: json['StaffContact'] as String?,
    );

Map<String, dynamic> _$$_ServiceRequestToJson(_$_ServiceRequest instance) =>
    <String, dynamic>{
      'ID': instance.id,
      'Request': instance.description,
      'RequestType': _$ServiceRequestTypeEnumMap[instance.serviceRequestType],
      'ClientID': instance.clientId,
      'ClientName': instance.clientName,
      'ClientContact': instance.clientPhoneNumber,
      'Status': _$RequestStatusEnumMap[instance.status],
      'ResolvedAt': instance.resolvedTime,
      'ResolvedBy': instance.resolvedBy,
      'ResolvedByName': instance.resolvedByName,
      'CreatedAt': instance.createdAt,
      'Meta': instance.meta,
      'StaffID': instance.staffId,
      'StaffName': instance.staffName,
      'StaffContact': instance.staffPhoneNumber,
    };

const _$ServiceRequestTypeEnumMap = {
  ServiceRequestType.RED_FLAG: 'RED_FLAG',
  ServiceRequestType.PIN_RESET: 'PIN_RESET',
  ServiceRequestType.PROFILE_UPDATE: 'PROFILE_UPDATE',
  ServiceRequestType.STAFF_PIN_RESET: 'STAFF_PIN_RESET',
  ServiceRequestType.UNKNOWN: 'UNKNOWN',
};

const _$RequestStatusEnumMap = {
  RequestStatus.PENDING: 'PENDING',
  RequestStatus.RESOLVED: 'RESOLVED',
  RequestStatus.IN_PROGRESS: 'IN_PROGRESS',
  RequestStatus.UNKNOWN: 'UNKNOWN',
};
