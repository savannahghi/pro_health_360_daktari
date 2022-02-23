// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'age_range.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_AgeRange _$_$_AgeRangeFromJson(Map<String, dynamic> json) {
  return _$_AgeRange(
    lowerBound: (json['lowerBound'] as num).toDouble(),
    upperBound: (json['upperBound'] as num).toDouble(),
  );
}

Map<String, dynamic> _$_$_AgeRangeToJson(_$_AgeRange instance) =>
    <String, dynamic>{
      'lowerBound': doubleToInt(instance.lowerBound),
      'upperBound': doubleToInt(instance.upperBound),
    };
