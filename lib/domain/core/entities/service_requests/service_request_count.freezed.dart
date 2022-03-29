// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'service_request_count.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ServiceRequestCount _$ServiceRequestCountFromJson(Map<String, dynamic> json) {
  return _ServiceRequestCount.fromJson(json);
}

/// @nodoc
class _$ServiceRequestCountTearOff {
  const _$ServiceRequestCountTearOff();

  _ServiceRequestCount call(
      {@JsonKey(name: 'requestType') ServiceRequestType? requestType,
      @JsonKey(name: 'total') int? count}) {
    return _ServiceRequestCount(
      requestType: requestType,
      count: count,
    );
  }

  ServiceRequestCount fromJson(Map<String, Object?> json) {
    return ServiceRequestCount.fromJson(json);
  }
}

/// @nodoc
const $ServiceRequestCount = _$ServiceRequestCountTearOff();

/// @nodoc
mixin _$ServiceRequestCount {
  @JsonKey(name: 'requestType')
  ServiceRequestType? get requestType => throw _privateConstructorUsedError;
  @JsonKey(name: 'total')
  int? get count => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ServiceRequestCountCopyWith<ServiceRequestCount> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ServiceRequestCountCopyWith<$Res> {
  factory $ServiceRequestCountCopyWith(
          ServiceRequestCount value, $Res Function(ServiceRequestCount) then) =
      _$ServiceRequestCountCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: 'requestType') ServiceRequestType? requestType,
      @JsonKey(name: 'total') int? count});
}

/// @nodoc
class _$ServiceRequestCountCopyWithImpl<$Res>
    implements $ServiceRequestCountCopyWith<$Res> {
  _$ServiceRequestCountCopyWithImpl(this._value, this._then);

  final ServiceRequestCount _value;
  // ignore: unused_field
  final $Res Function(ServiceRequestCount) _then;

  @override
  $Res call({
    Object? requestType = freezed,
    Object? count = freezed,
  }) {
    return _then(_value.copyWith(
      requestType: requestType == freezed
          ? _value.requestType
          : requestType // ignore: cast_nullable_to_non_nullable
              as ServiceRequestType?,
      count: count == freezed
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
abstract class _$ServiceRequestCountCopyWith<$Res>
    implements $ServiceRequestCountCopyWith<$Res> {
  factory _$ServiceRequestCountCopyWith(_ServiceRequestCount value,
          $Res Function(_ServiceRequestCount) then) =
      __$ServiceRequestCountCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: 'requestType') ServiceRequestType? requestType,
      @JsonKey(name: 'total') int? count});
}

/// @nodoc
class __$ServiceRequestCountCopyWithImpl<$Res>
    extends _$ServiceRequestCountCopyWithImpl<$Res>
    implements _$ServiceRequestCountCopyWith<$Res> {
  __$ServiceRequestCountCopyWithImpl(
      _ServiceRequestCount _value, $Res Function(_ServiceRequestCount) _then)
      : super(_value, (v) => _then(v as _ServiceRequestCount));

  @override
  _ServiceRequestCount get _value => super._value as _ServiceRequestCount;

  @override
  $Res call({
    Object? requestType = freezed,
    Object? count = freezed,
  }) {
    return _then(_ServiceRequestCount(
      requestType: requestType == freezed
          ? _value.requestType
          : requestType // ignore: cast_nullable_to_non_nullable
              as ServiceRequestType?,
      count: count == freezed
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ServiceRequestCount implements _ServiceRequestCount {
  _$_ServiceRequestCount(
      {@JsonKey(name: 'requestType') this.requestType,
      @JsonKey(name: 'total') this.count});

  factory _$_ServiceRequestCount.fromJson(Map<String, dynamic> json) =>
      _$$_ServiceRequestCountFromJson(json);

  @override
  @JsonKey(name: 'requestType')
  final ServiceRequestType? requestType;
  @override
  @JsonKey(name: 'total')
  final int? count;

  @override
  String toString() {
    return 'ServiceRequestCount(requestType: $requestType, count: $count)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ServiceRequestCount &&
            const DeepCollectionEquality()
                .equals(other.requestType, requestType) &&
            const DeepCollectionEquality().equals(other.count, count));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(requestType),
      const DeepCollectionEquality().hash(count));

  @JsonKey(ignore: true)
  @override
  _$ServiceRequestCountCopyWith<_ServiceRequestCount> get copyWith =>
      __$ServiceRequestCountCopyWithImpl<_ServiceRequestCount>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ServiceRequestCountToJson(this);
  }
}

abstract class _ServiceRequestCount implements ServiceRequestCount {
  factory _ServiceRequestCount(
      {@JsonKey(name: 'requestType') ServiceRequestType? requestType,
      @JsonKey(name: 'total') int? count}) = _$_ServiceRequestCount;

  factory _ServiceRequestCount.fromJson(Map<String, dynamic> json) =
      _$_ServiceRequestCount.fromJson;

  @override
  @JsonKey(name: 'requestType')
  ServiceRequestType? get requestType;
  @override
  @JsonKey(name: 'total')
  int? get count;
  @override
  @JsonKey(ignore: true)
  _$ServiceRequestCountCopyWith<_ServiceRequestCount> get copyWith =>
      throw _privateConstructorUsedError;
}
