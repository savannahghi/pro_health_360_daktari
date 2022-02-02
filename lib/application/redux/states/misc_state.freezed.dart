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
      {String? visitCount,
      String? title,
      String? message,
      String? phoneNumber,
      String? otpCode,
      String? pinCode,
      bool? acceptedTerms,
      List<FAQContent?>? faqList,
      String? defaultLocation,
      String? createPin,
      String? confirmPin,
      bool? invalidCredentials,
      bool? unKnownPhoneNo,
      bool? accountExists,
      bool? invalidPin,
      bool? hasCompletedEnteringOTP,
      bool? isResendingOTP,
      String? error}) {
    return _MiscState(
      visitCount: visitCount,
      title: title,
      message: message,
      phoneNumber: phoneNumber,
      otpCode: otpCode,
      pinCode: pinCode,
      acceptedTerms: acceptedTerms,
      faqList: faqList,
      defaultLocation: defaultLocation,
      createPin: createPin,
      confirmPin: confirmPin,
      invalidCredentials: invalidCredentials,
      unKnownPhoneNo: unKnownPhoneNo,
      accountExists: accountExists,
      invalidPin: invalidPin,
      hasCompletedEnteringOTP: hasCompletedEnteringOTP,
      isResendingOTP: isResendingOTP,
      error: error,
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
  String? get visitCount => throw _privateConstructorUsedError;
  String? get title => throw _privateConstructorUsedError;
  String? get message => throw _privateConstructorUsedError;
  String? get phoneNumber => throw _privateConstructorUsedError;
  String? get otpCode => throw _privateConstructorUsedError;
  String? get pinCode => throw _privateConstructorUsedError;
  bool? get acceptedTerms => throw _privateConstructorUsedError;
  List<FAQContent?>? get faqList => throw _privateConstructorUsedError;

  /// [defaultLocation] the location(branch) that the user has chosen
  String? get defaultLocation => throw _privateConstructorUsedError;

  /// [createPin] used when user is creating a PIN.
  String? get createPin => throw _privateConstructorUsedError;

  /// [confirmPin] used when user is creating a PIN for client side validation
  String? get confirmPin => throw _privateConstructorUsedError;

  /// [invalidCredentials] indicates the provided credentials are invalid.
  bool? get invalidCredentials => throw _privateConstructorUsedError;

  /// [unKnownPhoneNo] indicates that the provided phone number is not known by the backend.
  bool? get unKnownPhoneNo => throw _privateConstructorUsedError;

  /// [accountExists] a signal to the frontend that an account with the provided credentials already exists.
  bool? get accountExists => throw _privateConstructorUsedError;

  /// [invalidPin] used when running pin verification procedure.
  bool? get invalidPin => throw _privateConstructorUsedError;
  bool? get hasCompletedEnteringOTP =>
      throw _privateConstructorUsedError; // TODO: remove it is unused
  bool? get isResendingOTP =>
      throw _privateConstructorUsedError; // TODO: remove, it is unused
  String? get error => throw _privateConstructorUsedError;

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
      {String? visitCount,
      String? title,
      String? message,
      String? phoneNumber,
      String? otpCode,
      String? pinCode,
      bool? acceptedTerms,
      List<FAQContent?>? faqList,
      String? defaultLocation,
      String? createPin,
      String? confirmPin,
      bool? invalidCredentials,
      bool? unKnownPhoneNo,
      bool? accountExists,
      bool? invalidPin,
      bool? hasCompletedEnteringOTP,
      bool? isResendingOTP,
      String? error});
}

/// @nodoc
class _$MiscStateCopyWithImpl<$Res> implements $MiscStateCopyWith<$Res> {
  _$MiscStateCopyWithImpl(this._value, this._then);

  final MiscState _value;
  // ignore: unused_field
  final $Res Function(MiscState) _then;

  @override
  $Res call({
    Object? visitCount = freezed,
    Object? title = freezed,
    Object? message = freezed,
    Object? phoneNumber = freezed,
    Object? otpCode = freezed,
    Object? pinCode = freezed,
    Object? acceptedTerms = freezed,
    Object? faqList = freezed,
    Object? defaultLocation = freezed,
    Object? createPin = freezed,
    Object? confirmPin = freezed,
    Object? invalidCredentials = freezed,
    Object? unKnownPhoneNo = freezed,
    Object? accountExists = freezed,
    Object? invalidPin = freezed,
    Object? hasCompletedEnteringOTP = freezed,
    Object? isResendingOTP = freezed,
    Object? error = freezed,
  }) {
    return _then(_value.copyWith(
      visitCount: visitCount == freezed
          ? _value.visitCount
          : visitCount // ignore: cast_nullable_to_non_nullable
              as String?,
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      message: message == freezed
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      phoneNumber: phoneNumber == freezed
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      otpCode: otpCode == freezed
          ? _value.otpCode
          : otpCode // ignore: cast_nullable_to_non_nullable
              as String?,
      pinCode: pinCode == freezed
          ? _value.pinCode
          : pinCode // ignore: cast_nullable_to_non_nullable
              as String?,
      acceptedTerms: acceptedTerms == freezed
          ? _value.acceptedTerms
          : acceptedTerms // ignore: cast_nullable_to_non_nullable
              as bool?,
      faqList: faqList == freezed
          ? _value.faqList
          : faqList // ignore: cast_nullable_to_non_nullable
              as List<FAQContent?>?,
      defaultLocation: defaultLocation == freezed
          ? _value.defaultLocation
          : defaultLocation // ignore: cast_nullable_to_non_nullable
              as String?,
      createPin: createPin == freezed
          ? _value.createPin
          : createPin // ignore: cast_nullable_to_non_nullable
              as String?,
      confirmPin: confirmPin == freezed
          ? _value.confirmPin
          : confirmPin // ignore: cast_nullable_to_non_nullable
              as String?,
      invalidCredentials: invalidCredentials == freezed
          ? _value.invalidCredentials
          : invalidCredentials // ignore: cast_nullable_to_non_nullable
              as bool?,
      unKnownPhoneNo: unKnownPhoneNo == freezed
          ? _value.unKnownPhoneNo
          : unKnownPhoneNo // ignore: cast_nullable_to_non_nullable
              as bool?,
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
      {String? visitCount,
      String? title,
      String? message,
      String? phoneNumber,
      String? otpCode,
      String? pinCode,
      bool? acceptedTerms,
      List<FAQContent?>? faqList,
      String? defaultLocation,
      String? createPin,
      String? confirmPin,
      bool? invalidCredentials,
      bool? unKnownPhoneNo,
      bool? accountExists,
      bool? invalidPin,
      bool? hasCompletedEnteringOTP,
      bool? isResendingOTP,
      String? error});
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
    Object? visitCount = freezed,
    Object? title = freezed,
    Object? message = freezed,
    Object? phoneNumber = freezed,
    Object? otpCode = freezed,
    Object? pinCode = freezed,
    Object? acceptedTerms = freezed,
    Object? faqList = freezed,
    Object? defaultLocation = freezed,
    Object? createPin = freezed,
    Object? confirmPin = freezed,
    Object? invalidCredentials = freezed,
    Object? unKnownPhoneNo = freezed,
    Object? accountExists = freezed,
    Object? invalidPin = freezed,
    Object? hasCompletedEnteringOTP = freezed,
    Object? isResendingOTP = freezed,
    Object? error = freezed,
  }) {
    return _then(_MiscState(
      visitCount: visitCount == freezed
          ? _value.visitCount
          : visitCount // ignore: cast_nullable_to_non_nullable
              as String?,
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      message: message == freezed
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      phoneNumber: phoneNumber == freezed
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      otpCode: otpCode == freezed
          ? _value.otpCode
          : otpCode // ignore: cast_nullable_to_non_nullable
              as String?,
      pinCode: pinCode == freezed
          ? _value.pinCode
          : pinCode // ignore: cast_nullable_to_non_nullable
              as String?,
      acceptedTerms: acceptedTerms == freezed
          ? _value.acceptedTerms
          : acceptedTerms // ignore: cast_nullable_to_non_nullable
              as bool?,
      faqList: faqList == freezed
          ? _value.faqList
          : faqList // ignore: cast_nullable_to_non_nullable
              as List<FAQContent?>?,
      defaultLocation: defaultLocation == freezed
          ? _value.defaultLocation
          : defaultLocation // ignore: cast_nullable_to_non_nullable
              as String?,
      createPin: createPin == freezed
          ? _value.createPin
          : createPin // ignore: cast_nullable_to_non_nullable
              as String?,
      confirmPin: confirmPin == freezed
          ? _value.confirmPin
          : confirmPin // ignore: cast_nullable_to_non_nullable
              as String?,
      invalidCredentials: invalidCredentials == freezed
          ? _value.invalidCredentials
          : invalidCredentials // ignore: cast_nullable_to_non_nullable
              as bool?,
      unKnownPhoneNo: unKnownPhoneNo == freezed
          ? _value.unKnownPhoneNo
          : unKnownPhoneNo // ignore: cast_nullable_to_non_nullable
              as bool?,
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
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_MiscState implements _MiscState {
  _$_MiscState(
      {this.visitCount,
      this.title,
      this.message,
      this.phoneNumber,
      this.otpCode,
      this.pinCode,
      this.acceptedTerms,
      this.faqList,
      this.defaultLocation,
      this.createPin,
      this.confirmPin,
      this.invalidCredentials,
      this.unKnownPhoneNo,
      this.accountExists,
      this.invalidPin,
      this.hasCompletedEnteringOTP,
      this.isResendingOTP,
      this.error});

  factory _$_MiscState.fromJson(Map<String, dynamic> json) =>
      _$_$_MiscStateFromJson(json);

  @override
  final String? visitCount;
  @override
  final String? title;
  @override
  final String? message;
  @override
  final String? phoneNumber;
  @override
  final String? otpCode;
  @override
  final String? pinCode;
  @override
  final bool? acceptedTerms;
  @override
  final List<FAQContent?>? faqList;
  @override

  /// [defaultLocation] the location(branch) that the user has chosen
  final String? defaultLocation;
  @override

  /// [createPin] used when user is creating a PIN.
  final String? createPin;
  @override

  /// [confirmPin] used when user is creating a PIN for client side validation
  final String? confirmPin;
  @override

  /// [invalidCredentials] indicates the provided credentials are invalid.
  final bool? invalidCredentials;
  @override

  /// [unKnownPhoneNo] indicates that the provided phone number is not known by the backend.
  final bool? unKnownPhoneNo;
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
  String toString() {
    return 'MiscState(visitCount: $visitCount, title: $title, message: $message, phoneNumber: $phoneNumber, otpCode: $otpCode, pinCode: $pinCode, acceptedTerms: $acceptedTerms, faqList: $faqList, defaultLocation: $defaultLocation, createPin: $createPin, confirmPin: $confirmPin, invalidCredentials: $invalidCredentials, unKnownPhoneNo: $unKnownPhoneNo, accountExists: $accountExists, invalidPin: $invalidPin, hasCompletedEnteringOTP: $hasCompletedEnteringOTP, isResendingOTP: $isResendingOTP, error: $error)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _MiscState &&
            (identical(other.visitCount, visitCount) ||
                const DeepCollectionEquality()
                    .equals(other.visitCount, visitCount)) &&
            (identical(other.title, title) ||
                const DeepCollectionEquality().equals(other.title, title)) &&
            (identical(other.message, message) ||
                const DeepCollectionEquality()
                    .equals(other.message, message)) &&
            (identical(other.phoneNumber, phoneNumber) ||
                const DeepCollectionEquality()
                    .equals(other.phoneNumber, phoneNumber)) &&
            (identical(other.otpCode, otpCode) ||
                const DeepCollectionEquality()
                    .equals(other.otpCode, otpCode)) &&
            (identical(other.pinCode, pinCode) ||
                const DeepCollectionEquality()
                    .equals(other.pinCode, pinCode)) &&
            (identical(other.acceptedTerms, acceptedTerms) ||
                const DeepCollectionEquality()
                    .equals(other.acceptedTerms, acceptedTerms)) &&
            (identical(other.faqList, faqList) ||
                const DeepCollectionEquality()
                    .equals(other.faqList, faqList)) &&
            (identical(other.defaultLocation, defaultLocation) ||
                const DeepCollectionEquality()
                    .equals(other.defaultLocation, defaultLocation)) &&
            (identical(other.createPin, createPin) ||
                const DeepCollectionEquality()
                    .equals(other.createPin, createPin)) &&
            (identical(other.confirmPin, confirmPin) ||
                const DeepCollectionEquality()
                    .equals(other.confirmPin, confirmPin)) &&
            (identical(other.invalidCredentials, invalidCredentials) ||
                const DeepCollectionEquality()
                    .equals(other.invalidCredentials, invalidCredentials)) &&
            (identical(other.unKnownPhoneNo, unKnownPhoneNo) ||
                const DeepCollectionEquality()
                    .equals(other.unKnownPhoneNo, unKnownPhoneNo)) &&
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
                const DeepCollectionEquality().equals(other.error, error)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(visitCount) ^
      const DeepCollectionEquality().hash(title) ^
      const DeepCollectionEquality().hash(message) ^
      const DeepCollectionEquality().hash(phoneNumber) ^
      const DeepCollectionEquality().hash(otpCode) ^
      const DeepCollectionEquality().hash(pinCode) ^
      const DeepCollectionEquality().hash(acceptedTerms) ^
      const DeepCollectionEquality().hash(faqList) ^
      const DeepCollectionEquality().hash(defaultLocation) ^
      const DeepCollectionEquality().hash(createPin) ^
      const DeepCollectionEquality().hash(confirmPin) ^
      const DeepCollectionEquality().hash(invalidCredentials) ^
      const DeepCollectionEquality().hash(unKnownPhoneNo) ^
      const DeepCollectionEquality().hash(accountExists) ^
      const DeepCollectionEquality().hash(invalidPin) ^
      const DeepCollectionEquality().hash(hasCompletedEnteringOTP) ^
      const DeepCollectionEquality().hash(isResendingOTP) ^
      const DeepCollectionEquality().hash(error);

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
      {String? visitCount,
      String? title,
      String? message,
      String? phoneNumber,
      String? otpCode,
      String? pinCode,
      bool? acceptedTerms,
      List<FAQContent?>? faqList,
      String? defaultLocation,
      String? createPin,
      String? confirmPin,
      bool? invalidCredentials,
      bool? unKnownPhoneNo,
      bool? accountExists,
      bool? invalidPin,
      bool? hasCompletedEnteringOTP,
      bool? isResendingOTP,
      String? error}) = _$_MiscState;

  factory _MiscState.fromJson(Map<String, dynamic> json) =
      _$_MiscState.fromJson;

  @override
  String? get visitCount => throw _privateConstructorUsedError;
  @override
  String? get title => throw _privateConstructorUsedError;
  @override
  String? get message => throw _privateConstructorUsedError;
  @override
  String? get phoneNumber => throw _privateConstructorUsedError;
  @override
  String? get otpCode => throw _privateConstructorUsedError;
  @override
  String? get pinCode => throw _privateConstructorUsedError;
  @override
  bool? get acceptedTerms => throw _privateConstructorUsedError;
  @override
  List<FAQContent?>? get faqList => throw _privateConstructorUsedError;
  @override

  /// [defaultLocation] the location(branch) that the user has chosen
  String? get defaultLocation => throw _privateConstructorUsedError;
  @override

  /// [createPin] used when user is creating a PIN.
  String? get createPin => throw _privateConstructorUsedError;
  @override

  /// [confirmPin] used when user is creating a PIN for client side validation
  String? get confirmPin => throw _privateConstructorUsedError;
  @override

  /// [invalidCredentials] indicates the provided credentials are invalid.
  bool? get invalidCredentials => throw _privateConstructorUsedError;
  @override

  /// [unKnownPhoneNo] indicates that the provided phone number is not known by the backend.
  bool? get unKnownPhoneNo => throw _privateConstructorUsedError;
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
  @JsonKey(ignore: true)
  _$MiscStateCopyWith<_MiscState> get copyWith =>
      throw _privateConstructorUsedError;
}
