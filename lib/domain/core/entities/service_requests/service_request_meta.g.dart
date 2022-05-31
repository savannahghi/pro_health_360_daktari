// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'service_request_meta.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ServiceRequestMeta _$$_ServiceRequestMetaFromJson(
        Map<String, dynamic> json) =>
    _$_ServiceRequestMeta(
      cccNumber: json['ccc_number'] as String?,
      isCccNumberValid: json['is_ccc_number_valid'] as bool?,
      note: json['note'] as String?,
    );

Map<String, dynamic> _$$_ServiceRequestMetaToJson(
        _$_ServiceRequestMeta instance) =>
    <String, dynamic>{
      'ccc_number': instance.cccNumber,
      'is_ccc_number_valid': instance.isCccNumberValid,
      'note': instance.note,
    };
