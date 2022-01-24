// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'app_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

AppState _$AppStateFromJson(Map<String, dynamic> json) {
  return _State.fromJson(json);
}

/// @nodoc
class _$AppStateTearOff {
  const _$AppStateTearOff();

  _State call(
      {HomeState? homeState,
      OnboardingState? onboardingState,
      BottomNavigationState? bottomNavigationState,
      MiscState? miscState,
      StaffState? staffState,
      SurveyState? surveyState,
      ServiceRequestState? serviceRequestState,
      @JsonKey(ignore: true) Wait? wait}) {
    return _State(
      homeState: homeState,
      onboardingState: onboardingState,
      bottomNavigationState: bottomNavigationState,
      miscState: miscState,
      staffState: staffState,
      surveyState: surveyState,
      serviceRequestState: serviceRequestState,
      wait: wait,
    );
  }

  AppState fromJson(Map<String, Object> json) {
    return AppState.fromJson(json);
  }
}

/// @nodoc
const $AppState = _$AppStateTearOff();

/// @nodoc
mixin _$AppState {
  HomeState? get homeState => throw _privateConstructorUsedError;
  OnboardingState? get onboardingState => throw _privateConstructorUsedError;
  BottomNavigationState? get bottomNavigationState =>
      throw _privateConstructorUsedError;
  MiscState? get miscState => throw _privateConstructorUsedError;
  StaffState? get staffState => throw _privateConstructorUsedError;
  SurveyState? get surveyState => throw _privateConstructorUsedError;
  ServiceRequestState? get serviceRequestState =>
      throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  Wait? get wait => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AppStateCopyWith<AppState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppStateCopyWith<$Res> {
  factory $AppStateCopyWith(AppState value, $Res Function(AppState) then) =
      _$AppStateCopyWithImpl<$Res>;
  $Res call(
      {HomeState? homeState,
      OnboardingState? onboardingState,
      BottomNavigationState? bottomNavigationState,
      MiscState? miscState,
      StaffState? staffState,
      SurveyState? surveyState,
      ServiceRequestState? serviceRequestState,
      @JsonKey(ignore: true) Wait? wait});

  $HomeStateCopyWith<$Res>? get homeState;
  $OnboardingStateCopyWith<$Res>? get onboardingState;
  $BottomNavigationStateCopyWith<$Res>? get bottomNavigationState;
  $MiscStateCopyWith<$Res>? get miscState;
  $StaffStateCopyWith<$Res>? get staffState;
  $SurveyStateCopyWith<$Res>? get surveyState;
  $ServiceRequestStateCopyWith<$Res>? get serviceRequestState;
}

/// @nodoc
class _$AppStateCopyWithImpl<$Res> implements $AppStateCopyWith<$Res> {
  _$AppStateCopyWithImpl(this._value, this._then);

  final AppState _value;
  // ignore: unused_field
  final $Res Function(AppState) _then;

  @override
  $Res call({
    Object? homeState = freezed,
    Object? onboardingState = freezed,
    Object? bottomNavigationState = freezed,
    Object? miscState = freezed,
    Object? staffState = freezed,
    Object? surveyState = freezed,
    Object? serviceRequestState = freezed,
    Object? wait = freezed,
  }) {
    return _then(_value.copyWith(
      homeState: homeState == freezed
          ? _value.homeState
          : homeState // ignore: cast_nullable_to_non_nullable
              as HomeState?,
      onboardingState: onboardingState == freezed
          ? _value.onboardingState
          : onboardingState // ignore: cast_nullable_to_non_nullable
              as OnboardingState?,
      bottomNavigationState: bottomNavigationState == freezed
          ? _value.bottomNavigationState
          : bottomNavigationState // ignore: cast_nullable_to_non_nullable
              as BottomNavigationState?,
      miscState: miscState == freezed
          ? _value.miscState
          : miscState // ignore: cast_nullable_to_non_nullable
              as MiscState?,
      staffState: staffState == freezed
          ? _value.staffState
          : staffState // ignore: cast_nullable_to_non_nullable
              as StaffState?,
      surveyState: surveyState == freezed
          ? _value.surveyState
          : surveyState // ignore: cast_nullable_to_non_nullable
              as SurveyState?,
      serviceRequestState: serviceRequestState == freezed
          ? _value.serviceRequestState
          : serviceRequestState // ignore: cast_nullable_to_non_nullable
              as ServiceRequestState?,
      wait: wait == freezed
          ? _value.wait
          : wait // ignore: cast_nullable_to_non_nullable
              as Wait?,
    ));
  }

  @override
  $HomeStateCopyWith<$Res>? get homeState {
    if (_value.homeState == null) {
      return null;
    }

    return $HomeStateCopyWith<$Res>(_value.homeState!, (value) {
      return _then(_value.copyWith(homeState: value));
    });
  }

  @override
  $OnboardingStateCopyWith<$Res>? get onboardingState {
    if (_value.onboardingState == null) {
      return null;
    }

    return $OnboardingStateCopyWith<$Res>(_value.onboardingState!, (value) {
      return _then(_value.copyWith(onboardingState: value));
    });
  }

  @override
  $BottomNavigationStateCopyWith<$Res>? get bottomNavigationState {
    if (_value.bottomNavigationState == null) {
      return null;
    }

    return $BottomNavigationStateCopyWith<$Res>(_value.bottomNavigationState!,
        (value) {
      return _then(_value.copyWith(bottomNavigationState: value));
    });
  }

  @override
  $MiscStateCopyWith<$Res>? get miscState {
    if (_value.miscState == null) {
      return null;
    }

    return $MiscStateCopyWith<$Res>(_value.miscState!, (value) {
      return _then(_value.copyWith(miscState: value));
    });
  }

  @override
  $StaffStateCopyWith<$Res>? get staffState {
    if (_value.staffState == null) {
      return null;
    }

    return $StaffStateCopyWith<$Res>(_value.staffState!, (value) {
      return _then(_value.copyWith(staffState: value));
    });
  }

  @override
  $SurveyStateCopyWith<$Res>? get surveyState {
    if (_value.surveyState == null) {
      return null;
    }

    return $SurveyStateCopyWith<$Res>(_value.surveyState!, (value) {
      return _then(_value.copyWith(surveyState: value));
    });
  }

  @override
  $ServiceRequestStateCopyWith<$Res>? get serviceRequestState {
    if (_value.serviceRequestState == null) {
      return null;
    }

    return $ServiceRequestStateCopyWith<$Res>(_value.serviceRequestState!,
        (value) {
      return _then(_value.copyWith(serviceRequestState: value));
    });
  }
}

/// @nodoc
abstract class _$StateCopyWith<$Res> implements $AppStateCopyWith<$Res> {
  factory _$StateCopyWith(_State value, $Res Function(_State) then) =
      __$StateCopyWithImpl<$Res>;
  @override
  $Res call(
      {HomeState? homeState,
      OnboardingState? onboardingState,
      BottomNavigationState? bottomNavigationState,
      MiscState? miscState,
      StaffState? staffState,
      SurveyState? surveyState,
      ServiceRequestState? serviceRequestState,
      @JsonKey(ignore: true) Wait? wait});

  @override
  $HomeStateCopyWith<$Res>? get homeState;
  @override
  $OnboardingStateCopyWith<$Res>? get onboardingState;
  @override
  $BottomNavigationStateCopyWith<$Res>? get bottomNavigationState;
  @override
  $MiscStateCopyWith<$Res>? get miscState;
  @override
  $StaffStateCopyWith<$Res>? get staffState;
  @override
  $SurveyStateCopyWith<$Res>? get surveyState;
  @override
  $ServiceRequestStateCopyWith<$Res>? get serviceRequestState;
}

/// @nodoc
class __$StateCopyWithImpl<$Res> extends _$AppStateCopyWithImpl<$Res>
    implements _$StateCopyWith<$Res> {
  __$StateCopyWithImpl(_State _value, $Res Function(_State) _then)
      : super(_value, (v) => _then(v as _State));

  @override
  _State get _value => super._value as _State;

  @override
  $Res call({
    Object? homeState = freezed,
    Object? onboardingState = freezed,
    Object? bottomNavigationState = freezed,
    Object? miscState = freezed,
    Object? staffState = freezed,
    Object? surveyState = freezed,
    Object? serviceRequestState = freezed,
    Object? wait = freezed,
  }) {
    return _then(_State(
      homeState: homeState == freezed
          ? _value.homeState
          : homeState // ignore: cast_nullable_to_non_nullable
              as HomeState?,
      onboardingState: onboardingState == freezed
          ? _value.onboardingState
          : onboardingState // ignore: cast_nullable_to_non_nullable
              as OnboardingState?,
      bottomNavigationState: bottomNavigationState == freezed
          ? _value.bottomNavigationState
          : bottomNavigationState // ignore: cast_nullable_to_non_nullable
              as BottomNavigationState?,
      miscState: miscState == freezed
          ? _value.miscState
          : miscState // ignore: cast_nullable_to_non_nullable
              as MiscState?,
      staffState: staffState == freezed
          ? _value.staffState
          : staffState // ignore: cast_nullable_to_non_nullable
              as StaffState?,
      surveyState: surveyState == freezed
          ? _value.surveyState
          : surveyState // ignore: cast_nullable_to_non_nullable
              as SurveyState?,
      serviceRequestState: serviceRequestState == freezed
          ? _value.serviceRequestState
          : serviceRequestState // ignore: cast_nullable_to_non_nullable
              as ServiceRequestState?,
      wait: wait == freezed
          ? _value.wait
          : wait // ignore: cast_nullable_to_non_nullable
              as Wait?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_State implements _State {
  _$_State(
      {this.homeState,
      this.onboardingState,
      this.bottomNavigationState,
      this.miscState,
      this.staffState,
      this.surveyState,
      this.serviceRequestState,
      @JsonKey(ignore: true) this.wait});

  factory _$_State.fromJson(Map<String, dynamic> json) =>
      _$_$_StateFromJson(json);

  @override
  final HomeState? homeState;
  @override
  final OnboardingState? onboardingState;
  @override
  final BottomNavigationState? bottomNavigationState;
  @override
  final MiscState? miscState;
  @override
  final StaffState? staffState;
  @override
  final SurveyState? surveyState;
  @override
  final ServiceRequestState? serviceRequestState;
  @override
  @JsonKey(ignore: true)
  final Wait? wait;

  @override
  String toString() {
    return 'AppState(homeState: $homeState, onboardingState: $onboardingState, bottomNavigationState: $bottomNavigationState, miscState: $miscState, staffState: $staffState, surveyState: $surveyState, serviceRequestState: $serviceRequestState, wait: $wait)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _State &&
            (identical(other.homeState, homeState) ||
                const DeepCollectionEquality()
                    .equals(other.homeState, homeState)) &&
            (identical(other.onboardingState, onboardingState) ||
                const DeepCollectionEquality()
                    .equals(other.onboardingState, onboardingState)) &&
            (identical(other.bottomNavigationState, bottomNavigationState) ||
                const DeepCollectionEquality().equals(
                    other.bottomNavigationState, bottomNavigationState)) &&
            (identical(other.miscState, miscState) ||
                const DeepCollectionEquality()
                    .equals(other.miscState, miscState)) &&
            (identical(other.staffState, staffState) ||
                const DeepCollectionEquality()
                    .equals(other.staffState, staffState)) &&
            (identical(other.surveyState, surveyState) ||
                const DeepCollectionEquality()
                    .equals(other.surveyState, surveyState)) &&
            (identical(other.serviceRequestState, serviceRequestState) ||
                const DeepCollectionEquality()
                    .equals(other.serviceRequestState, serviceRequestState)) &&
            (identical(other.wait, wait) ||
                const DeepCollectionEquality().equals(other.wait, wait)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(homeState) ^
      const DeepCollectionEquality().hash(onboardingState) ^
      const DeepCollectionEquality().hash(bottomNavigationState) ^
      const DeepCollectionEquality().hash(miscState) ^
      const DeepCollectionEquality().hash(staffState) ^
      const DeepCollectionEquality().hash(surveyState) ^
      const DeepCollectionEquality().hash(serviceRequestState) ^
      const DeepCollectionEquality().hash(wait);

  @JsonKey(ignore: true)
  @override
  _$StateCopyWith<_State> get copyWith =>
      __$StateCopyWithImpl<_State>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_StateToJson(this);
  }
}

abstract class _State implements AppState {
  factory _State(
      {HomeState? homeState,
      OnboardingState? onboardingState,
      BottomNavigationState? bottomNavigationState,
      MiscState? miscState,
      StaffState? staffState,
      SurveyState? surveyState,
      ServiceRequestState? serviceRequestState,
      @JsonKey(ignore: true) Wait? wait}) = _$_State;

  factory _State.fromJson(Map<String, dynamic> json) = _$_State.fromJson;

  @override
  HomeState? get homeState => throw _privateConstructorUsedError;
  @override
  OnboardingState? get onboardingState => throw _privateConstructorUsedError;
  @override
  BottomNavigationState? get bottomNavigationState =>
      throw _privateConstructorUsedError;
  @override
  MiscState? get miscState => throw _privateConstructorUsedError;
  @override
  StaffState? get staffState => throw _privateConstructorUsedError;
  @override
  SurveyState? get surveyState => throw _privateConstructorUsedError;
  @override
  ServiceRequestState? get serviceRequestState =>
      throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  Wait? get wait => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$StateCopyWith<_State> get copyWith => throw _privateConstructorUsedError;
}

StaffState _$StaffStateFromJson(Map<String, dynamic> json) {
  return _StaffState.fromJson(json);
}

/// @nodoc
class _$StaffStateTearOff {
  const _$StaffStateTearOff();

  _StaffState call({UserState? userState}) {
    return _StaffState(
      userState: userState,
    );
  }

  StaffState fromJson(Map<String, Object> json) {
    return StaffState.fromJson(json);
  }
}

/// @nodoc
const $StaffState = _$StaffStateTearOff();

/// @nodoc
mixin _$StaffState {
  UserState? get userState => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $StaffStateCopyWith<StaffState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StaffStateCopyWith<$Res> {
  factory $StaffStateCopyWith(
          StaffState value, $Res Function(StaffState) then) =
      _$StaffStateCopyWithImpl<$Res>;
  $Res call({UserState? userState});

  $UserStateCopyWith<$Res>? get userState;
}

/// @nodoc
class _$StaffStateCopyWithImpl<$Res> implements $StaffStateCopyWith<$Res> {
  _$StaffStateCopyWithImpl(this._value, this._then);

  final StaffState _value;
  // ignore: unused_field
  final $Res Function(StaffState) _then;

  @override
  $Res call({
    Object? userState = freezed,
  }) {
    return _then(_value.copyWith(
      userState: userState == freezed
          ? _value.userState
          : userState // ignore: cast_nullable_to_non_nullable
              as UserState?,
    ));
  }

  @override
  $UserStateCopyWith<$Res>? get userState {
    if (_value.userState == null) {
      return null;
    }

    return $UserStateCopyWith<$Res>(_value.userState!, (value) {
      return _then(_value.copyWith(userState: value));
    });
  }
}

/// @nodoc
abstract class _$StaffStateCopyWith<$Res> implements $StaffStateCopyWith<$Res> {
  factory _$StaffStateCopyWith(
          _StaffState value, $Res Function(_StaffState) then) =
      __$StaffStateCopyWithImpl<$Res>;
  @override
  $Res call({UserState? userState});

  @override
  $UserStateCopyWith<$Res>? get userState;
}

/// @nodoc
class __$StaffStateCopyWithImpl<$Res> extends _$StaffStateCopyWithImpl<$Res>
    implements _$StaffStateCopyWith<$Res> {
  __$StaffStateCopyWithImpl(
      _StaffState _value, $Res Function(_StaffState) _then)
      : super(_value, (v) => _then(v as _StaffState));

  @override
  _StaffState get _value => super._value as _StaffState;

  @override
  $Res call({
    Object? userState = freezed,
  }) {
    return _then(_StaffState(
      userState: userState == freezed
          ? _value.userState
          : userState // ignore: cast_nullable_to_non_nullable
              as UserState?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_StaffState implements _StaffState {
  _$_StaffState({this.userState});

  factory _$_StaffState.fromJson(Map<String, dynamic> json) =>
      _$_$_StaffStateFromJson(json);

  @override
  final UserState? userState;

  @override
  String toString() {
    return 'StaffState(userState: $userState)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _StaffState &&
            (identical(other.userState, userState) ||
                const DeepCollectionEquality()
                    .equals(other.userState, userState)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(userState);

  @JsonKey(ignore: true)
  @override
  _$StaffStateCopyWith<_StaffState> get copyWith =>
      __$StaffStateCopyWithImpl<_StaffState>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_StaffStateToJson(this);
  }
}

abstract class _StaffState implements StaffState {
  factory _StaffState({UserState? userState}) = _$_StaffState;

  factory _StaffState.fromJson(Map<String, dynamic> json) =
      _$_StaffState.fromJson;

  @override
  UserState? get userState => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$StaffStateCopyWith<_StaffState> get copyWith =>
      throw _privateConstructorUsedError;
}

AuthState _$AuthStateFromJson(Map<String, dynamic> json) {
  return _AuthState.fromJson(json);
}

/// @nodoc
class _$AuthStateTearOff {
  const _$AuthStateTearOff();

  _AuthState call({AuthCredentials? credentials}) {
    return _AuthState(
      credentials: credentials,
    );
  }

  AuthState fromJson(Map<String, Object> json) {
    return AuthState.fromJson(json);
  }
}

/// @nodoc
const $AuthState = _$AuthStateTearOff();

/// @nodoc
mixin _$AuthState {
  AuthCredentials? get credentials => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AuthStateCopyWith<AuthState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthStateCopyWith<$Res> {
  factory $AuthStateCopyWith(AuthState value, $Res Function(AuthState) then) =
      _$AuthStateCopyWithImpl<$Res>;
  $Res call({AuthCredentials? credentials});

  $AuthCredentialsCopyWith<$Res>? get credentials;
}

/// @nodoc
class _$AuthStateCopyWithImpl<$Res> implements $AuthStateCopyWith<$Res> {
  _$AuthStateCopyWithImpl(this._value, this._then);

  final AuthState _value;
  // ignore: unused_field
  final $Res Function(AuthState) _then;

  @override
  $Res call({
    Object? credentials = freezed,
  }) {
    return _then(_value.copyWith(
      credentials: credentials == freezed
          ? _value.credentials
          : credentials // ignore: cast_nullable_to_non_nullable
              as AuthCredentials?,
    ));
  }

  @override
  $AuthCredentialsCopyWith<$Res>? get credentials {
    if (_value.credentials == null) {
      return null;
    }

    return $AuthCredentialsCopyWith<$Res>(_value.credentials!, (value) {
      return _then(_value.copyWith(credentials: value));
    });
  }
}

/// @nodoc
abstract class _$AuthStateCopyWith<$Res> implements $AuthStateCopyWith<$Res> {
  factory _$AuthStateCopyWith(
          _AuthState value, $Res Function(_AuthState) then) =
      __$AuthStateCopyWithImpl<$Res>;
  @override
  $Res call({AuthCredentials? credentials});

  @override
  $AuthCredentialsCopyWith<$Res>? get credentials;
}

/// @nodoc
class __$AuthStateCopyWithImpl<$Res> extends _$AuthStateCopyWithImpl<$Res>
    implements _$AuthStateCopyWith<$Res> {
  __$AuthStateCopyWithImpl(_AuthState _value, $Res Function(_AuthState) _then)
      : super(_value, (v) => _then(v as _AuthState));

  @override
  _AuthState get _value => super._value as _AuthState;

  @override
  $Res call({
    Object? credentials = freezed,
  }) {
    return _then(_AuthState(
      credentials: credentials == freezed
          ? _value.credentials
          : credentials // ignore: cast_nullable_to_non_nullable
              as AuthCredentials?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_AuthState implements _AuthState {
  _$_AuthState({this.credentials});

  factory _$_AuthState.fromJson(Map<String, dynamic> json) =>
      _$_$_AuthStateFromJson(json);

  @override
  final AuthCredentials? credentials;

  @override
  String toString() {
    return 'AuthState(credentials: $credentials)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _AuthState &&
            (identical(other.credentials, credentials) ||
                const DeepCollectionEquality()
                    .equals(other.credentials, credentials)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(credentials);

  @JsonKey(ignore: true)
  @override
  _$AuthStateCopyWith<_AuthState> get copyWith =>
      __$AuthStateCopyWithImpl<_AuthState>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_AuthStateToJson(this);
  }
}

abstract class _AuthState implements AuthState {
  factory _AuthState({AuthCredentials? credentials}) = _$_AuthState;

  factory _AuthState.fromJson(Map<String, dynamic> json) =
      _$_AuthState.fromJson;

  @override
  AuthCredentials? get credentials => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$AuthStateCopyWith<_AuthState> get copyWith =>
      throw _privateConstructorUsedError;
}

OnboardingState _$OnboardingStateFromJson(Map<String, dynamic> json) {
  return _OnboardingState.fromJson(json);
}

/// @nodoc
class _$OnboardingStateTearOff {
  const _$OnboardingStateTearOff();

  _OnboardingState call() {
    return _OnboardingState();
  }

  OnboardingState fromJson(Map<String, Object> json) {
    return OnboardingState.fromJson(json);
  }
}

/// @nodoc
const $OnboardingState = _$OnboardingStateTearOff();

/// @nodoc
mixin _$OnboardingState {
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OnboardingStateCopyWith<$Res> {
  factory $OnboardingStateCopyWith(
          OnboardingState value, $Res Function(OnboardingState) then) =
      _$OnboardingStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$OnboardingStateCopyWithImpl<$Res>
    implements $OnboardingStateCopyWith<$Res> {
  _$OnboardingStateCopyWithImpl(this._value, this._then);

  final OnboardingState _value;
  // ignore: unused_field
  final $Res Function(OnboardingState) _then;
}

/// @nodoc
abstract class _$OnboardingStateCopyWith<$Res> {
  factory _$OnboardingStateCopyWith(
          _OnboardingState value, $Res Function(_OnboardingState) then) =
      __$OnboardingStateCopyWithImpl<$Res>;
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
}

/// @nodoc
@JsonSerializable()
class _$_OnboardingState implements _OnboardingState {
  _$_OnboardingState();

  factory _$_OnboardingState.fromJson(Map<String, dynamic> json) =>
      _$_$_OnboardingStateFromJson(json);

  @override
  String toString() {
    return 'OnboardingState()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is _OnboardingState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  Map<String, dynamic> toJson() {
    return _$_$_OnboardingStateToJson(this);
  }
}

abstract class _OnboardingState implements OnboardingState {
  factory _OnboardingState() = _$_OnboardingState;

  factory _OnboardingState.fromJson(Map<String, dynamic> json) =
      _$_OnboardingState.fromJson;
}

HomeState _$HomeStateFromJson(Map<String, dynamic> json) {
  return _HomeState.fromJson(json);
}

/// @nodoc
class _$HomeStateTearOff {
  const _$HomeStateTearOff();

  _HomeState call() {
    return _HomeState();
  }

  HomeState fromJson(Map<String, Object> json) {
    return HomeState.fromJson(json);
  }
}

/// @nodoc
const $HomeState = _$HomeStateTearOff();

/// @nodoc
mixin _$HomeState {
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HomeStateCopyWith<$Res> {
  factory $HomeStateCopyWith(HomeState value, $Res Function(HomeState) then) =
      _$HomeStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$HomeStateCopyWithImpl<$Res> implements $HomeStateCopyWith<$Res> {
  _$HomeStateCopyWithImpl(this._value, this._then);

  final HomeState _value;
  // ignore: unused_field
  final $Res Function(HomeState) _then;
}

/// @nodoc
abstract class _$HomeStateCopyWith<$Res> {
  factory _$HomeStateCopyWith(
          _HomeState value, $Res Function(_HomeState) then) =
      __$HomeStateCopyWithImpl<$Res>;
}

/// @nodoc
class __$HomeStateCopyWithImpl<$Res> extends _$HomeStateCopyWithImpl<$Res>
    implements _$HomeStateCopyWith<$Res> {
  __$HomeStateCopyWithImpl(_HomeState _value, $Res Function(_HomeState) _then)
      : super(_value, (v) => _then(v as _HomeState));

  @override
  _HomeState get _value => super._value as _HomeState;
}

/// @nodoc
@JsonSerializable()
class _$_HomeState implements _HomeState {
  _$_HomeState();

  factory _$_HomeState.fromJson(Map<String, dynamic> json) =>
      _$_$_HomeStateFromJson(json);

  @override
  String toString() {
    return 'HomeState()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is _HomeState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  Map<String, dynamic> toJson() {
    return _$_$_HomeStateToJson(this);
  }
}

abstract class _HomeState implements HomeState {
  factory _HomeState() = _$_HomeState;

  factory _HomeState.fromJson(Map<String, dynamic> json) =
      _$_HomeState.fromJson;
}

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
      EventState? eventState,
      String? defaultLocation,
      String? createPin,
      String? confirmPin,
      bool? invalidCredentials,
      bool? unKnownPhoneNo,
      bool? accountExists,
      bool? invalidPin,
      @JsonKey(ignore: true) Event<bool?>? startVisitFailed,
      String? patientSearchTerm,
      bool? hasCompletedEnteringOTP,
      bool? isResendingOTP}) {
    return _MiscState(
      visitCount: visitCount,
      title: title,
      message: message,
      phoneNumber: phoneNumber,
      otpCode: otpCode,
      pinCode: pinCode,
      acceptedTerms: acceptedTerms,
      faqList: faqList,
      eventState: eventState,
      defaultLocation: defaultLocation,
      createPin: createPin,
      confirmPin: confirmPin,
      invalidCredentials: invalidCredentials,
      unKnownPhoneNo: unKnownPhoneNo,
      accountExists: accountExists,
      invalidPin: invalidPin,
      startVisitFailed: startVisitFailed,
      patientSearchTerm: patientSearchTerm,
      hasCompletedEnteringOTP: hasCompletedEnteringOTP,
      isResendingOTP: isResendingOTP,
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
  EventState? get eventState => throw _privateConstructorUsedError;

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

  /// notify user when the start visit action process fails
  @JsonKey(ignore: true)
  Event<bool?>? get startVisitFailed =>
      throw _privateConstructorUsedError; // TODO: rename to startVisitFailedEvent
  String? get patientSearchTerm => throw _privateConstructorUsedError;
  bool? get hasCompletedEnteringOTP =>
      throw _privateConstructorUsedError; // TODO: remove it is unused
  bool? get isResendingOTP => throw _privateConstructorUsedError;

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
      EventState? eventState,
      String? defaultLocation,
      String? createPin,
      String? confirmPin,
      bool? invalidCredentials,
      bool? unKnownPhoneNo,
      bool? accountExists,
      bool? invalidPin,
      @JsonKey(ignore: true) Event<bool?>? startVisitFailed,
      String? patientSearchTerm,
      bool? hasCompletedEnteringOTP,
      bool? isResendingOTP});

  $EventStateCopyWith<$Res>? get eventState;
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
    Object? eventState = freezed,
    Object? defaultLocation = freezed,
    Object? createPin = freezed,
    Object? confirmPin = freezed,
    Object? invalidCredentials = freezed,
    Object? unKnownPhoneNo = freezed,
    Object? accountExists = freezed,
    Object? invalidPin = freezed,
    Object? startVisitFailed = freezed,
    Object? patientSearchTerm = freezed,
    Object? hasCompletedEnteringOTP = freezed,
    Object? isResendingOTP = freezed,
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
      eventState: eventState == freezed
          ? _value.eventState
          : eventState // ignore: cast_nullable_to_non_nullable
              as EventState?,
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
      startVisitFailed: startVisitFailed == freezed
          ? _value.startVisitFailed
          : startVisitFailed // ignore: cast_nullable_to_non_nullable
              as Event<bool?>?,
      patientSearchTerm: patientSearchTerm == freezed
          ? _value.patientSearchTerm
          : patientSearchTerm // ignore: cast_nullable_to_non_nullable
              as String?,
      hasCompletedEnteringOTP: hasCompletedEnteringOTP == freezed
          ? _value.hasCompletedEnteringOTP
          : hasCompletedEnteringOTP // ignore: cast_nullable_to_non_nullable
              as bool?,
      isResendingOTP: isResendingOTP == freezed
          ? _value.isResendingOTP
          : isResendingOTP // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }

  @override
  $EventStateCopyWith<$Res>? get eventState {
    if (_value.eventState == null) {
      return null;
    }

    return $EventStateCopyWith<$Res>(_value.eventState!, (value) {
      return _then(_value.copyWith(eventState: value));
    });
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
      EventState? eventState,
      String? defaultLocation,
      String? createPin,
      String? confirmPin,
      bool? invalidCredentials,
      bool? unKnownPhoneNo,
      bool? accountExists,
      bool? invalidPin,
      @JsonKey(ignore: true) Event<bool?>? startVisitFailed,
      String? patientSearchTerm,
      bool? hasCompletedEnteringOTP,
      bool? isResendingOTP});

  @override
  $EventStateCopyWith<$Res>? get eventState;
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
    Object? eventState = freezed,
    Object? defaultLocation = freezed,
    Object? createPin = freezed,
    Object? confirmPin = freezed,
    Object? invalidCredentials = freezed,
    Object? unKnownPhoneNo = freezed,
    Object? accountExists = freezed,
    Object? invalidPin = freezed,
    Object? startVisitFailed = freezed,
    Object? patientSearchTerm = freezed,
    Object? hasCompletedEnteringOTP = freezed,
    Object? isResendingOTP = freezed,
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
      eventState: eventState == freezed
          ? _value.eventState
          : eventState // ignore: cast_nullable_to_non_nullable
              as EventState?,
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
      startVisitFailed: startVisitFailed == freezed
          ? _value.startVisitFailed
          : startVisitFailed // ignore: cast_nullable_to_non_nullable
              as Event<bool?>?,
      patientSearchTerm: patientSearchTerm == freezed
          ? _value.patientSearchTerm
          : patientSearchTerm // ignore: cast_nullable_to_non_nullable
              as String?,
      hasCompletedEnteringOTP: hasCompletedEnteringOTP == freezed
          ? _value.hasCompletedEnteringOTP
          : hasCompletedEnteringOTP // ignore: cast_nullable_to_non_nullable
              as bool?,
      isResendingOTP: isResendingOTP == freezed
          ? _value.isResendingOTP
          : isResendingOTP // ignore: cast_nullable_to_non_nullable
              as bool?,
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
      this.eventState,
      this.defaultLocation,
      this.createPin,
      this.confirmPin,
      this.invalidCredentials,
      this.unKnownPhoneNo,
      this.accountExists,
      this.invalidPin,
      @JsonKey(ignore: true) this.startVisitFailed,
      this.patientSearchTerm,
      this.hasCompletedEnteringOTP,
      this.isResendingOTP});

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
  final EventState? eventState;
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

  /// notify user when the start visit action process fails
  @JsonKey(ignore: true)
  final Event<bool?>? startVisitFailed;
  @override // TODO: rename to startVisitFailedEvent
  final String? patientSearchTerm;
  @override
  final bool? hasCompletedEnteringOTP;
  @override // TODO: remove it is unused
  final bool? isResendingOTP;

  @override
  String toString() {
    return 'MiscState(visitCount: $visitCount, title: $title, message: $message, phoneNumber: $phoneNumber, otpCode: $otpCode, pinCode: $pinCode, acceptedTerms: $acceptedTerms, faqList: $faqList, eventState: $eventState, defaultLocation: $defaultLocation, createPin: $createPin, confirmPin: $confirmPin, invalidCredentials: $invalidCredentials, unKnownPhoneNo: $unKnownPhoneNo, accountExists: $accountExists, invalidPin: $invalidPin, startVisitFailed: $startVisitFailed, patientSearchTerm: $patientSearchTerm, hasCompletedEnteringOTP: $hasCompletedEnteringOTP, isResendingOTP: $isResendingOTP)';
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
            (identical(other.eventState, eventState) ||
                const DeepCollectionEquality()
                    .equals(other.eventState, eventState)) &&
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
            (identical(other.startVisitFailed, startVisitFailed) ||
                const DeepCollectionEquality()
                    .equals(other.startVisitFailed, startVisitFailed)) &&
            (identical(other.patientSearchTerm, patientSearchTerm) ||
                const DeepCollectionEquality()
                    .equals(other.patientSearchTerm, patientSearchTerm)) &&
            (identical(
                    other.hasCompletedEnteringOTP, hasCompletedEnteringOTP) ||
                const DeepCollectionEquality().equals(
                    other.hasCompletedEnteringOTP, hasCompletedEnteringOTP)) &&
            (identical(other.isResendingOTP, isResendingOTP) ||
                const DeepCollectionEquality()
                    .equals(other.isResendingOTP, isResendingOTP)));
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
      const DeepCollectionEquality().hash(eventState) ^
      const DeepCollectionEquality().hash(defaultLocation) ^
      const DeepCollectionEquality().hash(createPin) ^
      const DeepCollectionEquality().hash(confirmPin) ^
      const DeepCollectionEquality().hash(invalidCredentials) ^
      const DeepCollectionEquality().hash(unKnownPhoneNo) ^
      const DeepCollectionEquality().hash(accountExists) ^
      const DeepCollectionEquality().hash(invalidPin) ^
      const DeepCollectionEquality().hash(startVisitFailed) ^
      const DeepCollectionEquality().hash(patientSearchTerm) ^
      const DeepCollectionEquality().hash(hasCompletedEnteringOTP) ^
      const DeepCollectionEquality().hash(isResendingOTP);

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
      EventState? eventState,
      String? defaultLocation,
      String? createPin,
      String? confirmPin,
      bool? invalidCredentials,
      bool? unKnownPhoneNo,
      bool? accountExists,
      bool? invalidPin,
      @JsonKey(ignore: true) Event<bool?>? startVisitFailed,
      String? patientSearchTerm,
      bool? hasCompletedEnteringOTP,
      bool? isResendingOTP}) = _$_MiscState;

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
  EventState? get eventState => throw _privateConstructorUsedError;
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

  /// notify user when the start visit action process fails
  @JsonKey(ignore: true)
  Event<bool?>? get startVisitFailed => throw _privateConstructorUsedError;
  @override // TODO: rename to startVisitFailedEvent
  String? get patientSearchTerm => throw _privateConstructorUsedError;
  @override
  bool? get hasCompletedEnteringOTP => throw _privateConstructorUsedError;
  @override // TODO: remove it is unused
  bool? get isResendingOTP => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$MiscStateCopyWith<_MiscState> get copyWith =>
      throw _privateConstructorUsedError;
}

SurveyState _$SurveyStateFromJson(Map<String, dynamic> json) {
  return _SurveyState.fromJson(json);
}

/// @nodoc
class _$SurveyStateTearOff {
  const _$SurveyStateTearOff();

  _SurveyState call() {
    return _SurveyState();
  }

  SurveyState fromJson(Map<String, Object> json) {
    return SurveyState.fromJson(json);
  }
}

/// @nodoc
const $SurveyState = _$SurveyStateTearOff();

/// @nodoc
mixin _$SurveyState {
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SurveyStateCopyWith<$Res> {
  factory $SurveyStateCopyWith(
          SurveyState value, $Res Function(SurveyState) then) =
      _$SurveyStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$SurveyStateCopyWithImpl<$Res> implements $SurveyStateCopyWith<$Res> {
  _$SurveyStateCopyWithImpl(this._value, this._then);

  final SurveyState _value;
  // ignore: unused_field
  final $Res Function(SurveyState) _then;
}

/// @nodoc
abstract class _$SurveyStateCopyWith<$Res> {
  factory _$SurveyStateCopyWith(
          _SurveyState value, $Res Function(_SurveyState) then) =
      __$SurveyStateCopyWithImpl<$Res>;
}

/// @nodoc
class __$SurveyStateCopyWithImpl<$Res> extends _$SurveyStateCopyWithImpl<$Res>
    implements _$SurveyStateCopyWith<$Res> {
  __$SurveyStateCopyWithImpl(
      _SurveyState _value, $Res Function(_SurveyState) _then)
      : super(_value, (v) => _then(v as _SurveyState));

  @override
  _SurveyState get _value => super._value as _SurveyState;
}

/// @nodoc
@JsonSerializable()
class _$_SurveyState implements _SurveyState {
  _$_SurveyState();

  factory _$_SurveyState.fromJson(Map<String, dynamic> json) =>
      _$_$_SurveyStateFromJson(json);

  @override
  String toString() {
    return 'SurveyState()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is _SurveyState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  Map<String, dynamic> toJson() {
    return _$_$_SurveyStateToJson(this);
  }
}

abstract class _SurveyState implements SurveyState {
  factory _SurveyState() = _$_SurveyState;

  factory _SurveyState.fromJson(Map<String, dynamic> json) =
      _$_SurveyState.fromJson;
}

ServiceRequestState _$ServiceRequestStateFromJson(Map<String, dynamic> json) {
  return _ServiceRequestState.fromJson(json);
}

/// @nodoc
class _$ServiceRequestStateTearOff {
  const _$ServiceRequestStateTearOff();

  _ServiceRequestState call() {
    return _ServiceRequestState();
  }

  ServiceRequestState fromJson(Map<String, Object> json) {
    return ServiceRequestState.fromJson(json);
  }
}

/// @nodoc
const $ServiceRequestState = _$ServiceRequestStateTearOff();

/// @nodoc
mixin _$ServiceRequestState {
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ServiceRequestStateCopyWith<$Res> {
  factory $ServiceRequestStateCopyWith(
          ServiceRequestState value, $Res Function(ServiceRequestState) then) =
      _$ServiceRequestStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$ServiceRequestStateCopyWithImpl<$Res>
    implements $ServiceRequestStateCopyWith<$Res> {
  _$ServiceRequestStateCopyWithImpl(this._value, this._then);

  final ServiceRequestState _value;
  // ignore: unused_field
  final $Res Function(ServiceRequestState) _then;
}

/// @nodoc
abstract class _$ServiceRequestStateCopyWith<$Res> {
  factory _$ServiceRequestStateCopyWith(_ServiceRequestState value,
          $Res Function(_ServiceRequestState) then) =
      __$ServiceRequestStateCopyWithImpl<$Res>;
}

/// @nodoc
class __$ServiceRequestStateCopyWithImpl<$Res>
    extends _$ServiceRequestStateCopyWithImpl<$Res>
    implements _$ServiceRequestStateCopyWith<$Res> {
  __$ServiceRequestStateCopyWithImpl(
      _ServiceRequestState _value, $Res Function(_ServiceRequestState) _then)
      : super(_value, (v) => _then(v as _ServiceRequestState));

  @override
  _ServiceRequestState get _value => super._value as _ServiceRequestState;
}

/// @nodoc
@JsonSerializable()
class _$_ServiceRequestState implements _ServiceRequestState {
  _$_ServiceRequestState();

  factory _$_ServiceRequestState.fromJson(Map<String, dynamic> json) =>
      _$_$_ServiceRequestStateFromJson(json);

  @override
  String toString() {
    return 'ServiceRequestState()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is _ServiceRequestState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  Map<String, dynamic> toJson() {
    return _$_$_ServiceRequestStateToJson(this);
  }
}

abstract class _ServiceRequestState implements ServiceRequestState {
  factory _ServiceRequestState() = _$_ServiceRequestState;

  factory _ServiceRequestState.fromJson(Map<String, dynamic> json) =
      _$_ServiceRequestState.fromJson;
}
