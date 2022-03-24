// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'communities_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_CommunitiesState _$$_CommunitiesStateFromJson(Map<String, dynamic> json) =>
    _$_CommunitiesState(
      invitedCommunities: (json['invitedCommunities'] as List<dynamic>?)
          ?.map((e) => Community.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_CommunitiesStateToJson(_$_CommunitiesState instance) =>
    <String, dynamic>{
      'invitedCommunities': instance.invitedCommunities,
    };
