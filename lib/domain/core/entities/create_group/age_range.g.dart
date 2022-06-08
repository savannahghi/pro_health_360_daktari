// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'age_range.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_AgeRange _$$_AgeRangeFromJson(Map<String, dynamic> json) => _$_AgeRange(
      lowerBound: json['lowerBound'] as String,
      upperBound: json['upperBound'] as String,
    );

Map<String, dynamic> _$$_AgeRangeToJson(_$_AgeRange instance) =>
    <String, dynamic>{
      'lowerBound': stringToIntLower(instance.lowerBound),
      'upperBound': stringToIntHigher(instance.upperBound),
    };
