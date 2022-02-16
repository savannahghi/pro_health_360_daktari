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
    serviceRequestType:
        _$enumDecodeNullable(_$ServiceRequestTypeEnumMap, json['RequestType']),
    resolvedTime: json['ResolvedAt'] as String?,
    resolvedBy: json['ResolvedBy'] as String?,
  );
}

Map<String, dynamic> _$_$_ServiceRequestContentToJson(
        _$_ServiceRequestContent instance) =>
    <String, dynamic>{
      'Request': instance.description,
      'ClientName': instance.clientName,
      'ClientContact': instance.clientPhoneNumber,
      'RequestType': _$ServiceRequestTypeEnumMap[instance.serviceRequestType],
      'ResolvedAt': instance.resolvedTime,
      'ResolvedBy': instance.resolvedBy,
    };

K _$enumDecode<K, V>(
  Map<K, V> enumValues,
  Object? source, {
  K? unknownValue,
}) {
  if (source == null) {
    throw ArgumentError(
      'A value must be provided. Supported values: '
      '${enumValues.values.join(', ')}',
    );
  }

  return enumValues.entries.singleWhere(
    (e) => e.value == source,
    orElse: () {
      if (unknownValue == null) {
        throw ArgumentError(
          '`$source` is not one of the supported values: '
          '${enumValues.values.join(', ')}',
        );
      }
      return MapEntry(unknownValue, enumValues.values.first);
    },
  ).key;
}

K? _$enumDecodeNullable<K, V>(
  Map<K, V> enumValues,
  dynamic source, {
  K? unknownValue,
}) {
  if (source == null) {
    return null;
  }
  return _$enumDecode<K, V>(enumValues, source, unknownValue: unknownValue);
}

const _$ServiceRequestTypeEnumMap = {
  ServiceRequestType.RED_FLAG: 'RED_FLAG',
  ServiceRequestType.PIN_RESET: 'PIN_RESET',
  ServiceRequestType.PROFILE_UPDATE: 'PROFILE_UPDATE',
  ServiceRequestType.UNKNOWN: 'UNKNOWN',
};
