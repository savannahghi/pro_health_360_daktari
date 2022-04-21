// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'notifications_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

NotificationsResponse _$NotificationsResponseFromJson(
    Map<String, dynamic> json) {
  return _NotificationsResponse.fromJson(json);
}

/// @nodoc
class _$NotificationsResponseTearOff {
  const _$NotificationsResponseTearOff();

  _NotificationsResponse call(
      {@JsonKey(name: 'fetchNotifications') required NotificationsData data}) {
    return _NotificationsResponse(
      data: data,
    );
  }

  NotificationsResponse fromJson(Map<String, Object?> json) {
    return NotificationsResponse.fromJson(json);
  }
}

/// @nodoc
const $NotificationsResponse = _$NotificationsResponseTearOff();

/// @nodoc
mixin _$NotificationsResponse {
  @JsonKey(name: 'fetchNotifications')
  NotificationsData get data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $NotificationsResponseCopyWith<NotificationsResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NotificationsResponseCopyWith<$Res> {
  factory $NotificationsResponseCopyWith(NotificationsResponse value,
          $Res Function(NotificationsResponse) then) =
      _$NotificationsResponseCopyWithImpl<$Res>;
  $Res call({@JsonKey(name: 'fetchNotifications') NotificationsData data});

  $NotificationsDataCopyWith<$Res> get data;
}

/// @nodoc
class _$NotificationsResponseCopyWithImpl<$Res>
    implements $NotificationsResponseCopyWith<$Res> {
  _$NotificationsResponseCopyWithImpl(this._value, this._then);

  final NotificationsResponse _value;
  // ignore: unused_field
  final $Res Function(NotificationsResponse) _then;

  @override
  $Res call({
    Object? data = freezed,
  }) {
    return _then(_value.copyWith(
      data: data == freezed
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as NotificationsData,
    ));
  }

  @override
  $NotificationsDataCopyWith<$Res> get data {
    return $NotificationsDataCopyWith<$Res>(_value.data, (value) {
      return _then(_value.copyWith(data: value));
    });
  }
}

/// @nodoc
abstract class _$NotificationsResponseCopyWith<$Res>
    implements $NotificationsResponseCopyWith<$Res> {
  factory _$NotificationsResponseCopyWith(_NotificationsResponse value,
          $Res Function(_NotificationsResponse) then) =
      __$NotificationsResponseCopyWithImpl<$Res>;
  @override
  $Res call({@JsonKey(name: 'fetchNotifications') NotificationsData data});

  @override
  $NotificationsDataCopyWith<$Res> get data;
}

/// @nodoc
class __$NotificationsResponseCopyWithImpl<$Res>
    extends _$NotificationsResponseCopyWithImpl<$Res>
    implements _$NotificationsResponseCopyWith<$Res> {
  __$NotificationsResponseCopyWithImpl(_NotificationsResponse _value,
      $Res Function(_NotificationsResponse) _then)
      : super(_value, (v) => _then(v as _NotificationsResponse));

  @override
  _NotificationsResponse get _value => super._value as _NotificationsResponse;

  @override
  $Res call({
    Object? data = freezed,
  }) {
    return _then(_NotificationsResponse(
      data: data == freezed
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as NotificationsData,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_NotificationsResponse implements _NotificationsResponse {
  _$_NotificationsResponse(
      {@JsonKey(name: 'fetchNotifications') required this.data});

  factory _$_NotificationsResponse.fromJson(Map<String, dynamic> json) =>
      _$$_NotificationsResponseFromJson(json);

  @override
  @JsonKey(name: 'fetchNotifications')
  final NotificationsData data;

  @override
  String toString() {
    return 'NotificationsResponse(data: $data)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _NotificationsResponse &&
            const DeepCollectionEquality().equals(other.data, data));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(data));

  @JsonKey(ignore: true)
  @override
  _$NotificationsResponseCopyWith<_NotificationsResponse> get copyWith =>
      __$NotificationsResponseCopyWithImpl<_NotificationsResponse>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_NotificationsResponseToJson(this);
  }
}

abstract class _NotificationsResponse implements NotificationsResponse {
  factory _NotificationsResponse(
      {@JsonKey(name: 'fetchNotifications')
          required NotificationsData data}) = _$_NotificationsResponse;

  factory _NotificationsResponse.fromJson(Map<String, dynamic> json) =
      _$_NotificationsResponse.fromJson;

  @override
  @JsonKey(name: 'fetchNotifications')
  NotificationsData get data;
  @override
  @JsonKey(ignore: true)
  _$NotificationsResponseCopyWith<_NotificationsResponse> get copyWith =>
      throw _privateConstructorUsedError;
}
