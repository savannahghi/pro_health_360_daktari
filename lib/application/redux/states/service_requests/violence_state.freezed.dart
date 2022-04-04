// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'violence_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ViolenceState _$ViolenceStateFromJson(Map<String, dynamic> json) {
  return _ViolenceState.fromJson(json);
}

/// @nodoc
class _$ViolenceStateTearOff {
  const _$ViolenceStateTearOff();

  _ViolenceState call({List<ScreeningQuestionsList>? screeningQuestionItems}) {
    return _ViolenceState(
      screeningQuestionItems: screeningQuestionItems,
    );
  }

  ViolenceState fromJson(Map<String, Object?> json) {
    return ViolenceState.fromJson(json);
  }
}

/// @nodoc
const $ViolenceState = _$ViolenceStateTearOff();

/// @nodoc
mixin _$ViolenceState {
  List<ScreeningQuestionsList>? get screeningQuestionItems =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ViolenceStateCopyWith<ViolenceState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ViolenceStateCopyWith<$Res> {
  factory $ViolenceStateCopyWith(
          ViolenceState value, $Res Function(ViolenceState) then) =
      _$ViolenceStateCopyWithImpl<$Res>;
  $Res call({List<ScreeningQuestionsList>? screeningQuestionItems});
}

/// @nodoc
class _$ViolenceStateCopyWithImpl<$Res>
    implements $ViolenceStateCopyWith<$Res> {
  _$ViolenceStateCopyWithImpl(this._value, this._then);

  final ViolenceState _value;
  // ignore: unused_field
  final $Res Function(ViolenceState) _then;

  @override
  $Res call({
    Object? screeningQuestionItems = freezed,
  }) {
    return _then(_value.copyWith(
      screeningQuestionItems: screeningQuestionItems == freezed
          ? _value.screeningQuestionItems
          : screeningQuestionItems // ignore: cast_nullable_to_non_nullable
              as List<ScreeningQuestionsList>?,
    ));
  }
}

/// @nodoc
abstract class _$ViolenceStateCopyWith<$Res>
    implements $ViolenceStateCopyWith<$Res> {
  factory _$ViolenceStateCopyWith(
          _ViolenceState value, $Res Function(_ViolenceState) then) =
      __$ViolenceStateCopyWithImpl<$Res>;
  @override
  $Res call({List<ScreeningQuestionsList>? screeningQuestionItems});
}

/// @nodoc
class __$ViolenceStateCopyWithImpl<$Res>
    extends _$ViolenceStateCopyWithImpl<$Res>
    implements _$ViolenceStateCopyWith<$Res> {
  __$ViolenceStateCopyWithImpl(
      _ViolenceState _value, $Res Function(_ViolenceState) _then)
      : super(_value, (v) => _then(v as _ViolenceState));

  @override
  _ViolenceState get _value => super._value as _ViolenceState;

  @override
  $Res call({
    Object? screeningQuestionItems = freezed,
  }) {
    return _then(_ViolenceState(
      screeningQuestionItems: screeningQuestionItems == freezed
          ? _value.screeningQuestionItems
          : screeningQuestionItems // ignore: cast_nullable_to_non_nullable
              as List<ScreeningQuestionsList>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ViolenceState implements _ViolenceState {
  _$_ViolenceState({this.screeningQuestionItems});

  factory _$_ViolenceState.fromJson(Map<String, dynamic> json) =>
      _$$_ViolenceStateFromJson(json);

  @override
  final List<ScreeningQuestionsList>? screeningQuestionItems;

  @override
  String toString() {
    return 'ViolenceState(screeningQuestionItems: $screeningQuestionItems)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ViolenceState &&
            const DeepCollectionEquality()
                .equals(other.screeningQuestionItems, screeningQuestionItems));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(screeningQuestionItems));

  @JsonKey(ignore: true)
  @override
  _$ViolenceStateCopyWith<_ViolenceState> get copyWith =>
      __$ViolenceStateCopyWithImpl<_ViolenceState>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ViolenceStateToJson(this);
  }
}

abstract class _ViolenceState implements ViolenceState {
  factory _ViolenceState(
          {List<ScreeningQuestionsList>? screeningQuestionItems}) =
      _$_ViolenceState;

  factory _ViolenceState.fromJson(Map<String, dynamic> json) =
      _$_ViolenceState.fromJson;

  @override
  List<ScreeningQuestionsList>? get screeningQuestionItems;
  @override
  @JsonKey(ignore: true)
  _$ViolenceStateCopyWith<_ViolenceState> get copyWith =>
      throw _privateConstructorUsedError;
}
