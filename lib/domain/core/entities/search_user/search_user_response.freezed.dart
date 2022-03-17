// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'search_user_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

SearchUserResponse _$SearchUserResponseFromJson(Map<String, dynamic> json) {
  return _SearchUserResponse.fromJson(json);
}

/// @nodoc
class _$SearchUserResponseTearOff {
  const _$SearchUserResponseTearOff();

  _SearchUserResponse call(
      {@JsonKey(name: 'ID') String? id,
      @JsonKey(name: 'User') UserData? user}) {
    return _SearchUserResponse(
      id: id,
      user: user,
    );
  }

  SearchUserResponse fromJson(Map<String, Object?> json) {
    return SearchUserResponse.fromJson(json);
  }
}

/// @nodoc
const $SearchUserResponse = _$SearchUserResponseTearOff();

/// @nodoc
mixin _$SearchUserResponse {
  @JsonKey(name: 'ID')
  String? get id => throw _privateConstructorUsedError; // This is the nickname
  @JsonKey(name: 'User')
  UserData? get user => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SearchUserResponseCopyWith<SearchUserResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SearchUserResponseCopyWith<$Res> {
  factory $SearchUserResponseCopyWith(
          SearchUserResponse value, $Res Function(SearchUserResponse) then) =
      _$SearchUserResponseCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: 'ID') String? id, @JsonKey(name: 'User') UserData? user});

  $UserDataCopyWith<$Res>? get user;
}

/// @nodoc
class _$SearchUserResponseCopyWithImpl<$Res>
    implements $SearchUserResponseCopyWith<$Res> {
  _$SearchUserResponseCopyWithImpl(this._value, this._then);

  final SearchUserResponse _value;
  // ignore: unused_field
  final $Res Function(SearchUserResponse) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? user = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      user: user == freezed
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as UserData?,
    ));
  }

  @override
  $UserDataCopyWith<$Res>? get user {
    if (_value.user == null) {
      return null;
    }

    return $UserDataCopyWith<$Res>(_value.user!, (value) {
      return _then(_value.copyWith(user: value));
    });
  }
}

/// @nodoc
abstract class _$SearchUserResponseCopyWith<$Res>
    implements $SearchUserResponseCopyWith<$Res> {
  factory _$SearchUserResponseCopyWith(
          _SearchUserResponse value, $Res Function(_SearchUserResponse) then) =
      __$SearchUserResponseCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: 'ID') String? id, @JsonKey(name: 'User') UserData? user});

  @override
  $UserDataCopyWith<$Res>? get user;
}

/// @nodoc
class __$SearchUserResponseCopyWithImpl<$Res>
    extends _$SearchUserResponseCopyWithImpl<$Res>
    implements _$SearchUserResponseCopyWith<$Res> {
  __$SearchUserResponseCopyWithImpl(
      _SearchUserResponse _value, $Res Function(_SearchUserResponse) _then)
      : super(_value, (v) => _then(v as _SearchUserResponse));

  @override
  _SearchUserResponse get _value => super._value as _SearchUserResponse;

  @override
  $Res call({
    Object? id = freezed,
    Object? user = freezed,
  }) {
    return _then(_SearchUserResponse(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      user: user == freezed
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as UserData?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_SearchUserResponse implements _SearchUserResponse {
  _$_SearchUserResponse(
      {@JsonKey(name: 'ID') this.id, @JsonKey(name: 'User') this.user});

  factory _$_SearchUserResponse.fromJson(Map<String, dynamic> json) =>
      _$$_SearchUserResponseFromJson(json);

  @override
  @JsonKey(name: 'ID')
  final String? id;
  @override // This is the nickname
  @JsonKey(name: 'User')
  final UserData? user;

  @override
  String toString() {
    return 'SearchUserResponse(id: $id, user: $user)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _SearchUserResponse &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.user, user));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(user));

  @JsonKey(ignore: true)
  @override
  _$SearchUserResponseCopyWith<_SearchUserResponse> get copyWith =>
      __$SearchUserResponseCopyWithImpl<_SearchUserResponse>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_SearchUserResponseToJson(this);
  }
}

abstract class _SearchUserResponse implements SearchUserResponse {
  factory _SearchUserResponse(
      {@JsonKey(name: 'ID') String? id,
      @JsonKey(name: 'User') UserData? user}) = _$_SearchUserResponse;

  factory _SearchUserResponse.fromJson(Map<String, dynamic> json) =
      _$_SearchUserResponse.fromJson;

  @override
  @JsonKey(name: 'ID')
  String? get id;
  @override // This is the nickname
  @JsonKey(name: 'User')
  UserData? get user;
  @override
  @JsonKey(ignore: true)
  _$SearchUserResponseCopyWith<_SearchUserResponse> get copyWith =>
      throw _privateConstructorUsedError;
}
