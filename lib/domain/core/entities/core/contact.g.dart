// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'contact.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Contact _$_$_ContactFromJson(Map<String, dynamic> json) {
  return _$_Contact(
    contactType:
        _$enumDecodeNullable(_$ContactTypeEnumMap, json['contactType']),
    value: json['contactValue'] as String?,
    active: json['active'] as bool? ?? false,
    optedIn: json['optedIn'] as bool? ?? false,
  );
}

Map<String, dynamic> _$_$_ContactToJson(_$_Contact instance) =>
    <String, dynamic>{
      'contactType': _$ContactTypeEnumMap[instance.contactType],
      'contactValue': instance.value,
      'active': instance.active,
      'optedIn': instance.optedIn,
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

const _$ContactTypeEnumMap = {
  ContactType.PHONE: 'PHONE',
  ContactType.EMAIL: 'EMAIL',
  ContactType.UNKNOWN: 'UNKNOWN',
};
