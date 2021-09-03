// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'practitioner_kyc_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_PractitionerKYCState _$_$_PractitionerKYCStateFromJson(
    Map<String, dynamic> json) {
  return _$_PractitionerKYCState(
    identificationDoc: json['identificationDoc'] == null
        ? null
        : Identification.fromJson(
            json['identificationDoc'] as Map<String, dynamic>),
    supportingDocuments: (json['supportingDocuments'] as List<dynamic>?)
        ?.map((e) => SupportingDocument.fromJson(e as Map<String, dynamic>))
        .toList(),
    registrationNumber: json['registrationNumber'] as String?,
    practiceLicenseID: json['practiceLicenseID'] as String?,
    practiceLicenseUploadID: json['practiceLicenseUploadID'] as String?,
    practiceServices: (json['practiceServices'] as List<dynamic>?)
        ?.map((e) => e as String)
        .toList(),
    cadre: json['cadre'] as String?,
    practitionerSetupComplete:
        json['practitionerSetupComplete'] as bool? ?? false,
    kycSubmitted: json['kycSubmitted'] as bool? ?? false,
    kraPin: json['kraPin'] as String,
    kraPinUploadId: json['kraPinUploadId'] as String,
    kycType: _$enumDecodeNullable(_$KYCTypeEnumMap, json['kycType'],
            unknownValue: KYCType.Unknown) ??
        KYCType.Unknown,
  );
}

Map<String, dynamic> _$_$_PractitionerKYCStateToJson(
        _$_PractitionerKYCState instance) =>
    <String, dynamic>{
      'identificationDoc': instance.identificationDoc,
      'supportingDocuments': instance.supportingDocuments,
      'registrationNumber': instance.registrationNumber,
      'practiceLicenseID': instance.practiceLicenseID,
      'practiceLicenseUploadID': instance.practiceLicenseUploadID,
      'practiceServices': instance.practiceServices,
      'cadre': instance.cadre,
      'practitionerSetupComplete': instance.practitionerSetupComplete,
      'kycSubmitted': instance.kycSubmitted,
      'kraPin': instance.kraPin,
      'kraPinUploadId': instance.kraPinUploadId,
      'kycType': _$KYCTypeEnumMap[instance.kycType],
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
  KYCType.Unknown: 'Unknown',
  KYCType.PractitionerKYCState: 'PractitionerKYCState',
};
