// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'fetch_facilites_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

FetchFacilitiesResponse _$FetchFacilitiesResponseFromJson(
    Map<String, dynamic> json) {
  return _FetchFacilitiesResponse.fromJson(json);
}

/// @nodoc
class _$FetchFacilitiesResponseTearOff {
  const _$FetchFacilitiesResponseTearOff();

  _FetchFacilitiesResponse call(
      {@JsonKey(name: 'fetchFacilities') List<Facility>? facilities}) {
    return _FetchFacilitiesResponse(
      facilities: facilities,
    );
  }

  FetchFacilitiesResponse fromJson(Map<String, Object?> json) {
    return FetchFacilitiesResponse.fromJson(json);
  }
}

/// @nodoc
const $FetchFacilitiesResponse = _$FetchFacilitiesResponseTearOff();

/// @nodoc
mixin _$FetchFacilitiesResponse {
  @JsonKey(name: 'fetchFacilities')
  List<Facility>? get facilities => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FetchFacilitiesResponseCopyWith<FetchFacilitiesResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FetchFacilitiesResponseCopyWith<$Res> {
  factory $FetchFacilitiesResponseCopyWith(FetchFacilitiesResponse value,
          $Res Function(FetchFacilitiesResponse) then) =
      _$FetchFacilitiesResponseCopyWithImpl<$Res>;
  $Res call({@JsonKey(name: 'fetchFacilities') List<Facility>? facilities});
}

/// @nodoc
class _$FetchFacilitiesResponseCopyWithImpl<$Res>
    implements $FetchFacilitiesResponseCopyWith<$Res> {
  _$FetchFacilitiesResponseCopyWithImpl(this._value, this._then);

  final FetchFacilitiesResponse _value;
  // ignore: unused_field
  final $Res Function(FetchFacilitiesResponse) _then;

  @override
  $Res call({
    Object? facilities = freezed,
  }) {
    return _then(_value.copyWith(
      facilities: facilities == freezed
          ? _value.facilities
          : facilities // ignore: cast_nullable_to_non_nullable
              as List<Facility>?,
    ));
  }
}

/// @nodoc
abstract class _$FetchFacilitiesResponseCopyWith<$Res>
    implements $FetchFacilitiesResponseCopyWith<$Res> {
  factory _$FetchFacilitiesResponseCopyWith(_FetchFacilitiesResponse value,
          $Res Function(_FetchFacilitiesResponse) then) =
      __$FetchFacilitiesResponseCopyWithImpl<$Res>;
  @override
  $Res call({@JsonKey(name: 'fetchFacilities') List<Facility>? facilities});
}

/// @nodoc
class __$FetchFacilitiesResponseCopyWithImpl<$Res>
    extends _$FetchFacilitiesResponseCopyWithImpl<$Res>
    implements _$FetchFacilitiesResponseCopyWith<$Res> {
  __$FetchFacilitiesResponseCopyWithImpl(_FetchFacilitiesResponse _value,
      $Res Function(_FetchFacilitiesResponse) _then)
      : super(_value, (v) => _then(v as _FetchFacilitiesResponse));

  @override
  _FetchFacilitiesResponse get _value =>
      super._value as _FetchFacilitiesResponse;

  @override
  $Res call({
    Object? facilities = freezed,
  }) {
    return _then(_FetchFacilitiesResponse(
      facilities: facilities == freezed
          ? _value.facilities
          : facilities // ignore: cast_nullable_to_non_nullable
              as List<Facility>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_FetchFacilitiesResponse implements _FetchFacilitiesResponse {
  _$_FetchFacilitiesResponse(
      {@JsonKey(name: 'fetchFacilities') this.facilities});

  factory _$_FetchFacilitiesResponse.fromJson(Map<String, dynamic> json) =>
      _$$_FetchFacilitiesResponseFromJson(json);

  @override
  @JsonKey(name: 'fetchFacilities')
  final List<Facility>? facilities;

  @override
  String toString() {
    return 'FetchFacilitiesResponse(facilities: $facilities)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _FetchFacilitiesResponse &&
            const DeepCollectionEquality()
                .equals(other.facilities, facilities));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(facilities));

  @JsonKey(ignore: true)
  @override
  _$FetchFacilitiesResponseCopyWith<_FetchFacilitiesResponse> get copyWith =>
      __$FetchFacilitiesResponseCopyWithImpl<_FetchFacilitiesResponse>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_FetchFacilitiesResponseToJson(this);
  }
}

abstract class _FetchFacilitiesResponse implements FetchFacilitiesResponse {
  factory _FetchFacilitiesResponse(
          {@JsonKey(name: 'fetchFacilities') List<Facility>? facilities}) =
      _$_FetchFacilitiesResponse;

  factory _FetchFacilitiesResponse.fromJson(Map<String, dynamic> json) =
      _$_FetchFacilitiesResponse.fromJson;

  @override
  @JsonKey(name: 'fetchFacilities')
  List<Facility>? get facilities;
  @override
  @JsonKey(ignore: true)
  _$FetchFacilitiesResponseCopyWith<_FetchFacilitiesResponse> get copyWith =>
      throw _privateConstructorUsedError;
}
