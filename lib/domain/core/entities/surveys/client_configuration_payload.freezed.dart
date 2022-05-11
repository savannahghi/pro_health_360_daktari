// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'client_configuration_payload.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ClientConfigurationPayload _$ClientConfigurationPayloadFromJson(
    Map<String, dynamic> json) {
  return _ClientConfigurationPayload.fromJson(json);
}

/// @nodoc
class _$ClientConfigurationPayloadTearOff {
  const _$ClientConfigurationPayloadTearOff();

  _ClientConfigurationPayload call(
      {@JsonKey(name: 'clientTypes') List<ClientType>? clientTypes,
      @JsonKey(name: 'ageGroups') List<String>? ageGroups,
      @JsonKey(name: 'gender') List<Gender>? gender}) {
    return _ClientConfigurationPayload(
      clientTypes: clientTypes,
      ageGroups: ageGroups,
      gender: gender,
    );
  }

  ClientConfigurationPayload fromJson(Map<String, Object?> json) {
    return ClientConfigurationPayload.fromJson(json);
  }
}

/// @nodoc
const $ClientConfigurationPayload = _$ClientConfigurationPayloadTearOff();

/// @nodoc
mixin _$ClientConfigurationPayload {
  @JsonKey(name: 'clientTypes')
  List<ClientType>? get clientTypes => throw _privateConstructorUsedError;
  @JsonKey(name: 'ageGroups')
  List<String>? get ageGroups => throw _privateConstructorUsedError;
  @JsonKey(name: 'gender')
  List<Gender>? get gender => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ClientConfigurationPayloadCopyWith<ClientConfigurationPayload>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ClientConfigurationPayloadCopyWith<$Res> {
  factory $ClientConfigurationPayloadCopyWith(ClientConfigurationPayload value,
          $Res Function(ClientConfigurationPayload) then) =
      _$ClientConfigurationPayloadCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: 'clientTypes') List<ClientType>? clientTypes,
      @JsonKey(name: 'ageGroups') List<String>? ageGroups,
      @JsonKey(name: 'gender') List<Gender>? gender});
}

/// @nodoc
class _$ClientConfigurationPayloadCopyWithImpl<$Res>
    implements $ClientConfigurationPayloadCopyWith<$Res> {
  _$ClientConfigurationPayloadCopyWithImpl(this._value, this._then);

  final ClientConfigurationPayload _value;
  // ignore: unused_field
  final $Res Function(ClientConfigurationPayload) _then;

  @override
  $Res call({
    Object? clientTypes = freezed,
    Object? ageGroups = freezed,
    Object? gender = freezed,
  }) {
    return _then(_value.copyWith(
      clientTypes: clientTypes == freezed
          ? _value.clientTypes
          : clientTypes // ignore: cast_nullable_to_non_nullable
              as List<ClientType>?,
      ageGroups: ageGroups == freezed
          ? _value.ageGroups
          : ageGroups // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      gender: gender == freezed
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as List<Gender>?,
    ));
  }
}

/// @nodoc
abstract class _$ClientConfigurationPayloadCopyWith<$Res>
    implements $ClientConfigurationPayloadCopyWith<$Res> {
  factory _$ClientConfigurationPayloadCopyWith(
          _ClientConfigurationPayload value,
          $Res Function(_ClientConfigurationPayload) then) =
      __$ClientConfigurationPayloadCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: 'clientTypes') List<ClientType>? clientTypes,
      @JsonKey(name: 'ageGroups') List<String>? ageGroups,
      @JsonKey(name: 'gender') List<Gender>? gender});
}

/// @nodoc
class __$ClientConfigurationPayloadCopyWithImpl<$Res>
    extends _$ClientConfigurationPayloadCopyWithImpl<$Res>
    implements _$ClientConfigurationPayloadCopyWith<$Res> {
  __$ClientConfigurationPayloadCopyWithImpl(_ClientConfigurationPayload _value,
      $Res Function(_ClientConfigurationPayload) _then)
      : super(_value, (v) => _then(v as _ClientConfigurationPayload));

  @override
  _ClientConfigurationPayload get _value =>
      super._value as _ClientConfigurationPayload;

  @override
  $Res call({
    Object? clientTypes = freezed,
    Object? ageGroups = freezed,
    Object? gender = freezed,
  }) {
    return _then(_ClientConfigurationPayload(
      clientTypes: clientTypes == freezed
          ? _value.clientTypes
          : clientTypes // ignore: cast_nullable_to_non_nullable
              as List<ClientType>?,
      ageGroups: ageGroups == freezed
          ? _value.ageGroups
          : ageGroups // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      gender: gender == freezed
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as List<Gender>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ClientConfigurationPayload implements _ClientConfigurationPayload {
  _$_ClientConfigurationPayload(
      {@JsonKey(name: 'clientTypes') this.clientTypes,
      @JsonKey(name: 'ageGroups') this.ageGroups,
      @JsonKey(name: 'gender') this.gender});

  factory _$_ClientConfigurationPayload.fromJson(Map<String, dynamic> json) =>
      _$$_ClientConfigurationPayloadFromJson(json);

  @override
  @JsonKey(name: 'clientTypes')
  final List<ClientType>? clientTypes;
  @override
  @JsonKey(name: 'ageGroups')
  final List<String>? ageGroups;
  @override
  @JsonKey(name: 'gender')
  final List<Gender>? gender;

  @override
  String toString() {
    return 'ClientConfigurationPayload(clientTypes: $clientTypes, ageGroups: $ageGroups, gender: $gender)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ClientConfigurationPayload &&
            const DeepCollectionEquality()
                .equals(other.clientTypes, clientTypes) &&
            const DeepCollectionEquality().equals(other.ageGroups, ageGroups) &&
            const DeepCollectionEquality().equals(other.gender, gender));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(clientTypes),
      const DeepCollectionEquality().hash(ageGroups),
      const DeepCollectionEquality().hash(gender));

  @JsonKey(ignore: true)
  @override
  _$ClientConfigurationPayloadCopyWith<_ClientConfigurationPayload>
      get copyWith => __$ClientConfigurationPayloadCopyWithImpl<
          _ClientConfigurationPayload>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ClientConfigurationPayloadToJson(this);
  }
}

abstract class _ClientConfigurationPayload
    implements ClientConfigurationPayload {
  factory _ClientConfigurationPayload(
          {@JsonKey(name: 'clientTypes') List<ClientType>? clientTypes,
          @JsonKey(name: 'ageGroups') List<String>? ageGroups,
          @JsonKey(name: 'gender') List<Gender>? gender}) =
      _$_ClientConfigurationPayload;

  factory _ClientConfigurationPayload.fromJson(Map<String, dynamic> json) =
      _$_ClientConfigurationPayload.fromJson;

  @override
  @JsonKey(name: 'clientTypes')
  List<ClientType>? get clientTypes;
  @override
  @JsonKey(name: 'ageGroups')
  List<String>? get ageGroups;
  @override
  @JsonKey(name: 'gender')
  List<Gender>? get gender;
  @override
  @JsonKey(ignore: true)
  _$ClientConfigurationPayloadCopyWith<_ClientConfigurationPayload>
      get copyWith => throw _privateConstructorUsedError;
}
