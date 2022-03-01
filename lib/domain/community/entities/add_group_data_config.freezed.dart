// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'add_group_data_config.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$AddGroupDataConfigTearOff {
  const _$AddGroupDataConfigTearOff();

  _AddGroupDataConfig call(
      {required List<DropdownItem> band,
      required List<DropdownItem> age,
      required List<DropdownItem> location,
      required List<DropdownItem> clinic}) {
    return _AddGroupDataConfig(
      band: band,
      age: age,
      location: location,
      clinic: clinic,
    );
  }
}

/// @nodoc
const $AddGroupDataConfig = _$AddGroupDataConfigTearOff();

/// @nodoc
mixin _$AddGroupDataConfig {
  List<DropdownItem> get band => throw _privateConstructorUsedError;
  List<DropdownItem> get age => throw _privateConstructorUsedError;
  List<DropdownItem> get location => throw _privateConstructorUsedError;
  List<DropdownItem> get clinic => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AddGroupDataConfigCopyWith<AddGroupDataConfig> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AddGroupDataConfigCopyWith<$Res> {
  factory $AddGroupDataConfigCopyWith(
          AddGroupDataConfig value, $Res Function(AddGroupDataConfig) then) =
      _$AddGroupDataConfigCopyWithImpl<$Res>;
  $Res call(
      {List<DropdownItem> band,
      List<DropdownItem> age,
      List<DropdownItem> location,
      List<DropdownItem> clinic});
}

/// @nodoc
class _$AddGroupDataConfigCopyWithImpl<$Res>
    implements $AddGroupDataConfigCopyWith<$Res> {
  _$AddGroupDataConfigCopyWithImpl(this._value, this._then);

  final AddGroupDataConfig _value;
  // ignore: unused_field
  final $Res Function(AddGroupDataConfig) _then;

  @override
  $Res call({
    Object? band = freezed,
    Object? age = freezed,
    Object? location = freezed,
    Object? clinic = freezed,
  }) {
    return _then(_value.copyWith(
      band: band == freezed
          ? _value.band
          : band // ignore: cast_nullable_to_non_nullable
              as List<DropdownItem>,
      age: age == freezed
          ? _value.age
          : age // ignore: cast_nullable_to_non_nullable
              as List<DropdownItem>,
      location: location == freezed
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as List<DropdownItem>,
      clinic: clinic == freezed
          ? _value.clinic
          : clinic // ignore: cast_nullable_to_non_nullable
              as List<DropdownItem>,
    ));
  }
}

/// @nodoc
abstract class _$AddGroupDataConfigCopyWith<$Res>
    implements $AddGroupDataConfigCopyWith<$Res> {
  factory _$AddGroupDataConfigCopyWith(
          _AddGroupDataConfig value, $Res Function(_AddGroupDataConfig) then) =
      __$AddGroupDataConfigCopyWithImpl<$Res>;
  @override
  $Res call(
      {List<DropdownItem> band,
      List<DropdownItem> age,
      List<DropdownItem> location,
      List<DropdownItem> clinic});
}

/// @nodoc
class __$AddGroupDataConfigCopyWithImpl<$Res>
    extends _$AddGroupDataConfigCopyWithImpl<$Res>
    implements _$AddGroupDataConfigCopyWith<$Res> {
  __$AddGroupDataConfigCopyWithImpl(
      _AddGroupDataConfig _value, $Res Function(_AddGroupDataConfig) _then)
      : super(_value, (v) => _then(v as _AddGroupDataConfig));

  @override
  _AddGroupDataConfig get _value => super._value as _AddGroupDataConfig;

  @override
  $Res call({
    Object? band = freezed,
    Object? age = freezed,
    Object? location = freezed,
    Object? clinic = freezed,
  }) {
    return _then(_AddGroupDataConfig(
      band: band == freezed
          ? _value.band
          : band // ignore: cast_nullable_to_non_nullable
              as List<DropdownItem>,
      age: age == freezed
          ? _value.age
          : age // ignore: cast_nullable_to_non_nullable
              as List<DropdownItem>,
      location: location == freezed
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as List<DropdownItem>,
      clinic: clinic == freezed
          ? _value.clinic
          : clinic // ignore: cast_nullable_to_non_nullable
              as List<DropdownItem>,
    ));
  }
}

/// @nodoc

class _$_AddGroupDataConfig implements _AddGroupDataConfig {
  _$_AddGroupDataConfig(
      {required this.band,
      required this.age,
      required this.location,
      required this.clinic});

  @override
  final List<DropdownItem> band;
  @override
  final List<DropdownItem> age;
  @override
  final List<DropdownItem> location;
  @override
  final List<DropdownItem> clinic;

  @override
  String toString() {
    return 'AddGroupDataConfig(band: $band, age: $age, location: $location, clinic: $clinic)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _AddGroupDataConfig &&
            const DeepCollectionEquality().equals(other.band, band) &&
            const DeepCollectionEquality().equals(other.age, age) &&
            const DeepCollectionEquality().equals(other.location, location) &&
            const DeepCollectionEquality().equals(other.clinic, clinic));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(band),
      const DeepCollectionEquality().hash(age),
      const DeepCollectionEquality().hash(location),
      const DeepCollectionEquality().hash(clinic));

  @JsonKey(ignore: true)
  @override
  _$AddGroupDataConfigCopyWith<_AddGroupDataConfig> get copyWith =>
      __$AddGroupDataConfigCopyWithImpl<_AddGroupDataConfig>(this, _$identity);
}

abstract class _AddGroupDataConfig implements AddGroupDataConfig {
  factory _AddGroupDataConfig(
      {required List<DropdownItem> band,
      required List<DropdownItem> age,
      required List<DropdownItem> location,
      required List<DropdownItem> clinic}) = _$_AddGroupDataConfig;

  @override
  List<DropdownItem> get band;
  @override
  List<DropdownItem> get age;
  @override
  List<DropdownItem> get location;
  @override
  List<DropdownItem> get clinic;
  @override
  @JsonKey(ignore: true)
  _$AddGroupDataConfigCopyWith<_AddGroupDataConfig> get copyWith =>
      throw _privateConstructorUsedError;
}
