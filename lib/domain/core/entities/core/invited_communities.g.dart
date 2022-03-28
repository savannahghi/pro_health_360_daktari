// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'invited_communities.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_InvitedCommunities _$$_InvitedCommunitiesFromJson(
        Map<String, dynamic> json) =>
    _$_InvitedCommunities(
      invitedCommunities: (json['invitedCommunities'] as List<dynamic>?)
          ?.map((e) => Community.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_InvitedCommunitiesToJson(
        _$_InvitedCommunities instance) =>
    <String, dynamic>{
      'invitedCommunities': instance.invitedCommunities,
    };
