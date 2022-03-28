// Package imports:
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mycarehubpro/domain/core/entities/community_members/community.dart';
import 'package:mycarehubpro/domain/core/entities/flagged_messages/flagged_message.dart';

part 'communities_state.freezed.dart';
part 'communities_state.g.dart';

@freezed
class CommunitiesState with _$CommunitiesState {
  factory CommunitiesState({
    // invited communities
    List<Community?>? invitedCommunities,

    // flagged messages
    List<FlaggedMessage?>? flaggedMessages,
  }) = _CommunitiesState;

  factory CommunitiesState.fromJson(Map<String, dynamic> json) =>
      _$CommunitiesStateFromJson(json);

  factory CommunitiesState.initial() => CommunitiesState(
        invitedCommunities: <Community>[],
        flaggedMessages: <FlaggedMessage>[],
      );
}
