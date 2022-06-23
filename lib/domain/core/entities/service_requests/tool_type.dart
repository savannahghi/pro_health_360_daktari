import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:prohealth360_daktari/domain/core/value_objects/app_enums.dart';

part 'tool_type.freezed.dart';
part 'tool_type.g.dart';

@freezed
class ToolType with _$ToolType {
  factory ToolType({
    @JsonKey(name: 'toolType') ScreeningToolsType? toolType,
  }) = _ToolType;

  factory ToolType.fromJson(Map<String, dynamic> json) =>
      _$ToolTypeFromJson(json);
}
