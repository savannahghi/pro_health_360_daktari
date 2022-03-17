// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'service_request_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ServiceRequestResponse _$$_ServiceRequestResponseFromJson(
        Map<String, dynamic> json) =>
    _$_ServiceRequestResponse(
      serviceRequestContent: (json['getServiceRequests'] as List<dynamic>?)
          ?.map(
              (e) => ServiceRequestContent.fromJson(e as Map<String, dynamic>))
          .toList(),
      pendingServiceRequests: json['getPendingServiceRequestsCount'] == null
          ? null
          : PendingServiceRequest.fromJson(
              json['getPendingServiceRequestsCount'] as Map<String, dynamic>),
      errorFetchingServiceRequests:
          json['errorFetchingServiceRequests'] as bool?,
    );

Map<String, dynamic> _$$_ServiceRequestResponseToJson(
        _$_ServiceRequestResponse instance) =>
    <String, dynamic>{
      'getServiceRequests': instance.serviceRequestContent,
      'getPendingServiceRequestsCount': instance.pendingServiceRequests,
      'errorFetchingServiceRequests': instance.errorFetchingServiceRequests,
    };
