// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'accept_terms_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

AcceptTermsResponse _$AcceptTermsResponseFromJson(Map<String, dynamic> json) {
  return _AcceptTermsResponse.fromJson(json);
}

/// @nodoc
class _$AcceptTermsResponseTearOff {
  const _$AcceptTermsResponseTearOff();

  _AcceptTermsResponse call(
      {@JsonKey(name: 'acceptTerms') required bool acceptTerms}) {
    return _AcceptTermsResponse(
      acceptTerms: acceptTerms,
    );
  }

  AcceptTermsResponse fromJson(Map<String, Object?> json) {
    return AcceptTermsResponse.fromJson(json);
  }
}

/// @nodoc
const $AcceptTermsResponse = _$AcceptTermsResponseTearOff();

/// @nodoc
mixin _$AcceptTermsResponse {
  @JsonKey(name: 'acceptTerms')
  bool get acceptTerms => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AcceptTermsResponseCopyWith<AcceptTermsResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AcceptTermsResponseCopyWith<$Res> {
  factory $AcceptTermsResponseCopyWith(
          AcceptTermsResponse value, $Res Function(AcceptTermsResponse) then) =
      _$AcceptTermsResponseCopyWithImpl<$Res>;
  $Res call({@JsonKey(name: 'acceptTerms') bool acceptTerms});
}

/// @nodoc
class _$AcceptTermsResponseCopyWithImpl<$Res>
    implements $AcceptTermsResponseCopyWith<$Res> {
  _$AcceptTermsResponseCopyWithImpl(this._value, this._then);

  final AcceptTermsResponse _value;
  // ignore: unused_field
  final $Res Function(AcceptTermsResponse) _then;

  @override
  $Res call({
    Object? acceptTerms = freezed,
  }) {
    return _then(_value.copyWith(
      acceptTerms: acceptTerms == freezed
          ? _value.acceptTerms
          : acceptTerms // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
abstract class _$AcceptTermsResponseCopyWith<$Res>
    implements $AcceptTermsResponseCopyWith<$Res> {
  factory _$AcceptTermsResponseCopyWith(_AcceptTermsResponse value,
          $Res Function(_AcceptTermsResponse) then) =
      __$AcceptTermsResponseCopyWithImpl<$Res>;
  @override
  $Res call({@JsonKey(name: 'acceptTerms') bool acceptTerms});
}

/// @nodoc
class __$AcceptTermsResponseCopyWithImpl<$Res>
    extends _$AcceptTermsResponseCopyWithImpl<$Res>
    implements _$AcceptTermsResponseCopyWith<$Res> {
  __$AcceptTermsResponseCopyWithImpl(
      _AcceptTermsResponse _value, $Res Function(_AcceptTermsResponse) _then)
      : super(_value, (v) => _then(v as _AcceptTermsResponse));

  @override
  _AcceptTermsResponse get _value => super._value as _AcceptTermsResponse;

  @override
  $Res call({
    Object? acceptTerms = freezed,
  }) {
    return _then(_AcceptTermsResponse(
      acceptTerms: acceptTerms == freezed
          ? _value.acceptTerms
          : acceptTerms // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_AcceptTermsResponse implements _AcceptTermsResponse {
  _$_AcceptTermsResponse(
      {@JsonKey(name: 'acceptTerms') required this.acceptTerms});

  factory _$_AcceptTermsResponse.fromJson(Map<String, dynamic> json) =>
      _$$_AcceptTermsResponseFromJson(json);

  @override
  @JsonKey(name: 'acceptTerms')
  final bool acceptTerms;

  @override
  String toString() {
    return 'AcceptTermsResponse(acceptTerms: $acceptTerms)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _AcceptTermsResponse &&
            const DeepCollectionEquality()
                .equals(other.acceptTerms, acceptTerms));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(acceptTerms));

  @JsonKey(ignore: true)
  @override
  _$AcceptTermsResponseCopyWith<_AcceptTermsResponse> get copyWith =>
      __$AcceptTermsResponseCopyWithImpl<_AcceptTermsResponse>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_AcceptTermsResponseToJson(this);
  }
}

abstract class _AcceptTermsResponse implements AcceptTermsResponse {
  factory _AcceptTermsResponse(
          {@JsonKey(name: 'acceptTerms') required bool acceptTerms}) =
      _$_AcceptTermsResponse;

  factory _AcceptTermsResponse.fromJson(Map<String, dynamic> json) =
      _$_AcceptTermsResponse.fromJson;

  @override
  @JsonKey(name: 'acceptTerms')
  bool get acceptTerms;
  @override
  @JsonKey(ignore: true)
  _$AcceptTermsResponseCopyWith<_AcceptTermsResponse> get copyWith =>
      throw _privateConstructorUsedError;
}
