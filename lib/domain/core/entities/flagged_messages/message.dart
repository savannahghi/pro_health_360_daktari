import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mycarehubpro/domain/core/entities/flagged_messages/flagged_message_user.dart';

part 'message.freezed.dart';
part 'message.g.dart';

@freezed
class Message with _$Message {
  factory Message({
    @JsonKey(name: 'id') String? messageID,
    @JsonKey(name: 'text') String? text,
    @JsonKey(name: 'createdAt') String? createdAt,
    @JsonKey(name: 'user') FlaggedMessageUser? user,
  }) = _Message;

  factory Message.fromJson(Map<String, dynamic> json) =>
      _$MessageFromJson(json);

  factory Message.initial() => Message(
        messageID: UNKNOWN,
        text: UNKNOWN,
        createdAt: UNKNOWN,
      );
}
