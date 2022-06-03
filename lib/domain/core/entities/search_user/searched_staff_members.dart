// Package imports:

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mycarehubpro/domain/core/entities/search_user/search_user_response.dart';

part 'searched_staff_members.freezed.dart';
part 'searched_staff_members.g.dart';

@freezed
class SearchedStaffMembers with _$SearchedStaffMembers {
  factory SearchedStaffMembers({
    @JsonKey(name: 'searchStaffUser')
        List<SearchUserResponse>? staffMembers, // Th
  }) = _SearchedStaffMembers;

  factory SearchedStaffMembers.fromJson(Map<String, dynamic> json) =>
      _$SearchedStaffMembersFromJson(json);
}
