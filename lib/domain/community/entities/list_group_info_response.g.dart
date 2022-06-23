// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'list_group_info_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ListGroupInfoResponse _$$_ListGroupInfoResponseFromJson(
        Map<String, dynamic> json) =>
    _$_ListGroupInfoResponse(
      groupMembers: (json['listCommunityMembers'] as List<dynamic>?)
          ?.map((e) => e == null
              ? null
              : GroupMember.fromJson(e as Map<String, dynamic>))
          .toList(),
      communities: (json['listCommunities'] as List<dynamic>?)
          ?.map((e) =>
              e == null ? null : Community.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_ListGroupInfoResponseToJson(
        _$_ListGroupInfoResponse instance) =>
    <String, dynamic>{
      'listCommunityMembers': instance.groupMembers,
      'listCommunities': instance.communities,
    };
