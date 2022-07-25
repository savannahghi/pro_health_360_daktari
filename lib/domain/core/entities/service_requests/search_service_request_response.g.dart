// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_service_request_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_SearchServiceRequestResponse _$$_SearchServiceRequestResponseFromJson(
        Map<String, dynamic> json) =>
    _$_SearchServiceRequestResponse(
      serviceRequests: (json['searchServiceRequests'] as List<dynamic>?)
          ?.map((e) => ServiceRequest.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_SearchServiceRequestResponseToJson(
        _$_SearchServiceRequestResponse instance) =>
    <String, dynamic>{
      'searchServiceRequests': instance.serviceRequests,
    };
