// Package imports:

import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mycarehubpro/domain/core/entities/search_user/user_data.dart';

part 'search_user_response.freezed.dart';
part 'search_user_response.g.dart';

@freezed
class SearchUserResponse with _$SearchUserResponse {
  factory SearchUserResponse({
    @JsonKey(name: 'ID') String? id, // This is the nickname
    @JsonKey(name: 'User') UserData? user,
  }) = _SearchUserResponse;

  factory SearchUserResponse.fromJson(Map<String, dynamic> json) =>
      _$SearchUserResponseFromJson(json);

  factory SearchUserResponse.initial() => SearchUserResponse(
        id: UNKNOWN,
        user: UserData.initial(),
      );
}
