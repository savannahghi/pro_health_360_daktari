// Package imports:
import 'package:json_annotation/json_annotation.dart';

part 'red_flag_item.g.dart';

@JsonSerializable()
class RedFlagItem {
  RedFlagItem({required this.clientName, required this.feelingDescription});

  factory RedFlagItem.fromJson(Map<String, dynamic> json) =>
      _$RedFlagItemFromJson(json);

  final String clientName;
  final String feelingDescription;

  Map<String, dynamic> toJson() => _$RedFlagItemToJson(this);
}
