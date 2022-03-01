// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'verify_phone_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

VerifyPhoneState _$VerifyPhoneStateFromJson(Map<String, dynamic> json) {
  return _VerifyPhoneState.fromJson(json);
}

/// @nodoc
class _$VerifyPhoneStateTearOff {
  const _$VerifyPhoneStateTearOff();

  _VerifyPhoneState call(
      {bool invalidOTP = false,
      String? otp,
      bool failedToSendOTP = false,
      bool canResendOTP = false}) {
    return _VerifyPhoneState(
      invalidOTP: invalidOTP,
      otp: otp,
      failedToSendOTP: failedToSendOTP,
      canResendOTP: canResendOTP,
    );
  }

  VerifyPhoneState fromJson(Map<String, Object?> json) {
    return VerifyPhoneState.fromJson(json);
  }
}

/// @nodoc
const $VerifyPhoneState = _$VerifyPhoneStateTearOff();

/// @nodoc
mixin _$VerifyPhoneState {
  bool get invalidOTP => throw _privateConstructorUsedError;
  String? get otp => throw _privateConstructorUsedError;
  bool get failedToSendOTP => throw _privateConstructorUsedError;
  bool get canResendOTP => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $VerifyPhoneStateCopyWith<VerifyPhoneState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VerifyPhoneStateCopyWith<$Res> {
  factory $VerifyPhoneStateCopyWith(
          VerifyPhoneState value, $Res Function(VerifyPhoneState) then) =
      _$VerifyPhoneStateCopyWithImpl<$Res>;
  $Res call(
      {bool invalidOTP, String? otp, bool failedToSendOTP, bool canResendOTP});
}

/// @nodoc
class _$VerifyPhoneStateCopyWithImpl<$Res>
    implements $VerifyPhoneStateCopyWith<$Res> {
  _$VerifyPhoneStateCopyWithImpl(this._value, this._then);

  final VerifyPhoneState _value;
  // ignore: unused_field
  final $Res Function(VerifyPhoneState) _then;

  @override
  $Res call({
    Object? invalidOTP = freezed,
    Object? otp = freezed,
    Object? failedToSendOTP = freezed,
    Object? canResendOTP = freezed,
  }) {
    return _then(_value.copyWith(
      invalidOTP: invalidOTP == freezed
          ? _value.invalidOTP
          : invalidOTP // ignore: cast_nullable_to_non_nullable
              as bool,
      otp: otp == freezed
          ? _value.otp
          : otp // ignore: cast_nullable_to_non_nullable
              as String?,
      failedToSendOTP: failedToSendOTP == freezed
          ? _value.failedToSendOTP
          : failedToSendOTP // ignore: cast_nullable_to_non_nullable
              as bool,
      canResendOTP: canResendOTP == freezed
          ? _value.canResendOTP
          : canResendOTP // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
abstract class _$VerifyPhoneStateCopyWith<$Res>
    implements $VerifyPhoneStateCopyWith<$Res> {
  factory _$VerifyPhoneStateCopyWith(
          _VerifyPhoneState value, $Res Function(_VerifyPhoneState) then) =
      __$VerifyPhoneStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {bool invalidOTP, String? otp, bool failedToSendOTP, bool canResendOTP});
}

/// @nodoc
class __$VerifyPhoneStateCopyWithImpl<$Res>
    extends _$VerifyPhoneStateCopyWithImpl<$Res>
    implements _$VerifyPhoneStateCopyWith<$Res> {
  __$VerifyPhoneStateCopyWithImpl(
      _VerifyPhoneState _value, $Res Function(_VerifyPhoneState) _then)
      : super(_value, (v) => _then(v as _VerifyPhoneState));

  @override
  _VerifyPhoneState get _value => super._value as _VerifyPhoneState;

  @override
  $Res call({
    Object? invalidOTP = freezed,
    Object? otp = freezed,
    Object? failedToSendOTP = freezed,
    Object? canResendOTP = freezed,
  }) {
    return _then(_VerifyPhoneState(
      invalidOTP: invalidOTP == freezed
          ? _value.invalidOTP
          : invalidOTP // ignore: cast_nullable_to_non_nullable
              as bool,
      otp: otp == freezed
          ? _value.otp
          : otp // ignore: cast_nullable_to_non_nullable
              as String?,
      failedToSendOTP: failedToSendOTP == freezed
          ? _value.failedToSendOTP
          : failedToSendOTP // ignore: cast_nullable_to_non_nullable
              as bool,
      canResendOTP: canResendOTP == freezed
          ? _value.canResendOTP
          : canResendOTP // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_VerifyPhoneState implements _VerifyPhoneState {
  _$_VerifyPhoneState(
      {this.invalidOTP = false,
      this.otp,
      this.failedToSendOTP = false,
      this.canResendOTP = false});

  factory _$_VerifyPhoneState.fromJson(Map<String, dynamic> json) =>
      _$$_VerifyPhoneStateFromJson(json);

  @JsonKey()
  @override
  final bool invalidOTP;
  @override
  final String? otp;
  @JsonKey()
  @override
  final bool failedToSendOTP;
  @JsonKey()
  @override
  final bool canResendOTP;

  @override
  String toString() {
    return 'VerifyPhoneState(invalidOTP: $invalidOTP, otp: $otp, failedToSendOTP: $failedToSendOTP, canResendOTP: $canResendOTP)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _VerifyPhoneState &&
            const DeepCollectionEquality()
                .equals(other.invalidOTP, invalidOTP) &&
            const DeepCollectionEquality().equals(other.otp, otp) &&
            const DeepCollectionEquality()
                .equals(other.failedToSendOTP, failedToSendOTP) &&
            const DeepCollectionEquality()
                .equals(other.canResendOTP, canResendOTP));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(invalidOTP),
      const DeepCollectionEquality().hash(otp),
      const DeepCollectionEquality().hash(failedToSendOTP),
      const DeepCollectionEquality().hash(canResendOTP));

  @JsonKey(ignore: true)
  @override
  _$VerifyPhoneStateCopyWith<_VerifyPhoneState> get copyWith =>
      __$VerifyPhoneStateCopyWithImpl<_VerifyPhoneState>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_VerifyPhoneStateToJson(this);
  }
}

abstract class _VerifyPhoneState implements VerifyPhoneState {
  factory _VerifyPhoneState(
      {bool invalidOTP,
      String? otp,
      bool failedToSendOTP,
      bool canResendOTP}) = _$_VerifyPhoneState;

  factory _VerifyPhoneState.fromJson(Map<String, dynamic> json) =
      _$_VerifyPhoneState.fromJson;

  @override
  bool get invalidOTP;
  @override
  String? get otp;
  @override
  bool get failedToSendOTP;
  @override
  bool get canResendOTP;
  @override
  @JsonKey(ignore: true)
  _$VerifyPhoneStateCopyWith<_VerifyPhoneState> get copyWith =>
      throw _privateConstructorUsedError;
}
