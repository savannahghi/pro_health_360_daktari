// Package imports:
import 'package:freezed_annotation/freezed_annotation.dart';
// Project imports:
import 'package:prohealth360_daktari/domain/core/entities/community_members/community.dart';

part 'pending_invites_state.freezed.dart';
part 'pending_invites_state.g.dart';

@freezed
class PendingInvitesState with _$PendingInvitesState {
  factory PendingInvitesState({
    @JsonKey(name: 'listPendingInvites') List<Community>? communitiesList,
  }) = _PendingInvitesState;

  factory PendingInvitesState.fromJson(Map<String, dynamic> json) =>
      _$PendingInvitesStateFromJson(json);

  factory PendingInvitesState.initial() => PendingInvitesState(
        communitiesList: <Community>[],
      );
}
