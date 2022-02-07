// Package imports:
import 'package:domain_objects/value_objects.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'facility.freezed.dart';
part 'facility.g.dart';

@freezed
class Facility with _$Facility {
  factory Facility({
    @JsonKey(name: 'ID') String? id,
    @JsonKey(name: 'name') String? name,
    @JsonKey(name: 'code') int? code,
    @JsonKey(name: 'phone') String? phone,
    @JsonKey(name: 'active', defaultValue: false) bool? active,
    @JsonKey(name: 'county') String? county,
    @JsonKey(name: 'description') String? description,
  }) = _Facility;

  factory Facility.fromJson(Map<String, dynamic> json) =>
      _$FacilityFromJson(json);

  factory Facility.initial() => Facility(
        id: UNKNOWN,
        name: UNKNOWN,
        code: 0,
        phone: UNKNOWN,
        active: false,
        county: UNKNOWN,
        description: UNKNOWN,
      );
}
