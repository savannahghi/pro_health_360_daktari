// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'service_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ServiceRequest _$ServiceRequestFromJson(Map<String, dynamic> json) {
  return _ServiceRequest.fromJson(json);
}

/// @nodoc
mixin _$ServiceRequest {
  @JsonKey(name: 'ID')
  String? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'Request')
  String? get description => throw _privateConstructorUsedError;
  @JsonKey(name: 'RequestType')
  ServiceRequestType? get serviceRequestType =>
      throw _privateConstructorUsedError;
  @JsonKey(name: 'ClientID')
  String? get clientId => throw _privateConstructorUsedError;
  @JsonKey(name: 'ClientName')
  String? get clientName => throw _privateConstructorUsedError;
  @JsonKey(name: 'ClientContact')
  String? get clientPhoneNumber => throw _privateConstructorUsedError;
  @JsonKey(name: 'Status')
  RequestStatus? get status => throw _privateConstructorUsedError;
  @JsonKey(name: 'ResolvedAt')
  String? get resolvedTime => throw _privateConstructorUsedError;
  @JsonKey(name: 'ResolvedBy')
  String? get resolvedBy => throw _privateConstructorUsedError;
  @JsonKey(name: 'ResolvedByName')
  String? get resolvedByName => throw _privateConstructorUsedError;
  @JsonKey(name: 'CreatedAt')
  String? get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'Meta')
  ServiceRequestMeta? get meta => throw _privateConstructorUsedError;
  @JsonKey(name: 'StaffID')
  String? get staffId => throw _privateConstructorUsedError;
  @JsonKey(name: 'StaffName')
  String? get staffName => throw _privateConstructorUsedError;
  @JsonKey(name: 'StaffContact')
  String? get staffPhoneNumber => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ServiceRequestCopyWith<ServiceRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ServiceRequestCopyWith<$Res> {
  factory $ServiceRequestCopyWith(
          ServiceRequest value, $Res Function(ServiceRequest) then) =
      _$ServiceRequestCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: 'ID') String? id,
      @JsonKey(name: 'Request') String? description,
      @JsonKey(name: 'RequestType') ServiceRequestType? serviceRequestType,
      @JsonKey(name: 'ClientID') String? clientId,
      @JsonKey(name: 'ClientName') String? clientName,
      @JsonKey(name: 'ClientContact') String? clientPhoneNumber,
      @JsonKey(name: 'Status') RequestStatus? status,
      @JsonKey(name: 'ResolvedAt') String? resolvedTime,
      @JsonKey(name: 'ResolvedBy') String? resolvedBy,
      @JsonKey(name: 'ResolvedByName') String? resolvedByName,
      @JsonKey(name: 'CreatedAt') String? createdAt,
      @JsonKey(name: 'Meta') ServiceRequestMeta? meta,
      @JsonKey(name: 'StaffID') String? staffId,
      @JsonKey(name: 'StaffName') String? staffName,
      @JsonKey(name: 'StaffContact') String? staffPhoneNumber});

  $ServiceRequestMetaCopyWith<$Res>? get meta;
}

/// @nodoc
class _$ServiceRequestCopyWithImpl<$Res>
    implements $ServiceRequestCopyWith<$Res> {
  _$ServiceRequestCopyWithImpl(this._value, this._then);

  final ServiceRequest _value;
  // ignore: unused_field
  final $Res Function(ServiceRequest) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? description = freezed,
    Object? serviceRequestType = freezed,
    Object? clientId = freezed,
    Object? clientName = freezed,
    Object? clientPhoneNumber = freezed,
    Object? status = freezed,
    Object? resolvedTime = freezed,
    Object? resolvedBy = freezed,
    Object? resolvedByName = freezed,
    Object? createdAt = freezed,
    Object? meta = freezed,
    Object? staffId = freezed,
    Object? staffName = freezed,
    Object? staffPhoneNumber = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      serviceRequestType: serviceRequestType == freezed
          ? _value.serviceRequestType
          : serviceRequestType // ignore: cast_nullable_to_non_nullable
              as ServiceRequestType?,
      clientId: clientId == freezed
          ? _value.clientId
          : clientId // ignore: cast_nullable_to_non_nullable
              as String?,
      clientName: clientName == freezed
          ? _value.clientName
          : clientName // ignore: cast_nullable_to_non_nullable
              as String?,
      clientPhoneNumber: clientPhoneNumber == freezed
          ? _value.clientPhoneNumber
          : clientPhoneNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as RequestStatus?,
      resolvedTime: resolvedTime == freezed
          ? _value.resolvedTime
          : resolvedTime // ignore: cast_nullable_to_non_nullable
              as String?,
      resolvedBy: resolvedBy == freezed
          ? _value.resolvedBy
          : resolvedBy // ignore: cast_nullable_to_non_nullable
              as String?,
      resolvedByName: resolvedByName == freezed
          ? _value.resolvedByName
          : resolvedByName // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: createdAt == freezed
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String?,
      meta: meta == freezed
          ? _value.meta
          : meta // ignore: cast_nullable_to_non_nullable
              as ServiceRequestMeta?,
      staffId: staffId == freezed
          ? _value.staffId
          : staffId // ignore: cast_nullable_to_non_nullable
              as String?,
      staffName: staffName == freezed
          ? _value.staffName
          : staffName // ignore: cast_nullable_to_non_nullable
              as String?,
      staffPhoneNumber: staffPhoneNumber == freezed
          ? _value.staffPhoneNumber
          : staffPhoneNumber // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }

  @override
  $ServiceRequestMetaCopyWith<$Res>? get meta {
    if (_value.meta == null) {
      return null;
    }

    return $ServiceRequestMetaCopyWith<$Res>(_value.meta!, (value) {
      return _then(_value.copyWith(meta: value));
    });
  }
}

/// @nodoc
abstract class _$$_ServiceRequestCopyWith<$Res>
    implements $ServiceRequestCopyWith<$Res> {
  factory _$$_ServiceRequestCopyWith(
          _$_ServiceRequest value, $Res Function(_$_ServiceRequest) then) =
      __$$_ServiceRequestCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: 'ID') String? id,
      @JsonKey(name: 'Request') String? description,
      @JsonKey(name: 'RequestType') ServiceRequestType? serviceRequestType,
      @JsonKey(name: 'ClientID') String? clientId,
      @JsonKey(name: 'ClientName') String? clientName,
      @JsonKey(name: 'ClientContact') String? clientPhoneNumber,
      @JsonKey(name: 'Status') RequestStatus? status,
      @JsonKey(name: 'ResolvedAt') String? resolvedTime,
      @JsonKey(name: 'ResolvedBy') String? resolvedBy,
      @JsonKey(name: 'ResolvedByName') String? resolvedByName,
      @JsonKey(name: 'CreatedAt') String? createdAt,
      @JsonKey(name: 'Meta') ServiceRequestMeta? meta,
      @JsonKey(name: 'StaffID') String? staffId,
      @JsonKey(name: 'StaffName') String? staffName,
      @JsonKey(name: 'StaffContact') String? staffPhoneNumber});

  @override
  $ServiceRequestMetaCopyWith<$Res>? get meta;
}

/// @nodoc
class __$$_ServiceRequestCopyWithImpl<$Res>
    extends _$ServiceRequestCopyWithImpl<$Res>
    implements _$$_ServiceRequestCopyWith<$Res> {
  __$$_ServiceRequestCopyWithImpl(
      _$_ServiceRequest _value, $Res Function(_$_ServiceRequest) _then)
      : super(_value, (v) => _then(v as _$_ServiceRequest));

  @override
  _$_ServiceRequest get _value => super._value as _$_ServiceRequest;

  @override
  $Res call({
    Object? id = freezed,
    Object? description = freezed,
    Object? serviceRequestType = freezed,
    Object? clientId = freezed,
    Object? clientName = freezed,
    Object? clientPhoneNumber = freezed,
    Object? status = freezed,
    Object? resolvedTime = freezed,
    Object? resolvedBy = freezed,
    Object? resolvedByName = freezed,
    Object? createdAt = freezed,
    Object? meta = freezed,
    Object? staffId = freezed,
    Object? staffName = freezed,
    Object? staffPhoneNumber = freezed,
  }) {
    return _then(_$_ServiceRequest(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      serviceRequestType: serviceRequestType == freezed
          ? _value.serviceRequestType
          : serviceRequestType // ignore: cast_nullable_to_non_nullable
              as ServiceRequestType?,
      clientId: clientId == freezed
          ? _value.clientId
          : clientId // ignore: cast_nullable_to_non_nullable
              as String?,
      clientName: clientName == freezed
          ? _value.clientName
          : clientName // ignore: cast_nullable_to_non_nullable
              as String?,
      clientPhoneNumber: clientPhoneNumber == freezed
          ? _value.clientPhoneNumber
          : clientPhoneNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as RequestStatus?,
      resolvedTime: resolvedTime == freezed
          ? _value.resolvedTime
          : resolvedTime // ignore: cast_nullable_to_non_nullable
              as String?,
      resolvedBy: resolvedBy == freezed
          ? _value.resolvedBy
          : resolvedBy // ignore: cast_nullable_to_non_nullable
              as String?,
      resolvedByName: resolvedByName == freezed
          ? _value.resolvedByName
          : resolvedByName // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: createdAt == freezed
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String?,
      meta: meta == freezed
          ? _value.meta
          : meta // ignore: cast_nullable_to_non_nullable
              as ServiceRequestMeta?,
      staffId: staffId == freezed
          ? _value.staffId
          : staffId // ignore: cast_nullable_to_non_nullable
              as String?,
      staffName: staffName == freezed
          ? _value.staffName
          : staffName // ignore: cast_nullable_to_non_nullable
              as String?,
      staffPhoneNumber: staffPhoneNumber == freezed
          ? _value.staffPhoneNumber
          : staffPhoneNumber // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ServiceRequest implements _ServiceRequest {
  _$_ServiceRequest(
      {@JsonKey(name: 'ID') this.id,
      @JsonKey(name: 'Request') this.description,
      @JsonKey(name: 'RequestType') this.serviceRequestType,
      @JsonKey(name: 'ClientID') this.clientId,
      @JsonKey(name: 'ClientName') this.clientName,
      @JsonKey(name: 'ClientContact') this.clientPhoneNumber,
      @JsonKey(name: 'Status') this.status,
      @JsonKey(name: 'ResolvedAt') this.resolvedTime,
      @JsonKey(name: 'ResolvedBy') this.resolvedBy,
      @JsonKey(name: 'ResolvedByName') this.resolvedByName,
      @JsonKey(name: 'CreatedAt') this.createdAt,
      @JsonKey(name: 'Meta') this.meta,
      @JsonKey(name: 'StaffID') this.staffId,
      @JsonKey(name: 'StaffName') this.staffName,
      @JsonKey(name: 'StaffContact') this.staffPhoneNumber});

  factory _$_ServiceRequest.fromJson(Map<String, dynamic> json) =>
      _$$_ServiceRequestFromJson(json);

  @override
  @JsonKey(name: 'ID')
  final String? id;
  @override
  @JsonKey(name: 'Request')
  final String? description;
  @override
  @JsonKey(name: 'RequestType')
  final ServiceRequestType? serviceRequestType;
  @override
  @JsonKey(name: 'ClientID')
  final String? clientId;
  @override
  @JsonKey(name: 'ClientName')
  final String? clientName;
  @override
  @JsonKey(name: 'ClientContact')
  final String? clientPhoneNumber;
  @override
  @JsonKey(name: 'Status')
  final RequestStatus? status;
  @override
  @JsonKey(name: 'ResolvedAt')
  final String? resolvedTime;
  @override
  @JsonKey(name: 'ResolvedBy')
  final String? resolvedBy;
  @override
  @JsonKey(name: 'ResolvedByName')
  final String? resolvedByName;
  @override
  @JsonKey(name: 'CreatedAt')
  final String? createdAt;
  @override
  @JsonKey(name: 'Meta')
  final ServiceRequestMeta? meta;
  @override
  @JsonKey(name: 'StaffID')
  final String? staffId;
  @override
  @JsonKey(name: 'StaffName')
  final String? staffName;
  @override
  @JsonKey(name: 'StaffContact')
  final String? staffPhoneNumber;

  @override
  String toString() {
    return 'ServiceRequest(id: $id, description: $description, serviceRequestType: $serviceRequestType, clientId: $clientId, clientName: $clientName, clientPhoneNumber: $clientPhoneNumber, status: $status, resolvedTime: $resolvedTime, resolvedBy: $resolvedBy, resolvedByName: $resolvedByName, createdAt: $createdAt, meta: $meta, staffId: $staffId, staffName: $staffName, staffPhoneNumber: $staffPhoneNumber)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ServiceRequest &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality()
                .equals(other.description, description) &&
            const DeepCollectionEquality()
                .equals(other.serviceRequestType, serviceRequestType) &&
            const DeepCollectionEquality().equals(other.clientId, clientId) &&
            const DeepCollectionEquality()
                .equals(other.clientName, clientName) &&
            const DeepCollectionEquality()
                .equals(other.clientPhoneNumber, clientPhoneNumber) &&
            const DeepCollectionEquality().equals(other.status, status) &&
            const DeepCollectionEquality()
                .equals(other.resolvedTime, resolvedTime) &&
            const DeepCollectionEquality()
                .equals(other.resolvedBy, resolvedBy) &&
            const DeepCollectionEquality()
                .equals(other.resolvedByName, resolvedByName) &&
            const DeepCollectionEquality().equals(other.createdAt, createdAt) &&
            const DeepCollectionEquality().equals(other.meta, meta) &&
            const DeepCollectionEquality().equals(other.staffId, staffId) &&
            const DeepCollectionEquality().equals(other.staffName, staffName) &&
            const DeepCollectionEquality()
                .equals(other.staffPhoneNumber, staffPhoneNumber));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(description),
      const DeepCollectionEquality().hash(serviceRequestType),
      const DeepCollectionEquality().hash(clientId),
      const DeepCollectionEquality().hash(clientName),
      const DeepCollectionEquality().hash(clientPhoneNumber),
      const DeepCollectionEquality().hash(status),
      const DeepCollectionEquality().hash(resolvedTime),
      const DeepCollectionEquality().hash(resolvedBy),
      const DeepCollectionEquality().hash(resolvedByName),
      const DeepCollectionEquality().hash(createdAt),
      const DeepCollectionEquality().hash(meta),
      const DeepCollectionEquality().hash(staffId),
      const DeepCollectionEquality().hash(staffName),
      const DeepCollectionEquality().hash(staffPhoneNumber));

  @JsonKey(ignore: true)
  @override
  _$$_ServiceRequestCopyWith<_$_ServiceRequest> get copyWith =>
      __$$_ServiceRequestCopyWithImpl<_$_ServiceRequest>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ServiceRequestToJson(this);
  }
}

abstract class _ServiceRequest implements ServiceRequest {
  factory _ServiceRequest(
      {@JsonKey(name: 'ID')
          final String? id,
      @JsonKey(name: 'Request')
          final String? description,
      @JsonKey(name: 'RequestType')
          final ServiceRequestType? serviceRequestType,
      @JsonKey(name: 'ClientID')
          final String? clientId,
      @JsonKey(name: 'ClientName')
          final String? clientName,
      @JsonKey(name: 'ClientContact')
          final String? clientPhoneNumber,
      @JsonKey(name: 'Status')
          final RequestStatus? status,
      @JsonKey(name: 'ResolvedAt')
          final String? resolvedTime,
      @JsonKey(name: 'ResolvedBy')
          final String? resolvedBy,
      @JsonKey(name: 'ResolvedByName')
          final String? resolvedByName,
      @JsonKey(name: 'CreatedAt')
          final String? createdAt,
      @JsonKey(name: 'Meta')
          final ServiceRequestMeta? meta,
      @JsonKey(name: 'StaffID')
          final String? staffId,
      @JsonKey(name: 'StaffName')
          final String? staffName,
      @JsonKey(name: 'StaffContact')
          final String? staffPhoneNumber}) = _$_ServiceRequest;

  factory _ServiceRequest.fromJson(Map<String, dynamic> json) =
      _$_ServiceRequest.fromJson;

  @override
  @JsonKey(name: 'ID')
  String? get id => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'Request')
  String? get description => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'RequestType')
  ServiceRequestType? get serviceRequestType =>
      throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'ClientID')
  String? get clientId => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'ClientName')
  String? get clientName => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'ClientContact')
  String? get clientPhoneNumber => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'Status')
  RequestStatus? get status => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'ResolvedAt')
  String? get resolvedTime => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'ResolvedBy')
  String? get resolvedBy => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'ResolvedByName')
  String? get resolvedByName => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'CreatedAt')
  String? get createdAt => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'Meta')
  ServiceRequestMeta? get meta => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'StaffID')
  String? get staffId => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'StaffName')
  String? get staffName => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'StaffContact')
  String? get staffPhoneNumber => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_ServiceRequestCopyWith<_$_ServiceRequest> get copyWith =>
      throw _privateConstructorUsedError;
}
