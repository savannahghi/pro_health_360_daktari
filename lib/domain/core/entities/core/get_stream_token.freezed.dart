// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'get_stream_token.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

GetStreamToken _$GetStreamTokenFromJson(Map<String, dynamic> json) {
  return _GetStreamToken.fromJson(json);
}

/// @nodoc
mixin _$GetStreamToken {
  @JsonKey(name: 'getStreamToken')
  String? get getStreamToken => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GetStreamTokenCopyWith<GetStreamToken> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GetStreamTokenCopyWith<$Res> {
  factory $GetStreamTokenCopyWith(
          GetStreamToken value, $Res Function(GetStreamToken) then) =
      _$GetStreamTokenCopyWithImpl<$Res>;
  $Res call({@JsonKey(name: 'getStreamToken') String? getStreamToken});
}

/// @nodoc
class _$GetStreamTokenCopyWithImpl<$Res>
    implements $GetStreamTokenCopyWith<$Res> {
  _$GetStreamTokenCopyWithImpl(this._value, this._then);

  final GetStreamToken _value;
  // ignore: unused_field
  final $Res Function(GetStreamToken) _then;

  @override
  $Res call({
    Object? getStreamToken = freezed,
  }) {
    return _then(_value.copyWith(
      getStreamToken: getStreamToken == freezed
          ? _value.getStreamToken
          : getStreamToken // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$$_GetStreamTokenCopyWith<$Res>
    implements $GetStreamTokenCopyWith<$Res> {
  factory _$$_GetStreamTokenCopyWith(
          _$_GetStreamToken value, $Res Function(_$_GetStreamToken) then) =
      __$$_GetStreamTokenCopyWithImpl<$Res>;
  @override
  $Res call({@JsonKey(name: 'getStreamToken') String? getStreamToken});
}

/// @nodoc
class __$$_GetStreamTokenCopyWithImpl<$Res>
    extends _$GetStreamTokenCopyWithImpl<$Res>
    implements _$$_GetStreamTokenCopyWith<$Res> {
  __$$_GetStreamTokenCopyWithImpl(
      _$_GetStreamToken _value, $Res Function(_$_GetStreamToken) _then)
      : super(_value, (v) => _then(v as _$_GetStreamToken));

  @override
  _$_GetStreamToken get _value => super._value as _$_GetStreamToken;

  @override
  $Res call({
    Object? getStreamToken = freezed,
  }) {
    return _then(_$_GetStreamToken(
      getStreamToken: getStreamToken == freezed
          ? _value.getStreamToken
          : getStreamToken // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_GetStreamToken implements _GetStreamToken {
  _$_GetStreamToken({@JsonKey(name: 'getStreamToken') this.getStreamToken});

  factory _$_GetStreamToken.fromJson(Map<String, dynamic> json) =>
      _$$_GetStreamTokenFromJson(json);

  @override
  @JsonKey(name: 'getStreamToken')
  final String? getStreamToken;

  @override
  String toString() {
    return 'GetStreamToken(getStreamToken: $getStreamToken)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_GetStreamToken &&
            const DeepCollectionEquality()
                .equals(other.getStreamToken, getStreamToken));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(getStreamToken));

  @JsonKey(ignore: true)
  @override
  _$$_GetStreamTokenCopyWith<_$_GetStreamToken> get copyWith =>
      __$$_GetStreamTokenCopyWithImpl<_$_GetStreamToken>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_GetStreamTokenToJson(this);
  }
}

abstract class _GetStreamToken implements GetStreamToken {
  factory _GetStreamToken(
          {@JsonKey(name: 'getStreamToken') final String? getStreamToken}) =
      _$_GetStreamToken;

  factory _GetStreamToken.fromJson(Map<String, dynamic> json) =
      _$_GetStreamToken.fromJson;

  @override
  @JsonKey(name: 'getStreamToken')
  String? get getStreamToken => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_GetStreamTokenCopyWith<_$_GetStreamToken> get copyWith =>
      throw _privateConstructorUsedError;
}
