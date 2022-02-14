// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'service_requests_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ServiceRequestsResponse _$ServiceRequestsResponseFromJson(
    Map<String, dynamic> json) {
  return _ServiceRequestsResponse.fromJson(json);
}

/// @nodoc
class _$ServiceRequestsResponseTearOff {
  const _$ServiceRequestsResponseTearOff();

  _ServiceRequestsResponse call(
      {@JsonKey(name: 'getServiceRequests')
          List<ServiceRequestContent>? serviceRequestContent}) {
    return _ServiceRequestsResponse(
      serviceRequestContent: serviceRequestContent,
    );
  }

  ServiceRequestsResponse fromJson(Map<String, Object> json) {
    return ServiceRequestsResponse.fromJson(json);
  }
}

/// @nodoc
const $ServiceRequestsResponse = _$ServiceRequestsResponseTearOff();

/// @nodoc
mixin _$ServiceRequestsResponse {
  @JsonKey(name: 'getServiceRequests')
  List<ServiceRequestContent>? get serviceRequestContent =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ServiceRequestsResponseCopyWith<ServiceRequestsResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ServiceRequestsResponseCopyWith<$Res> {
  factory $ServiceRequestsResponseCopyWith(ServiceRequestsResponse value,
          $Res Function(ServiceRequestsResponse) then) =
      _$ServiceRequestsResponseCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: 'getServiceRequests')
          List<ServiceRequestContent>? serviceRequestContent});
}

/// @nodoc
class _$ServiceRequestsResponseCopyWithImpl<$Res>
    implements $ServiceRequestsResponseCopyWith<$Res> {
  _$ServiceRequestsResponseCopyWithImpl(this._value, this._then);

  final ServiceRequestsResponse _value;
  // ignore: unused_field
  final $Res Function(ServiceRequestsResponse) _then;

  @override
  $Res call({
    Object? serviceRequestContent = freezed,
  }) {
    return _then(_value.copyWith(
      serviceRequestContent: serviceRequestContent == freezed
          ? _value.serviceRequestContent
          : serviceRequestContent // ignore: cast_nullable_to_non_nullable
              as List<ServiceRequestContent>?,
    ));
  }
}

/// @nodoc
abstract class _$ServiceRequestsResponseCopyWith<$Res>
    implements $ServiceRequestsResponseCopyWith<$Res> {
  factory _$ServiceRequestsResponseCopyWith(_ServiceRequestsResponse value,
          $Res Function(_ServiceRequestsResponse) then) =
      __$ServiceRequestsResponseCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: 'getServiceRequests')
          List<ServiceRequestContent>? serviceRequestContent});
}

/// @nodoc
class __$ServiceRequestsResponseCopyWithImpl<$Res>
    extends _$ServiceRequestsResponseCopyWithImpl<$Res>
    implements _$ServiceRequestsResponseCopyWith<$Res> {
  __$ServiceRequestsResponseCopyWithImpl(_ServiceRequestsResponse _value,
      $Res Function(_ServiceRequestsResponse) _then)
      : super(_value, (v) => _then(v as _ServiceRequestsResponse));

  @override
  _ServiceRequestsResponse get _value =>
      super._value as _ServiceRequestsResponse;

  @override
  $Res call({
    Object? serviceRequestContent = freezed,
  }) {
    return _then(_ServiceRequestsResponse(
      serviceRequestContent: serviceRequestContent == freezed
          ? _value.serviceRequestContent
          : serviceRequestContent // ignore: cast_nullable_to_non_nullable
              as List<ServiceRequestContent>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ServiceRequestsResponse implements _ServiceRequestsResponse {
  _$_ServiceRequestsResponse(
      {@JsonKey(name: 'getServiceRequests') this.serviceRequestContent});

  factory _$_ServiceRequestsResponse.fromJson(Map<String, dynamic> json) =>
      _$_$_ServiceRequestsResponseFromJson(json);

  @override
  @JsonKey(name: 'getServiceRequests')
  final List<ServiceRequestContent>? serviceRequestContent;

  @override
  String toString() {
    return 'ServiceRequestsResponse(serviceRequestContent: $serviceRequestContent)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _ServiceRequestsResponse &&
            (identical(other.serviceRequestContent, serviceRequestContent) ||
                const DeepCollectionEquality().equals(
                    other.serviceRequestContent, serviceRequestContent)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(serviceRequestContent);

  @JsonKey(ignore: true)
  @override
  _$ServiceRequestsResponseCopyWith<_ServiceRequestsResponse> get copyWith =>
      __$ServiceRequestsResponseCopyWithImpl<_ServiceRequestsResponse>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_ServiceRequestsResponseToJson(this);
  }
}

abstract class _ServiceRequestsResponse implements ServiceRequestsResponse {
  factory _ServiceRequestsResponse(
          {@JsonKey(name: 'getServiceRequests')
              List<ServiceRequestContent>? serviceRequestContent}) =
      _$_ServiceRequestsResponse;

  factory _ServiceRequestsResponse.fromJson(Map<String, dynamic> json) =
      _$_ServiceRequestsResponse.fromJson;

  @override
  @JsonKey(name: 'getServiceRequests')
  List<ServiceRequestContent>? get serviceRequestContent =>
      throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$ServiceRequestsResponseCopyWith<_ServiceRequestsResponse> get copyWith =>
      throw _privateConstructorUsedError;
}
