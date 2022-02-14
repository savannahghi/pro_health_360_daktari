// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'service_request_content.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ServiceRequestContent _$_$_ServiceRequestContentFromJson(
    Map<String, dynamic> json) {
  return _$_ServiceRequestContent(
    description: json['Request'] as String?,
    clientName: json['ClientName'] as String?,
    clientPhoneNumber: json['ClientContact'] as String?,
  );
}

Map<String, dynamic> _$_$_ServiceRequestContentToJson(
        _$_ServiceRequestContent instance) =>
    <String, dynamic>{
      'Request': instance.description,
      'ClientName': instance.clientName,
      'ClientContact': instance.clientPhoneNumber,
    };
