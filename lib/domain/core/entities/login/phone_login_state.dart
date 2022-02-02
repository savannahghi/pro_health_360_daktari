// Package imports:
import 'package:domain_objects/value_objects.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'phone_login_state.freezed.dart';
part 'phone_login_state.g.dart';

@freezed
class PhoneLoginState with _$PhoneLoginState {
  factory PhoneLoginState({
    bool? invalidCredentials,
    String? phoneNumber,
    String? pinCode,

    /// [unKnownPhoneNo] indicates that the provided phone number is not known by the backend.
    bool? unKnownPhoneNo,
  }) = _PhoneLoginState;

  factory PhoneLoginState.fromJson(Map<String, dynamic> json) =>
      _$PhoneLoginStateFromJson(json);

  factory PhoneLoginState.initial() => PhoneLoginState(
        phoneNumber: UNKNOWN,
        pinCode: UNKNOWN,
        unKnownPhoneNo: false,
        invalidCredentials: false,
      );
}
