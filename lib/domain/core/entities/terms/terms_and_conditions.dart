// Package imports:
import 'package:domain_objects/value_objects.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:json_annotation/json_annotation.dart';

part 'terms_and_conditions.g.dart';
part 'terms_and_conditions.freezed.dart';

@freezed
class TermsAndConditions with _$TermsAndConditions {
  factory TermsAndConditions({
    @JsonKey(name: 'termsID') required int termsId,
    @JsonKey(name: 'text') required String text,
  }) = _TermsAndConditions;

  factory TermsAndConditions.fromJson(Map<String, dynamic> json) =>
      _$TermsAndConditionsFromJson(json);

  factory TermsAndConditions.initial() => TermsAndConditions(
        termsId: 0,
        text: UNKNOWN,
      );
}
