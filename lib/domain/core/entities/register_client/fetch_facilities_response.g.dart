// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fetch_facilities_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_FetchFacilitiesResponse _$$_FetchFacilitiesResponseFromJson(
        Map<String, dynamic> json) =>
    _$_FetchFacilitiesResponse(
      facilities: (json['searchFacility'] as List<dynamic>?)
          ?.map((e) => Facility.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_FetchFacilitiesResponseToJson(
        _$_FetchFacilitiesResponse instance) =>
    <String, dynamic>{
      'searchFacility': instance.facilities,
    };
