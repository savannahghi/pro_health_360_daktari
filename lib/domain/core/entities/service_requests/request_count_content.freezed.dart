// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'request_count_content.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

RequestCountContent _$RequestCountContentFromJson(Map<String, dynamic> json) {
  return _RequestCountContent.fromJson(json);
}

/// @nodoc
class _$RequestCountContentTearOff {
  const _$RequestCountContentTearOff();

  _RequestCountContent call(
      {@JsonKey(name: 'requestType') ServiceRequestType? requestType,
      @JsonKey(name: 'total') int? count}) {
    return _RequestCountContent(
      requestType: requestType,
      count: count,
    );
  }

  RequestCountContent fromJson(Map<String, Object> json) {
    return RequestCountContent.fromJson(json);
  }
}

/// @nodoc
const $RequestCountContent = _$RequestCountContentTearOff();

/// @nodoc
mixin _$RequestCountContent {
  @JsonKey(name: 'requestType')
  ServiceRequestType? get requestType => throw _privateConstructorUsedError;
  @JsonKey(name: 'total')
  int? get count => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RequestCountContentCopyWith<RequestCountContent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RequestCountContentCopyWith<$Res> {
  factory $RequestCountContentCopyWith(
          RequestCountContent value, $Res Function(RequestCountContent) then) =
      _$RequestCountContentCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: 'requestType') ServiceRequestType? requestType,
      @JsonKey(name: 'total') int? count});
}

/// @nodoc
class _$RequestCountContentCopyWithImpl<$Res>
    implements $RequestCountContentCopyWith<$Res> {
  _$RequestCountContentCopyWithImpl(this._value, this._then);

  final RequestCountContent _value;
  // ignore: unused_field
  final $Res Function(RequestCountContent) _then;

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
abstract class _$RequestCountContentCopyWith<$Res>
    implements $RequestCountContentCopyWith<$Res> {
  factory _$RequestCountContentCopyWith(_RequestCountContent value,
          $Res Function(_RequestCountContent) then) =
      __$RequestCountContentCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: 'requestType') ServiceRequestType? requestType,
      @JsonKey(name: 'total') int? count});
}

/// @nodoc
class __$RequestCountContentCopyWithImpl<$Res>
    extends _$RequestCountContentCopyWithImpl<$Res>
    implements _$RequestCountContentCopyWith<$Res> {
  __$RequestCountContentCopyWithImpl(
      _RequestCountContent _value, $Res Function(_RequestCountContent) _then)
      : super(_value, (v) => _then(v as _RequestCountContent));

  @override
  _RequestCountContent get _value => super._value as _RequestCountContent;

  @override
  $Res call({
    Object? requestType = freezed,
    Object? count = freezed,
  }) {
    return _then(_RequestCountContent(
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
class _$_RequestCountContent implements _RequestCountContent {
  _$_RequestCountContent(
      {@JsonKey(name: 'requestType') this.requestType,
      @JsonKey(name: 'total') this.count});

  factory _$_RequestCountContent.fromJson(Map<String, dynamic> json) =>
      _$_$_RequestCountContentFromJson(json);

  @override
  @JsonKey(name: 'requestType')
  final ServiceRequestType? requestType;
  @override
  @JsonKey(name: 'total')
  final int? count;

  @override
  String toString() {
    return 'RequestCountContent(requestType: $requestType, count: $count)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _RequestCountContent &&
            (identical(other.requestType, requestType) ||
                const DeepCollectionEquality()
                    .equals(other.requestType, requestType)) &&
            (identical(other.count, count) ||
                const DeepCollectionEquality().equals(other.count, count)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(requestType) ^
      const DeepCollectionEquality().hash(count);

  @JsonKey(ignore: true)
  @override
  _$RequestCountContentCopyWith<_RequestCountContent> get copyWith =>
      __$RequestCountContentCopyWithImpl<_RequestCountContent>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_RequestCountContentToJson(this);
  }
}

abstract class _RequestCountContent implements RequestCountContent {
  factory _RequestCountContent(
      {@JsonKey(name: 'requestType') ServiceRequestType? requestType,
      @JsonKey(name: 'total') int? count}) = _$_RequestCountContent;

  factory _RequestCountContent.fromJson(Map<String, dynamic> json) =
      _$_RequestCountContent.fromJson;

  @override
  @JsonKey(name: 'requestType')
  ServiceRequestType? get requestType => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'total')
  int? get count => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$RequestCountContentCopyWith<_RequestCountContent> get copyWith =>
      throw _privateConstructorUsedError;
}
