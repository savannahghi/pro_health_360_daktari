// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'faqs_content_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

FAQsContentState _$FAQsContentStateFromJson(Map<String, dynamic> json) {
  return _FAQsContentState.fromJson(json);
}

/// @nodoc
class _$FAQsContentStateTearOff {
  const _$FAQsContentStateTearOff();

  _FAQsContentState call(
      {List<FAQContent?>? profileFAQs,
      bool? errorFetchingFAQs,
      bool? timeoutFetchingFAQs}) {
    return _FAQsContentState(
      profileFAQs: profileFAQs,
      errorFetchingFAQs: errorFetchingFAQs,
      timeoutFetchingFAQs: timeoutFetchingFAQs,
    );
  }

  FAQsContentState fromJson(Map<String, Object> json) {
    return FAQsContentState.fromJson(json);
  }
}

/// @nodoc
const $FAQsContentState = _$FAQsContentStateTearOff();

/// @nodoc
mixin _$FAQsContentState {
  List<FAQContent?>? get profileFAQs => throw _privateConstructorUsedError;
  bool? get errorFetchingFAQs => throw _privateConstructorUsedError;
  bool? get timeoutFetchingFAQs => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FAQsContentStateCopyWith<FAQsContentState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FAQsContentStateCopyWith<$Res> {
  factory $FAQsContentStateCopyWith(
          FAQsContentState value, $Res Function(FAQsContentState) then) =
      _$FAQsContentStateCopyWithImpl<$Res>;
  $Res call(
      {List<FAQContent?>? profileFAQs,
      bool? errorFetchingFAQs,
      bool? timeoutFetchingFAQs});
}

/// @nodoc
class _$FAQsContentStateCopyWithImpl<$Res>
    implements $FAQsContentStateCopyWith<$Res> {
  _$FAQsContentStateCopyWithImpl(this._value, this._then);

  final FAQsContentState _value;
  // ignore: unused_field
  final $Res Function(FAQsContentState) _then;

  @override
  $Res call({
    Object? profileFAQs = freezed,
    Object? errorFetchingFAQs = freezed,
    Object? timeoutFetchingFAQs = freezed,
  }) {
    return _then(_value.copyWith(
      profileFAQs: profileFAQs == freezed
          ? _value.profileFAQs
          : profileFAQs // ignore: cast_nullable_to_non_nullable
              as List<FAQContent?>?,
      errorFetchingFAQs: errorFetchingFAQs == freezed
          ? _value.errorFetchingFAQs
          : errorFetchingFAQs // ignore: cast_nullable_to_non_nullable
              as bool?,
      timeoutFetchingFAQs: timeoutFetchingFAQs == freezed
          ? _value.timeoutFetchingFAQs
          : timeoutFetchingFAQs // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
abstract class _$FAQsContentStateCopyWith<$Res>
    implements $FAQsContentStateCopyWith<$Res> {
  factory _$FAQsContentStateCopyWith(
          _FAQsContentState value, $Res Function(_FAQsContentState) then) =
      __$FAQsContentStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {List<FAQContent?>? profileFAQs,
      bool? errorFetchingFAQs,
      bool? timeoutFetchingFAQs});
}

/// @nodoc
class __$FAQsContentStateCopyWithImpl<$Res>
    extends _$FAQsContentStateCopyWithImpl<$Res>
    implements _$FAQsContentStateCopyWith<$Res> {
  __$FAQsContentStateCopyWithImpl(
      _FAQsContentState _value, $Res Function(_FAQsContentState) _then)
      : super(_value, (v) => _then(v as _FAQsContentState));

  @override
  _FAQsContentState get _value => super._value as _FAQsContentState;

  @override
  $Res call({
    Object? profileFAQs = freezed,
    Object? errorFetchingFAQs = freezed,
    Object? timeoutFetchingFAQs = freezed,
  }) {
    return _then(_FAQsContentState(
      profileFAQs: profileFAQs == freezed
          ? _value.profileFAQs
          : profileFAQs // ignore: cast_nullable_to_non_nullable
              as List<FAQContent?>?,
      errorFetchingFAQs: errorFetchingFAQs == freezed
          ? _value.errorFetchingFAQs
          : errorFetchingFAQs // ignore: cast_nullable_to_non_nullable
              as bool?,
      timeoutFetchingFAQs: timeoutFetchingFAQs == freezed
          ? _value.timeoutFetchingFAQs
          : timeoutFetchingFAQs // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_FAQsContentState implements _FAQsContentState {
  _$_FAQsContentState(
      {this.profileFAQs, this.errorFetchingFAQs, this.timeoutFetchingFAQs});

  factory _$_FAQsContentState.fromJson(Map<String, dynamic> json) =>
      _$_$_FAQsContentStateFromJson(json);

  @override
  final List<FAQContent?>? profileFAQs;
  @override
  final bool? errorFetchingFAQs;
  @override
  final bool? timeoutFetchingFAQs;

  @override
  String toString() {
    return 'FAQsContentState(profileFAQs: $profileFAQs, errorFetchingFAQs: $errorFetchingFAQs, timeoutFetchingFAQs: $timeoutFetchingFAQs)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _FAQsContentState &&
            (identical(other.profileFAQs, profileFAQs) ||
                const DeepCollectionEquality()
                    .equals(other.profileFAQs, profileFAQs)) &&
            (identical(other.errorFetchingFAQs, errorFetchingFAQs) ||
                const DeepCollectionEquality()
                    .equals(other.errorFetchingFAQs, errorFetchingFAQs)) &&
            (identical(other.timeoutFetchingFAQs, timeoutFetchingFAQs) ||
                const DeepCollectionEquality()
                    .equals(other.timeoutFetchingFAQs, timeoutFetchingFAQs)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(profileFAQs) ^
      const DeepCollectionEquality().hash(errorFetchingFAQs) ^
      const DeepCollectionEquality().hash(timeoutFetchingFAQs);

  @JsonKey(ignore: true)
  @override
  _$FAQsContentStateCopyWith<_FAQsContentState> get copyWith =>
      __$FAQsContentStateCopyWithImpl<_FAQsContentState>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_FAQsContentStateToJson(this);
  }
}

abstract class _FAQsContentState implements FAQsContentState {
  factory _FAQsContentState(
      {List<FAQContent?>? profileFAQs,
      bool? errorFetchingFAQs,
      bool? timeoutFetchingFAQs}) = _$_FAQsContentState;

  factory _FAQsContentState.fromJson(Map<String, dynamic> json) =
      _$_FAQsContentState.fromJson;

  @override
  List<FAQContent?>? get profileFAQs => throw _privateConstructorUsedError;
  @override
  bool? get errorFetchingFAQs => throw _privateConstructorUsedError;
  @override
  bool? get timeoutFetchingFAQs => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$FAQsContentStateCopyWith<_FAQsContentState> get copyWith =>
      throw _privateConstructorUsedError;
}
