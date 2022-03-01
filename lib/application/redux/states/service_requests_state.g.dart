// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'service_requests_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ServiceRequestState _$$_ServiceRequestStateFromJson(
        Map<String, dynamic> json) =>
    _$_ServiceRequestState(
      serviceRequestContent: (json['getServiceRequests'] as List<dynamic>?)
          ?.map((e) => e == null
              ? null
              : ServiceRequestContent.fromJson(e as Map<String, dynamic>))
          .toList(),
      pendingServiceRequests: json['getPendingServiceRequestsCount'] == null
          ? null
          : PendingServiceRequest.fromJson(
              json['getPendingServiceRequestsCount'] as Map<String, dynamic>),
      errorFetchingServiceRequests:
          json['errorFetchingServiceRequests'] as bool?,
    );

Map<String, dynamic> _$$_ServiceRequestStateToJson(
        _$_ServiceRequestState instance) =>
    <String, dynamic>{
      'getServiceRequests': instance.serviceRequestContent,
      'getPendingServiceRequestsCount': instance.pendingServiceRequests,
      'errorFetchingServiceRequests': instance.errorFetchingServiceRequests,
    };
