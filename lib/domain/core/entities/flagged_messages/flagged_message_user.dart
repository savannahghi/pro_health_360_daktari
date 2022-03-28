import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'flagged_message_user.freezed.dart';
part 'flagged_message_user.g.dart';

@freezed
class FlaggedMessageUser with _$FlaggedMessageUser {
  factory FlaggedMessageUser({
    @JsonKey(name: 'userID') String? userID,
    @JsonKey(name: 'name') String? name,
    @JsonKey(name: 'username') String? username,
  }) = _FlaggedMessageUser;

  factory FlaggedMessageUser.fromJson(Map<String, dynamic> json) =>
      _$FlaggedMessageUserFromJson(json);

  factory FlaggedMessageUser.initial() => FlaggedMessageUser(
        userID: UNKNOWN,
        name: UNKNOWN,
        username: UNKNOWN,
      );
}
