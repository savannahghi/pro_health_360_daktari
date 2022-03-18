// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'roles.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Roles _$RolesFromJson(Map<String, dynamic> json) {
  return _Roles.fromJson(json);
}

/// @nodoc
class _$RolesTearOff {
  const _$RolesTearOff();

  _Roles call(
      {@JsonKey(name: 'authorityPermissionID') String? authorityPermissionID,
      @JsonKey(name: 'name') String? name}) {
    return _Roles(
      authorityPermissionID: authorityPermissionID,
      name: name,
    );
  }

  Roles fromJson(Map<String, Object?> json) {
    return Roles.fromJson(json);
  }
}

/// @nodoc
const $Roles = _$RolesTearOff();

/// @nodoc
mixin _$Roles {
  @JsonKey(name: 'authorityPermissionID')
  String? get authorityPermissionID => throw _privateConstructorUsedError;
  @JsonKey(name: 'name')
  String? get name => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RolesCopyWith<Roles> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RolesCopyWith<$Res> {
  factory $RolesCopyWith(Roles value, $Res Function(Roles) then) =
      _$RolesCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: 'authorityPermissionID') String? authorityPermissionID,
      @JsonKey(name: 'name') String? name});
}

/// @nodoc
class _$RolesCopyWithImpl<$Res> implements $RolesCopyWith<$Res> {
  _$RolesCopyWithImpl(this._value, this._then);

  final Roles _value;
  // ignore: unused_field
  final $Res Function(Roles) _then;

  @override
  $Res call({
    Object? authorityPermissionID = freezed,
    Object? name = freezed,
  }) {
    return _then(_value.copyWith(
      authorityPermissionID: authorityPermissionID == freezed
          ? _value.authorityPermissionID
          : authorityPermissionID // ignore: cast_nullable_to_non_nullable
              as String?,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$RolesCopyWith<$Res> implements $RolesCopyWith<$Res> {
  factory _$RolesCopyWith(_Roles value, $Res Function(_Roles) then) =
      __$RolesCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: 'authorityPermissionID') String? authorityPermissionID,
      @JsonKey(name: 'name') String? name});
}

/// @nodoc
class __$RolesCopyWithImpl<$Res> extends _$RolesCopyWithImpl<$Res>
    implements _$RolesCopyWith<$Res> {
  __$RolesCopyWithImpl(_Roles _value, $Res Function(_Roles) _then)
      : super(_value, (v) => _then(v as _Roles));

  @override
  _Roles get _value => super._value as _Roles;

  @override
  $Res call({
    Object? authorityPermissionID = freezed,
    Object? name = freezed,
  }) {
    return _then(_Roles(
      authorityPermissionID: authorityPermissionID == freezed
          ? _value.authorityPermissionID
          : authorityPermissionID // ignore: cast_nullable_to_non_nullable
              as String?,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Roles implements _Roles {
  _$_Roles(
      {@JsonKey(name: 'authorityPermissionID') this.authorityPermissionID,
      @JsonKey(name: 'name') this.name});

  factory _$_Roles.fromJson(Map<String, dynamic> json) =>
      _$$_RolesFromJson(json);

  @override
  @JsonKey(name: 'authorityPermissionID')
  final String? authorityPermissionID;
  @override
  @JsonKey(name: 'name')
  final String? name;

  @override
  String toString() {
    return 'Roles(authorityPermissionID: $authorityPermissionID, name: $name)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Roles &&
            const DeepCollectionEquality()
                .equals(other.authorityPermissionID, authorityPermissionID) &&
            const DeepCollectionEquality().equals(other.name, name));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(authorityPermissionID),
      const DeepCollectionEquality().hash(name));

  @JsonKey(ignore: true)
  @override
  _$RolesCopyWith<_Roles> get copyWith =>
      __$RolesCopyWithImpl<_Roles>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_RolesToJson(this);
  }
}

abstract class _Roles implements Roles {
  factory _Roles(
      {@JsonKey(name: 'authorityPermissionID') String? authorityPermissionID,
      @JsonKey(name: 'name') String? name}) = _$_Roles;

  factory _Roles.fromJson(Map<String, dynamic> json) = _$_Roles.fromJson;

  @override
  @JsonKey(name: 'authorityPermissionID')
  String? get authorityPermissionID;
  @override
  @JsonKey(name: 'name')
  String? get name;
  @override
  @JsonKey(ignore: true)
  _$RolesCopyWith<_Roles> get copyWith => throw _privateConstructorUsedError;
}
