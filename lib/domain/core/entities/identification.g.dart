// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'identification.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Identification _$_$_IdentificationFromJson(Map<String, dynamic> json) {
  return _$_Identification(
    type: json['type'] as String,
    docNumber: json['docNumber'] as String,
    uploadID: json['uploadID'] as String,
  );
}

Map<String, dynamic> _$_$_IdentificationToJson(_$_Identification instance) =>
    <String, dynamic>{
      'type': instance.type,
      'docNumber': instance.docNumber,
      'uploadID': instance.uploadID,
    };
