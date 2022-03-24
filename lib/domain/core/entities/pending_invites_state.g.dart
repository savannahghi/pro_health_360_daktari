// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pending_invites_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_PendingInvitesState _$$_PendingInvitesStateFromJson(
        Map<String, dynamic> json) =>
    _$_PendingInvitesState(
      communitiesList: (json['listPendingInvites'] as List<dynamic>?)
          ?.map((e) => Community.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_PendingInvitesStateToJson(
        _$_PendingInvitesState instance) =>
    <String, dynamic>{
      'listPendingInvites': instance.communitiesList,
    };
