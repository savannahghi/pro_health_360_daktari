import 'package:freezed_annotation/freezed_annotation.dart';

part 'age_range.freezed.dart';
part 'age_range.g.dart';

@freezed
class AgeRange with _$AgeRange {
  factory AgeRange({
    @JsonKey(toJson: stringToIntLower) required String lowerBound,
    @JsonKey(toJson: stringToIntHigher) required String upperBound,
  }) = _AgeRange;

  factory AgeRange.fromJson(Map<String, dynamic> json) =>
      _$AgeRangeFromJson(json);
}

int stringToIntHigher(String number) {
  return int.tryParse(number) ?? 25;
}

int stringToIntLower(String number) {
  return int.tryParse(number) ?? 14;
}
