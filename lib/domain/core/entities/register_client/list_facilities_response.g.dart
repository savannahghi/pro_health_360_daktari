// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'list_facilities_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ListFacilitiesResponse _$_$_ListFacilitiesResponseFromJson(
    Map<String, dynamic> json) {
  return _$_ListFacilitiesResponse(
    facilities: (json['Facilities'] as List<dynamic>?)
        ?.map((e) => Facility.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$_$_ListFacilitiesResponseToJson(
        _$_ListFacilitiesResponse instance) =>
    <String, dynamic>{
      'Facilities': instance.facilities,
    };
