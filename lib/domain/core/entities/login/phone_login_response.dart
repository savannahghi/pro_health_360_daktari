// Package imports:
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mycarehubpro/domain/core/entities/login/user_response.dart';

// Project imports:

part 'phone_login_response.freezed.dart';
part 'phone_login_response.g.dart';

@freezed
class PhoneLoginResponse with _$PhoneLoginResponse {
  factory PhoneLoginResponse({
    @JsonKey(name: 'code') int? code,
    @JsonKey(name: 'message') String? message,
    @JsonKey(name: 'response') UserResponse? userResponse,
  }) = _PhoneLoginResponse;

  factory PhoneLoginResponse.fromJson(Map<String, dynamic> json) =>
      _$PhoneLoginResponseFromJson(json);
}
