// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'app_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

AppState _$AppStateFromJson(Map<String, dynamic> json) {
  return _State.fromJson(json);
}

/// @nodoc
mixin _$AppState {
  AuthCredentials? get credentials => throw _privateConstructorUsedError;
  HomeState? get homeState => throw _privateConstructorUsedError;
  OnboardingState? get onboardingState => throw _privateConstructorUsedError;
  BottomNavigationState? get bottomNavigationState =>
      throw _privateConstructorUsedError;
  MiscState? get miscState => throw _privateConstructorUsedError;
  StaffState? get staffState => throw _privateConstructorUsedError;
  SurveyState? get surveyState => throw _privateConstructorUsedError;
  ServiceRequestState? get serviceRequestState =>
      throw _privateConstructorUsedError;
  ConnectivityState? get connectivityState =>
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
      {AuthCredentials? credentials,
      HomeState? homeState,
      OnboardingState? onboardingState,
      BottomNavigationState? bottomNavigationState,
      MiscState? miscState,
      StaffState? staffState,
      SurveyState? surveyState,
      ServiceRequestState? serviceRequestState,
      ConnectivityState? connectivityState,
      @JsonKey(ignore: true) Wait? wait});

  $AuthCredentialsCopyWith<$Res>? get credentials;
  $HomeStateCopyWith<$Res>? get homeState;
  $OnboardingStateCopyWith<$Res>? get onboardingState;
  $BottomNavigationStateCopyWith<$Res>? get bottomNavigationState;
  $MiscStateCopyWith<$Res>? get miscState;
  $StaffStateCopyWith<$Res>? get staffState;
  $SurveyStateCopyWith<$Res>? get surveyState;
  $ServiceRequestStateCopyWith<$Res>? get serviceRequestState;
  $ConnectivityStateCopyWith<$Res>? get connectivityState;
}

/// @nodoc
class _$AppStateCopyWithImpl<$Res> implements $AppStateCopyWith<$Res> {
  _$AppStateCopyWithImpl(this._value, this._then);

  final AppState _value;
  // ignore: unused_field
  final $Res Function(AppState) _then;

  @override
  $Res call({
    Object? credentials = freezed,
    Object? homeState = freezed,
    Object? onboardingState = freezed,
    Object? bottomNavigationState = freezed,
    Object? miscState = freezed,
    Object? staffState = freezed,
    Object? surveyState = freezed,
    Object? serviceRequestState = freezed,
    Object? connectivityState = freezed,
    Object? wait = freezed,
  }) {
    return _then(_value.copyWith(
      credentials: credentials == freezed
          ? _value.credentials
          : credentials // ignore: cast_nullable_to_non_nullable
              as AuthCredentials?,
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
      connectivityState: connectivityState == freezed
          ? _value.connectivityState
          : connectivityState // ignore: cast_nullable_to_non_nullable
              as ConnectivityState?,
      wait: wait == freezed
          ? _value.wait
          : wait // ignore: cast_nullable_to_non_nullable
              as Wait?,
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

  @override
  $ConnectivityStateCopyWith<$Res>? get connectivityState {
    if (_value.connectivityState == null) {
      return null;
    }

    return $ConnectivityStateCopyWith<$Res>(_value.connectivityState!, (value) {
      return _then(_value.copyWith(connectivityState: value));
    });
  }
}

/// @nodoc
abstract class _$$_StateCopyWith<$Res> implements $AppStateCopyWith<$Res> {
  factory _$$_StateCopyWith(_$_State value, $Res Function(_$_State) then) =
      __$$_StateCopyWithImpl<$Res>;
  @override
  $Res call(
      {AuthCredentials? credentials,
      HomeState? homeState,
      OnboardingState? onboardingState,
      BottomNavigationState? bottomNavigationState,
      MiscState? miscState,
      StaffState? staffState,
      SurveyState? surveyState,
      ServiceRequestState? serviceRequestState,
      ConnectivityState? connectivityState,
      @JsonKey(ignore: true) Wait? wait});

  @override
  $AuthCredentialsCopyWith<$Res>? get credentials;
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
  @override
  $ConnectivityStateCopyWith<$Res>? get connectivityState;
}

/// @nodoc
class __$$_StateCopyWithImpl<$Res> extends _$AppStateCopyWithImpl<$Res>
    implements _$$_StateCopyWith<$Res> {
  __$$_StateCopyWithImpl(_$_State _value, $Res Function(_$_State) _then)
      : super(_value, (v) => _then(v as _$_State));

  @override
  _$_State get _value => super._value as _$_State;

  @override
  $Res call({
    Object? credentials = freezed,
    Object? homeState = freezed,
    Object? onboardingState = freezed,
    Object? bottomNavigationState = freezed,
    Object? miscState = freezed,
    Object? staffState = freezed,
    Object? surveyState = freezed,
    Object? serviceRequestState = freezed,
    Object? connectivityState = freezed,
    Object? wait = freezed,
  }) {
    return _then(_$_State(
      credentials: credentials == freezed
          ? _value.credentials
          : credentials // ignore: cast_nullable_to_non_nullable
              as AuthCredentials?,
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
      connectivityState: connectivityState == freezed
          ? _value.connectivityState
          : connectivityState // ignore: cast_nullable_to_non_nullable
              as ConnectivityState?,
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
      {this.credentials,
      this.homeState,
      this.onboardingState,
      this.bottomNavigationState,
      this.miscState,
      this.staffState,
      this.surveyState,
      this.serviceRequestState,
      this.connectivityState,
      @JsonKey(ignore: true) this.wait});

  factory _$_State.fromJson(Map<String, dynamic> json) =>
      _$$_StateFromJson(json);

  @override
  final AuthCredentials? credentials;
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
  final ConnectivityState? connectivityState;
  @override
  @JsonKey(ignore: true)
  final Wait? wait;

  @override
  String toString() {
    return 'AppState(credentials: $credentials, homeState: $homeState, onboardingState: $onboardingState, bottomNavigationState: $bottomNavigationState, miscState: $miscState, staffState: $staffState, surveyState: $surveyState, serviceRequestState: $serviceRequestState, connectivityState: $connectivityState, wait: $wait)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_State &&
            const DeepCollectionEquality()
                .equals(other.credentials, credentials) &&
            const DeepCollectionEquality().equals(other.homeState, homeState) &&
            const DeepCollectionEquality()
                .equals(other.onboardingState, onboardingState) &&
            const DeepCollectionEquality()
                .equals(other.bottomNavigationState, bottomNavigationState) &&
            const DeepCollectionEquality().equals(other.miscState, miscState) &&
            const DeepCollectionEquality()
                .equals(other.staffState, staffState) &&
            const DeepCollectionEquality()
                .equals(other.surveyState, surveyState) &&
            const DeepCollectionEquality()
                .equals(other.serviceRequestState, serviceRequestState) &&
            const DeepCollectionEquality()
                .equals(other.connectivityState, connectivityState) &&
            const DeepCollectionEquality().equals(other.wait, wait));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(credentials),
      const DeepCollectionEquality().hash(homeState),
      const DeepCollectionEquality().hash(onboardingState),
      const DeepCollectionEquality().hash(bottomNavigationState),
      const DeepCollectionEquality().hash(miscState),
      const DeepCollectionEquality().hash(staffState),
      const DeepCollectionEquality().hash(surveyState),
      const DeepCollectionEquality().hash(serviceRequestState),
      const DeepCollectionEquality().hash(connectivityState),
      const DeepCollectionEquality().hash(wait));

  @JsonKey(ignore: true)
  @override
  _$$_StateCopyWith<_$_State> get copyWith =>
      __$$_StateCopyWithImpl<_$_State>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_StateToJson(this);
  }
}

abstract class _State implements AppState {
  factory _State(
      {final AuthCredentials? credentials,
      final HomeState? homeState,
      final OnboardingState? onboardingState,
      final BottomNavigationState? bottomNavigationState,
      final MiscState? miscState,
      final StaffState? staffState,
      final SurveyState? surveyState,
      final ServiceRequestState? serviceRequestState,
      final ConnectivityState? connectivityState,
      @JsonKey(ignore: true) final Wait? wait}) = _$_State;

  factory _State.fromJson(Map<String, dynamic> json) = _$_State.fromJson;

  @override
  AuthCredentials? get credentials => throw _privateConstructorUsedError;
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
  ConnectivityState? get connectivityState =>
      throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  Wait? get wait => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_StateCopyWith<_$_State> get copyWith =>
      throw _privateConstructorUsedError;
}
