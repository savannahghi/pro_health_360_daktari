// Package imports:
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:myharehubpro/domain/core/entities/community_members/member.dart';

part 'group_member.freezed.dart';
part 'group_member.g.dart';

@freezed
class GroupMember with _$GroupMember {
  factory GroupMember({
    @JsonKey(name: 'user') Member? memberDetails,
  }) = _GroupMember;

  factory GroupMember.fromJson(Map<String, dynamic> json) => _$GroupMemberFromJson(json);

  factory GroupMember.initial() => GroupMember(
    memberDetails: Member.initial(),
      );
}