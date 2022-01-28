// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'staff_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_StaffState _$_$_StaffStateFromJson(Map<String, dynamic> json) {
  return _$_StaffState(
    userState: json['userState'] == null
        ? null
        : UserState.fromJson(json['userState'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$_$_StaffStateToJson(_$_StaffState instance) =>
    <String, dynamic>{
      'userState': instance.userState,
    };
