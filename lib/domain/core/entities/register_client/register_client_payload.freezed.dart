// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'register_client_payload.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

RegisterClientPayload _$RegisterClientPayloadFromJson(
    Map<String, dynamic> json) {
  return _RegisterClientPayload.fromJson(json);
}

/// @nodoc
class _$RegisterClientPayloadTearOff {
  const _$RegisterClientPayloadTearOff();

  _RegisterClientPayload call(
      {@JsonKey(name: 'facility')
          String? facility,
      @JsonKey(name: 'clientType')
          ClientType? clientType,
      @JsonKey(name: 'clientName')
          String? clientName,
      @JsonKey(name: 'gender', fromJson: genderFromJson)
          Gender? gender,
      @JsonKey(name: 'dateOfBirth', toJson: dobToJson)
          DateTime? dateOfBirth,
      @JsonKey(name: 'phoneNumber')
          String? phoneNumber,
      @JsonKey(name: 'enrollmentDate', toJson: dobToJson)
          DateTime? enrollmentDate,
      @JsonKey(name: 'cccNumber')
          String? cccNumber,
      @JsonKey(name: 'counselled')
          bool? counselled,
      @JsonKey(name: 'inviteClient')
          bool? inviteClient}) {
    return _RegisterClientPayload(
      facility: facility,
      clientType: clientType,
      clientName: clientName,
      gender: gender,
      dateOfBirth: dateOfBirth,
      phoneNumber: phoneNumber,
      enrollmentDate: enrollmentDate,
      cccNumber: cccNumber,
      counselled: counselled,
      inviteClient: inviteClient,
    );
  }

  RegisterClientPayload fromJson(Map<String, Object?> json) {
    return RegisterClientPayload.fromJson(json);
  }
}

/// @nodoc
const $RegisterClientPayload = _$RegisterClientPayloadTearOff();

/// @nodoc
mixin _$RegisterClientPayload {
  @JsonKey(name: 'facility')
  String? get facility => throw _privateConstructorUsedError;
  @JsonKey(name: 'clientType')
  ClientType? get clientType => throw _privateConstructorUsedError;
  @JsonKey(name: 'clientName')
  String? get clientName => throw _privateConstructorUsedError;
  @JsonKey(name: 'gender', fromJson: genderFromJson)
  Gender? get gender => throw _privateConstructorUsedError;
  @JsonKey(name: 'dateOfBirth', toJson: dobToJson)
  DateTime? get dateOfBirth => throw _privateConstructorUsedError;
  @JsonKey(name: 'phoneNumber')
  String? get phoneNumber => throw _privateConstructorUsedError;
  @JsonKey(name: 'enrollmentDate', toJson: dobToJson)
  DateTime? get enrollmentDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'cccNumber')
  String? get cccNumber => throw _privateConstructorUsedError;
  @JsonKey(name: 'counselled')
  bool? get counselled => throw _privateConstructorUsedError;
  @JsonKey(name: 'inviteClient')
  bool? get inviteClient => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RegisterClientPayloadCopyWith<RegisterClientPayload> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RegisterClientPayloadCopyWith<$Res> {
  factory $RegisterClientPayloadCopyWith(RegisterClientPayload value,
          $Res Function(RegisterClientPayload) then) =
      _$RegisterClientPayloadCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: 'facility')
          String? facility,
      @JsonKey(name: 'clientType')
          ClientType? clientType,
      @JsonKey(name: 'clientName')
          String? clientName,
      @JsonKey(name: 'gender', fromJson: genderFromJson)
          Gender? gender,
      @JsonKey(name: 'dateOfBirth', toJson: dobToJson)
          DateTime? dateOfBirth,
      @JsonKey(name: 'phoneNumber')
          String? phoneNumber,
      @JsonKey(name: 'enrollmentDate', toJson: dobToJson)
          DateTime? enrollmentDate,
      @JsonKey(name: 'cccNumber')
          String? cccNumber,
      @JsonKey(name: 'counselled')
          bool? counselled,
      @JsonKey(name: 'inviteClient')
          bool? inviteClient});
}

/// @nodoc
class _$RegisterClientPayloadCopyWithImpl<$Res>
    implements $RegisterClientPayloadCopyWith<$Res> {
  _$RegisterClientPayloadCopyWithImpl(this._value, this._then);

  final RegisterClientPayload _value;
  // ignore: unused_field
  final $Res Function(RegisterClientPayload) _then;

  @override
  $Res call({
    Object? facility = freezed,
    Object? clientType = freezed,
    Object? clientName = freezed,
    Object? gender = freezed,
    Object? dateOfBirth = freezed,
    Object? phoneNumber = freezed,
    Object? enrollmentDate = freezed,
    Object? cccNumber = freezed,
    Object? counselled = freezed,
    Object? inviteClient = freezed,
  }) {
    return _then(_value.copyWith(
      facility: facility == freezed
          ? _value.facility
          : facility // ignore: cast_nullable_to_non_nullable
              as String?,
      clientType: clientType == freezed
          ? _value.clientType
          : clientType // ignore: cast_nullable_to_non_nullable
              as ClientType?,
      clientName: clientName == freezed
          ? _value.clientName
          : clientName // ignore: cast_nullable_to_non_nullable
              as String?,
      gender: gender == freezed
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as Gender?,
      dateOfBirth: dateOfBirth == freezed
          ? _value.dateOfBirth
          : dateOfBirth // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      phoneNumber: phoneNumber == freezed
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      enrollmentDate: enrollmentDate == freezed
          ? _value.enrollmentDate
          : enrollmentDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      cccNumber: cccNumber == freezed
          ? _value.cccNumber
          : cccNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      counselled: counselled == freezed
          ? _value.counselled
          : counselled // ignore: cast_nullable_to_non_nullable
              as bool?,
      inviteClient: inviteClient == freezed
          ? _value.inviteClient
          : inviteClient // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
abstract class _$RegisterClientPayloadCopyWith<$Res>
    implements $RegisterClientPayloadCopyWith<$Res> {
  factory _$RegisterClientPayloadCopyWith(_RegisterClientPayload value,
          $Res Function(_RegisterClientPayload) then) =
      __$RegisterClientPayloadCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: 'facility')
          String? facility,
      @JsonKey(name: 'clientType')
          ClientType? clientType,
      @JsonKey(name: 'clientName')
          String? clientName,
      @JsonKey(name: 'gender', fromJson: genderFromJson)
          Gender? gender,
      @JsonKey(name: 'dateOfBirth', toJson: dobToJson)
          DateTime? dateOfBirth,
      @JsonKey(name: 'phoneNumber')
          String? phoneNumber,
      @JsonKey(name: 'enrollmentDate', toJson: dobToJson)
          DateTime? enrollmentDate,
      @JsonKey(name: 'cccNumber')
          String? cccNumber,
      @JsonKey(name: 'counselled')
          bool? counselled,
      @JsonKey(name: 'inviteClient')
          bool? inviteClient});
}

/// @nodoc
class __$RegisterClientPayloadCopyWithImpl<$Res>
    extends _$RegisterClientPayloadCopyWithImpl<$Res>
    implements _$RegisterClientPayloadCopyWith<$Res> {
  __$RegisterClientPayloadCopyWithImpl(_RegisterClientPayload _value,
      $Res Function(_RegisterClientPayload) _then)
      : super(_value, (v) => _then(v as _RegisterClientPayload));

  @override
  _RegisterClientPayload get _value => super._value as _RegisterClientPayload;

  @override
  $Res call({
    Object? facility = freezed,
    Object? clientType = freezed,
    Object? clientName = freezed,
    Object? gender = freezed,
    Object? dateOfBirth = freezed,
    Object? phoneNumber = freezed,
    Object? enrollmentDate = freezed,
    Object? cccNumber = freezed,
    Object? counselled = freezed,
    Object? inviteClient = freezed,
  }) {
    return _then(_RegisterClientPayload(
      facility: facility == freezed
          ? _value.facility
          : facility // ignore: cast_nullable_to_non_nullable
              as String?,
      clientType: clientType == freezed
          ? _value.clientType
          : clientType // ignore: cast_nullable_to_non_nullable
              as ClientType?,
      clientName: clientName == freezed
          ? _value.clientName
          : clientName // ignore: cast_nullable_to_non_nullable
              as String?,
      gender: gender == freezed
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as Gender?,
      dateOfBirth: dateOfBirth == freezed
          ? _value.dateOfBirth
          : dateOfBirth // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      phoneNumber: phoneNumber == freezed
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      enrollmentDate: enrollmentDate == freezed
          ? _value.enrollmentDate
          : enrollmentDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      cccNumber: cccNumber == freezed
          ? _value.cccNumber
          : cccNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      counselled: counselled == freezed
          ? _value.counselled
          : counselled // ignore: cast_nullable_to_non_nullable
              as bool?,
      inviteClient: inviteClient == freezed
          ? _value.inviteClient
          : inviteClient // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_RegisterClientPayload implements _RegisterClientPayload {
  _$_RegisterClientPayload(
      {@JsonKey(name: 'facility') this.facility,
      @JsonKey(name: 'clientType') this.clientType,
      @JsonKey(name: 'clientName') this.clientName,
      @JsonKey(name: 'gender', fromJson: genderFromJson) this.gender,
      @JsonKey(name: 'dateOfBirth', toJson: dobToJson) this.dateOfBirth,
      @JsonKey(name: 'phoneNumber') this.phoneNumber,
      @JsonKey(name: 'enrollmentDate', toJson: dobToJson) this.enrollmentDate,
      @JsonKey(name: 'cccNumber') this.cccNumber,
      @JsonKey(name: 'counselled') this.counselled,
      @JsonKey(name: 'inviteClient') this.inviteClient});

  factory _$_RegisterClientPayload.fromJson(Map<String, dynamic> json) =>
      _$$_RegisterClientPayloadFromJson(json);

  @override
  @JsonKey(name: 'facility')
  final String? facility;
  @override
  @JsonKey(name: 'clientType')
  final ClientType? clientType;
  @override
  @JsonKey(name: 'clientName')
  final String? clientName;
  @override
  @JsonKey(name: 'gender', fromJson: genderFromJson)
  final Gender? gender;
  @override
  @JsonKey(name: 'dateOfBirth', toJson: dobToJson)
  final DateTime? dateOfBirth;
  @override
  @JsonKey(name: 'phoneNumber')
  final String? phoneNumber;
  @override
  @JsonKey(name: 'enrollmentDate', toJson: dobToJson)
  final DateTime? enrollmentDate;
  @override
  @JsonKey(name: 'cccNumber')
  final String? cccNumber;
  @override
  @JsonKey(name: 'counselled')
  final bool? counselled;
  @override
  @JsonKey(name: 'inviteClient')
  final bool? inviteClient;

  @override
  String toString() {
    return 'RegisterClientPayload(facility: $facility, clientType: $clientType, clientName: $clientName, gender: $gender, dateOfBirth: $dateOfBirth, phoneNumber: $phoneNumber, enrollmentDate: $enrollmentDate, cccNumber: $cccNumber, counselled: $counselled, inviteClient: $inviteClient)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _RegisterClientPayload &&
            const DeepCollectionEquality().equals(other.facility, facility) &&
            const DeepCollectionEquality()
                .equals(other.clientType, clientType) &&
            const DeepCollectionEquality()
                .equals(other.clientName, clientName) &&
            const DeepCollectionEquality().equals(other.gender, gender) &&
            const DeepCollectionEquality()
                .equals(other.dateOfBirth, dateOfBirth) &&
            const DeepCollectionEquality()
                .equals(other.phoneNumber, phoneNumber) &&
            const DeepCollectionEquality()
                .equals(other.enrollmentDate, enrollmentDate) &&
            const DeepCollectionEquality().equals(other.cccNumber, cccNumber) &&
            const DeepCollectionEquality()
                .equals(other.counselled, counselled) &&
            const DeepCollectionEquality()
                .equals(other.inviteClient, inviteClient));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(facility),
      const DeepCollectionEquality().hash(clientType),
      const DeepCollectionEquality().hash(clientName),
      const DeepCollectionEquality().hash(gender),
      const DeepCollectionEquality().hash(dateOfBirth),
      const DeepCollectionEquality().hash(phoneNumber),
      const DeepCollectionEquality().hash(enrollmentDate),
      const DeepCollectionEquality().hash(cccNumber),
      const DeepCollectionEquality().hash(counselled),
      const DeepCollectionEquality().hash(inviteClient));

  @JsonKey(ignore: true)
  @override
  _$RegisterClientPayloadCopyWith<_RegisterClientPayload> get copyWith =>
      __$RegisterClientPayloadCopyWithImpl<_RegisterClientPayload>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_RegisterClientPayloadToJson(this);
  }
}

abstract class _RegisterClientPayload implements RegisterClientPayload {
  factory _RegisterClientPayload(
      {@JsonKey(name: 'facility')
          String? facility,
      @JsonKey(name: 'clientType')
          ClientType? clientType,
      @JsonKey(name: 'clientName')
          String? clientName,
      @JsonKey(name: 'gender', fromJson: genderFromJson)
          Gender? gender,
      @JsonKey(name: 'dateOfBirth', toJson: dobToJson)
          DateTime? dateOfBirth,
      @JsonKey(name: 'phoneNumber')
          String? phoneNumber,
      @JsonKey(name: 'enrollmentDate', toJson: dobToJson)
          DateTime? enrollmentDate,
      @JsonKey(name: 'cccNumber')
          String? cccNumber,
      @JsonKey(name: 'counselled')
          bool? counselled,
      @JsonKey(name: 'inviteClient')
          bool? inviteClient}) = _$_RegisterClientPayload;

  factory _RegisterClientPayload.fromJson(Map<String, dynamic> json) =
      _$_RegisterClientPayload.fromJson;

  @override
  @JsonKey(name: 'facility')
  String? get facility;
  @override
  @JsonKey(name: 'clientType')
  ClientType? get clientType;
  @override
  @JsonKey(name: 'clientName')
  String? get clientName;
  @override
  @JsonKey(name: 'gender', fromJson: genderFromJson)
  Gender? get gender;
  @override
  @JsonKey(name: 'dateOfBirth', toJson: dobToJson)
  DateTime? get dateOfBirth;
  @override
  @JsonKey(name: 'phoneNumber')
  String? get phoneNumber;
  @override
  @JsonKey(name: 'enrollmentDate', toJson: dobToJson)
  DateTime? get enrollmentDate;
  @override
  @JsonKey(name: 'cccNumber')
  String? get cccNumber;
  @override
  @JsonKey(name: 'counselled')
  bool? get counselled;
  @override
  @JsonKey(name: 'inviteClient')
  bool? get inviteClient;
  @override
  @JsonKey(ignore: true)
  _$RegisterClientPayloadCopyWith<_RegisterClientPayload> get copyWith =>
      throw _privateConstructorUsedError;
}
