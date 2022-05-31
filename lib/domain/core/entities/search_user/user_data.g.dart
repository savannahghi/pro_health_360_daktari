// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UserData _$$_UserDataFromJson(Map<String, dynamic> json) => _$_UserData(
      id: json['ID'] as String?,
      userName: json['Username'] as String?,
      termsAccepted: json['TermsAccepted'] as bool? ?? false,
      active: json['Active'] as bool? ?? false,
      primaryContact: json['Contacts'] == null
          ? null
          : Contact.fromJson(json['Contacts'] as Map<String, dynamic>),
      name: json['Name'] as String?,
    );

Map<String, dynamic> _$$_UserDataToJson(_$_UserData instance) =>
    <String, dynamic>{
      'ID': instance.id,
      'Username': instance.userName,
      'TermsAccepted': instance.termsAccepted,
      'Active': instance.active,
      'Contacts': instance.primaryContact,
      'Name': instance.name,
    };
