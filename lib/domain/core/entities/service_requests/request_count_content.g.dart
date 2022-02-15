// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'request_count_content.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_RequestCountContent _$_$_RequestCountContentFromJson(
    Map<String, dynamic> json) {
  return _$_RequestCountContent(
    requestType:
        _$enumDecodeNullable(_$ServiceRequestTypeEnumMap, json['requestType']),
    count: json['total'] as int?,
  );
}

Map<String, dynamic> _$_$_RequestCountContentToJson(
        _$_RequestCountContent instance) =>
    <String, dynamic>{
      'requestType': _$ServiceRequestTypeEnumMap[instance.requestType],
      'total': instance.count,
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
