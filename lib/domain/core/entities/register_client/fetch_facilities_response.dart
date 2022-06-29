// Package imports:
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:prohealth360_daktari/domain/core/entities/core/facility.dart';

part 'fetch_facilities_response.freezed.dart';
part 'fetch_facilities_response.g.dart';

@freezed
class FetchFacilitiesResponse with _$FetchFacilitiesResponse {
  factory FetchFacilitiesResponse({
    @JsonKey(name: 'searchFacility') List<Facility>? facilities,
  }) = _FetchFacilitiesResponse;

  factory FetchFacilitiesResponse.fromJson(Map<String, dynamic> json) =>
      _$FetchFacilitiesResponseFromJson(json);
}
