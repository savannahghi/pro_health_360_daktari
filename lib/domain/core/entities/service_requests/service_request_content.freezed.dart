// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'service_request_content.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ServiceRequestContent _$ServiceRequestContentFromJson(
    Map<String, dynamic> json) {
  return _ServiceRequestContent.fromJson(json);
}

/// @nodoc
class _$ServiceRequestContentTearOff {
  const _$ServiceRequestContentTearOff();

  _ServiceRequestContent call(
      {@JsonKey(name: 'Request') String? description,
      @JsonKey(name: 'ClientName') String? clientName,
      @JsonKey(name: 'ClientContact') String? clientPhoneNumber,
      @JsonKey(name: 'RequestType') ServiceRequestType? serviceRequestType,
      @JsonKey(name: 'ResolvedAt') String? resolvedTime,
      @JsonKey(name: 'ResolvedBy') String? resolvedBy}) {
    return _ServiceRequestContent(
      description: description,
      clientName: clientName,
      clientPhoneNumber: clientPhoneNumber,
      serviceRequestType: serviceRequestType,
      resolvedTime: resolvedTime,
      resolvedBy: resolvedBy,
    );
  }

  ServiceRequestContent fromJson(Map<String, Object?> json) {
    return ServiceRequestContent.fromJson(json);
  }
}

/// @nodoc
const $ServiceRequestContent = _$ServiceRequestContentTearOff();

/// @nodoc
mixin _$ServiceRequestContent {
  @JsonKey(name: 'Request')
  String? get description => throw _privateConstructorUsedError;
  @JsonKey(name: 'ClientName')
  String? get clientName => throw _privateConstructorUsedError;
  @JsonKey(name: 'ClientContact')
  String? get clientPhoneNumber => throw _privateConstructorUsedError;
  @JsonKey(name: 'RequestType')
  ServiceRequestType? get serviceRequestType =>
      throw _privateConstructorUsedError;
  @JsonKey(name: 'ResolvedAt')
  String? get resolvedTime => throw _privateConstructorUsedError;
  @JsonKey(name: 'ResolvedBy')
  String? get resolvedBy => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ServiceRequestContentCopyWith<ServiceRequestContent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ServiceRequestContentCopyWith<$Res> {
  factory $ServiceRequestContentCopyWith(ServiceRequestContent value,
          $Res Function(ServiceRequestContent) then) =
      _$ServiceRequestContentCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: 'Request') String? description,
      @JsonKey(name: 'ClientName') String? clientName,
      @JsonKey(name: 'ClientContact') String? clientPhoneNumber,
      @JsonKey(name: 'RequestType') ServiceRequestType? serviceRequestType,
      @JsonKey(name: 'ResolvedAt') String? resolvedTime,
      @JsonKey(name: 'ResolvedBy') String? resolvedBy});
}

/// @nodoc
class _$ServiceRequestContentCopyWithImpl<$Res>
    implements $ServiceRequestContentCopyWith<$Res> {
  _$ServiceRequestContentCopyWithImpl(this._value, this._then);

  final ServiceRequestContent _value;
  // ignore: unused_field
  final $Res Function(ServiceRequestContent) _then;

  @override
  $Res call({
    Object? description = freezed,
    Object? clientName = freezed,
    Object? clientPhoneNumber = freezed,
    Object? serviceRequestType = freezed,
    Object? resolvedTime = freezed,
    Object? resolvedBy = freezed,
  }) {
    return _then(_value.copyWith(
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      clientName: clientName == freezed
          ? _value.clientName
          : clientName // ignore: cast_nullable_to_non_nullable
              as String?,
      clientPhoneNumber: clientPhoneNumber == freezed
          ? _value.clientPhoneNumber
          : clientPhoneNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      serviceRequestType: serviceRequestType == freezed
          ? _value.serviceRequestType
          : serviceRequestType // ignore: cast_nullable_to_non_nullable
              as ServiceRequestType?,
      resolvedTime: resolvedTime == freezed
          ? _value.resolvedTime
          : resolvedTime // ignore: cast_nullable_to_non_nullable
              as String?,
      resolvedBy: resolvedBy == freezed
          ? _value.resolvedBy
          : resolvedBy // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$ServiceRequestContentCopyWith<$Res>
    implements $ServiceRequestContentCopyWith<$Res> {
  factory _$ServiceRequestContentCopyWith(_ServiceRequestContent value,
          $Res Function(_ServiceRequestContent) then) =
      __$ServiceRequestContentCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: 'Request') String? description,
      @JsonKey(name: 'ClientName') String? clientName,
      @JsonKey(name: 'ClientContact') String? clientPhoneNumber,
      @JsonKey(name: 'RequestType') ServiceRequestType? serviceRequestType,
      @JsonKey(name: 'ResolvedAt') String? resolvedTime,
      @JsonKey(name: 'ResolvedBy') String? resolvedBy});
}

/// @nodoc
class __$ServiceRequestContentCopyWithImpl<$Res>
    extends _$ServiceRequestContentCopyWithImpl<$Res>
    implements _$ServiceRequestContentCopyWith<$Res> {
  __$ServiceRequestContentCopyWithImpl(_ServiceRequestContent _value,
      $Res Function(_ServiceRequestContent) _then)
      : super(_value, (v) => _then(v as _ServiceRequestContent));

  @override
  _ServiceRequestContent get _value => super._value as _ServiceRequestContent;

  @override
  $Res call({
    Object? description = freezed,
    Object? clientName = freezed,
    Object? clientPhoneNumber = freezed,
    Object? serviceRequestType = freezed,
    Object? resolvedTime = freezed,
    Object? resolvedBy = freezed,
  }) {
    return _then(_ServiceRequestContent(
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      clientName: clientName == freezed
          ? _value.clientName
          : clientName // ignore: cast_nullable_to_non_nullable
              as String?,
      clientPhoneNumber: clientPhoneNumber == freezed
          ? _value.clientPhoneNumber
          : clientPhoneNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      serviceRequestType: serviceRequestType == freezed
          ? _value.serviceRequestType
          : serviceRequestType // ignore: cast_nullable_to_non_nullable
              as ServiceRequestType?,
      resolvedTime: resolvedTime == freezed
          ? _value.resolvedTime
          : resolvedTime // ignore: cast_nullable_to_non_nullable
              as String?,
      resolvedBy: resolvedBy == freezed
          ? _value.resolvedBy
          : resolvedBy // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ServiceRequestContent implements _ServiceRequestContent {
  _$_ServiceRequestContent(
      {@JsonKey(name: 'Request') this.description,
      @JsonKey(name: 'ClientName') this.clientName,
      @JsonKey(name: 'ClientContact') this.clientPhoneNumber,
      @JsonKey(name: 'RequestType') this.serviceRequestType,
      @JsonKey(name: 'ResolvedAt') this.resolvedTime,
      @JsonKey(name: 'ResolvedBy') this.resolvedBy});

  factory _$_ServiceRequestContent.fromJson(Map<String, dynamic> json) =>
      _$$_ServiceRequestContentFromJson(json);

  @override
  @JsonKey(name: 'Request')
  final String? description;
  @override
  @JsonKey(name: 'ClientName')
  final String? clientName;
  @override
  @JsonKey(name: 'ClientContact')
  final String? clientPhoneNumber;
  @override
  @JsonKey(name: 'RequestType')
  final ServiceRequestType? serviceRequestType;
  @override
  @JsonKey(name: 'ResolvedAt')
  final String? resolvedTime;
  @override
  @JsonKey(name: 'ResolvedBy')
  final String? resolvedBy;

  @override
  String toString() {
    return 'ServiceRequestContent(description: $description, clientName: $clientName, clientPhoneNumber: $clientPhoneNumber, serviceRequestType: $serviceRequestType, resolvedTime: $resolvedTime, resolvedBy: $resolvedBy)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ServiceRequestContent &&
            const DeepCollectionEquality()
                .equals(other.description, description) &&
            const DeepCollectionEquality()
                .equals(other.clientName, clientName) &&
            const DeepCollectionEquality()
                .equals(other.clientPhoneNumber, clientPhoneNumber) &&
            const DeepCollectionEquality()
                .equals(other.serviceRequestType, serviceRequestType) &&
            const DeepCollectionEquality()
                .equals(other.resolvedTime, resolvedTime) &&
            const DeepCollectionEquality()
                .equals(other.resolvedBy, resolvedBy));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(description),
      const DeepCollectionEquality().hash(clientName),
      const DeepCollectionEquality().hash(clientPhoneNumber),
      const DeepCollectionEquality().hash(serviceRequestType),
      const DeepCollectionEquality().hash(resolvedTime),
      const DeepCollectionEquality().hash(resolvedBy));

  @JsonKey(ignore: true)
  @override
  _$ServiceRequestContentCopyWith<_ServiceRequestContent> get copyWith =>
      __$ServiceRequestContentCopyWithImpl<_ServiceRequestContent>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ServiceRequestContentToJson(this);
  }
}

abstract class _ServiceRequestContent implements ServiceRequestContent {
  factory _ServiceRequestContent(
          {@JsonKey(name: 'Request') String? description,
          @JsonKey(name: 'ClientName') String? clientName,
          @JsonKey(name: 'ClientContact') String? clientPhoneNumber,
          @JsonKey(name: 'RequestType') ServiceRequestType? serviceRequestType,
          @JsonKey(name: 'ResolvedAt') String? resolvedTime,
          @JsonKey(name: 'ResolvedBy') String? resolvedBy}) =
      _$_ServiceRequestContent;

  factory _ServiceRequestContent.fromJson(Map<String, dynamic> json) =
      _$_ServiceRequestContent.fromJson;

  @override
  @JsonKey(name: 'Request')
  String? get description;
  @override
  @JsonKey(name: 'ClientName')
  String? get clientName;
  @override
  @JsonKey(name: 'ClientContact')
  String? get clientPhoneNumber;
  @override
  @JsonKey(name: 'RequestType')
  ServiceRequestType? get serviceRequestType;
  @override
  @JsonKey(name: 'ResolvedAt')
  String? get resolvedTime;
  @override
  @JsonKey(name: 'ResolvedBy')
  String? get resolvedBy;
  @override
  @JsonKey(ignore: true)
  _$ServiceRequestContentCopyWith<_ServiceRequestContent> get copyWith =>
      throw _privateConstructorUsedError;
}
