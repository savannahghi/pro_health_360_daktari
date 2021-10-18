// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'security_question_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SecurityQuestionResponse _$SecurityQuestionResponseFromJson(
    Map<String, dynamic> json) {
  return SecurityQuestionResponse(
    id: json['id'] as String,
    timeStamp: json['timeStamp'] as String,
    userId: json['userId'] as String,
    securityQuestionId: json['securityQuestionId'] as String,
    response: json['response'] as String,
  );
}

Map<String, dynamic> _$SecurityQuestionResponseToJson(
        SecurityQuestionResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'timeStamp': instance.timeStamp,
      'userId': instance.userId,
      'securityQuestionId': instance.securityQuestionId,
      'response': instance.response,
    };
