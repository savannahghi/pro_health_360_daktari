import 'package:domain_objects/value_objects.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'verify_phone_state.freezed.dart';
part 'verify_phone_state.g.dart';

@freezed
class VerifyPhoneState with _$VerifyPhoneState {
  factory VerifyPhoneState({
    @Default(false) bool invalidOTP,
    String? otp,
    @Default(false) bool failedToSendOTP,
    @Default(false) bool canResendOTP,
  }) = _VerifyPhoneState;

  factory VerifyPhoneState.fromJson(Map<String, dynamic> json) =>
      _$VerifyPhoneStateFromJson(json);

  factory VerifyPhoneState.initial() => VerifyPhoneState(
        otp: UNKNOWN,
        invalidOTP: false,
        failedToSendOTP: false,
        canResendOTP: false,
      );
}
