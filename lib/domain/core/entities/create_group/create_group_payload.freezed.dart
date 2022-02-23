// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'create_group_payload.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

CreateGroupPayload _$CreateGroupPayloadFromJson(Map<String, dynamic> json) {
  return _CreateGroupPayload.fromJson(json);
}

/// @nodoc
class _$CreateGroupPayloadTearOff {
  const _$CreateGroupPayloadTearOff();

  _CreateGroupPayload call(
      {String? name,
      String? description,
      AgeRange? ageRange,
      List<Gender>? gender,
      List<ClientType>? clientType,
      bool? inviteOnly}) {
    return _CreateGroupPayload(
      name: name,
      description: description,
      ageRange: ageRange,
      gender: gender,
      clientType: clientType,
      inviteOnly: inviteOnly,
    );
  }

  CreateGroupPayload fromJson(Map<String, Object> json) {
    return CreateGroupPayload.fromJson(json);
  }
}

/// @nodoc
const $CreateGroupPayload = _$CreateGroupPayloadTearOff();

/// @nodoc
mixin _$CreateGroupPayload {
  String? get name => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  AgeRange? get ageRange => throw _privateConstructorUsedError;
  List<Gender>? get gender => throw _privateConstructorUsedError;
  List<ClientType>? get clientType => throw _privateConstructorUsedError;
  bool? get inviteOnly => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CreateGroupPayloadCopyWith<CreateGroupPayload> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CreateGroupPayloadCopyWith<$Res> {
  factory $CreateGroupPayloadCopyWith(
          CreateGroupPayload value, $Res Function(CreateGroupPayload) then) =
      _$CreateGroupPayloadCopyWithImpl<$Res>;
  $Res call(
      {String? name,
      String? description,
      AgeRange? ageRange,
      List<Gender>? gender,
      List<ClientType>? clientType,
      bool? inviteOnly});

  $AgeRangeCopyWith<$Res>? get ageRange;
}

/// @nodoc
class _$CreateGroupPayloadCopyWithImpl<$Res>
    implements $CreateGroupPayloadCopyWith<$Res> {
  _$CreateGroupPayloadCopyWithImpl(this._value, this._then);

  final CreateGroupPayload _value;
  // ignore: unused_field
  final $Res Function(CreateGroupPayload) _then;

  @override
  $Res call({
    Object? name = freezed,
    Object? description = freezed,
    Object? ageRange = freezed,
    Object? gender = freezed,
    Object? clientType = freezed,
    Object? inviteOnly = freezed,
  }) {
    return _then(_value.copyWith(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      ageRange: ageRange == freezed
          ? _value.ageRange
          : ageRange // ignore: cast_nullable_to_non_nullable
              as AgeRange?,
      gender: gender == freezed
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as List<Gender>?,
      clientType: clientType == freezed
          ? _value.clientType
          : clientType // ignore: cast_nullable_to_non_nullable
              as List<ClientType>?,
      inviteOnly: inviteOnly == freezed
          ? _value.inviteOnly
          : inviteOnly // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }

  @override
  $AgeRangeCopyWith<$Res>? get ageRange {
    if (_value.ageRange == null) {
      return null;
    }

    return $AgeRangeCopyWith<$Res>(_value.ageRange!, (value) {
      return _then(_value.copyWith(ageRange: value));
    });
  }
}

/// @nodoc
abstract class _$CreateGroupPayloadCopyWith<$Res>
    implements $CreateGroupPayloadCopyWith<$Res> {
  factory _$CreateGroupPayloadCopyWith(
          _CreateGroupPayload value, $Res Function(_CreateGroupPayload) then) =
      __$CreateGroupPayloadCopyWithImpl<$Res>;
  @override
  $Res call(
      {String? name,
      String? description,
      AgeRange? ageRange,
      List<Gender>? gender,
      List<ClientType>? clientType,
      bool? inviteOnly});

  @override
  $AgeRangeCopyWith<$Res>? get ageRange;
}

/// @nodoc
class __$CreateGroupPayloadCopyWithImpl<$Res>
    extends _$CreateGroupPayloadCopyWithImpl<$Res>
    implements _$CreateGroupPayloadCopyWith<$Res> {
  __$CreateGroupPayloadCopyWithImpl(
      _CreateGroupPayload _value, $Res Function(_CreateGroupPayload) _then)
      : super(_value, (v) => _then(v as _CreateGroupPayload));

  @override
  _CreateGroupPayload get _value => super._value as _CreateGroupPayload;

  @override
  $Res call({
    Object? name = freezed,
    Object? description = freezed,
    Object? ageRange = freezed,
    Object? gender = freezed,
    Object? clientType = freezed,
    Object? inviteOnly = freezed,
  }) {
    return _then(_CreateGroupPayload(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      ageRange: ageRange == freezed
          ? _value.ageRange
          : ageRange // ignore: cast_nullable_to_non_nullable
              as AgeRange?,
      gender: gender == freezed
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as List<Gender>?,
      clientType: clientType == freezed
          ? _value.clientType
          : clientType // ignore: cast_nullable_to_non_nullable
              as List<ClientType>?,
      inviteOnly: inviteOnly == freezed
          ? _value.inviteOnly
          : inviteOnly // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$_CreateGroupPayload implements _CreateGroupPayload {
  _$_CreateGroupPayload(
      {this.name,
      this.description,
      this.ageRange,
      this.gender,
      this.clientType,
      this.inviteOnly});

  factory _$_CreateGroupPayload.fromJson(Map<String, dynamic> json) =>
      _$_$_CreateGroupPayloadFromJson(json);

  @override
  final String? name;
  @override
  final String? description;
  @override
  final AgeRange? ageRange;
  @override
  final List<Gender>? gender;
  @override
  final List<ClientType>? clientType;
  @override
  final bool? inviteOnly;

  @override
  String toString() {
    return 'CreateGroupPayload(name: $name, description: $description, ageRange: $ageRange, gender: $gender, clientType: $clientType, inviteOnly: $inviteOnly)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _CreateGroupPayload &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.description, description) ||
                const DeepCollectionEquality()
                    .equals(other.description, description)) &&
            (identical(other.ageRange, ageRange) ||
                const DeepCollectionEquality()
                    .equals(other.ageRange, ageRange)) &&
            (identical(other.gender, gender) ||
                const DeepCollectionEquality().equals(other.gender, gender)) &&
            (identical(other.clientType, clientType) ||
                const DeepCollectionEquality()
                    .equals(other.clientType, clientType)) &&
            (identical(other.inviteOnly, inviteOnly) ||
                const DeepCollectionEquality()
                    .equals(other.inviteOnly, inviteOnly)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(description) ^
      const DeepCollectionEquality().hash(ageRange) ^
      const DeepCollectionEquality().hash(gender) ^
      const DeepCollectionEquality().hash(clientType) ^
      const DeepCollectionEquality().hash(inviteOnly);

  @JsonKey(ignore: true)
  @override
  _$CreateGroupPayloadCopyWith<_CreateGroupPayload> get copyWith =>
      __$CreateGroupPayloadCopyWithImpl<_CreateGroupPayload>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_CreateGroupPayloadToJson(this);
  }
}

abstract class _CreateGroupPayload implements CreateGroupPayload {
  factory _CreateGroupPayload(
      {String? name,
      String? description,
      AgeRange? ageRange,
      List<Gender>? gender,
      List<ClientType>? clientType,
      bool? inviteOnly}) = _$_CreateGroupPayload;

  factory _CreateGroupPayload.fromJson(Map<String, dynamic> json) =
      _$_CreateGroupPayload.fromJson;

  @override
  String? get name => throw _privateConstructorUsedError;
  @override
  String? get description => throw _privateConstructorUsedError;
  @override
  AgeRange? get ageRange => throw _privateConstructorUsedError;
  @override
  List<Gender>? get gender => throw _privateConstructorUsedError;
  @override
  List<ClientType>? get clientType => throw _privateConstructorUsedError;
  @override
  bool? get inviteOnly => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$CreateGroupPayloadCopyWith<_CreateGroupPayload> get copyWith =>
      throw _privateConstructorUsedError;
}
