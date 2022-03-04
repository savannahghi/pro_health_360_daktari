// Package imports:
import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:myharehubpro/application/core/services/utils.dart';

part 'member.freezed.dart';
part 'member.g.dart';

@freezed
class Member with _$Member {
  factory Member({
    @JsonKey(name: 'ID') String? id,
    @JsonKey(name: 'userID') String? userID,
    @JsonKey(name: 'name') String? name,
    @JsonKey(name: 'role') String? role,
    @JsonKey(name: 'username') String? username,
    @JsonKey(name: 'gender', fromJson: genderFromJson, toJson: genderToJson)
        Gender? gender,
  }) = _Member;

  factory Member.fromJson(Map<String, dynamic> json) => _$MemberFromJson(json);

  factory Member.initial() => Member(
        id: UNKNOWN,
        userID: UNKNOWN,
        name: UNKNOWN,
        role: UNKNOWN,
        username: UNKNOWN,
        gender: Gender.unknown,
      );
}
