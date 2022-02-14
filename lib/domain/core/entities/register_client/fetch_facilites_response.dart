// Package imports:
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:healthcloud/domain/core/entities/core/facility.dart';

part 'fetch_facilites_response.freezed.dart';
part 'fetch_facilites_response.g.dart';

@freezed
class FetchFacilitiesResponse with _$FetchFacilitiesResponse {
  factory FetchFacilitiesResponse({
    @JsonKey(name: 'fetchFacilities') List<Facility>? facilities,
  }) = _FetchFacilitiesResponse;

  factory FetchFacilitiesResponse.fromJson(Map<String, dynamic> json) =>
      _$FetchFacilitiesResponseFromJson(json);
}
