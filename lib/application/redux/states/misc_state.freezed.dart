// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'misc_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

MiscState _$MiscStateFromJson(Map<String, dynamic> json) {
  return _MiscState.fromJson(json);
}

/// @nodoc
class _$MiscStateTearOff {
  const _$MiscStateTearOff();

  _MiscState call(
      {String? message,
      String? otpCode,
      bool? acceptedTerms,
      List<FAQContent?>? faqList,
      String? createPin,
      String? confirmPin,
      bool? accountExists,
      bool? invalidPin,
      bool? hasCompletedEnteringOTP,
      bool? isResendingOTP,
      String? error,
      String? initialRoute}) {
    return _MiscState(
      message: message,
      otpCode: otpCode,
      acceptedTerms: acceptedTerms,
      faqList: faqList,
      createPin: createPin,
      confirmPin: confirmPin,
      accountExists: accountExists,
      invalidPin: invalidPin,
      hasCompletedEnteringOTP: hasCompletedEnteringOTP,
      isResendingOTP: isResendingOTP,
      error: error,
      initialRoute: initialRoute,
    );
  }

  MiscState fromJson(Map<String, Object> json) {
    return MiscState.fromJson(json);
  }
}

/// @nodoc
const $MiscState = _$MiscStateTearOff();

/// @nodoc
mixin _$MiscState {
  String? get message => throw _privateConstructorUsedError;
  String? get otpCode => throw _privateConstructorUsedError;
  bool? get acceptedTerms => throw _privateConstructorUsedError;
  List<FAQContent?>? get faqList => throw _privateConstructorUsedError;

  /// [createPin] used when user is creating a PIN.
  String? get createPin => throw _privateConstructorUsedError;

  /// [confirmPin] used when user is creating a PIN for client side validation
  String? get confirmPin => throw _privateConstructorUsedError;

  /// [accountExists] a signal to the frontend that an account with the provided credentials already exists.
  bool? get accountExists => throw _privateConstructorUsedError;

  /// [invalidPin] used when running pin verification procedure.
  bool? get invalidPin => throw _privateConstructorUsedError;
  bool? get hasCompletedEnteringOTP =>
      throw _privateConstructorUsedError; // TODO: remove it is unused
  bool? get isResendingOTP =>
      throw _privateConstructorUsedError; // TODO: remove, it is unused
  String? get error => throw _privateConstructorUsedError;
  String? get initialRoute => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MiscStateCopyWith<MiscState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MiscStateCopyWith<$Res> {
  factory $MiscStateCopyWith(MiscState value, $Res Function(MiscState) then) =
      _$MiscStateCopyWithImpl<$Res>;
  $Res call(
      {String? message,
      String? otpCode,
      bool? acceptedTerms,
      List<FAQContent?>? faqList,
      String? createPin,
      String? confirmPin,
      bool? accountExists,
      bool? invalidPin,
      bool? hasCompletedEnteringOTP,
      bool? isResendingOTP,
      String? error,
      String? initialRoute});
}

/// @nodoc
class _$MiscStateCopyWithImpl<$Res> implements $MiscStateCopyWith<$Res> {
  _$MiscStateCopyWithImpl(this._value, this._then);

  final MiscState _value;
  // ignore: unused_field
  final $Res Function(MiscState) _then;

  @override
  $Res call({
    Object? message = freezed,
    Object? otpCode = freezed,
    Object? acceptedTerms = freezed,
    Object? faqList = freezed,
    Object? createPin = freezed,
    Object? confirmPin = freezed,
    Object? accountExists = freezed,
    Object? invalidPin = freezed,
    Object? hasCompletedEnteringOTP = freezed,
    Object? isResendingOTP = freezed,
    Object? error = freezed,
    Object? initialRoute = freezed,
  }) {
    return _then(_value.copyWith(
      message: message == freezed
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      otpCode: otpCode == freezed
          ? _value.otpCode
          : otpCode // ignore: cast_nullable_to_non_nullable
              as String?,
      acceptedTerms: acceptedTerms == freezed
          ? _value.acceptedTerms
          : acceptedTerms // ignore: cast_nullable_to_non_nullable
              as bool?,
      faqList: faqList == freezed
          ? _value.faqList
          : faqList // ignore: cast_nullable_to_non_nullable
              as List<FAQContent?>?,
      createPin: createPin == freezed
          ? _value.createPin
          : createPin // ignore: cast_nullable_to_non_nullable
              as String?,
      confirmPin: confirmPin == freezed
          ? _value.confirmPin
          : confirmPin // ignore: cast_nullable_to_non_nullable
              as String?,
      accountExists: accountExists == freezed
          ? _value.accountExists
          : accountExists // ignore: cast_nullable_to_non_nullable
              as bool?,
      invalidPin: invalidPin == freezed
          ? _value.invalidPin
          : invalidPin // ignore: cast_nullable_to_non_nullable
              as bool?,
      hasCompletedEnteringOTP: hasCompletedEnteringOTP == freezed
          ? _value.hasCompletedEnteringOTP
          : hasCompletedEnteringOTP // ignore: cast_nullable_to_non_nullable
              as bool?,
      isResendingOTP: isResendingOTP == freezed
          ? _value.isResendingOTP
          : isResendingOTP // ignore: cast_nullable_to_non_nullable
              as bool?,
      error: error == freezed
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
      initialRoute: initialRoute == freezed
          ? _value.initialRoute
          : initialRoute // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$MiscStateCopyWith<$Res> implements $MiscStateCopyWith<$Res> {
  factory _$MiscStateCopyWith(
          _MiscState value, $Res Function(_MiscState) then) =
      __$MiscStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {String? message,
      String? otpCode,
      bool? acceptedTerms,
      List<FAQContent?>? faqList,
      String? createPin,
      String? confirmPin,
      bool? accountExists,
      bool? invalidPin,
      bool? hasCompletedEnteringOTP,
      bool? isResendingOTP,
      String? error,
      String? initialRoute});
}

/// @nodoc
class __$MiscStateCopyWithImpl<$Res> extends _$MiscStateCopyWithImpl<$Res>
    implements _$MiscStateCopyWith<$Res> {
  __$MiscStateCopyWithImpl(_MiscState _value, $Res Function(_MiscState) _then)
      : super(_value, (v) => _then(v as _MiscState));

  @override
  _MiscState get _value => super._value as _MiscState;

  @override
  $Res call({
    Object? message = freezed,
    Object? otpCode = freezed,
    Object? acceptedTerms = freezed,
    Object? faqList = freezed,
    Object? createPin = freezed,
    Object? confirmPin = freezed,
    Object? accountExists = freezed,
    Object? invalidPin = freezed,
    Object? hasCompletedEnteringOTP = freezed,
    Object? isResendingOTP = freezed,
    Object? error = freezed,
    Object? initialRoute = freezed,
  }) {
    return _then(_MiscState(
      message: message == freezed
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      otpCode: otpCode == freezed
          ? _value.otpCode
          : otpCode // ignore: cast_nullable_to_non_nullable
              as String?,
      acceptedTerms: acceptedTerms == freezed
          ? _value.acceptedTerms
          : acceptedTerms // ignore: cast_nullable_to_non_nullable
              as bool?,
      faqList: faqList == freezed
          ? _value.faqList
          : faqList // ignore: cast_nullable_to_non_nullable
              as List<FAQContent?>?,
      createPin: createPin == freezed
          ? _value.createPin
          : createPin // ignore: cast_nullable_to_non_nullable
              as String?,
      confirmPin: confirmPin == freezed
          ? _value.confirmPin
          : confirmPin // ignore: cast_nullable_to_non_nullable
              as String?,
      accountExists: accountExists == freezed
          ? _value.accountExists
          : accountExists // ignore: cast_nullable_to_non_nullable
              as bool?,
      invalidPin: invalidPin == freezed
          ? _value.invalidPin
          : invalidPin // ignore: cast_nullable_to_non_nullable
              as bool?,
      hasCompletedEnteringOTP: hasCompletedEnteringOTP == freezed
          ? _value.hasCompletedEnteringOTP
          : hasCompletedEnteringOTP // ignore: cast_nullable_to_non_nullable
              as bool?,
      isResendingOTP: isResendingOTP == freezed
          ? _value.isResendingOTP
          : isResendingOTP // ignore: cast_nullable_to_non_nullable
              as bool?,
      error: error == freezed
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
      initialRoute: initialRoute == freezed
          ? _value.initialRoute
          : initialRoute // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_MiscState implements _MiscState {
  _$_MiscState(
      {this.message,
      this.otpCode,
      this.acceptedTerms,
      this.faqList,
      this.createPin,
      this.confirmPin,
      this.accountExists,
      this.invalidPin,
      this.hasCompletedEnteringOTP,
      this.isResendingOTP,
      this.error,
      this.initialRoute});

  factory _$_MiscState.fromJson(Map<String, dynamic> json) =>
      _$_$_MiscStateFromJson(json);

  @override
  final String? message;
  @override
  final String? otpCode;
  @override
  final bool? acceptedTerms;
  @override
  final List<FAQContent?>? faqList;
  @override

  /// [createPin] used when user is creating a PIN.
  final String? createPin;
  @override

  /// [confirmPin] used when user is creating a PIN for client side validation
  final String? confirmPin;
  @override

  /// [accountExists] a signal to the frontend that an account with the provided credentials already exists.
  final bool? accountExists;
  @override

  /// [invalidPin] used when running pin verification procedure.
  final bool? invalidPin;
  @override
  final bool? hasCompletedEnteringOTP;
  @override // TODO: remove it is unused
  final bool? isResendingOTP;
  @override // TODO: remove, it is unused
  final String? error;
  @override
  final String? initialRoute;

  @override
  String toString() {
    return 'MiscState(message: $message, otpCode: $otpCode, acceptedTerms: $acceptedTerms, faqList: $faqList, createPin: $createPin, confirmPin: $confirmPin, accountExists: $accountExists, invalidPin: $invalidPin, hasCompletedEnteringOTP: $hasCompletedEnteringOTP, isResendingOTP: $isResendingOTP, error: $error, initialRoute: $initialRoute)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _MiscState &&
            (identical(other.message, message) ||
                const DeepCollectionEquality()
                    .equals(other.message, message)) &&
            (identical(other.otpCode, otpCode) ||
                const DeepCollectionEquality()
                    .equals(other.otpCode, otpCode)) &&
            (identical(other.acceptedTerms, acceptedTerms) ||
                const DeepCollectionEquality()
                    .equals(other.acceptedTerms, acceptedTerms)) &&
            (identical(other.faqList, faqList) ||
                const DeepCollectionEquality()
                    .equals(other.faqList, faqList)) &&
            (identical(other.createPin, createPin) ||
                const DeepCollectionEquality()
                    .equals(other.createPin, createPin)) &&
            (identical(other.confirmPin, confirmPin) ||
                const DeepCollectionEquality()
                    .equals(other.confirmPin, confirmPin)) &&
            (identical(other.accountExists, accountExists) ||
                const DeepCollectionEquality()
                    .equals(other.accountExists, accountExists)) &&
            (identical(other.invalidPin, invalidPin) ||
                const DeepCollectionEquality()
                    .equals(other.invalidPin, invalidPin)) &&
            (identical(
                    other.hasCompletedEnteringOTP, hasCompletedEnteringOTP) ||
                const DeepCollectionEquality().equals(
                    other.hasCompletedEnteringOTP, hasCompletedEnteringOTP)) &&
            (identical(other.isResendingOTP, isResendingOTP) ||
                const DeepCollectionEquality()
                    .equals(other.isResendingOTP, isResendingOTP)) &&
            (identical(other.error, error) ||
                const DeepCollectionEquality().equals(other.error, error)) &&
            (identical(other.initialRoute, initialRoute) ||
                const DeepCollectionEquality()
                    .equals(other.initialRoute, initialRoute)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(message) ^
      const DeepCollectionEquality().hash(otpCode) ^
      const DeepCollectionEquality().hash(acceptedTerms) ^
      const DeepCollectionEquality().hash(faqList) ^
      const DeepCollectionEquality().hash(createPin) ^
      const DeepCollectionEquality().hash(confirmPin) ^
      const DeepCollectionEquality().hash(accountExists) ^
      const DeepCollectionEquality().hash(invalidPin) ^
      const DeepCollectionEquality().hash(hasCompletedEnteringOTP) ^
      const DeepCollectionEquality().hash(isResendingOTP) ^
      const DeepCollectionEquality().hash(error) ^
      const DeepCollectionEquality().hash(initialRoute);

  @JsonKey(ignore: true)
  @override
  _$MiscStateCopyWith<_MiscState> get copyWith =>
      __$MiscStateCopyWithImpl<_MiscState>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_MiscStateToJson(this);
  }
}

abstract class _MiscState implements MiscState {
  factory _MiscState(
      {String? message,
      String? otpCode,
      bool? acceptedTerms,
      List<FAQContent?>? faqList,
      String? createPin,
      String? confirmPin,
      bool? accountExists,
      bool? invalidPin,
      bool? hasCompletedEnteringOTP,
      bool? isResendingOTP,
      String? error,
      String? initialRoute}) = _$_MiscState;

  factory _MiscState.fromJson(Map<String, dynamic> json) =
      _$_MiscState.fromJson;

  @override
  String? get message => throw _privateConstructorUsedError;
  @override
  String? get otpCode => throw _privateConstructorUsedError;
  @override
  bool? get acceptedTerms => throw _privateConstructorUsedError;
  @override
  List<FAQContent?>? get faqList => throw _privateConstructorUsedError;
  @override

  /// [createPin] used when user is creating a PIN.
  String? get createPin => throw _privateConstructorUsedError;
  @override

  /// [confirmPin] used when user is creating a PIN for client side validation
  String? get confirmPin => throw _privateConstructorUsedError;
  @override

  /// [accountExists] a signal to the frontend that an account with the provided credentials already exists.
  bool? get accountExists => throw _privateConstructorUsedError;
  @override

  /// [invalidPin] used when running pin verification procedure.
  bool? get invalidPin => throw _privateConstructorUsedError;
  @override
  bool? get hasCompletedEnteringOTP => throw _privateConstructorUsedError;
  @override // TODO: remove it is unused
  bool? get isResendingOTP => throw _privateConstructorUsedError;
  @override // TODO: remove, it is unused
  String? get error => throw _privateConstructorUsedError;
  @override
  String? get initialRoute => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$MiscStateCopyWith<_MiscState> get copyWith =>
      throw _privateConstructorUsedError;
}
