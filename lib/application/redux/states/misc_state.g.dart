// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'misc_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_MiscState _$$_MiscStateFromJson(Map<String, dynamic> json) => _$_MiscState(
      initialRoute: json['initialRoute'] as String?,
      error: json['error'] as String?,
      profileFAQsContentState: json['profileFAQsContentState'] == null
          ? null
          : FAQsContentState.fromJson(
              json['profileFAQsContentState'] as Map<String, dynamic>),
      communityMembers: (json['communityMembers'] as List<dynamic>?)
          ?.map((e) => Member.fromJson(e as Map<String, dynamic>))
          .toList(),
      groupState: json['groupState'] == null
          ? null
          : GroupState.fromJson(json['groupState'] as Map<String, dynamic>),
      searchUserResponseState: json['searchUserResponseState'] == null
          ? null
          : SearchUserResponseState.fromJson(
              json['searchUserResponseState'] as Map<String, dynamic>),
      inactiveTime: json['inactiveTime'] as String?,
    );

Map<String, dynamic> _$$_MiscStateToJson(_$_MiscState instance) =>
    <String, dynamic>{
      'initialRoute': instance.initialRoute,
      'error': instance.error,
      'profileFAQsContentState': instance.profileFAQsContentState,
      'communityMembers': instance.communityMembers,
      'groupState': instance.groupState,
      'searchUserResponseState': instance.searchUserResponseState,
      'inactiveTime': instance.inactiveTime,
    };
