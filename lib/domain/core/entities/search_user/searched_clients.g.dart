// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'searched_clients.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_SearchedClients _$$_SearchedClientsFromJson(Map<String, dynamic> json) =>
    _$_SearchedClients(
      clients: (json['searchClientUser'] as List<dynamic>?)
          ?.map((e) => SearchUserResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_SearchedClientsToJson(_$_SearchedClients instance) =>
    <String, dynamic>{
      'searchClientUser': instance.clients,
    };
