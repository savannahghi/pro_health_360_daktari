// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'search_service_request_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

SearchServiceRequestResponse _$SearchServiceRequestResponseFromJson(
    Map<String, dynamic> json) {
  return _SearchServiceRequestResponse.fromJson(json);
}

/// @nodoc
mixin _$SearchServiceRequestResponse {
  @JsonKey(name: 'searchServiceRequests')
  List<ServiceRequest>? get serviceRequests =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SearchServiceRequestResponseCopyWith<SearchServiceRequestResponse>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SearchServiceRequestResponseCopyWith<$Res> {
  factory $SearchServiceRequestResponseCopyWith(
          SearchServiceRequestResponse value,
          $Res Function(SearchServiceRequestResponse) then) =
      _$SearchServiceRequestResponseCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: 'searchServiceRequests')
          List<ServiceRequest>? serviceRequests});
}

/// @nodoc
class _$SearchServiceRequestResponseCopyWithImpl<$Res>
    implements $SearchServiceRequestResponseCopyWith<$Res> {
  _$SearchServiceRequestResponseCopyWithImpl(this._value, this._then);

  final SearchServiceRequestResponse _value;
  // ignore: unused_field
  final $Res Function(SearchServiceRequestResponse) _then;

  @override
  $Res call({
    Object? serviceRequests = freezed,
  }) {
    return _then(_value.copyWith(
      serviceRequests: serviceRequests == freezed
          ? _value.serviceRequests
          : serviceRequests // ignore: cast_nullable_to_non_nullable
              as List<ServiceRequest>?,
    ));
  }
}

/// @nodoc
abstract class _$$_SearchServiceRequestResponseCopyWith<$Res>
    implements $SearchServiceRequestResponseCopyWith<$Res> {
  factory _$$_SearchServiceRequestResponseCopyWith(
          _$_SearchServiceRequestResponse value,
          $Res Function(_$_SearchServiceRequestResponse) then) =
      __$$_SearchServiceRequestResponseCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: 'searchServiceRequests')
          List<ServiceRequest>? serviceRequests});
}

/// @nodoc
class __$$_SearchServiceRequestResponseCopyWithImpl<$Res>
    extends _$SearchServiceRequestResponseCopyWithImpl<$Res>
    implements _$$_SearchServiceRequestResponseCopyWith<$Res> {
  __$$_SearchServiceRequestResponseCopyWithImpl(
      _$_SearchServiceRequestResponse _value,
      $Res Function(_$_SearchServiceRequestResponse) _then)
      : super(_value, (v) => _then(v as _$_SearchServiceRequestResponse));

  @override
  _$_SearchServiceRequestResponse get _value =>
      super._value as _$_SearchServiceRequestResponse;

  @override
  $Res call({
    Object? serviceRequests = freezed,
  }) {
    return _then(_$_SearchServiceRequestResponse(
      serviceRequests: serviceRequests == freezed
          ? _value._serviceRequests
          : serviceRequests // ignore: cast_nullable_to_non_nullable
              as List<ServiceRequest>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_SearchServiceRequestResponse implements _SearchServiceRequestResponse {
  _$_SearchServiceRequestResponse(
      {@JsonKey(name: 'searchServiceRequests')
          final List<ServiceRequest>? serviceRequests})
      : _serviceRequests = serviceRequests;

  factory _$_SearchServiceRequestResponse.fromJson(Map<String, dynamic> json) =>
      _$$_SearchServiceRequestResponseFromJson(json);

  final List<ServiceRequest>? _serviceRequests;
  @override
  @JsonKey(name: 'searchServiceRequests')
  List<ServiceRequest>? get serviceRequests {
    final value = _serviceRequests;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'SearchServiceRequestResponse(serviceRequests: $serviceRequests)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SearchServiceRequestResponse &&
            const DeepCollectionEquality()
                .equals(other._serviceRequests, _serviceRequests));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_serviceRequests));

  @JsonKey(ignore: true)
  @override
  _$$_SearchServiceRequestResponseCopyWith<_$_SearchServiceRequestResponse>
      get copyWith => __$$_SearchServiceRequestResponseCopyWithImpl<
          _$_SearchServiceRequestResponse>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_SearchServiceRequestResponseToJson(this);
  }
}

abstract class _SearchServiceRequestResponse
    implements SearchServiceRequestResponse {
  factory _SearchServiceRequestResponse(
          {@JsonKey(name: 'searchServiceRequests')
              final List<ServiceRequest>? serviceRequests}) =
      _$_SearchServiceRequestResponse;

  factory _SearchServiceRequestResponse.fromJson(Map<String, dynamic> json) =
      _$_SearchServiceRequestResponse.fromJson;

  @override
  @JsonKey(name: 'searchServiceRequests')
  List<ServiceRequest>? get serviceRequests =>
      throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_SearchServiceRequestResponseCopyWith<_$_SearchServiceRequestResponse>
      get copyWith => throw _privateConstructorUsedError;
}
