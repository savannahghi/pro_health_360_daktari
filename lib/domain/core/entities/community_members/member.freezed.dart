// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'member.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Member _$MemberFromJson(Map<String, dynamic> json) {
  return _Member.fromJson(json);
}

/// @nodoc
class _$MemberTearOff {
  const _$MemberTearOff();

  _Member call(
      {@JsonKey(name: 'id')
          String? id,
      @JsonKey(name: 'userID')
          String? userID,
      @JsonKey(name: 'role')
          String? role,
      @JsonKey(name: 'username')
          String? username,
      @JsonKey(name: 'gender', fromJson: genderFromJson, toJson: genderToJson)
          Gender? gender,
      @JsonKey(name: 'extraData')
          BanStatus? banStatus}) {
    return _Member(
      id: id,
      userID: userID,
      role: role,
      username: username,
      gender: gender,
      banStatus: banStatus,
    );
  }

  Member fromJson(Map<String, Object?> json) {
    return Member.fromJson(json);
  }
}

/// @nodoc
const $Member = _$MemberTearOff();

/// @nodoc
mixin _$Member {
  @JsonKey(name: 'id')
  String? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'userID')
  String? get userID => throw _privateConstructorUsedError;
  @JsonKey(name: 'role')
  String? get role => throw _privateConstructorUsedError;
  @JsonKey(name: 'username')
  String? get username => throw _privateConstructorUsedError;
  @JsonKey(name: 'gender', fromJson: genderFromJson, toJson: genderToJson)
  Gender? get gender => throw _privateConstructorUsedError;
  @JsonKey(name: 'extraData')
  BanStatus? get banStatus => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MemberCopyWith<Member> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MemberCopyWith<$Res> {
  factory $MemberCopyWith(Member value, $Res Function(Member) then) =
      _$MemberCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: 'id')
          String? id,
      @JsonKey(name: 'userID')
          String? userID,
      @JsonKey(name: 'role')
          String? role,
      @JsonKey(name: 'username')
          String? username,
      @JsonKey(name: 'gender', fromJson: genderFromJson, toJson: genderToJson)
          Gender? gender,
      @JsonKey(name: 'extraData')
          BanStatus? banStatus});

  $BanStatusCopyWith<$Res>? get banStatus;
}

/// @nodoc
class _$MemberCopyWithImpl<$Res> implements $MemberCopyWith<$Res> {
  _$MemberCopyWithImpl(this._value, this._then);

  final Member _value;
  // ignore: unused_field
  final $Res Function(Member) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? userID = freezed,
    Object? role = freezed,
    Object? username = freezed,
    Object? gender = freezed,
    Object? banStatus = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      userID: userID == freezed
          ? _value.userID
          : userID // ignore: cast_nullable_to_non_nullable
              as String?,
      role: role == freezed
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as String?,
      username: username == freezed
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String?,
      gender: gender == freezed
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as Gender?,
      banStatus: banStatus == freezed
          ? _value.banStatus
          : banStatus // ignore: cast_nullable_to_non_nullable
              as BanStatus?,
    ));
  }

  @override
  $BanStatusCopyWith<$Res>? get banStatus {
    if (_value.banStatus == null) {
      return null;
    }

    return $BanStatusCopyWith<$Res>(_value.banStatus!, (value) {
      return _then(_value.copyWith(banStatus: value));
    });
  }
}

/// @nodoc
abstract class _$MemberCopyWith<$Res> implements $MemberCopyWith<$Res> {
  factory _$MemberCopyWith(_Member value, $Res Function(_Member) then) =
      __$MemberCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: 'id')
          String? id,
      @JsonKey(name: 'userID')
          String? userID,
      @JsonKey(name: 'role')
          String? role,
      @JsonKey(name: 'username')
          String? username,
      @JsonKey(name: 'gender', fromJson: genderFromJson, toJson: genderToJson)
          Gender? gender,
      @JsonKey(name: 'extraData')
          BanStatus? banStatus});

  @override
  $BanStatusCopyWith<$Res>? get banStatus;
}

/// @nodoc
class __$MemberCopyWithImpl<$Res> extends _$MemberCopyWithImpl<$Res>
    implements _$MemberCopyWith<$Res> {
  __$MemberCopyWithImpl(_Member _value, $Res Function(_Member) _then)
      : super(_value, (v) => _then(v as _Member));

  @override
  _Member get _value => super._value as _Member;

  @override
  $Res call({
    Object? id = freezed,
    Object? userID = freezed,
    Object? role = freezed,
    Object? username = freezed,
    Object? gender = freezed,
    Object? banStatus = freezed,
  }) {
    return _then(_Member(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      userID: userID == freezed
          ? _value.userID
          : userID // ignore: cast_nullable_to_non_nullable
              as String?,
      role: role == freezed
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as String?,
      username: username == freezed
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String?,
      gender: gender == freezed
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as Gender?,
      banStatus: banStatus == freezed
          ? _value.banStatus
          : banStatus // ignore: cast_nullable_to_non_nullable
              as BanStatus?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Member implements _Member {
  _$_Member(
      {@JsonKey(name: 'id')
          this.id,
      @JsonKey(name: 'userID')
          this.userID,
      @JsonKey(name: 'role')
          this.role,
      @JsonKey(name: 'username')
          this.username,
      @JsonKey(name: 'gender', fromJson: genderFromJson, toJson: genderToJson)
          this.gender,
      @JsonKey(name: 'extraData')
          this.banStatus});

  factory _$_Member.fromJson(Map<String, dynamic> json) =>
      _$$_MemberFromJson(json);

  @override
  @JsonKey(name: 'id')
  final String? id;
  @override
  @JsonKey(name: 'userID')
  final String? userID;
  @override
  @JsonKey(name: 'role')
  final String? role;
  @override
  @JsonKey(name: 'username')
  final String? username;
  @override
  @JsonKey(name: 'gender', fromJson: genderFromJson, toJson: genderToJson)
  final Gender? gender;
  @override
  @JsonKey(name: 'extraData')
  final BanStatus? banStatus;

  @override
  String toString() {
    return 'Member(id: $id, userID: $userID, role: $role, username: $username, gender: $gender, banStatus: $banStatus)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Member &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.userID, userID) &&
            const DeepCollectionEquality().equals(other.role, role) &&
            const DeepCollectionEquality().equals(other.username, username) &&
            const DeepCollectionEquality().equals(other.gender, gender) &&
            const DeepCollectionEquality().equals(other.banStatus, banStatus));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(userID),
      const DeepCollectionEquality().hash(role),
      const DeepCollectionEquality().hash(username),
      const DeepCollectionEquality().hash(gender),
      const DeepCollectionEquality().hash(banStatus));

  @JsonKey(ignore: true)
  @override
  _$MemberCopyWith<_Member> get copyWith =>
      __$MemberCopyWithImpl<_Member>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_MemberToJson(this);
  }
}

abstract class _Member implements Member {
  factory _Member(
      {@JsonKey(name: 'id')
          String? id,
      @JsonKey(name: 'userID')
          String? userID,
      @JsonKey(name: 'role')
          String? role,
      @JsonKey(name: 'username')
          String? username,
      @JsonKey(name: 'gender', fromJson: genderFromJson, toJson: genderToJson)
          Gender? gender,
      @JsonKey(name: 'extraData')
          BanStatus? banStatus}) = _$_Member;

  factory _Member.fromJson(Map<String, dynamic> json) = _$_Member.fromJson;

  @override
  @JsonKey(name: 'id')
  String? get id;
  @override
  @JsonKey(name: 'userID')
  String? get userID;
  @override
  @JsonKey(name: 'role')
  String? get role;
  @override
  @JsonKey(name: 'username')
  String? get username;
  @override
  @JsonKey(name: 'gender', fromJson: genderFromJson, toJson: genderToJson)
  Gender? get gender;
  @override
  @JsonKey(name: 'extraData')
  BanStatus? get banStatus;
  @override
  @JsonKey(ignore: true)
  _$MemberCopyWith<_Member> get copyWith => throw _privateConstructorUsedError;
}
