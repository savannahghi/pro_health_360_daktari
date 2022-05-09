// Package imports:
import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'list_members_response.freezed.dart';
part 'list_members_response.g.dart';

@freezed
class ListMembersResponse with _$ListMembersResponse {
  factory ListMembersResponse({
    @JsonKey(name: 'listMembers') List<Member>? members,
  }) = _ListMembersResponse;

  factory ListMembersResponse.fromJson(Map<String, dynamic> json) =>
      _$ListMembersResponseFromJson(json);
}
