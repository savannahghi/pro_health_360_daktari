// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'service_requests_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ServiceRequestsResponse _$_$_ServiceRequestsResponseFromJson(
    Map<String, dynamic> json) {
  return _$_ServiceRequestsResponse(
    ServiceRequest: (json['getServiceRequests'] as List<dynamic>?)
        ?.map((e) => ServiceRequest.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$_$_ServiceRequestsResponseToJson(
        _$_ServiceRequestsResponse instance) =>
    <String, dynamic>{
      'getServiceRequests': instance.ServiceRequest,
    };
