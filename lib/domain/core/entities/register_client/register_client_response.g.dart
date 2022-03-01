// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_client_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_RegisterClientResponse _$$_RegisterClientResponseFromJson(
        Map<String, dynamic> json) =>
    _$_RegisterClientResponse(
      id: json['ID'] as String?,
      active: json['active'] as bool?,
      clientType: json['clientType'] as String?,
      enrollmentDate: json['enrollmentDate'] as String?,
      fhirPatientID: json['fhirPatientID'] as String?,
      emrHealthRecordID: json['emrHealthRecordID'] as String?,
      treatmentBuddy: json['treatmentBuddy'] as String?,
      counselled: json['counselled'] as bool?,
      organisation: json['organisation'] as String?,
      userID: json['userID'] as String?,
      currentFacilityID: json['currentFacilityID'] as String?,
      chv: json['chv'] as String?,
      caregiver: json['caregiver'] as String?,
    );

Map<String, dynamic> _$$_RegisterClientResponseToJson(
        _$_RegisterClientResponse instance) =>
    <String, dynamic>{
      'ID': instance.id,
      'active': instance.active,
      'clientType': instance.clientType,
      'enrollmentDate': instance.enrollmentDate,
      'fhirPatientID': instance.fhirPatientID,
      'emrHealthRecordID': instance.emrHealthRecordID,
      'treatmentBuddy': instance.treatmentBuddy,
      'counselled': instance.counselled,
      'organisation': instance.organisation,
      'userID': instance.userID,
      'currentFacilityID': instance.currentFacilityID,
      'chv': instance.chv,
      'caregiver': instance.caregiver,
    };
