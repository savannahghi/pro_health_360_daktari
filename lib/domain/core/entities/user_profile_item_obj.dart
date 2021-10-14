// Package imports:
import 'package:json_annotation/json_annotation.dart';

part 'user_profile_item_obj.g.dart';

@JsonSerializable()
class UserProfileItemObj {
  UserProfileItemObj({
    required this.iconAssetPath,
    required this.title,
    required this.route,
  });

  factory UserProfileItemObj.fromJson(Map<String, dynamic> json) =>
      _$UserProfileItemObjFromJson(json);

  final String iconAssetPath;
  final String title;
  final String route;

  Map<String, dynamic> toJson() => _$UserProfileItemObjToJson(this);
}
