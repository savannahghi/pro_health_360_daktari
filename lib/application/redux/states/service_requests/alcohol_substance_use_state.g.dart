// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'alcohol_substance_use_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_AlcoholSubstanceUseState _$$_AlcoholSubstanceUseStateFromJson(
        Map<String, dynamic> json) =>
    _$_AlcoholSubstanceUseState(
      screeningQuestionItems: (json['screeningQuestionItems'] as List<dynamic>?)
          ?.map(
              (e) => ScreeningQuestionsList.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_AlcoholSubstanceUseStateToJson(
        _$_AlcoholSubstanceUseState instance) =>
    <String, dynamic>{
      'screeningQuestionItems': instance.screeningQuestionItems,
    };
