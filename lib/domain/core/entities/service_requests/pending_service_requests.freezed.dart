// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'pending_service_requests.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PendingServiceRequest _$PendingServiceRequestFromJson(
    Map<String, dynamic> json) {
  return _PendingServiceRequest.fromJson(json);
}

/// @nodoc
class _$PendingServiceRequestTearOff {
  const _$PendingServiceRequestTearOff();

  _PendingServiceRequest call(
      {@JsonKey(name: 'total')
          int? total,
      @JsonKey(name: 'requestsTypeCount')
          List<ServiceRequestCount>? serviceRequestsCount}) {
    return _PendingServiceRequest(
      total: total,
      serviceRequestsCount: serviceRequestsCount,
    );
  }

  PendingServiceRequest fromJson(Map<String, Object?> json) {
    return PendingServiceRequest.fromJson(json);
  }
}

/// @nodoc
const $PendingServiceRequest = _$PendingServiceRequestTearOff();

/// @nodoc
mixin _$PendingServiceRequest {
  @JsonKey(name: 'total')
  int? get total => throw _privateConstructorUsedError;
  @JsonKey(name: 'requestsTypeCount')
  List<ServiceRequestCount>? get serviceRequestsCount =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PendingServiceRequestCopyWith<PendingServiceRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PendingServiceRequestCopyWith<$Res> {
  factory $PendingServiceRequestCopyWith(PendingServiceRequest value,
          $Res Function(PendingServiceRequest) then) =
      _$PendingServiceRequestCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: 'total')
          int? total,
      @JsonKey(name: 'requestsTypeCount')
          List<ServiceRequestCount>? serviceRequestsCount});
}

/// @nodoc
class _$PendingServiceRequestCopyWithImpl<$Res>
    implements $PendingServiceRequestCopyWith<$Res> {
  _$PendingServiceRequestCopyWithImpl(this._value, this._then);

  final PendingServiceRequest _value;
  // ignore: unused_field
  final $Res Function(PendingServiceRequest) _then;

  @override
  $Res call({
    Object? total = freezed,
    Object? serviceRequestsCount = freezed,
  }) {
    return _then(_value.copyWith(
      total: total == freezed
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as int?,
      serviceRequestsCount: serviceRequestsCount == freezed
          ? _value.serviceRequestsCount
          : serviceRequestsCount // ignore: cast_nullable_to_non_nullable
              as List<ServiceRequestCount>?,
    ));
  }
}

/// @nodoc
abstract class _$PendingServiceRequestCopyWith<$Res>
    implements $PendingServiceRequestCopyWith<$Res> {
  factory _$PendingServiceRequestCopyWith(_PendingServiceRequest value,
          $Res Function(_PendingServiceRequest) then) =
      __$PendingServiceRequestCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: 'total')
          int? total,
      @JsonKey(name: 'requestsTypeCount')
          List<ServiceRequestCount>? serviceRequestsCount});
}

/// @nodoc
class __$PendingServiceRequestCopyWithImpl<$Res>
    extends _$PendingServiceRequestCopyWithImpl<$Res>
    implements _$PendingServiceRequestCopyWith<$Res> {
  __$PendingServiceRequestCopyWithImpl(_PendingServiceRequest _value,
      $Res Function(_PendingServiceRequest) _then)
      : super(_value, (v) => _then(v as _PendingServiceRequest));

  @override
  _PendingServiceRequest get _value => super._value as _PendingServiceRequest;

  @override
  $Res call({
    Object? total = freezed,
    Object? serviceRequestsCount = freezed,
  }) {
    return _then(_PendingServiceRequest(
      total: total == freezed
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as int?,
      serviceRequestsCount: serviceRequestsCount == freezed
          ? _value.serviceRequestsCount
          : serviceRequestsCount // ignore: cast_nullable_to_non_nullable
              as List<ServiceRequestCount>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_PendingServiceRequest implements _PendingServiceRequest {
  _$_PendingServiceRequest(
      {@JsonKey(name: 'total') this.total,
      @JsonKey(name: 'requestsTypeCount') this.serviceRequestsCount});

  factory _$_PendingServiceRequest.fromJson(Map<String, dynamic> json) =>
      _$$_PendingServiceRequestFromJson(json);

  @override
  @JsonKey(name: 'total')
  final int? total;
  @override
  @JsonKey(name: 'requestsTypeCount')
  final List<ServiceRequestCount>? serviceRequestsCount;

  @override
  String toString() {
    return 'PendingServiceRequest(total: $total, serviceRequestsCount: $serviceRequestsCount)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _PendingServiceRequest &&
            const DeepCollectionEquality().equals(other.total, total) &&
            const DeepCollectionEquality()
                .equals(other.serviceRequestsCount, serviceRequestsCount));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(total),
      const DeepCollectionEquality().hash(serviceRequestsCount));

  @JsonKey(ignore: true)
  @override
  _$PendingServiceRequestCopyWith<_PendingServiceRequest> get copyWith =>
      __$PendingServiceRequestCopyWithImpl<_PendingServiceRequest>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PendingServiceRequestToJson(this);
  }
}

abstract class _PendingServiceRequest implements PendingServiceRequest {
  factory _PendingServiceRequest(
          {@JsonKey(name: 'total')
              int? total,
          @JsonKey(name: 'requestsTypeCount')
              List<ServiceRequestCount>? serviceRequestsCount}) =
      _$_PendingServiceRequest;

  factory _PendingServiceRequest.fromJson(Map<String, dynamic> json) =
      _$_PendingServiceRequest.fromJson;

  @override
  @JsonKey(name: 'total')
  int? get total;
  @override
  @JsonKey(name: 'requestsTypeCount')
  List<ServiceRequestCount>? get serviceRequestsCount;
  @override
  @JsonKey(ignore: true)
  _$PendingServiceRequestCopyWith<_PendingServiceRequest> get copyWith =>
      throw _privateConstructorUsedError;
}
