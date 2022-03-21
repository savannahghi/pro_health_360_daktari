// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'onboarding_path_info.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$OnboardingPathInfoTearOff {
  const _$OnboardingPathInfoTearOff();

  _OnboardingPathInfo call(
      {required String nextRoute,
      required String previousRoute,
      dynamic arguments = null}) {
    return _OnboardingPathInfo(
      nextRoute: nextRoute,
      previousRoute: previousRoute,
      arguments: arguments,
    );
  }
}

/// @nodoc
const $OnboardingPathInfo = _$OnboardingPathInfoTearOff();

/// @nodoc
mixin _$OnboardingPathInfo {
// The next route to navigate to
  String get nextRoute =>
      throw _privateConstructorUsedError; // The previous route to navigate to
  String get previousRoute =>
      throw _privateConstructorUsedError; // Any route arguments that may need to be passed while navigating
  dynamic get arguments => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $OnboardingPathInfoCopyWith<OnboardingPathInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OnboardingPathInfoCopyWith<$Res> {
  factory $OnboardingPathInfoCopyWith(
          OnboardingPathInfo value, $Res Function(OnboardingPathInfo) then) =
      _$OnboardingPathInfoCopyWithImpl<$Res>;
  $Res call({String nextRoute, String previousRoute, dynamic arguments});
}

/// @nodoc
class _$OnboardingPathInfoCopyWithImpl<$Res>
    implements $OnboardingPathInfoCopyWith<$Res> {
  _$OnboardingPathInfoCopyWithImpl(this._value, this._then);

  final OnboardingPathInfo _value;
  // ignore: unused_field
  final $Res Function(OnboardingPathInfo) _then;

  @override
  $Res call({
    Object? nextRoute = freezed,
    Object? previousRoute = freezed,
    Object? arguments = freezed,
  }) {
    return _then(_value.copyWith(
      nextRoute: nextRoute == freezed
          ? _value.nextRoute
          : nextRoute // ignore: cast_nullable_to_non_nullable
              as String,
      previousRoute: previousRoute == freezed
          ? _value.previousRoute
          : previousRoute // ignore: cast_nullable_to_non_nullable
              as String,
      arguments: arguments == freezed
          ? _value.arguments
          : arguments // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ));
  }
}

/// @nodoc
abstract class _$OnboardingPathInfoCopyWith<$Res>
    implements $OnboardingPathInfoCopyWith<$Res> {
  factory _$OnboardingPathInfoCopyWith(
          _OnboardingPathInfo value, $Res Function(_OnboardingPathInfo) then) =
      __$OnboardingPathInfoCopyWithImpl<$Res>;
  @override
  $Res call({String nextRoute, String previousRoute, dynamic arguments});
}

/// @nodoc
class __$OnboardingPathInfoCopyWithImpl<$Res>
    extends _$OnboardingPathInfoCopyWithImpl<$Res>
    implements _$OnboardingPathInfoCopyWith<$Res> {
  __$OnboardingPathInfoCopyWithImpl(
      _OnboardingPathInfo _value, $Res Function(_OnboardingPathInfo) _then)
      : super(_value, (v) => _then(v as _OnboardingPathInfo));

  @override
  _OnboardingPathInfo get _value => super._value as _OnboardingPathInfo;

  @override
  $Res call({
    Object? nextRoute = freezed,
    Object? previousRoute = freezed,
    Object? arguments = freezed,
  }) {
    return _then(_OnboardingPathInfo(
      nextRoute: nextRoute == freezed
          ? _value.nextRoute
          : nextRoute // ignore: cast_nullable_to_non_nullable
              as String,
      previousRoute: previousRoute == freezed
          ? _value.previousRoute
          : previousRoute // ignore: cast_nullable_to_non_nullable
              as String,
      arguments: arguments == freezed
          ? _value.arguments
          : arguments // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ));
  }
}

/// @nodoc

class _$_OnboardingPathInfo implements _OnboardingPathInfo {
  _$_OnboardingPathInfo(
      {required this.nextRoute,
      required this.previousRoute,
      this.arguments = null});

  @override // The next route to navigate to
  final String nextRoute;
  @override // The previous route to navigate to
  final String previousRoute;
  @JsonKey()
  @override // Any route arguments that may need to be passed while navigating
  final dynamic arguments;

  @override
  String toString() {
    return 'OnboardingPathInfo(nextRoute: $nextRoute, previousRoute: $previousRoute, arguments: $arguments)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _OnboardingPathInfo &&
            const DeepCollectionEquality().equals(other.nextRoute, nextRoute) &&
            const DeepCollectionEquality()
                .equals(other.previousRoute, previousRoute) &&
            const DeepCollectionEquality().equals(other.arguments, arguments));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(nextRoute),
      const DeepCollectionEquality().hash(previousRoute),
      const DeepCollectionEquality().hash(arguments));

  @JsonKey(ignore: true)
  @override
  _$OnboardingPathInfoCopyWith<_OnboardingPathInfo> get copyWith =>
      __$OnboardingPathInfoCopyWithImpl<_OnboardingPathInfo>(this, _$identity);
}

abstract class _OnboardingPathInfo implements OnboardingPathInfo {
  factory _OnboardingPathInfo(
      {required String nextRoute,
      required String previousRoute,
      dynamic arguments}) = _$_OnboardingPathInfo;

  @override // The next route to navigate to
  String get nextRoute;
  @override // The previous route to navigate to
  String get previousRoute;
  @override // Any route arguments that may need to be passed while navigating
  dynamic get arguments;
  @override
  @JsonKey(ignore: true)
  _$OnboardingPathInfoCopyWith<_OnboardingPathInfo> get copyWith =>
      throw _privateConstructorUsedError;
}
