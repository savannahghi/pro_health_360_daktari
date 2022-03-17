// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'client_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ClientResponse _$$_ClientResponseFromJson(Map<String, dynamic> json) =>
    _$_ClientResponse(
      userId: json['ID'] as String?,
      userName: json['Username'] as String?,
      termsAccepted: json['TermsAccepted'] as bool? ?? false,
      active: json['Active'] as bool? ?? false,
      primaryContact: json['Contacts'] == null
          ? null
          : Contact.fromJson(json['Contacts'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_ClientResponseToJson(_$_ClientResponse instance) =>
    <String, dynamic>{
      'ID': instance.userId,
      'Username': instance.userName,
      'TermsAccepted': instance.termsAccepted,
      'Active': instance.active,
      'Contacts': instance.primaryContact,
    };
