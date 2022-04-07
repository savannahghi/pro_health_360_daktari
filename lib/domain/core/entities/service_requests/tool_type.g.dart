// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tool_type.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ToolType _$$_ToolTypeFromJson(Map<String, dynamic> json) => _$_ToolType(
      toolType:
          $enumDecodeNullable(_$ScreeningToolsTypeEnumMap, json['toolType']),
    );

Map<String, dynamic> _$$_ToolTypeToJson(_$_ToolType instance) =>
    <String, dynamic>{
      'toolType': _$ScreeningToolsTypeEnumMap[instance.toolType],
    };

const _$ScreeningToolsTypeEnumMap = {
  ScreeningToolsType.VIOLENCE_ASSESSMENT: 'VIOLENCE_ASSESSMENT',
  ScreeningToolsType.CONTRACEPTIVE_ASSESSMENT: 'CONTRACEPTIVE_ASSESSMENT',
  ScreeningToolsType.TB_ASSESSMENT: 'TB_ASSESSMENT',
  ScreeningToolsType.ALCOHOL_SUBSTANCE_ASSESSMENT:
      'ALCOHOL_SUBSTANCE_ASSESSMENT',
};
