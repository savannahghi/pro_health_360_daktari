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
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PendingServiceRequest _$PendingServiceRequestFromJson(
    Map<String, dynamic> json) {
  return _PendingServiceRequest.fromJson(json);
}

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
abstract class _$$_PendingServiceRequestCopyWith<$Res>
    implements $PendingServiceRequestCopyWith<$Res> {
  factory _$$_PendingServiceRequestCopyWith(_$_PendingServiceRequest value,
          $Res Function(_$_PendingServiceRequest) then) =
      __$$_PendingServiceRequestCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: 'total')
          int? total,
      @JsonKey(name: 'requestsTypeCount')
          List<ServiceRequestCount>? serviceRequestsCount});
}

/// @nodoc
class __$$_PendingServiceRequestCopyWithImpl<$Res>
    extends _$PendingServiceRequestCopyWithImpl<$Res>
    implements _$$_PendingServiceRequestCopyWith<$Res> {
  __$$_PendingServiceRequestCopyWithImpl(_$_PendingServiceRequest _value,
      $Res Function(_$_PendingServiceRequest) _then)
      : super(_value, (v) => _then(v as _$_PendingServiceRequest));

  @override
  _$_PendingServiceRequest get _value =>
      super._value as _$_PendingServiceRequest;

  @override
  $Res call({
    Object? total = freezed,
    Object? serviceRequestsCount = freezed,
  }) {
    return _then(_$_PendingServiceRequest(
      total: total == freezed
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as int?,
      serviceRequestsCount: serviceRequestsCount == freezed
          ? _value._serviceRequestsCount
          : serviceRequestsCount // ignore: cast_nullable_to_non_nullable
              as List<ServiceRequestCount>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_PendingServiceRequest implements _PendingServiceRequest {
  _$_PendingServiceRequest(
      {@JsonKey(name: 'total')
          this.total,
      @JsonKey(name: 'requestsTypeCount')
          final List<ServiceRequestCount>? serviceRequestsCount})
      : _serviceRequestsCount = serviceRequestsCount;

  factory _$_PendingServiceRequest.fromJson(Map<String, dynamic> json) =>
      _$$_PendingServiceRequestFromJson(json);

  @override
  @JsonKey(name: 'total')
  final int? total;
  final List<ServiceRequestCount>? _serviceRequestsCount;
  @override
  @JsonKey(name: 'requestsTypeCount')
  List<ServiceRequestCount>? get serviceRequestsCount {
    final value = _serviceRequestsCount;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'PendingServiceRequest(total: $total, serviceRequestsCount: $serviceRequestsCount)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PendingServiceRequest &&
            const DeepCollectionEquality().equals(other.total, total) &&
            const DeepCollectionEquality()
                .equals(other._serviceRequestsCount, _serviceRequestsCount));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(total),
      const DeepCollectionEquality().hash(_serviceRequestsCount));

  @JsonKey(ignore: true)
  @override
  _$$_PendingServiceRequestCopyWith<_$_PendingServiceRequest> get copyWith =>
      __$$_PendingServiceRequestCopyWithImpl<_$_PendingServiceRequest>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PendingServiceRequestToJson(this);
  }
}

abstract class _PendingServiceRequest implements PendingServiceRequest {
  factory _PendingServiceRequest(
          {@JsonKey(name: 'total')
              final int? total,
          @JsonKey(name: 'requestsTypeCount')
              final List<ServiceRequestCount>? serviceRequestsCount}) =
      _$_PendingServiceRequest;

  factory _PendingServiceRequest.fromJson(Map<String, dynamic> json) =
      _$_PendingServiceRequest.fromJson;

  @override
  @JsonKey(name: 'total')
  int? get total => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'requestsTypeCount')
  List<ServiceRequestCount>? get serviceRequestsCount =>
      throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_PendingServiceRequestCopyWith<_$_PendingServiceRequest> get copyWith =>
      throw _privateConstructorUsedError;
}
