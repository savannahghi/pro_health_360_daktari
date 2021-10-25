// Package imports:
import 'package:json_annotation/json_annotation.dart';

part 'bottom_nav_obj.g.dart';

@JsonSerializable()
class BottomNavObj {
  BottomNavObj({
    this.currentBottomNavIndex = 0,
  });

  factory BottomNavObj.fromJson(Map<String, dynamic> json) =>
      _$BottomNavObjFromJson(json);

  final int currentBottomNavIndex;

  Map<String, dynamic> toJson() => _$BottomNavObjToJson(this);
}
