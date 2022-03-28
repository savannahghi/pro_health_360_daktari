import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mycarehubpro/domain/core/entities/flagged_messages/message.dart';

part 'flagged_message.freezed.dart';
part 'flagged_message.g.dart';

@freezed
class FlaggedMessage with _$FlaggedMessage {
  factory FlaggedMessage({@JsonKey(name: 'message') Message? message}) =
      _FlaggedMessage;

  factory FlaggedMessage.fromJson(Map<String, dynamic> json) =>
      _$FlaggedMessageFromJson(json);

  factory FlaggedMessage.initial() => FlaggedMessage(
        message: Message.initial(),
      );
}
