// Package imports:
import 'package:json_annotation/json_annotation.dart';

part 'security_question.g.dart';

@JsonSerializable()
class SecurityQuestion {
  final String id;
  final String questionStem;
  final String? description;
  final String? responseType;
  final String? flavour;
  final bool active;
  final int? sequence;

  SecurityQuestion({
    this.active = false,
    this.sequence,
    this.description,
    required this.id,
    required this.questionStem,
    required this.responseType,
    required this.flavour,
  });

  factory SecurityQuestion.fromJson(Map<String, dynamic> json) =>
      _$SecurityQuestionFromJson(json);
  Map<String, dynamic> toJson() => _$SecurityQuestionToJson(this);
}
