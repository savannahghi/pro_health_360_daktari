import 'package:freezed_annotation/freezed_annotation.dart';

part 'age_range.freezed.dart';
part 'age_range.g.dart';

@freezed
class AgeRange with _$AgeRange {
  factory AgeRange({
    @JsonKey(toJson: doubleToInt) required double lowerBound,
    @JsonKey(toJson: doubleToInt) required double upperBound,
  }) = _AgeRange;

  factory AgeRange.fromJson(Map<String, dynamic> json) =>
      _$AgeRangeFromJson(json);
}

int doubleToInt(double number) {
  return number.round();
}
