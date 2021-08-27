// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'practitioner_kyc_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_PractitionerKYCState _$_$_PractitionerKYCStateFromJson(
    Map<String, dynamic> json) {
  return _$_PractitionerKYCState(
    kycType: _$enumDecodeNullable(_$KYCTypeEnumMap, json['kycType'],
            unknownValue: KYCType.unknown) ??
        KYCType.unknown,
    individualPractitioner: json['individualPractitioner'] == null
        ? null
        : IndividualPractitioner.fromJson(
            json['individualPractitioner'] as Map<String, dynamic>),
    organizationPractitioner: json['organizationPractitioner'] == null
        ? null
        : OrganizationPractitioner.fromJson(
            json['organizationPractitioner'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$_$_PractitionerKYCStateToJson(
        _$_PractitionerKYCState instance) =>
    <String, dynamic>{
      'kycType': _$KYCTypeEnumMap[instance.kycType],
      'individualPractitioner': instance.individualPractitioner,
      'organizationPractitioner': instance.organizationPractitioner,
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

const _$KYCTypeEnumMap = {
  KYCType.unknown: 'unknown',
  KYCType.individualPractitioner: 'individualPractitioner',
  KYCType.organizationPractitioner: 'organizationPractitioner',
};
