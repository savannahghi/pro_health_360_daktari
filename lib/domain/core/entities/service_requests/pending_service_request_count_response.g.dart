// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pending_service_request_count_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_PendingServiceRequestsCountResponse
    _$_$_PendingServiceRequestsCountResponseFromJson(
        Map<String, dynamic> json) {
  return _$_PendingServiceRequestsCountResponse(
    pendingServiceRequests: json['getPendingServiceRequestsCount'] == null
        ? null
        : PendingServiceRequest.fromJson(
            json['getPendingServiceRequestsCount'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$_$_PendingServiceRequestsCountResponseToJson(
        _$_PendingServiceRequestsCountResponse instance) =>
    <String, dynamic>{
      'getPendingServiceRequestsCount': instance.pendingServiceRequests,
    };
