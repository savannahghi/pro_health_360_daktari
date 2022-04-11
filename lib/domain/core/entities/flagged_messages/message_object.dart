import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:stream_chat_flutter/stream_chat_flutter.dart';

part 'message_object.freezed.dart';
part 'message_object.g.dart';

@freezed
class MessageObject with _$MessageObject {
  factory MessageObject({@JsonKey(name: 'message') Message? message}) =
      _MessageObject;

  factory MessageObject.fromJson(Map<String, dynamic> json) =>
      _$MessageObjectFromJson(json);
}
