// Package imports:
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:prohealth360_daktari/domain/core/entities/community_members/community.dart';
import 'package:stream_chat_flutter/stream_chat_flutter.dart';

part 'communities_state.freezed.dart';
part 'communities_state.g.dart';

@freezed
class CommunitiesState with _$CommunitiesState {
  factory CommunitiesState({
    // invited communities
    List<Community?>? invitedCommunities,

    // flagged messages
    List<Message?>? flaggedMessages,
  }) = _CommunitiesState;

  factory CommunitiesState.fromJson(Map<String, dynamic> json) =>
      _$CommunitiesStateFromJson(json);

  factory CommunitiesState.initial() => CommunitiesState(
        invitedCommunities: <Community>[],
        flaggedMessages: <Message>[],
      );
}
