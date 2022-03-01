// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'list_facilities_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ListFacilitiesResponse _$ListFacilitiesResponseFromJson(
    Map<String, dynamic> json) {
  return _ListFacilitiesResponse.fromJson(json);
}

/// @nodoc
class _$ListFacilitiesResponseTearOff {
  const _$ListFacilitiesResponseTearOff();

  _ListFacilitiesResponse call(
      {@JsonKey(name: 'Facilities') List<Facility>? facilities}) {
    return _ListFacilitiesResponse(
      facilities: facilities,
    );
  }

  ListFacilitiesResponse fromJson(Map<String, Object?> json) {
    return ListFacilitiesResponse.fromJson(json);
  }
}

/// @nodoc
const $ListFacilitiesResponse = _$ListFacilitiesResponseTearOff();

/// @nodoc
mixin _$ListFacilitiesResponse {
  @JsonKey(name: 'Facilities')
  List<Facility>? get facilities => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ListFacilitiesResponseCopyWith<ListFacilitiesResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ListFacilitiesResponseCopyWith<$Res> {
  factory $ListFacilitiesResponseCopyWith(ListFacilitiesResponse value,
          $Res Function(ListFacilitiesResponse) then) =
      _$ListFacilitiesResponseCopyWithImpl<$Res>;
  $Res call({@JsonKey(name: 'Facilities') List<Facility>? facilities});
}

/// @nodoc
class _$ListFacilitiesResponseCopyWithImpl<$Res>
    implements $ListFacilitiesResponseCopyWith<$Res> {
  _$ListFacilitiesResponseCopyWithImpl(this._value, this._then);

  final ListFacilitiesResponse _value;
  // ignore: unused_field
  final $Res Function(ListFacilitiesResponse) _then;

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
abstract class _$ListFacilitiesResponseCopyWith<$Res>
    implements $ListFacilitiesResponseCopyWith<$Res> {
  factory _$ListFacilitiesResponseCopyWith(_ListFacilitiesResponse value,
          $Res Function(_ListFacilitiesResponse) then) =
      __$ListFacilitiesResponseCopyWithImpl<$Res>;
  @override
  $Res call({@JsonKey(name: 'Facilities') List<Facility>? facilities});
}

/// @nodoc
class __$ListFacilitiesResponseCopyWithImpl<$Res>
    extends _$ListFacilitiesResponseCopyWithImpl<$Res>
    implements _$ListFacilitiesResponseCopyWith<$Res> {
  __$ListFacilitiesResponseCopyWithImpl(_ListFacilitiesResponse _value,
      $Res Function(_ListFacilitiesResponse) _then)
      : super(_value, (v) => _then(v as _ListFacilitiesResponse));

  @override
  _ListFacilitiesResponse get _value => super._value as _ListFacilitiesResponse;

  @override
  $Res call({
    Object? facilities = freezed,
  }) {
    return _then(_ListFacilitiesResponse(
      facilities: facilities == freezed
          ? _value.facilities
          : facilities // ignore: cast_nullable_to_non_nullable
              as List<Facility>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ListFacilitiesResponse implements _ListFacilitiesResponse {
  _$_ListFacilitiesResponse({@JsonKey(name: 'Facilities') this.facilities});

  factory _$_ListFacilitiesResponse.fromJson(Map<String, dynamic> json) =>
      _$$_ListFacilitiesResponseFromJson(json);

  @override
  @JsonKey(name: 'Facilities')
  final List<Facility>? facilities;

  @override
  String toString() {
    return 'ListFacilitiesResponse(facilities: $facilities)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ListFacilitiesResponse &&
            const DeepCollectionEquality()
                .equals(other.facilities, facilities));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(facilities));

  @JsonKey(ignore: true)
  @override
  _$ListFacilitiesResponseCopyWith<_ListFacilitiesResponse> get copyWith =>
      __$ListFacilitiesResponseCopyWithImpl<_ListFacilitiesResponse>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ListFacilitiesResponseToJson(this);
  }
}

abstract class _ListFacilitiesResponse implements ListFacilitiesResponse {
  factory _ListFacilitiesResponse(
          {@JsonKey(name: 'Facilities') List<Facility>? facilities}) =
      _$_ListFacilitiesResponse;

  factory _ListFacilitiesResponse.fromJson(Map<String, dynamic> json) =
      _$_ListFacilitiesResponse.fromJson;

  @override
  @JsonKey(name: 'Facilities')
  List<Facility>? get facilities;
  @override
  @JsonKey(ignore: true)
  _$ListFacilitiesResponseCopyWith<_ListFacilitiesResponse> get copyWith =>
      throw _privateConstructorUsedError;
}
