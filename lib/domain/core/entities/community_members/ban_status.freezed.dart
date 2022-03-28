// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'ban_status.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

BanStatus _$BanStatusFromJson(Map<String, dynamic> json) {
  return _BanStatus.fromJson(json);
}

/// @nodoc
class _$BanStatusTearOff {
  const _$BanStatusTearOff();

  _BanStatus call({@JsonKey(name: 'bannedInCommunity') bool? value}) {
    return _BanStatus(
      value: value,
    );
  }

  BanStatus fromJson(Map<String, Object?> json) {
    return BanStatus.fromJson(json);
  }
}

/// @nodoc
const $BanStatus = _$BanStatusTearOff();

/// @nodoc
mixin _$BanStatus {
  @JsonKey(name: 'bannedInCommunity')
  bool? get value => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BanStatusCopyWith<BanStatus> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BanStatusCopyWith<$Res> {
  factory $BanStatusCopyWith(BanStatus value, $Res Function(BanStatus) then) =
      _$BanStatusCopyWithImpl<$Res>;
  $Res call({@JsonKey(name: 'bannedInCommunity') bool? value});
}

/// @nodoc
class _$BanStatusCopyWithImpl<$Res> implements $BanStatusCopyWith<$Res> {
  _$BanStatusCopyWithImpl(this._value, this._then);

  final BanStatus _value;
  // ignore: unused_field
  final $Res Function(BanStatus) _then;

  @override
  $Res call({
    Object? value = freezed,
  }) {
    return _then(_value.copyWith(
      value: value == freezed
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
abstract class _$BanStatusCopyWith<$Res> implements $BanStatusCopyWith<$Res> {
  factory _$BanStatusCopyWith(
          _BanStatus value, $Res Function(_BanStatus) then) =
      __$BanStatusCopyWithImpl<$Res>;
  @override
  $Res call({@JsonKey(name: 'bannedInCommunity') bool? value});
}

/// @nodoc
class __$BanStatusCopyWithImpl<$Res> extends _$BanStatusCopyWithImpl<$Res>
    implements _$BanStatusCopyWith<$Res> {
  __$BanStatusCopyWithImpl(_BanStatus _value, $Res Function(_BanStatus) _then)
      : super(_value, (v) => _then(v as _BanStatus));

  @override
  _BanStatus get _value => super._value as _BanStatus;

  @override
  $Res call({
    Object? value = freezed,
  }) {
    return _then(_BanStatus(
      value: value == freezed
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_BanStatus implements _BanStatus {
  _$_BanStatus({@JsonKey(name: 'bannedInCommunity') this.value});

  factory _$_BanStatus.fromJson(Map<String, dynamic> json) =>
      _$$_BanStatusFromJson(json);

  @override
  @JsonKey(name: 'bannedInCommunity')
  final bool? value;

  @override
  String toString() {
    return 'BanStatus(value: $value)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _BanStatus &&
            const DeepCollectionEquality().equals(other.value, value));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(value));

  @JsonKey(ignore: true)
  @override
  _$BanStatusCopyWith<_BanStatus> get copyWith =>
      __$BanStatusCopyWithImpl<_BanStatus>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_BanStatusToJson(this);
  }
}

abstract class _BanStatus implements BanStatus {
  factory _BanStatus({@JsonKey(name: 'bannedInCommunity') bool? value}) =
      _$_BanStatus;

  factory _BanStatus.fromJson(Map<String, dynamic> json) =
      _$_BanStatus.fromJson;

  @override
  @JsonKey(name: 'bannedInCommunity')
  bool? get value;
  @override
  @JsonKey(ignore: true)
  _$BanStatusCopyWith<_BanStatus> get copyWith =>
      throw _privateConstructorUsedError;
}
