// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'groups_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_GroupState _$$_GroupStateFromJson(Map<String, dynamic> json) =>
    _$_GroupState(
      groupMembers: (json['listCommunityMembers'] as List<dynamic>?)
          ?.map((e) => e == null
              ? null
              : GroupMember.fromJson(e as Map<String, dynamic>))
          .toList(),
      isModerator: json['isModerator'] as bool?,
    );

Map<String, dynamic> _$$_GroupStateToJson(_$_GroupState instance) =>
    <String, dynamic>{
      'listCommunityMembers': instance.groupMembers,
      'isModerator': instance.isModerator,
    };
