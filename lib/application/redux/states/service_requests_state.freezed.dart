// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'service_requests_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ServiceRequestState _$ServiceRequestStateFromJson(Map<String, dynamic> json) {
  return _ServiceRequestState.fromJson(json);
}

/// @nodoc
class _$ServiceRequestStateTearOff {
  const _$ServiceRequestStateTearOff();

  _ServiceRequestState call(
      {@JsonKey(name: 'getServiceRequests')
          List<ServiceRequestContent?>? serviceRequestContent,
      bool? errorFetchingServiceRequests}) {
    return _ServiceRequestState(
      serviceRequestContent: serviceRequestContent,
      errorFetchingServiceRequests: errorFetchingServiceRequests,
    );
  }

  ServiceRequestState fromJson(Map<String, Object> json) {
    return ServiceRequestState.fromJson(json);
  }
}

/// @nodoc
const $ServiceRequestState = _$ServiceRequestStateTearOff();

/// @nodoc
mixin _$ServiceRequestState {
  @JsonKey(name: 'getServiceRequests')
  List<ServiceRequestContent?>? get serviceRequestContent =>
      throw _privateConstructorUsedError;
  bool? get errorFetchingServiceRequests => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ServiceRequestStateCopyWith<ServiceRequestState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ServiceRequestStateCopyWith<$Res> {
  factory $ServiceRequestStateCopyWith(
          ServiceRequestState value, $Res Function(ServiceRequestState) then) =
      _$ServiceRequestStateCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: 'getServiceRequests')
          List<ServiceRequestContent?>? serviceRequestContent,
      bool? errorFetchingServiceRequests});
}

/// @nodoc
class _$ServiceRequestStateCopyWithImpl<$Res>
    implements $ServiceRequestStateCopyWith<$Res> {
  _$ServiceRequestStateCopyWithImpl(this._value, this._then);

  final ServiceRequestState _value;
  // ignore: unused_field
  final $Res Function(ServiceRequestState) _then;

  @override
  $Res call({
    Object? serviceRequestContent = freezed,
    Object? errorFetchingServiceRequests = freezed,
  }) {
    return _then(_value.copyWith(
      serviceRequestContent: serviceRequestContent == freezed
          ? _value.serviceRequestContent
          : serviceRequestContent // ignore: cast_nullable_to_non_nullable
              as List<ServiceRequestContent?>?,
      errorFetchingServiceRequests: errorFetchingServiceRequests == freezed
          ? _value.errorFetchingServiceRequests
          : errorFetchingServiceRequests // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
abstract class _$ServiceRequestStateCopyWith<$Res>
    implements $ServiceRequestStateCopyWith<$Res> {
  factory _$ServiceRequestStateCopyWith(_ServiceRequestState value,
          $Res Function(_ServiceRequestState) then) =
      __$ServiceRequestStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: 'getServiceRequests')
          List<ServiceRequestContent?>? serviceRequestContent,
      bool? errorFetchingServiceRequests});
}

/// @nodoc
class __$ServiceRequestStateCopyWithImpl<$Res>
    extends _$ServiceRequestStateCopyWithImpl<$Res>
    implements _$ServiceRequestStateCopyWith<$Res> {
  __$ServiceRequestStateCopyWithImpl(
      _ServiceRequestState _value, $Res Function(_ServiceRequestState) _then)
      : super(_value, (v) => _then(v as _ServiceRequestState));

  @override
  _ServiceRequestState get _value => super._value as _ServiceRequestState;

  @override
  $Res call({
    Object? serviceRequestContent = freezed,
    Object? errorFetchingServiceRequests = freezed,
  }) {
    return _then(_ServiceRequestState(
      serviceRequestContent: serviceRequestContent == freezed
          ? _value.serviceRequestContent
          : serviceRequestContent // ignore: cast_nullable_to_non_nullable
              as List<ServiceRequestContent?>?,
      errorFetchingServiceRequests: errorFetchingServiceRequests == freezed
          ? _value.errorFetchingServiceRequests
          : errorFetchingServiceRequests // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ServiceRequestState implements _ServiceRequestState {
  _$_ServiceRequestState(
      {@JsonKey(name: 'getServiceRequests') this.serviceRequestContent,
      this.errorFetchingServiceRequests});

  factory _$_ServiceRequestState.fromJson(Map<String, dynamic> json) =>
      _$_$_ServiceRequestStateFromJson(json);

  @override
  @JsonKey(name: 'getServiceRequests')
  final List<ServiceRequestContent?>? serviceRequestContent;
  @override
  final bool? errorFetchingServiceRequests;

  @override
  String toString() {
    return 'ServiceRequestState(serviceRequestContent: $serviceRequestContent, errorFetchingServiceRequests: $errorFetchingServiceRequests)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _ServiceRequestState &&
            (identical(other.serviceRequestContent, serviceRequestContent) ||
                const DeepCollectionEquality().equals(
                    other.serviceRequestContent, serviceRequestContent)) &&
            (identical(other.errorFetchingServiceRequests,
                    errorFetchingServiceRequests) ||
                const DeepCollectionEquality().equals(
                    other.errorFetchingServiceRequests,
                    errorFetchingServiceRequests)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(serviceRequestContent) ^
      const DeepCollectionEquality().hash(errorFetchingServiceRequests);

  @JsonKey(ignore: true)
  @override
  _$ServiceRequestStateCopyWith<_ServiceRequestState> get copyWith =>
      __$ServiceRequestStateCopyWithImpl<_ServiceRequestState>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_ServiceRequestStateToJson(this);
  }
}

abstract class _ServiceRequestState implements ServiceRequestState {
  factory _ServiceRequestState(
      {@JsonKey(name: 'getServiceRequests')
          List<ServiceRequestContent?>? serviceRequestContent,
      bool? errorFetchingServiceRequests}) = _$_ServiceRequestState;

  factory _ServiceRequestState.fromJson(Map<String, dynamic> json) =
      _$_ServiceRequestState.fromJson;

  @override
  @JsonKey(name: 'getServiceRequests')
  List<ServiceRequestContent?>? get serviceRequestContent =>
      throw _privateConstructorUsedError;
  @override
  bool? get errorFetchingServiceRequests => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$ServiceRequestStateCopyWith<_ServiceRequestState> get copyWith =>
      throw _privateConstructorUsedError;
}
