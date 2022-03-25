// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'roles_list.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

RolesList _$RolesListFromJson(Map<String, dynamic> json) {
  return _RolesList.fromJson(json);
}

/// @nodoc
class _$RolesListTearOff {
  const _$RolesListTearOff();

  _RolesList call({@JsonKey(name: 'getUserRoles') List<Role>? roles}) {
    return _RolesList(
      roles: roles,
    );
  }

  RolesList fromJson(Map<String, Object?> json) {
    return RolesList.fromJson(json);
  }
}

/// @nodoc
const $RolesList = _$RolesListTearOff();

/// @nodoc
mixin _$RolesList {
  @JsonKey(name: 'getUserRoles')
  List<Role>? get roles => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RolesListCopyWith<RolesList> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RolesListCopyWith<$Res> {
  factory $RolesListCopyWith(RolesList value, $Res Function(RolesList) then) =
      _$RolesListCopyWithImpl<$Res>;
  $Res call({@JsonKey(name: 'getUserRoles') List<Role>? roles});
}

/// @nodoc
class _$RolesListCopyWithImpl<$Res> implements $RolesListCopyWith<$Res> {
  _$RolesListCopyWithImpl(this._value, this._then);

  final RolesList _value;
  // ignore: unused_field
  final $Res Function(RolesList) _then;

  @override
  $Res call({
    Object? roles = freezed,
  }) {
    return _then(_value.copyWith(
      roles: roles == freezed
          ? _value.roles
          : roles // ignore: cast_nullable_to_non_nullable
              as List<Role>?,
    ));
  }
}

/// @nodoc
abstract class _$RolesListCopyWith<$Res> implements $RolesListCopyWith<$Res> {
  factory _$RolesListCopyWith(
          _RolesList value, $Res Function(_RolesList) then) =
      __$RolesListCopyWithImpl<$Res>;
  @override
  $Res call({@JsonKey(name: 'getUserRoles') List<Role>? roles});
}

/// @nodoc
class __$RolesListCopyWithImpl<$Res> extends _$RolesListCopyWithImpl<$Res>
    implements _$RolesListCopyWith<$Res> {
  __$RolesListCopyWithImpl(_RolesList _value, $Res Function(_RolesList) _then)
      : super(_value, (v) => _then(v as _RolesList));

  @override
  _RolesList get _value => super._value as _RolesList;

  @override
  $Res call({
    Object? roles = freezed,
  }) {
    return _then(_RolesList(
      roles: roles == freezed
          ? _value.roles
          : roles // ignore: cast_nullable_to_non_nullable
              as List<Role>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_RolesList implements _RolesList {
  _$_RolesList({@JsonKey(name: 'getUserRoles') this.roles});

  factory _$_RolesList.fromJson(Map<String, dynamic> json) =>
      _$$_RolesListFromJson(json);

  @override
  @JsonKey(name: 'getUserRoles')
  final List<Role>? roles;

  @override
  String toString() {
    return 'RolesList(roles: $roles)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _RolesList &&
            const DeepCollectionEquality().equals(other.roles, roles));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(roles));

  @JsonKey(ignore: true)
  @override
  _$RolesListCopyWith<_RolesList> get copyWith =>
      __$RolesListCopyWithImpl<_RolesList>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_RolesListToJson(this);
  }
}

abstract class _RolesList implements RolesList {
  factory _RolesList({@JsonKey(name: 'getUserRoles') List<Role>? roles}) =
      _$_RolesList;

  factory _RolesList.fromJson(Map<String, dynamic> json) =
      _$_RolesList.fromJson;

  @override
  @JsonKey(name: 'getUserRoles')
  List<Role>? get roles;
  @override
  @JsonKey(ignore: true)
  _$RolesListCopyWith<_RolesList> get copyWith =>
      throw _privateConstructorUsedError;
}
