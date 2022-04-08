// Package imports:

import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mycarehubpro/domain/core/entities/search_user/roles_list.dart';
import 'package:mycarehubpro/domain/core/entities/search_user/user_data.dart';

part 'search_user_response.freezed.dart';
part 'search_user_response.g.dart';

@freezed
class SearchUserResponse with _$SearchUserResponse {
  factory SearchUserResponse({
    @JsonKey(name: 'ID') String? id,
    @JsonKey(name: 'CCCNumber')
        String?
            clientCCCNumber, // This is the CCCNumber if the person being searched is a client
    @JsonKey(name: 'Active')
        bool?
            isActive, // This is the CCCNumber if the person being searched is a client
    @JsonKey(name: 'StaffNumber')
        String?
            staffNumber, // this is the staff number if the person being searched is a staff member
    @JsonKey(name: 'User') UserData? user,
    @JsonKey(name: 'rolesList')
        RolesList?
            rolesList, // this is the list the user has if they are a staff member
  }) = _SearchUserResponse;

  factory SearchUserResponse.fromJson(Map<String, dynamic> json) =>
      _$SearchUserResponseFromJson(json);

  factory SearchUserResponse.initial() => SearchUserResponse(
        id: UNKNOWN,
        clientCCCNumber: UNKNOWN,
        isActive: true,
        staffNumber: UNKNOWN,
        user: UserData.initial(),
        rolesList: RolesList.initial(),
      );
}
