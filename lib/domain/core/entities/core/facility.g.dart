// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'facility.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Facility _$_$_FacilityFromJson(Map<String, dynamic> json) {
  return _$_Facility(
    id: json['id'] as String?,
    name: json['name'] as String?,
    code: json['code'] as int?,
    phone: json['phone'] as String?,
    active: json['active'] as bool? ?? false,
    county: json['county'] as String?,
    description: json['description'] as String?,
  );
}

Map<String, dynamic> _$_$_FacilityToJson(_$_Facility instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'code': instance.code,
      'phone': instance.phone,
      'active': instance.active,
      'county': instance.county,
      'description': instance.description,
    };
