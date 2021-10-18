import 'package:json_annotation/json_annotation.dart';

part 'security_question_response.g.dart';

@JsonSerializable()
class SecurityQuestionResponse {
  final String id;
  final String timeStamp;
  final String userId;
  final String securityQuestionId;
  final String response;

  SecurityQuestionResponse({
    required this.id,
    required this.timeStamp,
    required this.userId,
    required this.securityQuestionId,
    required this.response,
  });

  factory SecurityQuestionResponse.fromJson(Map<String, dynamic> json) =>
      _$SecurityQuestionResponseFromJson(json);
  Map<String, dynamic> toJson() => _$SecurityQuestionResponseToJson(this);
}
