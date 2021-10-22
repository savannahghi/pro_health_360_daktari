// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'new_broadcast_config.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$NewBroadcastConfigTearOff {
  const _$NewBroadcastConfigTearOff();

  _NewBroadcastConfig call(
      {required AddGroupDataConfig addGroupDataConfig,
      required List<DropdownItem> broadcastName}) {
    return _NewBroadcastConfig(
      addGroupDataConfig: addGroupDataConfig,
      broadcastName: broadcastName,
    );
  }
}

/// @nodoc
const $NewBroadcastConfig = _$NewBroadcastConfigTearOff();

/// @nodoc
mixin _$NewBroadcastConfig {
  AddGroupDataConfig get addGroupDataConfig =>
      throw _privateConstructorUsedError;
  List<DropdownItem> get broadcastName => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $NewBroadcastConfigCopyWith<NewBroadcastConfig> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NewBroadcastConfigCopyWith<$Res> {
  factory $NewBroadcastConfigCopyWith(
          NewBroadcastConfig value, $Res Function(NewBroadcastConfig) then) =
      _$NewBroadcastConfigCopyWithImpl<$Res>;
  $Res call(
      {AddGroupDataConfig addGroupDataConfig,
      List<DropdownItem> broadcastName});

  $AddGroupDataConfigCopyWith<$Res> get addGroupDataConfig;
}

/// @nodoc
class _$NewBroadcastConfigCopyWithImpl<$Res>
    implements $NewBroadcastConfigCopyWith<$Res> {
  _$NewBroadcastConfigCopyWithImpl(this._value, this._then);

  final NewBroadcastConfig _value;
  // ignore: unused_field
  final $Res Function(NewBroadcastConfig) _then;

  @override
  $Res call({
    Object? addGroupDataConfig = freezed,
    Object? broadcastName = freezed,
  }) {
    return _then(_value.copyWith(
      addGroupDataConfig: addGroupDataConfig == freezed
          ? _value.addGroupDataConfig
          : addGroupDataConfig // ignore: cast_nullable_to_non_nullable
              as AddGroupDataConfig,
      broadcastName: broadcastName == freezed
          ? _value.broadcastName
          : broadcastName // ignore: cast_nullable_to_non_nullable
              as List<DropdownItem>,
    ));
  }

  @override
  $AddGroupDataConfigCopyWith<$Res> get addGroupDataConfig {
    return $AddGroupDataConfigCopyWith<$Res>(_value.addGroupDataConfig,
        (value) {
      return _then(_value.copyWith(addGroupDataConfig: value));
    });
  }
}

/// @nodoc
abstract class _$NewBroadcastConfigCopyWith<$Res>
    implements $NewBroadcastConfigCopyWith<$Res> {
  factory _$NewBroadcastConfigCopyWith(
          _NewBroadcastConfig value, $Res Function(_NewBroadcastConfig) then) =
      __$NewBroadcastConfigCopyWithImpl<$Res>;
  @override
  $Res call(
      {AddGroupDataConfig addGroupDataConfig,
      List<DropdownItem> broadcastName});

  @override
  $AddGroupDataConfigCopyWith<$Res> get addGroupDataConfig;
}

/// @nodoc
class __$NewBroadcastConfigCopyWithImpl<$Res>
    extends _$NewBroadcastConfigCopyWithImpl<$Res>
    implements _$NewBroadcastConfigCopyWith<$Res> {
  __$NewBroadcastConfigCopyWithImpl(
      _NewBroadcastConfig _value, $Res Function(_NewBroadcastConfig) _then)
      : super(_value, (v) => _then(v as _NewBroadcastConfig));

  @override
  _NewBroadcastConfig get _value => super._value as _NewBroadcastConfig;

  @override
  $Res call({
    Object? addGroupDataConfig = freezed,
    Object? broadcastName = freezed,
  }) {
    return _then(_NewBroadcastConfig(
      addGroupDataConfig: addGroupDataConfig == freezed
          ? _value.addGroupDataConfig
          : addGroupDataConfig // ignore: cast_nullable_to_non_nullable
              as AddGroupDataConfig,
      broadcastName: broadcastName == freezed
          ? _value.broadcastName
          : broadcastName // ignore: cast_nullable_to_non_nullable
              as List<DropdownItem>,
    ));
  }
}

/// @nodoc

class _$_NewBroadcastConfig implements _NewBroadcastConfig {
  _$_NewBroadcastConfig(
      {required this.addGroupDataConfig, required this.broadcastName});

  @override
  final AddGroupDataConfig addGroupDataConfig;
  @override
  final List<DropdownItem> broadcastName;

  @override
  String toString() {
    return 'NewBroadcastConfig(addGroupDataConfig: $addGroupDataConfig, broadcastName: $broadcastName)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _NewBroadcastConfig &&
            (identical(other.addGroupDataConfig, addGroupDataConfig) ||
                const DeepCollectionEquality()
                    .equals(other.addGroupDataConfig, addGroupDataConfig)) &&
            (identical(other.broadcastName, broadcastName) ||
                const DeepCollectionEquality()
                    .equals(other.broadcastName, broadcastName)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(addGroupDataConfig) ^
      const DeepCollectionEquality().hash(broadcastName);

  @JsonKey(ignore: true)
  @override
  _$NewBroadcastConfigCopyWith<_NewBroadcastConfig> get copyWith =>
      __$NewBroadcastConfigCopyWithImpl<_NewBroadcastConfig>(this, _$identity);
}

abstract class _NewBroadcastConfig implements NewBroadcastConfig {
  factory _NewBroadcastConfig(
      {required AddGroupDataConfig addGroupDataConfig,
      required List<DropdownItem> broadcastName}) = _$_NewBroadcastConfig;

  @override
  AddGroupDataConfig get addGroupDataConfig =>
      throw _privateConstructorUsedError;
  @override
  List<DropdownItem> get broadcastName => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$NewBroadcastConfigCopyWith<_NewBroadcastConfig> get copyWith =>
      throw _privateConstructorUsedError;
}
