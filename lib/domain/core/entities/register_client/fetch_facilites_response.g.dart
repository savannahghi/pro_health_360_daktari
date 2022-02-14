// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fetch_facilites_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_FetchFacilitiesResponse _$_$_FetchFacilitiesResponseFromJson(
    Map<String, dynamic> json) {
  return _$_FetchFacilitiesResponse(
    facilities: (json['fetchFacilities'] as List<dynamic>?)
        ?.map((e) => Facility.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$_$_FetchFacilitiesResponseToJson(
        _$_FetchFacilitiesResponse instance) =>
    <String, dynamic>{
      'fetchFacilities': instance.facilities,
    };
