// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tb_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_TBState _$$_TBStateFromJson(Map<String, dynamic> json) => _$_TBState(
      screeningQuestionItems: (json['screeningQuestionItems'] as List<dynamic>?)
          ?.map(
              (e) => ScreeningQuestionsList.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_TBStateToJson(_$_TBState instance) =>
    <String, dynamic>{
      'screeningQuestionItems': instance.screeningQuestionItems,
    };
