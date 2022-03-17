// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'contact.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Contact _$$_ContactFromJson(Map<String, dynamic> json) => _$_Contact(
      id: json['ID'] as String?,
      contactType:
          $enumDecodeNullable(_$ContactTypeEnumMap, json['ContactType']),
      value: json['ContactValue'] as String?,
      active: json['Active'] as bool? ?? false,
      optedIn: json['OptedIn'] as bool? ?? false,
    );

Map<String, dynamic> _$$_ContactToJson(_$_Contact instance) =>
    <String, dynamic>{
      'ID': instance.id,
      'ContactType': _$ContactTypeEnumMap[instance.contactType],
      'ContactValue': instance.value,
      'Active': instance.active,
      'OptedIn': instance.optedIn,
    };

const _$ContactTypeEnumMap = {
  ContactType.PHONE: 'PHONE',
  ContactType.EMAIL: 'EMAIL',
  ContactType.UNKNOWN: 'UNKNOWN',
};
