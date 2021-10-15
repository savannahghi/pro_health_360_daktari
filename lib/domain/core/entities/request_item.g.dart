// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'request_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RequestItem _$RequestItemFromJson(Map<String, dynamic> json) {
  return RequestItem(
    imageAssetPath: json['imageAssetPath'] as String,
    title: json['title'] as String,
    route: json['route'] as String,
    totalNumber: json['totalNumber'] as int,
  );
}

Map<String, dynamic> _$RequestItemToJson(RequestItem instance) =>
    <String, dynamic>{
      'imageAssetPath': instance.imageAssetPath,
      'title': instance.title,
      'route': instance.route,
      'totalNumber': instance.totalNumber,
    };
