// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pending_service_requests.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_PendingServiceRequest _$_$_PendingServiceRequestFromJson(
    Map<String, dynamic> json) {
  return _$_PendingServiceRequest(
    total: json['total'] as int?,
    serviceRequestsCount: (json['requestsTypeCount'] as List<dynamic>?)
        ?.map((e) => RequestCountContent.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$_$_PendingServiceRequestToJson(
        _$_PendingServiceRequest instance) =>
    <String, dynamic>{
      'total': instance.total,
      'requestsTypeCount': instance.serviceRequestsCount,
    };
