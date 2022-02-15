// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'pending_service_request_count_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PendingServiceRequestsCountResponse
    _$PendingServiceRequestsCountResponseFromJson(Map<String, dynamic> json) {
  return _PendingServiceRequestsCountResponse.fromJson(json);
}

/// @nodoc
class _$PendingServiceRequestsCountResponseTearOff {
  const _$PendingServiceRequestsCountResponseTearOff();

  _PendingServiceRequestsCountResponse call(
      {@JsonKey(name: 'getPendingServiceRequestsCount')
          PendingServiceRequest? pendingServiceRequests}) {
    return _PendingServiceRequestsCountResponse(
      pendingServiceRequests: pendingServiceRequests,
    );
  }

  PendingServiceRequestsCountResponse fromJson(Map<String, Object> json) {
    return PendingServiceRequestsCountResponse.fromJson(json);
  }
}

/// @nodoc
const $PendingServiceRequestsCountResponse =
    _$PendingServiceRequestsCountResponseTearOff();

/// @nodoc
mixin _$PendingServiceRequestsCountResponse {
  @JsonKey(name: 'getPendingServiceRequestsCount')
  PendingServiceRequest? get pendingServiceRequests =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PendingServiceRequestsCountResponseCopyWith<
          PendingServiceRequestsCountResponse>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PendingServiceRequestsCountResponseCopyWith<$Res> {
  factory $PendingServiceRequestsCountResponseCopyWith(
          PendingServiceRequestsCountResponse value,
          $Res Function(PendingServiceRequestsCountResponse) then) =
      _$PendingServiceRequestsCountResponseCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: 'getPendingServiceRequestsCount')
          PendingServiceRequest? pendingServiceRequests});

  $PendingServiceRequestCopyWith<$Res>? get pendingServiceRequests;
}

/// @nodoc
class _$PendingServiceRequestsCountResponseCopyWithImpl<$Res>
    implements $PendingServiceRequestsCountResponseCopyWith<$Res> {
  _$PendingServiceRequestsCountResponseCopyWithImpl(this._value, this._then);

  final PendingServiceRequestsCountResponse _value;
  // ignore: unused_field
  final $Res Function(PendingServiceRequestsCountResponse) _then;

  @override
  $Res call({
    Object? pendingServiceRequests = freezed,
  }) {
    return _then(_value.copyWith(
      pendingServiceRequests: pendingServiceRequests == freezed
          ? _value.pendingServiceRequests
          : pendingServiceRequests // ignore: cast_nullable_to_non_nullable
              as PendingServiceRequest?,
    ));
  }

  @override
  $PendingServiceRequestCopyWith<$Res>? get pendingServiceRequests {
    if (_value.pendingServiceRequests == null) {
      return null;
    }

    return $PendingServiceRequestCopyWith<$Res>(_value.pendingServiceRequests!,
        (value) {
      return _then(_value.copyWith(pendingServiceRequests: value));
    });
  }
}

/// @nodoc
abstract class _$PendingServiceRequestsCountResponseCopyWith<$Res>
    implements $PendingServiceRequestsCountResponseCopyWith<$Res> {
  factory _$PendingServiceRequestsCountResponseCopyWith(
          _PendingServiceRequestsCountResponse value,
          $Res Function(_PendingServiceRequestsCountResponse) then) =
      __$PendingServiceRequestsCountResponseCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: 'getPendingServiceRequestsCount')
          PendingServiceRequest? pendingServiceRequests});

  @override
  $PendingServiceRequestCopyWith<$Res>? get pendingServiceRequests;
}

/// @nodoc
class __$PendingServiceRequestsCountResponseCopyWithImpl<$Res>
    extends _$PendingServiceRequestsCountResponseCopyWithImpl<$Res>
    implements _$PendingServiceRequestsCountResponseCopyWith<$Res> {
  __$PendingServiceRequestsCountResponseCopyWithImpl(
      _PendingServiceRequestsCountResponse _value,
      $Res Function(_PendingServiceRequestsCountResponse) _then)
      : super(_value, (v) => _then(v as _PendingServiceRequestsCountResponse));

  @override
  _PendingServiceRequestsCountResponse get _value =>
      super._value as _PendingServiceRequestsCountResponse;

  @override
  $Res call({
    Object? pendingServiceRequests = freezed,
  }) {
    return _then(_PendingServiceRequestsCountResponse(
      pendingServiceRequests: pendingServiceRequests == freezed
          ? _value.pendingServiceRequests
          : pendingServiceRequests // ignore: cast_nullable_to_non_nullable
              as PendingServiceRequest?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_PendingServiceRequestsCountResponse
    implements _PendingServiceRequestsCountResponse {
  _$_PendingServiceRequestsCountResponse(
      {@JsonKey(name: 'getPendingServiceRequestsCount')
          this.pendingServiceRequests});

  factory _$_PendingServiceRequestsCountResponse.fromJson(
          Map<String, dynamic> json) =>
      _$_$_PendingServiceRequestsCountResponseFromJson(json);

  @override
  @JsonKey(name: 'getPendingServiceRequestsCount')
  final PendingServiceRequest? pendingServiceRequests;

  @override
  String toString() {
    return 'PendingServiceRequestsCountResponse(pendingServiceRequests: $pendingServiceRequests)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _PendingServiceRequestsCountResponse &&
            (identical(other.pendingServiceRequests, pendingServiceRequests) ||
                const DeepCollectionEquality().equals(
                    other.pendingServiceRequests, pendingServiceRequests)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(pendingServiceRequests);

  @JsonKey(ignore: true)
  @override
  _$PendingServiceRequestsCountResponseCopyWith<
          _PendingServiceRequestsCountResponse>
      get copyWith => __$PendingServiceRequestsCountResponseCopyWithImpl<
          _PendingServiceRequestsCountResponse>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_PendingServiceRequestsCountResponseToJson(this);
  }
}

abstract class _PendingServiceRequestsCountResponse
    implements PendingServiceRequestsCountResponse {
  factory _PendingServiceRequestsCountResponse(
          {@JsonKey(name: 'getPendingServiceRequestsCount')
              PendingServiceRequest? pendingServiceRequests}) =
      _$_PendingServiceRequestsCountResponse;

  factory _PendingServiceRequestsCountResponse.fromJson(
          Map<String, dynamic> json) =
      _$_PendingServiceRequestsCountResponse.fromJson;

  @override
  @JsonKey(name: 'getPendingServiceRequestsCount')
  PendingServiceRequest? get pendingServiceRequests =>
      throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$PendingServiceRequestsCountResponseCopyWith<
          _PendingServiceRequestsCountResponse>
      get copyWith => throw _privateConstructorUsedError;
}
