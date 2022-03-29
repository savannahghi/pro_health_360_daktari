// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pending_service_request_count.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_PendingServiceRequestCount _$$_PendingServiceRequestCountFromJson(
        Map<String, dynamic> json) =>
    _$_PendingServiceRequestCount(
      clientsServiceRequestCount: json['clientsServiceRequestCount'] == null
          ? null
          : ServiceRequestTypeCount.fromJson(
              json['clientsServiceRequestCount'] as Map<String, dynamic>),
      staffServiceRequestCount: json['staffServiceRequestCount'] == null
          ? null
          : ServiceRequestTypeCount.fromJson(
              json['staffServiceRequestCount'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_PendingServiceRequestCountToJson(
        _$_PendingServiceRequestCount instance) =>
    <String, dynamic>{
      'clientsServiceRequestCount': instance.clientsServiceRequestCount,
      'staffServiceRequestCount': instance.staffServiceRequestCount,
    };
