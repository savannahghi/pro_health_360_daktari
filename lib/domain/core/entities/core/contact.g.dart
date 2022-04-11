// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'contact.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Contact _$$_ContactFromJson(Map<String, dynamic> json) => _$_Contact(
      id: json['id'] as String?,
      contactType:
          $enumDecodeNullable(_$ContactTypeEnumMap, json['contactType']),
      value: json['contactValue'] as String?,
      active: json['active'] as bool? ?? false,
      optedIn: json['optedIn'] as bool? ?? false,
    );

Map<String, dynamic> _$$_ContactToJson(_$_Contact instance) =>
    <String, dynamic>{
      'id': instance.id,
      'contactType': _$ContactTypeEnumMap[instance.contactType],
      'contactValue': instance.value,
      'active': instance.active,
      'optedIn': instance.optedIn,
    };

const _$ContactTypeEnumMap = {
  ContactType.PHONE: 'PHONE',
  ContactType.EMAIL: 'EMAIL',
  ContactType.UNKNOWN: 'UNKNOWN',
};
