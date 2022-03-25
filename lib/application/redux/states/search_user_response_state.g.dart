// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_user_response_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_SearchUserResponseState _$$_SearchUserResponseStateFromJson(
        Map<String, dynamic> json) =>
    _$_SearchUserResponseState(
      searchUserResponses: (json['searchUserResponses'] as List<dynamic>?)
          ?.map((e) => e == null
              ? null
              : SearchUserResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
      selectedSearchUserResponse: json['selectedSearchUserResponse'] == null
          ? null
          : SearchUserResponse.fromJson(
              json['selectedSearchUserResponse'] as Map<String, dynamic>),
      errorSearchingUser: json['errorSearchingUser'] as bool?,
      timeoutSearchingUser: json['timeoutSearchingUser'] as bool?,
      noUserFound: json['noUserFound'] as bool?,
    );

Map<String, dynamic> _$$_SearchUserResponseStateToJson(
        _$_SearchUserResponseState instance) =>
    <String, dynamic>{
      'searchUserResponses': instance.searchUserResponses,
      'selectedSearchUserResponse': instance.selectedSearchUserResponse,
      'errorSearchingUser': instance.errorSearchingUser,
      'timeoutSearchingUser': instance.timeoutSearchingUser,
      'noUserFound': instance.noUserFound,
    };
