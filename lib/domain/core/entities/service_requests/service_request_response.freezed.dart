// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'service_request_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ServiceRequestResponse _$ServiceRequestResponseFromJson(
    Map<String, dynamic> json) {
  return _ServiceRequestResponse.fromJson(json);
}

/// @nodoc
class _$ServiceRequestResponseTearOff {
  const _$ServiceRequestResponseTearOff();

  _ServiceRequestResponse call(
      {@JsonKey(name: 'getServiceRequests')
          List<ServiceRequest>? serviceRequests,
      @JsonKey(name: 'getPendingServiceRequestsCount')
          PendingServiceRequestCount? pendingServiceRequests,
      bool? errorFetchingServiceRequests}) {
    return _ServiceRequestResponse(
      serviceRequests: serviceRequests,
      pendingServiceRequests: pendingServiceRequests,
      errorFetchingServiceRequests: errorFetchingServiceRequests,
    );
  }

  ServiceRequestResponse fromJson(Map<String, Object?> json) {
    return ServiceRequestResponse.fromJson(json);
  }
}

/// @nodoc
const $ServiceRequestResponse = _$ServiceRequestResponseTearOff();

/// @nodoc
mixin _$ServiceRequestResponse {
  @JsonKey(name: 'getServiceRequests')
  List<ServiceRequest>? get serviceRequests =>
      throw _privateConstructorUsedError;
  @JsonKey(name: 'getPendingServiceRequestsCount')
  PendingServiceRequestCount? get pendingServiceRequests =>
      throw _privateConstructorUsedError;
  bool? get errorFetchingServiceRequests => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ServiceRequestResponseCopyWith<ServiceRequestResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ServiceRequestResponseCopyWith<$Res> {
  factory $ServiceRequestResponseCopyWith(ServiceRequestResponse value,
          $Res Function(ServiceRequestResponse) then) =
      _$ServiceRequestResponseCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: 'getServiceRequests')
          List<ServiceRequest>? serviceRequests,
      @JsonKey(name: 'getPendingServiceRequestsCount')
          PendingServiceRequestCount? pendingServiceRequests,
      bool? errorFetchingServiceRequests});

  $PendingServiceRequestCountCopyWith<$Res>? get pendingServiceRequests;
}

/// @nodoc
class _$ServiceRequestResponseCopyWithImpl<$Res>
    implements $ServiceRequestResponseCopyWith<$Res> {
  _$ServiceRequestResponseCopyWithImpl(this._value, this._then);

  final ServiceRequestResponse _value;
  // ignore: unused_field
  final $Res Function(ServiceRequestResponse) _then;

  @override
  $Res call({
    Object? serviceRequests = freezed,
    Object? pendingServiceRequests = freezed,
    Object? errorFetchingServiceRequests = freezed,
  }) {
    return _then(_value.copyWith(
      serviceRequests: serviceRequests == freezed
          ? _value.serviceRequests
          : serviceRequests // ignore: cast_nullable_to_non_nullable
              as List<ServiceRequest>?,
      pendingServiceRequests: pendingServiceRequests == freezed
          ? _value.pendingServiceRequests
          : pendingServiceRequests // ignore: cast_nullable_to_non_nullable
              as PendingServiceRequestCount?,
      errorFetchingServiceRequests: errorFetchingServiceRequests == freezed
          ? _value.errorFetchingServiceRequests
          : errorFetchingServiceRequests // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }

  @override
  $PendingServiceRequestCountCopyWith<$Res>? get pendingServiceRequests {
    if (_value.pendingServiceRequests == null) {
      return null;
    }

    return $PendingServiceRequestCountCopyWith<$Res>(
        _value.pendingServiceRequests!, (value) {
      return _then(_value.copyWith(pendingServiceRequests: value));
    });
  }
}

/// @nodoc
abstract class _$ServiceRequestResponseCopyWith<$Res>
    implements $ServiceRequestResponseCopyWith<$Res> {
  factory _$ServiceRequestResponseCopyWith(_ServiceRequestResponse value,
          $Res Function(_ServiceRequestResponse) then) =
      __$ServiceRequestResponseCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: 'getServiceRequests')
          List<ServiceRequest>? serviceRequests,
      @JsonKey(name: 'getPendingServiceRequestsCount')
          PendingServiceRequestCount? pendingServiceRequests,
      bool? errorFetchingServiceRequests});

  @override
  $PendingServiceRequestCountCopyWith<$Res>? get pendingServiceRequests;
}

/// @nodoc
class __$ServiceRequestResponseCopyWithImpl<$Res>
    extends _$ServiceRequestResponseCopyWithImpl<$Res>
    implements _$ServiceRequestResponseCopyWith<$Res> {
  __$ServiceRequestResponseCopyWithImpl(_ServiceRequestResponse _value,
      $Res Function(_ServiceRequestResponse) _then)
      : super(_value, (v) => _then(v as _ServiceRequestResponse));

  @override
  _ServiceRequestResponse get _value => super._value as _ServiceRequestResponse;

  @override
  $Res call({
    Object? serviceRequests = freezed,
    Object? pendingServiceRequests = freezed,
    Object? errorFetchingServiceRequests = freezed,
  }) {
    return _then(_ServiceRequestResponse(
      serviceRequests: serviceRequests == freezed
          ? _value.serviceRequests
          : serviceRequests // ignore: cast_nullable_to_non_nullable
              as List<ServiceRequest>?,
      pendingServiceRequests: pendingServiceRequests == freezed
          ? _value.pendingServiceRequests
          : pendingServiceRequests // ignore: cast_nullable_to_non_nullable
              as PendingServiceRequestCount?,
      errorFetchingServiceRequests: errorFetchingServiceRequests == freezed
          ? _value.errorFetchingServiceRequests
          : errorFetchingServiceRequests // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ServiceRequestResponse implements _ServiceRequestResponse {
  _$_ServiceRequestResponse(
      {@JsonKey(name: 'getServiceRequests')
          this.serviceRequests,
      @JsonKey(name: 'getPendingServiceRequestsCount')
          this.pendingServiceRequests,
      this.errorFetchingServiceRequests});

  factory _$_ServiceRequestResponse.fromJson(Map<String, dynamic> json) =>
      _$$_ServiceRequestResponseFromJson(json);

  @override
  @JsonKey(name: 'getServiceRequests')
  final List<ServiceRequest>? serviceRequests;
  @override
  @JsonKey(name: 'getPendingServiceRequestsCount')
  final PendingServiceRequestCount? pendingServiceRequests;
  @override
  final bool? errorFetchingServiceRequests;

  @override
  String toString() {
    return 'ServiceRequestResponse(serviceRequests: $serviceRequests, pendingServiceRequests: $pendingServiceRequests, errorFetchingServiceRequests: $errorFetchingServiceRequests)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ServiceRequestResponse &&
            const DeepCollectionEquality()
                .equals(other.serviceRequests, serviceRequests) &&
            const DeepCollectionEquality()
                .equals(other.pendingServiceRequests, pendingServiceRequests) &&
            const DeepCollectionEquality().equals(
                other.errorFetchingServiceRequests,
                errorFetchingServiceRequests));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(serviceRequests),
      const DeepCollectionEquality().hash(pendingServiceRequests),
      const DeepCollectionEquality().hash(errorFetchingServiceRequests));

  @JsonKey(ignore: true)
  @override
  _$ServiceRequestResponseCopyWith<_ServiceRequestResponse> get copyWith =>
      __$ServiceRequestResponseCopyWithImpl<_ServiceRequestResponse>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ServiceRequestResponseToJson(this);
  }
}

abstract class _ServiceRequestResponse implements ServiceRequestResponse {
  factory _ServiceRequestResponse(
      {@JsonKey(name: 'getServiceRequests')
          List<ServiceRequest>? serviceRequests,
      @JsonKey(name: 'getPendingServiceRequestsCount')
          PendingServiceRequestCount? pendingServiceRequests,
      bool? errorFetchingServiceRequests}) = _$_ServiceRequestResponse;

  factory _ServiceRequestResponse.fromJson(Map<String, dynamic> json) =
      _$_ServiceRequestResponse.fromJson;

  @override
  @JsonKey(name: 'getServiceRequests')
  List<ServiceRequest>? get serviceRequests;
  @override
  @JsonKey(name: 'getPendingServiceRequestsCount')
  PendingServiceRequestCount? get pendingServiceRequests;
  @override
  bool? get errorFetchingServiceRequests;
  @override
  @JsonKey(ignore: true)
  _$ServiceRequestResponseCopyWith<_ServiceRequestResponse> get copyWith =>
      throw _privateConstructorUsedError;
}
