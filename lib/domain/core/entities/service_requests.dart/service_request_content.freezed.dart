// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

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
      @JsonKey(name: 'ClientContact') String? clientPhoneNumber}) {
    return _ServiceRequestContent(
      description: description,
      clientName: clientName,
      clientPhoneNumber: clientPhoneNumber,
    );
  }

  ServiceRequestContent fromJson(Map<String, Object> json) {
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
      @JsonKey(name: 'ClientContact') String? clientPhoneNumber});
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
      @JsonKey(name: 'ClientContact') String? clientPhoneNumber});
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
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ServiceRequestContent implements _ServiceRequestContent {
  _$_ServiceRequestContent(
      {@JsonKey(name: 'Request') this.description,
      @JsonKey(name: 'ClientName') this.clientName,
      @JsonKey(name: 'ClientContact') this.clientPhoneNumber});

  factory _$_ServiceRequestContent.fromJson(Map<String, dynamic> json) =>
      _$_$_ServiceRequestContentFromJson(json);

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
  String toString() {
    return 'ServiceRequestContent(description: $description, clientName: $clientName, clientPhoneNumber: $clientPhoneNumber)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _ServiceRequestContent &&
            (identical(other.description, description) ||
                const DeepCollectionEquality()
                    .equals(other.description, description)) &&
            (identical(other.clientName, clientName) ||
                const DeepCollectionEquality()
                    .equals(other.clientName, clientName)) &&
            (identical(other.clientPhoneNumber, clientPhoneNumber) ||
                const DeepCollectionEquality()
                    .equals(other.clientPhoneNumber, clientPhoneNumber)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(description) ^
      const DeepCollectionEquality().hash(clientName) ^
      const DeepCollectionEquality().hash(clientPhoneNumber);

  @JsonKey(ignore: true)
  @override
  _$ServiceRequestContentCopyWith<_ServiceRequestContent> get copyWith =>
      __$ServiceRequestContentCopyWithImpl<_ServiceRequestContent>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_ServiceRequestContentToJson(this);
  }
}

abstract class _ServiceRequestContent implements ServiceRequestContent {
  factory _ServiceRequestContent(
          {@JsonKey(name: 'Request') String? description,
          @JsonKey(name: 'ClientName') String? clientName,
          @JsonKey(name: 'ClientContact') String? clientPhoneNumber}) =
      _$_ServiceRequestContent;

  factory _ServiceRequestContent.fromJson(Map<String, dynamic> json) =
      _$_ServiceRequestContent.fromJson;

  @override
  @JsonKey(name: 'Request')
  String? get description => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'ClientName')
  String? get clientName => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'ClientContact')
  String? get clientPhoneNumber => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$ServiceRequestContentCopyWith<_ServiceRequestContent> get copyWith =>
      throw _privateConstructorUsedError;
}
