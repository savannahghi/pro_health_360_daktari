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
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

RolesList _$RolesListFromJson(Map<String, dynamic> json) {
  return _RolesList.fromJson(json);
}

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
abstract class _$$_RolesListCopyWith<$Res> implements $RolesListCopyWith<$Res> {
  factory _$$_RolesListCopyWith(
          _$_RolesList value, $Res Function(_$_RolesList) then) =
      __$$_RolesListCopyWithImpl<$Res>;
  @override
  $Res call({@JsonKey(name: 'getUserRoles') List<Role>? roles});
}

/// @nodoc
class __$$_RolesListCopyWithImpl<$Res> extends _$RolesListCopyWithImpl<$Res>
    implements _$$_RolesListCopyWith<$Res> {
  __$$_RolesListCopyWithImpl(
      _$_RolesList _value, $Res Function(_$_RolesList) _then)
      : super(_value, (v) => _then(v as _$_RolesList));

  @override
  _$_RolesList get _value => super._value as _$_RolesList;

  @override
  $Res call({
    Object? roles = freezed,
  }) {
    return _then(_$_RolesList(
      roles: roles == freezed
          ? _value._roles
          : roles // ignore: cast_nullable_to_non_nullable
              as List<Role>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_RolesList implements _RolesList {
  _$_RolesList({@JsonKey(name: 'getUserRoles') final List<Role>? roles})
      : _roles = roles;

  factory _$_RolesList.fromJson(Map<String, dynamic> json) =>
      _$$_RolesListFromJson(json);

  final List<Role>? _roles;
  @override
  @JsonKey(name: 'getUserRoles')
  List<Role>? get roles {
    final value = _roles;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'RolesList(roles: $roles)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_RolesList &&
            const DeepCollectionEquality().equals(other._roles, _roles));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_roles));

  @JsonKey(ignore: true)
  @override
  _$$_RolesListCopyWith<_$_RolesList> get copyWith =>
      __$$_RolesListCopyWithImpl<_$_RolesList>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_RolesListToJson(this);
  }
}

abstract class _RolesList implements RolesList {
  factory _RolesList({@JsonKey(name: 'getUserRoles') final List<Role>? roles}) =
      _$_RolesList;

  factory _RolesList.fromJson(Map<String, dynamic> json) =
      _$_RolesList.fromJson;

  @override
  @JsonKey(name: 'getUserRoles')
  List<Role>? get roles => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_RolesListCopyWith<_$_RolesList> get copyWith =>
      throw _privateConstructorUsedError;
}
