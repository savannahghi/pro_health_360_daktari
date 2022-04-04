// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'contraceptive_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ContraceptiveState _$$_ContraceptiveStateFromJson(
        Map<String, dynamic> json) =>
    _$_ContraceptiveState(
      screeningQuestionItems: (json['screeningQuestionItems'] as List<dynamic>?)
          ?.map(
              (e) => ScreeningQuestionsList.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_ContraceptiveStateToJson(
        _$_ContraceptiveState instance) =>
    <String, dynamic>{
      'screeningQuestionItems': instance.screeningQuestionItems,
    };
