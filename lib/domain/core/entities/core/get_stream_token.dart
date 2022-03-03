import 'package:freezed_annotation/freezed_annotation.dart';

part 'get_stream_token.freezed.dart';
part 'get_stream_token.g.dart';

@freezed
class GetStreamToken with _$GetStreamToken {
  factory GetStreamToken({@JsonKey(name: 'getStreamToken') String? getStreamToken})= _GetStreamToken;

  factory GetStreamToken.fromJson(Map<String, dynamic> json) =>
      _$GetStreamTokenFromJson(json);
}
