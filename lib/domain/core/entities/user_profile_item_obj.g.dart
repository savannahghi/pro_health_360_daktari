// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_profile_item_obj.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserProfileItemObj _$UserProfileItemObjFromJson(Map<String, dynamic> json) {
  return UserProfileItemObj(
    iconAssetPath: json['iconAssetPath'] as String,
    title: json['title'] as String,
    route: json['route'] as String,
  );
}

Map<String, dynamic> _$UserProfileItemObjToJson(UserProfileItemObj instance) =>
    <String, dynamic>{
      'iconAssetPath': instance.iconAssetPath,
      'title': instance.title,
      'route': instance.route,
    };
