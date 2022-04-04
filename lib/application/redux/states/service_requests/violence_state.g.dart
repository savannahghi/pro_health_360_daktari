// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'violence_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ViolenceState _$$_ViolenceStateFromJson(Map<String, dynamic> json) =>
    _$_ViolenceState(
      screeningQuestionItems: (json['screeningQuestionItems'] as List<dynamic>?)
          ?.map(
              (e) => ScreeningQuestionsList.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_ViolenceStateToJson(_$_ViolenceState instance) =>
    <String, dynamic>{
      'screeningQuestionItems': instance.screeningQuestionItems,
    };
