import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:prohealth360_daktari/domain/core/entities/core/auth_credentials.dart';
import 'package:prohealth360_daktari/domain/core/entities/core/staff_state.dart';

part 'user_response.freezed.dart';
part 'user_response.g.dart';

@freezed
class UserResponse with _$UserResponse {
  factory UserResponse({
    @JsonKey(name: 'credentials') AuthCredentials? credentials,
    @JsonKey(name: 'staffProfile') StaffState? staffState,
    @JsonKey(name: 'getStreamToken') String? streamToken,
  }) = _UserResponse;

  factory UserResponse.fromJson(Map<String, dynamic> json) =>
      _$UserResponseFromJson(json);
}
