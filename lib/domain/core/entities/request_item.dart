// Package imports:
import 'package:json_annotation/json_annotation.dart';

part 'request_item.g.dart';

@JsonSerializable()
class RequestItem {
  RequestItem({
    required this.imageAssetPath,
    required this.title,
    required this.route,
    required this.totalNumber, 
  });

  factory RequestItem.fromJson(Map<String, dynamic> json) =>
      _$RequestItemFromJson(json);

  final String imageAssetPath;
  final String title;
  final String route;
  final int totalNumber;

  Map<String, dynamic> toJson() => _$RequestItemToJson(this);
}
