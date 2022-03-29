// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'service_requests_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ServiceRequestState _$$_ServiceRequestStateFromJson(
        Map<String, dynamic> json) =>
    _$_ServiceRequestState(
      clientServiceRequests: (json['clientServiceRequests'] as List<dynamic>?)
          ?.map((e) => ServiceRequest.fromJson(e as Map<String, dynamic>))
          .toList(),
      staffServiceRequests: (json['staffServiceRequests'] as List<dynamic>?)
          ?.map((e) => ServiceRequest.fromJson(e as Map<String, dynamic>))
          .toList(),
      pendingServiceRequestsCount: json['pendingServiceRequestsCount'] == null
          ? null
          : PendingServiceRequestCount.fromJson(
              json['pendingServiceRequestsCount'] as Map<String, dynamic>),
      errorFetchingPendingServiceRequests:
          json['errorFetchingPendingServiceRequests'] as bool?,
    );

Map<String, dynamic> _$$_ServiceRequestStateToJson(
        _$_ServiceRequestState instance) =>
    <String, dynamic>{
      'clientServiceRequests': instance.clientServiceRequests,
      'staffServiceRequests': instance.staffServiceRequests,
      'pendingServiceRequestsCount': instance.pendingServiceRequestsCount,
      'errorFetchingPendingServiceRequests':
          instance.errorFetchingPendingServiceRequests,
    };
