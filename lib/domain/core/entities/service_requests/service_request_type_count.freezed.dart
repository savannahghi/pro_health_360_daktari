// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'service_request_type_count.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ServiceRequestTypeCount _$ServiceRequestTypeCountFromJson(
    Map<String, dynamic> json) {
  return _ServiceRequestTypeCount.fromJson(json);
}

/// @nodoc
class _$ServiceRequestTypeCountTearOff {
  const _$ServiceRequestTypeCountTearOff();

  _ServiceRequestTypeCount call(
      {@JsonKey(name: 'requestsTypeCount')
          List<ServiceRequestCount>? requestsTypeCount}) {
    return _ServiceRequestTypeCount(
      requestsTypeCount: requestsTypeCount,
    );
  }

  ServiceRequestTypeCount fromJson(Map<String, Object?> json) {
    return ServiceRequestTypeCount.fromJson(json);
  }
}

/// @nodoc
const $ServiceRequestTypeCount = _$ServiceRequestTypeCountTearOff();

/// @nodoc
mixin _$ServiceRequestTypeCount {
  @JsonKey(name: 'requestsTypeCount')
  List<ServiceRequestCount>? get requestsTypeCount =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ServiceRequestTypeCountCopyWith<ServiceRequestTypeCount> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ServiceRequestTypeCountCopyWith<$Res> {
  factory $ServiceRequestTypeCountCopyWith(ServiceRequestTypeCount value,
          $Res Function(ServiceRequestTypeCount) then) =
      _$ServiceRequestTypeCountCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: 'requestsTypeCount')
          List<ServiceRequestCount>? requestsTypeCount});
}

/// @nodoc
class _$ServiceRequestTypeCountCopyWithImpl<$Res>
    implements $ServiceRequestTypeCountCopyWith<$Res> {
  _$ServiceRequestTypeCountCopyWithImpl(this._value, this._then);

  final ServiceRequestTypeCount _value;
  // ignore: unused_field
  final $Res Function(ServiceRequestTypeCount) _then;

  @override
  $Res call({
    Object? requestsTypeCount = freezed,
  }) {
    return _then(_value.copyWith(
      requestsTypeCount: requestsTypeCount == freezed
          ? _value.requestsTypeCount
          : requestsTypeCount // ignore: cast_nullable_to_non_nullable
              as List<ServiceRequestCount>?,
    ));
  }
}

/// @nodoc
abstract class _$ServiceRequestTypeCountCopyWith<$Res>
    implements $ServiceRequestTypeCountCopyWith<$Res> {
  factory _$ServiceRequestTypeCountCopyWith(_ServiceRequestTypeCount value,
          $Res Function(_ServiceRequestTypeCount) then) =
      __$ServiceRequestTypeCountCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: 'requestsTypeCount')
          List<ServiceRequestCount>? requestsTypeCount});
}

/// @nodoc
class __$ServiceRequestTypeCountCopyWithImpl<$Res>
    extends _$ServiceRequestTypeCountCopyWithImpl<$Res>
    implements _$ServiceRequestTypeCountCopyWith<$Res> {
  __$ServiceRequestTypeCountCopyWithImpl(_ServiceRequestTypeCount _value,
      $Res Function(_ServiceRequestTypeCount) _then)
      : super(_value, (v) => _then(v as _ServiceRequestTypeCount));

  @override
  _ServiceRequestTypeCount get _value =>
      super._value as _ServiceRequestTypeCount;

  @override
  $Res call({
    Object? requestsTypeCount = freezed,
  }) {
    return _then(_ServiceRequestTypeCount(
      requestsTypeCount: requestsTypeCount == freezed
          ? _value.requestsTypeCount
          : requestsTypeCount // ignore: cast_nullable_to_non_nullable
              as List<ServiceRequestCount>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ServiceRequestTypeCount implements _ServiceRequestTypeCount {
  _$_ServiceRequestTypeCount(
      {@JsonKey(name: 'requestsTypeCount') this.requestsTypeCount});

  factory _$_ServiceRequestTypeCount.fromJson(Map<String, dynamic> json) =>
      _$$_ServiceRequestTypeCountFromJson(json);

  @override
  @JsonKey(name: 'requestsTypeCount')
  final List<ServiceRequestCount>? requestsTypeCount;

  @override
  String toString() {
    return 'ServiceRequestTypeCount(requestsTypeCount: $requestsTypeCount)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ServiceRequestTypeCount &&
            const DeepCollectionEquality()
                .equals(other.requestsTypeCount, requestsTypeCount));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(requestsTypeCount));

  @JsonKey(ignore: true)
  @override
  _$ServiceRequestTypeCountCopyWith<_ServiceRequestTypeCount> get copyWith =>
      __$ServiceRequestTypeCountCopyWithImpl<_ServiceRequestTypeCount>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ServiceRequestTypeCountToJson(this);
  }
}

abstract class _ServiceRequestTypeCount implements ServiceRequestTypeCount {
  factory _ServiceRequestTypeCount(
          {@JsonKey(name: 'requestsTypeCount')
              List<ServiceRequestCount>? requestsTypeCount}) =
      _$_ServiceRequestTypeCount;

  factory _ServiceRequestTypeCount.fromJson(Map<String, dynamic> json) =
      _$_ServiceRequestTypeCount.fromJson;

  @override
  @JsonKey(name: 'requestsTypeCount')
  List<ServiceRequestCount>? get requestsTypeCount;
  @override
  @JsonKey(ignore: true)
  _$ServiceRequestTypeCountCopyWith<_ServiceRequestTypeCount> get copyWith =>
      throw _privateConstructorUsedError;
}
