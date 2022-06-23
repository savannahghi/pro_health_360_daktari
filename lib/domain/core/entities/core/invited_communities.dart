// Package imports:
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:prohealth360_daktari/domain/core/entities/community_members/community.dart';

part 'invited_communities.freezed.dart';
part 'invited_communities.g.dart';

@freezed
class InvitedCommunities with _$InvitedCommunities {
  factory InvitedCommunities({
    @JsonKey(name: 'invitedCommunities') List<Community>? invitedCommunities,
  }) = _InvitedCommunities;

  factory InvitedCommunities.fromJson(Map<String, dynamic> json) =>
      _$InvitedCommunitiesFromJson(json);

  factory InvitedCommunities.initial() => InvitedCommunities(
        invitedCommunities: <Community>[],
      );
}
