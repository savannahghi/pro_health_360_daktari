// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'onboarding_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

OnboardingState _$OnboardingStateFromJson(Map<String, dynamic> json) {
  return _OnboardingState.fromJson(json);
}

/// @nodoc
class _$OnboardingStateTearOff {
  const _$OnboardingStateTearOff();

  _OnboardingState call(
      {TermsAndConditions? termsAndConditions,
      CreatePINState? createPINState,
      List<SecurityQuestion>? securityQuestions,
      List<SecurityQuestionResponse>? securityQuestionResponses,
      VerifyPhoneState? verifyPhoneState,
      PhoneLoginState? phoneLogin,
      bool? termsAccepted,
      bool? isPhoneVerified,
      bool? isPINSet,
      bool? isResetPin,
      bool? hasSetSecurityQuestions,
      bool? hasVerifiedSecurityQuestions,
      bool? hasSetNickName}) {
    return _OnboardingState(
      termsAndConditions: termsAndConditions,
      createPINState: createPINState,
      securityQuestions: securityQuestions,
      securityQuestionResponses: securityQuestionResponses,
      verifyPhoneState: verifyPhoneState,
      phoneLogin: phoneLogin,
      termsAccepted: termsAccepted,
      isPhoneVerified: isPhoneVerified,
      isPINSet: isPINSet,
      isResetPin: isResetPin,
      hasSetSecurityQuestions: hasSetSecurityQuestions,
      hasVerifiedSecurityQuestions: hasVerifiedSecurityQuestions,
      hasSetNickName: hasSetNickName,
    );
  }

  OnboardingState fromJson(Map<String, Object?> json) {
    return OnboardingState.fromJson(json);
  }
}

/// @nodoc
const $OnboardingState = _$OnboardingStateTearOff();

/// @nodoc
mixin _$OnboardingState {
  TermsAndConditions? get termsAndConditions =>
      throw _privateConstructorUsedError;
  CreatePINState? get createPINState => throw _privateConstructorUsedError;
  List<SecurityQuestion>? get securityQuestions =>
      throw _privateConstructorUsedError;
  List<SecurityQuestionResponse>? get securityQuestionResponses =>
      throw _privateConstructorUsedError;
  VerifyPhoneState? get verifyPhoneState => throw _privateConstructorUsedError;
  PhoneLoginState? get phoneLogin =>
      throw _privateConstructorUsedError; // If the user has accepted terms
  bool? get termsAccepted =>
      throw _privateConstructorUsedError; // If the user has verified their phone number
  bool? get isPhoneVerified =>
      throw _privateConstructorUsedError; //If the user has set their PIN
  bool? get isPINSet =>
      throw _privateConstructorUsedError; //If the user wants to reset their PIN
  bool? get isResetPin =>
      throw _privateConstructorUsedError; // If the user has set their security questions
  bool? get hasSetSecurityQuestions =>
      throw _privateConstructorUsedError; // If the user has successfully verified their security questions if pin is expired
  bool? get hasVerifiedSecurityQuestions =>
      throw _privateConstructorUsedError; // If the user has set their nickname
  bool? get hasSetNickName => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $OnboardingStateCopyWith<OnboardingState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OnboardingStateCopyWith<$Res> {
  factory $OnboardingStateCopyWith(
          OnboardingState value, $Res Function(OnboardingState) then) =
      _$OnboardingStateCopyWithImpl<$Res>;
  $Res call(
      {TermsAndConditions? termsAndConditions,
      CreatePINState? createPINState,
      List<SecurityQuestion>? securityQuestions,
      List<SecurityQuestionResponse>? securityQuestionResponses,
      VerifyPhoneState? verifyPhoneState,
      PhoneLoginState? phoneLogin,
      bool? termsAccepted,
      bool? isPhoneVerified,
      bool? isPINSet,
      bool? isResetPin,
      bool? hasSetSecurityQuestions,
      bool? hasVerifiedSecurityQuestions,
      bool? hasSetNickName});

  $TermsAndConditionsCopyWith<$Res>? get termsAndConditions;
  $CreatePINStateCopyWith<$Res>? get createPINState;
  $VerifyPhoneStateCopyWith<$Res>? get verifyPhoneState;
  $PhoneLoginStateCopyWith<$Res>? get phoneLogin;
}

/// @nodoc
class _$OnboardingStateCopyWithImpl<$Res>
    implements $OnboardingStateCopyWith<$Res> {
  _$OnboardingStateCopyWithImpl(this._value, this._then);

  final OnboardingState _value;
  // ignore: unused_field
  final $Res Function(OnboardingState) _then;

  @override
  $Res call({
    Object? termsAndConditions = freezed,
    Object? createPINState = freezed,
    Object? securityQuestions = freezed,
    Object? securityQuestionResponses = freezed,
    Object? verifyPhoneState = freezed,
    Object? phoneLogin = freezed,
    Object? termsAccepted = freezed,
    Object? isPhoneVerified = freezed,
    Object? isPINSet = freezed,
    Object? isResetPin = freezed,
    Object? hasSetSecurityQuestions = freezed,
    Object? hasVerifiedSecurityQuestions = freezed,
    Object? hasSetNickName = freezed,
  }) {
    return _then(_value.copyWith(
      termsAndConditions: termsAndConditions == freezed
          ? _value.termsAndConditions
          : termsAndConditions // ignore: cast_nullable_to_non_nullable
              as TermsAndConditions?,
      createPINState: createPINState == freezed
          ? _value.createPINState
          : createPINState // ignore: cast_nullable_to_non_nullable
              as CreatePINState?,
      securityQuestions: securityQuestions == freezed
          ? _value.securityQuestions
          : securityQuestions // ignore: cast_nullable_to_non_nullable
              as List<SecurityQuestion>?,
      securityQuestionResponses: securityQuestionResponses == freezed
          ? _value.securityQuestionResponses
          : securityQuestionResponses // ignore: cast_nullable_to_non_nullable
              as List<SecurityQuestionResponse>?,
      verifyPhoneState: verifyPhoneState == freezed
          ? _value.verifyPhoneState
          : verifyPhoneState // ignore: cast_nullable_to_non_nullable
              as VerifyPhoneState?,
      phoneLogin: phoneLogin == freezed
          ? _value.phoneLogin
          : phoneLogin // ignore: cast_nullable_to_non_nullable
              as PhoneLoginState?,
      termsAccepted: termsAccepted == freezed
          ? _value.termsAccepted
          : termsAccepted // ignore: cast_nullable_to_non_nullable
              as bool?,
      isPhoneVerified: isPhoneVerified == freezed
          ? _value.isPhoneVerified
          : isPhoneVerified // ignore: cast_nullable_to_non_nullable
              as bool?,
      isPINSet: isPINSet == freezed
          ? _value.isPINSet
          : isPINSet // ignore: cast_nullable_to_non_nullable
              as bool?,
      isResetPin: isResetPin == freezed
          ? _value.isResetPin
          : isResetPin // ignore: cast_nullable_to_non_nullable
              as bool?,
      hasSetSecurityQuestions: hasSetSecurityQuestions == freezed
          ? _value.hasSetSecurityQuestions
          : hasSetSecurityQuestions // ignore: cast_nullable_to_non_nullable
              as bool?,
      hasVerifiedSecurityQuestions: hasVerifiedSecurityQuestions == freezed
          ? _value.hasVerifiedSecurityQuestions
          : hasVerifiedSecurityQuestions // ignore: cast_nullable_to_non_nullable
              as bool?,
      hasSetNickName: hasSetNickName == freezed
          ? _value.hasSetNickName
          : hasSetNickName // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }

  @override
  $TermsAndConditionsCopyWith<$Res>? get termsAndConditions {
    if (_value.termsAndConditions == null) {
      return null;
    }

    return $TermsAndConditionsCopyWith<$Res>(_value.termsAndConditions!,
        (value) {
      return _then(_value.copyWith(termsAndConditions: value));
    });
  }

  @override
  $CreatePINStateCopyWith<$Res>? get createPINState {
    if (_value.createPINState == null) {
      return null;
    }

    return $CreatePINStateCopyWith<$Res>(_value.createPINState!, (value) {
      return _then(_value.copyWith(createPINState: value));
    });
  }

  @override
  $VerifyPhoneStateCopyWith<$Res>? get verifyPhoneState {
    if (_value.verifyPhoneState == null) {
      return null;
    }

    return $VerifyPhoneStateCopyWith<$Res>(_value.verifyPhoneState!, (value) {
      return _then(_value.copyWith(verifyPhoneState: value));
    });
  }

  @override
  $PhoneLoginStateCopyWith<$Res>? get phoneLogin {
    if (_value.phoneLogin == null) {
      return null;
    }

    return $PhoneLoginStateCopyWith<$Res>(_value.phoneLogin!, (value) {
      return _then(_value.copyWith(phoneLogin: value));
    });
  }
}

/// @nodoc
abstract class _$OnboardingStateCopyWith<$Res>
    implements $OnboardingStateCopyWith<$Res> {
  factory _$OnboardingStateCopyWith(
          _OnboardingState value, $Res Function(_OnboardingState) then) =
      __$OnboardingStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {TermsAndConditions? termsAndConditions,
      CreatePINState? createPINState,
      List<SecurityQuestion>? securityQuestions,
      List<SecurityQuestionResponse>? securityQuestionResponses,
      VerifyPhoneState? verifyPhoneState,
      PhoneLoginState? phoneLogin,
      bool? termsAccepted,
      bool? isPhoneVerified,
      bool? isPINSet,
      bool? isResetPin,
      bool? hasSetSecurityQuestions,
      bool? hasVerifiedSecurityQuestions,
      bool? hasSetNickName});

  @override
  $TermsAndConditionsCopyWith<$Res>? get termsAndConditions;
  @override
  $CreatePINStateCopyWith<$Res>? get createPINState;
  @override
  $VerifyPhoneStateCopyWith<$Res>? get verifyPhoneState;
  @override
  $PhoneLoginStateCopyWith<$Res>? get phoneLogin;
}

/// @nodoc
class __$OnboardingStateCopyWithImpl<$Res>
    extends _$OnboardingStateCopyWithImpl<$Res>
    implements _$OnboardingStateCopyWith<$Res> {
  __$OnboardingStateCopyWithImpl(
      _OnboardingState _value, $Res Function(_OnboardingState) _then)
      : super(_value, (v) => _then(v as _OnboardingState));

  @override
  _OnboardingState get _value => super._value as _OnboardingState;

  @override
  $Res call({
    Object? termsAndConditions = freezed,
    Object? createPINState = freezed,
    Object? securityQuestions = freezed,
    Object? securityQuestionResponses = freezed,
    Object? verifyPhoneState = freezed,
    Object? phoneLogin = freezed,
    Object? termsAccepted = freezed,
    Object? isPhoneVerified = freezed,
    Object? isPINSet = freezed,
    Object? isResetPin = freezed,
    Object? hasSetSecurityQuestions = freezed,
    Object? hasVerifiedSecurityQuestions = freezed,
    Object? hasSetNickName = freezed,
  }) {
    return _then(_OnboardingState(
      termsAndConditions: termsAndConditions == freezed
          ? _value.termsAndConditions
          : termsAndConditions // ignore: cast_nullable_to_non_nullable
              as TermsAndConditions?,
      createPINState: createPINState == freezed
          ? _value.createPINState
          : createPINState // ignore: cast_nullable_to_non_nullable
              as CreatePINState?,
      securityQuestions: securityQuestions == freezed
          ? _value.securityQuestions
          : securityQuestions // ignore: cast_nullable_to_non_nullable
              as List<SecurityQuestion>?,
      securityQuestionResponses: securityQuestionResponses == freezed
          ? _value.securityQuestionResponses
          : securityQuestionResponses // ignore: cast_nullable_to_non_nullable
              as List<SecurityQuestionResponse>?,
      verifyPhoneState: verifyPhoneState == freezed
          ? _value.verifyPhoneState
          : verifyPhoneState // ignore: cast_nullable_to_non_nullable
              as VerifyPhoneState?,
      phoneLogin: phoneLogin == freezed
          ? _value.phoneLogin
          : phoneLogin // ignore: cast_nullable_to_non_nullable
              as PhoneLoginState?,
      termsAccepted: termsAccepted == freezed
          ? _value.termsAccepted
          : termsAccepted // ignore: cast_nullable_to_non_nullable
              as bool?,
      isPhoneVerified: isPhoneVerified == freezed
          ? _value.isPhoneVerified
          : isPhoneVerified // ignore: cast_nullable_to_non_nullable
              as bool?,
      isPINSet: isPINSet == freezed
          ? _value.isPINSet
          : isPINSet // ignore: cast_nullable_to_non_nullable
              as bool?,
      isResetPin: isResetPin == freezed
          ? _value.isResetPin
          : isResetPin // ignore: cast_nullable_to_non_nullable
              as bool?,
      hasSetSecurityQuestions: hasSetSecurityQuestions == freezed
          ? _value.hasSetSecurityQuestions
          : hasSetSecurityQuestions // ignore: cast_nullable_to_non_nullable
              as bool?,
      hasVerifiedSecurityQuestions: hasVerifiedSecurityQuestions == freezed
          ? _value.hasVerifiedSecurityQuestions
          : hasVerifiedSecurityQuestions // ignore: cast_nullable_to_non_nullable
              as bool?,
      hasSetNickName: hasSetNickName == freezed
          ? _value.hasSetNickName
          : hasSetNickName // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_OnboardingState implements _OnboardingState {
  _$_OnboardingState(
      {this.termsAndConditions,
      this.createPINState,
      this.securityQuestions,
      this.securityQuestionResponses,
      this.verifyPhoneState,
      this.phoneLogin,
      this.termsAccepted,
      this.isPhoneVerified,
      this.isPINSet,
      this.isResetPin,
      this.hasSetSecurityQuestions,
      this.hasVerifiedSecurityQuestions,
      this.hasSetNickName});

  factory _$_OnboardingState.fromJson(Map<String, dynamic> json) =>
      _$$_OnboardingStateFromJson(json);

  @override
  final TermsAndConditions? termsAndConditions;
  @override
  final CreatePINState? createPINState;
  @override
  final List<SecurityQuestion>? securityQuestions;
  @override
  final List<SecurityQuestionResponse>? securityQuestionResponses;
  @override
  final VerifyPhoneState? verifyPhoneState;
  @override
  final PhoneLoginState? phoneLogin;
  @override // If the user has accepted terms
  final bool? termsAccepted;
  @override // If the user has verified their phone number
  final bool? isPhoneVerified;
  @override //If the user has set their PIN
  final bool? isPINSet;
  @override //If the user wants to reset their PIN
  final bool? isResetPin;
  @override // If the user has set their security questions
  final bool? hasSetSecurityQuestions;
  @override // If the user has successfully verified their security questions if pin is expired
  final bool? hasVerifiedSecurityQuestions;
  @override // If the user has set their nickname
  final bool? hasSetNickName;

  @override
  String toString() {
    return 'OnboardingState(termsAndConditions: $termsAndConditions, createPINState: $createPINState, securityQuestions: $securityQuestions, securityQuestionResponses: $securityQuestionResponses, verifyPhoneState: $verifyPhoneState, phoneLogin: $phoneLogin, termsAccepted: $termsAccepted, isPhoneVerified: $isPhoneVerified, isPINSet: $isPINSet, isResetPin: $isResetPin, hasSetSecurityQuestions: $hasSetSecurityQuestions, hasVerifiedSecurityQuestions: $hasVerifiedSecurityQuestions, hasSetNickName: $hasSetNickName)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _OnboardingState &&
            const DeepCollectionEquality()
                .equals(other.termsAndConditions, termsAndConditions) &&
            const DeepCollectionEquality()
                .equals(other.createPINState, createPINState) &&
            const DeepCollectionEquality()
                .equals(other.securityQuestions, securityQuestions) &&
            const DeepCollectionEquality().equals(
                other.securityQuestionResponses, securityQuestionResponses) &&
            const DeepCollectionEquality()
                .equals(other.verifyPhoneState, verifyPhoneState) &&
            const DeepCollectionEquality()
                .equals(other.phoneLogin, phoneLogin) &&
            const DeepCollectionEquality()
                .equals(other.termsAccepted, termsAccepted) &&
            const DeepCollectionEquality()
                .equals(other.isPhoneVerified, isPhoneVerified) &&
            const DeepCollectionEquality().equals(other.isPINSet, isPINSet) &&
            const DeepCollectionEquality()
                .equals(other.isResetPin, isResetPin) &&
            const DeepCollectionEquality().equals(
                other.hasSetSecurityQuestions, hasSetSecurityQuestions) &&
            const DeepCollectionEquality().equals(
                other.hasVerifiedSecurityQuestions,
                hasVerifiedSecurityQuestions) &&
            const DeepCollectionEquality()
                .equals(other.hasSetNickName, hasSetNickName));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(termsAndConditions),
      const DeepCollectionEquality().hash(createPINState),
      const DeepCollectionEquality().hash(securityQuestions),
      const DeepCollectionEquality().hash(securityQuestionResponses),
      const DeepCollectionEquality().hash(verifyPhoneState),
      const DeepCollectionEquality().hash(phoneLogin),
      const DeepCollectionEquality().hash(termsAccepted),
      const DeepCollectionEquality().hash(isPhoneVerified),
      const DeepCollectionEquality().hash(isPINSet),
      const DeepCollectionEquality().hash(isResetPin),
      const DeepCollectionEquality().hash(hasSetSecurityQuestions),
      const DeepCollectionEquality().hash(hasVerifiedSecurityQuestions),
      const DeepCollectionEquality().hash(hasSetNickName));

  @JsonKey(ignore: true)
  @override
  _$OnboardingStateCopyWith<_OnboardingState> get copyWith =>
      __$OnboardingStateCopyWithImpl<_OnboardingState>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_OnboardingStateToJson(this);
  }
}

abstract class _OnboardingState implements OnboardingState {
  factory _OnboardingState(
      {TermsAndConditions? termsAndConditions,
      CreatePINState? createPINState,
      List<SecurityQuestion>? securityQuestions,
      List<SecurityQuestionResponse>? securityQuestionResponses,
      VerifyPhoneState? verifyPhoneState,
      PhoneLoginState? phoneLogin,
      bool? termsAccepted,
      bool? isPhoneVerified,
      bool? isPINSet,
      bool? isResetPin,
      bool? hasSetSecurityQuestions,
      bool? hasVerifiedSecurityQuestions,
      bool? hasSetNickName}) = _$_OnboardingState;

  factory _OnboardingState.fromJson(Map<String, dynamic> json) =
      _$_OnboardingState.fromJson;

  @override
  TermsAndConditions? get termsAndConditions;
  @override
  CreatePINState? get createPINState;
  @override
  List<SecurityQuestion>? get securityQuestions;
  @override
  List<SecurityQuestionResponse>? get securityQuestionResponses;
  @override
  VerifyPhoneState? get verifyPhoneState;
  @override
  PhoneLoginState? get phoneLogin;
  @override // If the user has accepted terms
  bool? get termsAccepted;
  @override // If the user has verified their phone number
  bool? get isPhoneVerified;
  @override //If the user has set their PIN
  bool? get isPINSet;
  @override //If the user wants to reset their PIN
  bool? get isResetPin;
  @override // If the user has set their security questions
  bool? get hasSetSecurityQuestions;
  @override // If the user has successfully verified their security questions if pin is expired
  bool? get hasVerifiedSecurityQuestions;
  @override // If the user has set their nickname
  bool? get hasSetNickName;
  @override
  @JsonKey(ignore: true)
  _$OnboardingStateCopyWith<_OnboardingState> get copyWith =>
      throw _privateConstructorUsedError;
}
