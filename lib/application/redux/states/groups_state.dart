// Package imports:
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mycarehubpro/domain/core/entities/community_members/group_member.dart';

part 'groups_state.freezed.dart';
part 'groups_state.g.dart';

@freezed
class GroupState with _$GroupState {
  factory GroupState({
    @JsonKey(name: 'listCommunityMembers') List<GroupMember?>? groupMembers,
  }) = _GroupState;

  factory GroupState.fromJson(Map<String, dynamic> json) =>
      _$GroupStateFromJson(json);

  factory GroupState.initial() => GroupState(groupMembers: <GroupMember?>[]);
}
