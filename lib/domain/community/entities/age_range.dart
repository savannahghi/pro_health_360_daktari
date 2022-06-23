import 'package:freezed_annotation/freezed_annotation.dart';

part 'age_range.freezed.dart';
part 'age_range.g.dart';

@freezed
class AgeRange with _$AgeRange {
  factory AgeRange({
    @JsonKey(name: 'lowerBound') int? lowerBound,
    @JsonKey(name: 'upperBound') int? upperBound,
  }) = _AgeRange;

  factory AgeRange.fromJson(Map<String, dynamic> json) =>
      _$AgeRangeFromJson(json);
}
