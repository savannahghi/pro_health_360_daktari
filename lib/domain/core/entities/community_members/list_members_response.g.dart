// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'list_members_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ListMembersResponse _$$_ListMembersResponseFromJson(
        Map<String, dynamic> json) =>
    _$_ListMembersResponse(
      members: (json['listMembers'] as List<dynamic>?)
          ?.map((e) => Member.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_ListMembersResponseToJson(
        _$_ListMembersResponse instance) =>
    <String, dynamic>{
      'listMembers': instance.members,
    };
