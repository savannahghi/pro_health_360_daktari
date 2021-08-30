// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'practitioner.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_IndividualPractitioner _$_$_IndividualPractitionerFromJson(
    Map<String, dynamic> json) {
  return _$_IndividualPractitioner(
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
    kraPin: json['kraPin'] as String,
    kraPinUploadId: json['kraPinUploadId'] as String,
  );
}

Map<String, dynamic> _$_$_IndividualPractitionerToJson(
        _$_IndividualPractitioner instance) =>
    <String, dynamic>{
      'identificationDoc': instance.identificationDoc,
      'supportingDocuments': instance.supportingDocuments,
      'registrationNumber': instance.registrationNumber,
      'practiceLicenseID': instance.practiceLicenseID,
      'practiceLicenseUploadID': instance.practiceLicenseUploadID,
      'practiceServices': instance.practiceServices,
      'cadre': instance.cadre,
      'kraPin': instance.kraPin,
      'kraPinUploadId': instance.kraPinUploadId,
    };

_$_OrganizationPractitioner _$_$_OrganizationPractitionerFromJson(
    Map<String, dynamic> json) {
  return _$_OrganizationPractitioner(
    registrationNumber: json['registrationNumber'] as String?,
    practiceLicenseID: json['practiceLicenseID'] as String?,
    practiceLicenseUploadID: json['practiceLicenseUploadID'] as String?,
    practiceServices: (json['practiceServices'] as List<dynamic>?)
        ?.map((e) => e as String)
        .toList(),
    cadre: json['cadre'] as String?,
    organizationTypeName: json['organizationTypeName'] as String?,
    certificateOfIncorporation: json['certificateOfIncorporation'] as String?,
    certificateOfInCorporationUploadID:
        json['certificateOfInCorporationUploadID'] as String?,
    directorIdentifications: (json['directorIdentifications'] as List<dynamic>?)
        ?.map((e) => Identification.fromJson(e as Map<String, dynamic>))
        .toList(),
    supportingDocuments: (json['supportingDocuments'] as List<dynamic>?)
        ?.map((e) => SupportingDocument.fromJson(e as Map<String, dynamic>))
        .toList(),
    kraPin: json['kraPin'] as String,
    kraPinUploadId: json['kraPinUploadId'] as String,
  );
}

Map<String, dynamic> _$_$_OrganizationPractitionerToJson(
        _$_OrganizationPractitioner instance) =>
    <String, dynamic>{
      'registrationNumber': instance.registrationNumber,
      'practiceLicenseID': instance.practiceLicenseID,
      'practiceLicenseUploadID': instance.practiceLicenseUploadID,
      'practiceServices': instance.practiceServices,
      'cadre': instance.cadre,
      'organizationTypeName': instance.organizationTypeName,
      'certificateOfIncorporation': instance.certificateOfIncorporation,
      'certificateOfInCorporationUploadID':
          instance.certificateOfInCorporationUploadID,
      'directorIdentifications': instance.directorIdentifications,
      'supportingDocuments': instance.supportingDocuments,
      'kraPin': instance.kraPin,
      'kraPinUploadId': instance.kraPinUploadId,
    };
