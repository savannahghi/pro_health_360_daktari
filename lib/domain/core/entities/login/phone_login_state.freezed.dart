// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'phone_login_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PhoneLoginState _$PhoneLoginStateFromJson(Map<String, dynamic> json) {
  return _PhoneLoginState.fromJson(json);
}

/// @nodoc
class _$PhoneLoginStateTearOff {
  const _$PhoneLoginStateTearOff();

  _PhoneLoginState call(
      {bool? invalidCredentials,
      String? phoneNumber,
      String? pinCode,
      bool? unKnownPhoneNo}) {
    return _PhoneLoginState(
      invalidCredentials: invalidCredentials,
      phoneNumber: phoneNumber,
      pinCode: pinCode,
      unKnownPhoneNo: unKnownPhoneNo,
    );
  }

  PhoneLoginState fromJson(Map<String, Object?> json) {
    return PhoneLoginState.fromJson(json);
  }
}

/// @nodoc
const $PhoneLoginState = _$PhoneLoginStateTearOff();

/// @nodoc
mixin _$PhoneLoginState {
  bool? get invalidCredentials => throw _privateConstructorUsedError;
  String? get phoneNumber => throw _privateConstructorUsedError;
  String? get pinCode => throw _privateConstructorUsedError;

  /// [unKnownPhoneNo] indicates that the provided phone number is not known by the backend.
  bool? get unKnownPhoneNo => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PhoneLoginStateCopyWith<PhoneLoginState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PhoneLoginStateCopyWith<$Res> {
  factory $PhoneLoginStateCopyWith(
          PhoneLoginState value, $Res Function(PhoneLoginState) then) =
      _$PhoneLoginStateCopyWithImpl<$Res>;
  $Res call(
      {bool? invalidCredentials,
      String? phoneNumber,
      String? pinCode,
      bool? unKnownPhoneNo});
}

/// @nodoc
class _$PhoneLoginStateCopyWithImpl<$Res>
    implements $PhoneLoginStateCopyWith<$Res> {
  _$PhoneLoginStateCopyWithImpl(this._value, this._then);

  final PhoneLoginState _value;
  // ignore: unused_field
  final $Res Function(PhoneLoginState) _then;

  @override
  $Res call({
    Object? invalidCredentials = freezed,
    Object? phoneNumber = freezed,
    Object? pinCode = freezed,
    Object? unKnownPhoneNo = freezed,
  }) {
    return _then(_value.copyWith(
      invalidCredentials: invalidCredentials == freezed
          ? _value.invalidCredentials
          : invalidCredentials // ignore: cast_nullable_to_non_nullable
              as bool?,
      phoneNumber: phoneNumber == freezed
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      pinCode: pinCode == freezed
          ? _value.pinCode
          : pinCode // ignore: cast_nullable_to_non_nullable
              as String?,
      unKnownPhoneNo: unKnownPhoneNo == freezed
          ? _value.unKnownPhoneNo
          : unKnownPhoneNo // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
abstract class _$PhoneLoginStateCopyWith<$Res>
    implements $PhoneLoginStateCopyWith<$Res> {
  factory _$PhoneLoginStateCopyWith(
          _PhoneLoginState value, $Res Function(_PhoneLoginState) then) =
      __$PhoneLoginStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {bool? invalidCredentials,
      String? phoneNumber,
      String? pinCode,
      bool? unKnownPhoneNo});
}

/// @nodoc
class __$PhoneLoginStateCopyWithImpl<$Res>
    extends _$PhoneLoginStateCopyWithImpl<$Res>
    implements _$PhoneLoginStateCopyWith<$Res> {
  __$PhoneLoginStateCopyWithImpl(
      _PhoneLoginState _value, $Res Function(_PhoneLoginState) _then)
      : super(_value, (v) => _then(v as _PhoneLoginState));

  @override
  _PhoneLoginState get _value => super._value as _PhoneLoginState;

  @override
  $Res call({
    Object? invalidCredentials = freezed,
    Object? phoneNumber = freezed,
    Object? pinCode = freezed,
    Object? unKnownPhoneNo = freezed,
  }) {
    return _then(_PhoneLoginState(
      invalidCredentials: invalidCredentials == freezed
          ? _value.invalidCredentials
          : invalidCredentials // ignore: cast_nullable_to_non_nullable
              as bool?,
      phoneNumber: phoneNumber == freezed
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      pinCode: pinCode == freezed
          ? _value.pinCode
          : pinCode // ignore: cast_nullable_to_non_nullable
              as String?,
      unKnownPhoneNo: unKnownPhoneNo == freezed
          ? _value.unKnownPhoneNo
          : unKnownPhoneNo // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_PhoneLoginState implements _PhoneLoginState {
  _$_PhoneLoginState(
      {this.invalidCredentials,
      this.phoneNumber,
      this.pinCode,
      this.unKnownPhoneNo});

  factory _$_PhoneLoginState.fromJson(Map<String, dynamic> json) =>
      _$$_PhoneLoginStateFromJson(json);

  @override
  final bool? invalidCredentials;
  @override
  final String? phoneNumber;
  @override
  final String? pinCode;
  @override

  /// [unKnownPhoneNo] indicates that the provided phone number is not known by the backend.
  final bool? unKnownPhoneNo;

  @override
  String toString() {
    return 'PhoneLoginState(invalidCredentials: $invalidCredentials, phoneNumber: $phoneNumber, pinCode: $pinCode, unKnownPhoneNo: $unKnownPhoneNo)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _PhoneLoginState &&
            const DeepCollectionEquality()
                .equals(other.invalidCredentials, invalidCredentials) &&
            const DeepCollectionEquality()
                .equals(other.phoneNumber, phoneNumber) &&
            const DeepCollectionEquality().equals(other.pinCode, pinCode) &&
            const DeepCollectionEquality()
                .equals(other.unKnownPhoneNo, unKnownPhoneNo));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(invalidCredentials),
      const DeepCollectionEquality().hash(phoneNumber),
      const DeepCollectionEquality().hash(pinCode),
      const DeepCollectionEquality().hash(unKnownPhoneNo));

  @JsonKey(ignore: true)
  @override
  _$PhoneLoginStateCopyWith<_PhoneLoginState> get copyWith =>
      __$PhoneLoginStateCopyWithImpl<_PhoneLoginState>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PhoneLoginStateToJson(this);
  }
}

abstract class _PhoneLoginState implements PhoneLoginState {
  factory _PhoneLoginState(
      {bool? invalidCredentials,
      String? phoneNumber,
      String? pinCode,
      bool? unKnownPhoneNo}) = _$_PhoneLoginState;

  factory _PhoneLoginState.fromJson(Map<String, dynamic> json) =
      _$_PhoneLoginState.fromJson;

  @override
  bool? get invalidCredentials;
  @override
  String? get phoneNumber;
  @override
  String? get pinCode;
  @override

  /// [unKnownPhoneNo] indicates that the provided phone number is not known by the backend.
  bool? get unKnownPhoneNo;
  @override
  @JsonKey(ignore: true)
  _$PhoneLoginStateCopyWith<_PhoneLoginState> get copyWith =>
      throw _privateConstructorUsedError;
}
