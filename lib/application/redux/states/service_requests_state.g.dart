// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'service_requests_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ServiceRequestState _$_$_ServiceRequestStateFromJson(
    Map<String, dynamic> json) {
  return _$_ServiceRequestState(
    serviceRequestContent: (json['getServiceRequests'] as List<dynamic>?)
        ?.map((e) => e == null
            ? null
            : ServiceRequestContent.fromJson(e as Map<String, dynamic>))
        .toList(),
    errorFetchingServiceRequests: json['errorFetchingServiceRequests'] as bool?,
  );
}

Map<String, dynamic> _$_$_ServiceRequestStateToJson(
        _$_ServiceRequestState instance) =>
    <String, dynamic>{
      'getServiceRequests': instance.serviceRequestContent,
      'errorFetchingServiceRequests': instance.errorFetchingServiceRequests,
    };
