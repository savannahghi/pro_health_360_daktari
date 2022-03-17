// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'service_requests_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ServiceRequestState _$$_ServiceRequestStateFromJson(
        Map<String, dynamic> json) =>
    _$_ServiceRequestState(
      serviceRequestContent:
          (json['serviceRequestContent'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(
            k, ServiceRequestContent.fromJson(e as Map<String, dynamic>)),
      ),
      pendingServiceRequests: json['pendingServiceRequests'] == null
          ? null
          : PendingServiceRequest.fromJson(
              json['pendingServiceRequests'] as Map<String, dynamic>),
      errorFetchingServiceRequests:
          json['errorFetchingServiceRequests'] as bool?,
    );

Map<String, dynamic> _$$_ServiceRequestStateToJson(
        _$_ServiceRequestState instance) =>
    <String, dynamic>{
      'serviceRequestContent': instance.serviceRequestContent,
      'pendingServiceRequests': instance.pendingServiceRequests,
      'errorFetchingServiceRequests': instance.errorFetchingServiceRequests,
    };
