// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'flagged_message_user.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

FlaggedMessageUser _$FlaggedMessageUserFromJson(Map<String, dynamic> json) {
  return _FlaggedMessageUser.fromJson(json);
}

/// @nodoc
mixin _$FlaggedMessageUser {
  @JsonKey(name: 'userID')
  String? get userID => throw _privateConstructorUsedError;
  @JsonKey(name: 'name')
  String? get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'username')
  String? get username => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FlaggedMessageUserCopyWith<FlaggedMessageUser> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FlaggedMessageUserCopyWith<$Res> {
  factory $FlaggedMessageUserCopyWith(
          FlaggedMessageUser value, $Res Function(FlaggedMessageUser) then) =
      _$FlaggedMessageUserCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: 'userID') String? userID,
      @JsonKey(name: 'name') String? name,
      @JsonKey(name: 'username') String? username});
}

/// @nodoc
class _$FlaggedMessageUserCopyWithImpl<$Res>
    implements $FlaggedMessageUserCopyWith<$Res> {
  _$FlaggedMessageUserCopyWithImpl(this._value, this._then);

  final FlaggedMessageUser _value;
  // ignore: unused_field
  final $Res Function(FlaggedMessageUser) _then;

  @override
  $Res call({
    Object? userID = freezed,
    Object? name = freezed,
    Object? username = freezed,
  }) {
    return _then(_value.copyWith(
      userID: userID == freezed
          ? _value.userID
          : userID // ignore: cast_nullable_to_non_nullable
              as String?,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      username: username == freezed
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$$_FlaggedMessageUserCopyWith<$Res>
    implements $FlaggedMessageUserCopyWith<$Res> {
  factory _$$_FlaggedMessageUserCopyWith(_$_FlaggedMessageUser value,
          $Res Function(_$_FlaggedMessageUser) then) =
      __$$_FlaggedMessageUserCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: 'userID') String? userID,
      @JsonKey(name: 'name') String? name,
      @JsonKey(name: 'username') String? username});
}

/// @nodoc
class __$$_FlaggedMessageUserCopyWithImpl<$Res>
    extends _$FlaggedMessageUserCopyWithImpl<$Res>
    implements _$$_FlaggedMessageUserCopyWith<$Res> {
  __$$_FlaggedMessageUserCopyWithImpl(
      _$_FlaggedMessageUser _value, $Res Function(_$_FlaggedMessageUser) _then)
      : super(_value, (v) => _then(v as _$_FlaggedMessageUser));

  @override
  _$_FlaggedMessageUser get _value => super._value as _$_FlaggedMessageUser;

  @override
  $Res call({
    Object? userID = freezed,
    Object? name = freezed,
    Object? username = freezed,
  }) {
    return _then(_$_FlaggedMessageUser(
      userID: userID == freezed
          ? _value.userID
          : userID // ignore: cast_nullable_to_non_nullable
              as String?,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      username: username == freezed
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_FlaggedMessageUser implements _FlaggedMessageUser {
  _$_FlaggedMessageUser(
      {@JsonKey(name: 'userID') this.userID,
      @JsonKey(name: 'name') this.name,
      @JsonKey(name: 'username') this.username});

  factory _$_FlaggedMessageUser.fromJson(Map<String, dynamic> json) =>
      _$$_FlaggedMessageUserFromJson(json);

  @override
  @JsonKey(name: 'userID')
  final String? userID;
  @override
  @JsonKey(name: 'name')
  final String? name;
  @override
  @JsonKey(name: 'username')
  final String? username;

  @override
  String toString() {
    return 'FlaggedMessageUser(userID: $userID, name: $name, username: $username)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_FlaggedMessageUser &&
            const DeepCollectionEquality().equals(other.userID, userID) &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality().equals(other.username, username));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(userID),
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(username));

  @JsonKey(ignore: true)
  @override
  _$$_FlaggedMessageUserCopyWith<_$_FlaggedMessageUser> get copyWith =>
      __$$_FlaggedMessageUserCopyWithImpl<_$_FlaggedMessageUser>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_FlaggedMessageUserToJson(this);
  }
}

abstract class _FlaggedMessageUser implements FlaggedMessageUser {
  factory _FlaggedMessageUser(
          {@JsonKey(name: 'userID') final String? userID,
          @JsonKey(name: 'name') final String? name,
          @JsonKey(name: 'username') final String? username}) =
      _$_FlaggedMessageUser;

  factory _FlaggedMessageUser.fromJson(Map<String, dynamic> json) =
      _$_FlaggedMessageUser.fromJson;

  @override
  @JsonKey(name: 'userID')
  String? get userID => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'name')
  String? get name => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'username')
  String? get username => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_FlaggedMessageUserCopyWith<_$_FlaggedMessageUser> get copyWith =>
      throw _privateConstructorUsedError;
}
