// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'afyamoja_misc_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_AfyaMojaMiscState _$_$_AfyaMojaMiscStateFromJson(Map<String, dynamic> json) {
  return _$_AfyaMojaMiscState(
    bottomNavObj: json['bottomNavObj'] == null
        ? null
        : BottomNavObj.fromJson(json['bottomNavObj'] as Map<String, dynamic>),
    libraryListItems: json['libraryListItems'] as List<dynamic>?,
  );
}

Map<String, dynamic> _$_$_AfyaMojaMiscStateToJson(
        _$_AfyaMojaMiscState instance) =>
    <String, dynamic>{
      'bottomNavObj': instance.bottomNavObj,
      'libraryListItems': instance.libraryListItems,
    };
