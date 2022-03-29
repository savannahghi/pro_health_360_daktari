// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'service_request_type_count.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ServiceRequestTypeCount _$$_ServiceRequestTypeCountFromJson(
        Map<String, dynamic> json) =>
    _$_ServiceRequestTypeCount(
      requestsTypeCount: (json['requestsTypeCount'] as List<dynamic>?)
          ?.map((e) => ServiceRequestCount.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_ServiceRequestTypeCountToJson(
        _$_ServiceRequestTypeCount instance) =>
    <String, dynamic>{
      'requestsTypeCount': instance.requestsTypeCount,
    };
