// Package imports:
import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:prohealth360_daktari/domain/core/entities/community_members/community.dart';

part 'groups_state.freezed.dart';
part 'groups_state.g.dart';

@freezed
class GroupState with _$GroupState {
  factory GroupState({
    @JsonKey(name: 'listCommunityMembers') List<GroupMember?>? groupMembers,
    bool? isModerator,
    bool? isOwner,
    List<Community?>? communities,
  }) = _GroupState;

  factory GroupState.fromJson(Map<String, dynamic> json) =>
      _$GroupStateFromJson(json);

  factory GroupState.initial() => GroupState(
        groupMembers: <GroupMember?>[],
        isModerator: false,
        isOwner: false,
        communities: <Community>[],
      );
}
