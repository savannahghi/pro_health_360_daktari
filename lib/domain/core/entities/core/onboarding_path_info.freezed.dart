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
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

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
abstract class _$$_OnboardingPathInfoCopyWith<$Res>
    implements $OnboardingPathInfoCopyWith<$Res> {
  factory _$$_OnboardingPathInfoCopyWith(_$_OnboardingPathInfo value,
          $Res Function(_$_OnboardingPathInfo) then) =
      __$$_OnboardingPathInfoCopyWithImpl<$Res>;
  @override
  $Res call({String nextRoute, String previousRoute, dynamic arguments});
}

/// @nodoc
class __$$_OnboardingPathInfoCopyWithImpl<$Res>
    extends _$OnboardingPathInfoCopyWithImpl<$Res>
    implements _$$_OnboardingPathInfoCopyWith<$Res> {
  __$$_OnboardingPathInfoCopyWithImpl(
      _$_OnboardingPathInfo _value, $Res Function(_$_OnboardingPathInfo) _then)
      : super(_value, (v) => _then(v as _$_OnboardingPathInfo));

  @override
  _$_OnboardingPathInfo get _value => super._value as _$_OnboardingPathInfo;

  @override
  $Res call({
    Object? nextRoute = freezed,
    Object? previousRoute = freezed,
    Object? arguments = freezed,
  }) {
    return _then(_$_OnboardingPathInfo(
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

// The next route to navigate to
  @override
  final String nextRoute;
// The previous route to navigate to
  @override
  final String previousRoute;
// Any route arguments that may need to be passed while navigating
  @override
  @JsonKey()
  final dynamic arguments;

  @override
  String toString() {
    return 'OnboardingPathInfo(nextRoute: $nextRoute, previousRoute: $previousRoute, arguments: $arguments)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_OnboardingPathInfo &&
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
  _$$_OnboardingPathInfoCopyWith<_$_OnboardingPathInfo> get copyWith =>
      __$$_OnboardingPathInfoCopyWithImpl<_$_OnboardingPathInfo>(
          this, _$identity);
}

abstract class _OnboardingPathInfo implements OnboardingPathInfo {
  factory _OnboardingPathInfo(
      {required final String nextRoute,
      required final String previousRoute,
      final dynamic arguments}) = _$_OnboardingPathInfo;

  @override // The next route to navigate to
  String get nextRoute => throw _privateConstructorUsedError;
  @override // The previous route to navigate to
  String get previousRoute => throw _privateConstructorUsedError;
  @override // Any route arguments that may need to be passed while navigating
  dynamic get arguments => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_OnboardingPathInfoCopyWith<_$_OnboardingPathInfo> get copyWith =>
      throw _privateConstructorUsedError;
}
