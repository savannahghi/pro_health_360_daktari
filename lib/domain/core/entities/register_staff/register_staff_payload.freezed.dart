// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'register_staff_payload.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

RegisterStaffPayload _$RegisterStaffPayloadFromJson(Map<String, dynamic> json) {
  return _RegisterStaffPayload.fromJson(json);
}

/// @nodoc
class _$RegisterStaffPayloadTearOff {
  const _$RegisterStaffPayloadTearOff();

  _RegisterStaffPayload call(
      {@JsonKey(name: 'facility') String? facility,
      @JsonKey(name: 'staffName') String? staffName,
      @JsonKey(name: 'gender', fromJson: genderFromJson) Gender? gender,
      @JsonKey(name: 'phoneNumber') String? phoneNumber,
      @JsonKey(name: 'idNumber') String? idNumber,
      @JsonKey(name: 'staffNumber') String? staffNumber,
      @JsonKey(name: 'staffRoles', fromJson: roleValueFromJson) RoleValue? role,
      @JsonKey(name: 'inviteStaff') bool? inviteStaff,
      @JsonKey(name: 'dateOfBirth', toJson: dobToJson) DateTime? dateOfBirth}) {
    return _RegisterStaffPayload(
      facility: facility,
      staffName: staffName,
      gender: gender,
      phoneNumber: phoneNumber,
      idNumber: idNumber,
      staffNumber: staffNumber,
      role: role,
      inviteStaff: inviteStaff,
      dateOfBirth: dateOfBirth,
    );
  }

  RegisterStaffPayload fromJson(Map<String, Object?> json) {
    return RegisterStaffPayload.fromJson(json);
  }
}

/// @nodoc
const $RegisterStaffPayload = _$RegisterStaffPayloadTearOff();

/// @nodoc
mixin _$RegisterStaffPayload {
  @JsonKey(name: 'facility')
  String? get facility => throw _privateConstructorUsedError;
  @JsonKey(name: 'staffName')
  String? get staffName => throw _privateConstructorUsedError;
  @JsonKey(name: 'gender', fromJson: genderFromJson)
  Gender? get gender => throw _privateConstructorUsedError;
  @JsonKey(name: 'phoneNumber')
  String? get phoneNumber => throw _privateConstructorUsedError;
  @JsonKey(name: 'idNumber')
  String? get idNumber => throw _privateConstructorUsedError;
  @JsonKey(name: 'staffNumber')
  String? get staffNumber => throw _privateConstructorUsedError;
  @JsonKey(name: 'staffRoles', fromJson: roleValueFromJson)
  RoleValue? get role => throw _privateConstructorUsedError;
  @JsonKey(name: 'inviteStaff')
  bool? get inviteStaff => throw _privateConstructorUsedError;
  @JsonKey(name: 'dateOfBirth', toJson: dobToJson)
  DateTime? get dateOfBirth => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RegisterStaffPayloadCopyWith<RegisterStaffPayload> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RegisterStaffPayloadCopyWith<$Res> {
  factory $RegisterStaffPayloadCopyWith(RegisterStaffPayload value,
          $Res Function(RegisterStaffPayload) then) =
      _$RegisterStaffPayloadCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: 'facility') String? facility,
      @JsonKey(name: 'staffName') String? staffName,
      @JsonKey(name: 'gender', fromJson: genderFromJson) Gender? gender,
      @JsonKey(name: 'phoneNumber') String? phoneNumber,
      @JsonKey(name: 'idNumber') String? idNumber,
      @JsonKey(name: 'staffNumber') String? staffNumber,
      @JsonKey(name: 'staffRoles', fromJson: roleValueFromJson) RoleValue? role,
      @JsonKey(name: 'inviteStaff') bool? inviteStaff,
      @JsonKey(name: 'dateOfBirth', toJson: dobToJson) DateTime? dateOfBirth});
}

/// @nodoc
class _$RegisterStaffPayloadCopyWithImpl<$Res>
    implements $RegisterStaffPayloadCopyWith<$Res> {
  _$RegisterStaffPayloadCopyWithImpl(this._value, this._then);

  final RegisterStaffPayload _value;
  // ignore: unused_field
  final $Res Function(RegisterStaffPayload) _then;

  @override
  $Res call({
    Object? facility = freezed,
    Object? staffName = freezed,
    Object? gender = freezed,
    Object? phoneNumber = freezed,
    Object? idNumber = freezed,
    Object? staffNumber = freezed,
    Object? role = freezed,
    Object? inviteStaff = freezed,
    Object? dateOfBirth = freezed,
  }) {
    return _then(_value.copyWith(
      facility: facility == freezed
          ? _value.facility
          : facility // ignore: cast_nullable_to_non_nullable
              as String?,
      staffName: staffName == freezed
          ? _value.staffName
          : staffName // ignore: cast_nullable_to_non_nullable
              as String?,
      gender: gender == freezed
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as Gender?,
      phoneNumber: phoneNumber == freezed
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      idNumber: idNumber == freezed
          ? _value.idNumber
          : idNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      staffNumber: staffNumber == freezed
          ? _value.staffNumber
          : staffNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      role: role == freezed
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as RoleValue?,
      inviteStaff: inviteStaff == freezed
          ? _value.inviteStaff
          : inviteStaff // ignore: cast_nullable_to_non_nullable
              as bool?,
      dateOfBirth: dateOfBirth == freezed
          ? _value.dateOfBirth
          : dateOfBirth // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
abstract class _$RegisterStaffPayloadCopyWith<$Res>
    implements $RegisterStaffPayloadCopyWith<$Res> {
  factory _$RegisterStaffPayloadCopyWith(_RegisterStaffPayload value,
          $Res Function(_RegisterStaffPayload) then) =
      __$RegisterStaffPayloadCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: 'facility') String? facility,
      @JsonKey(name: 'staffName') String? staffName,
      @JsonKey(name: 'gender', fromJson: genderFromJson) Gender? gender,
      @JsonKey(name: 'phoneNumber') String? phoneNumber,
      @JsonKey(name: 'idNumber') String? idNumber,
      @JsonKey(name: 'staffNumber') String? staffNumber,
      @JsonKey(name: 'staffRoles', fromJson: roleValueFromJson) RoleValue? role,
      @JsonKey(name: 'inviteStaff') bool? inviteStaff,
      @JsonKey(name: 'dateOfBirth', toJson: dobToJson) DateTime? dateOfBirth});
}

/// @nodoc
class __$RegisterStaffPayloadCopyWithImpl<$Res>
    extends _$RegisterStaffPayloadCopyWithImpl<$Res>
    implements _$RegisterStaffPayloadCopyWith<$Res> {
  __$RegisterStaffPayloadCopyWithImpl(
      _RegisterStaffPayload _value, $Res Function(_RegisterStaffPayload) _then)
      : super(_value, (v) => _then(v as _RegisterStaffPayload));

  @override
  _RegisterStaffPayload get _value => super._value as _RegisterStaffPayload;

  @override
  $Res call({
    Object? facility = freezed,
    Object? staffName = freezed,
    Object? gender = freezed,
    Object? phoneNumber = freezed,
    Object? idNumber = freezed,
    Object? staffNumber = freezed,
    Object? role = freezed,
    Object? inviteStaff = freezed,
    Object? dateOfBirth = freezed,
  }) {
    return _then(_RegisterStaffPayload(
      facility: facility == freezed
          ? _value.facility
          : facility // ignore: cast_nullable_to_non_nullable
              as String?,
      staffName: staffName == freezed
          ? _value.staffName
          : staffName // ignore: cast_nullable_to_non_nullable
              as String?,
      gender: gender == freezed
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as Gender?,
      phoneNumber: phoneNumber == freezed
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      idNumber: idNumber == freezed
          ? _value.idNumber
          : idNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      staffNumber: staffNumber == freezed
          ? _value.staffNumber
          : staffNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      role: role == freezed
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as RoleValue?,
      inviteStaff: inviteStaff == freezed
          ? _value.inviteStaff
          : inviteStaff // ignore: cast_nullable_to_non_nullable
              as bool?,
      dateOfBirth: dateOfBirth == freezed
          ? _value.dateOfBirth
          : dateOfBirth // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_RegisterStaffPayload implements _RegisterStaffPayload {
  _$_RegisterStaffPayload(
      {@JsonKey(name: 'facility') this.facility,
      @JsonKey(name: 'staffName') this.staffName,
      @JsonKey(name: 'gender', fromJson: genderFromJson) this.gender,
      @JsonKey(name: 'phoneNumber') this.phoneNumber,
      @JsonKey(name: 'idNumber') this.idNumber,
      @JsonKey(name: 'staffNumber') this.staffNumber,
      @JsonKey(name: 'staffRoles', fromJson: roleValueFromJson) this.role,
      @JsonKey(name: 'inviteStaff') this.inviteStaff,
      @JsonKey(name: 'dateOfBirth', toJson: dobToJson) this.dateOfBirth});

  factory _$_RegisterStaffPayload.fromJson(Map<String, dynamic> json) =>
      _$$_RegisterStaffPayloadFromJson(json);

  @override
  @JsonKey(name: 'facility')
  final String? facility;
  @override
  @JsonKey(name: 'staffName')
  final String? staffName;
  @override
  @JsonKey(name: 'gender', fromJson: genderFromJson)
  final Gender? gender;
  @override
  @JsonKey(name: 'phoneNumber')
  final String? phoneNumber;
  @override
  @JsonKey(name: 'idNumber')
  final String? idNumber;
  @override
  @JsonKey(name: 'staffNumber')
  final String? staffNumber;
  @override
  @JsonKey(name: 'staffRoles', fromJson: roleValueFromJson)
  final RoleValue? role;
  @override
  @JsonKey(name: 'inviteStaff')
  final bool? inviteStaff;
  @override
  @JsonKey(name: 'dateOfBirth', toJson: dobToJson)
  final DateTime? dateOfBirth;

  @override
  String toString() {
    return 'RegisterStaffPayload(facility: $facility, staffName: $staffName, gender: $gender, phoneNumber: $phoneNumber, idNumber: $idNumber, staffNumber: $staffNumber, role: $role, inviteStaff: $inviteStaff, dateOfBirth: $dateOfBirth)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _RegisterStaffPayload &&
            const DeepCollectionEquality().equals(other.facility, facility) &&
            const DeepCollectionEquality().equals(other.staffName, staffName) &&
            const DeepCollectionEquality().equals(other.gender, gender) &&
            const DeepCollectionEquality()
                .equals(other.phoneNumber, phoneNumber) &&
            const DeepCollectionEquality().equals(other.idNumber, idNumber) &&
            const DeepCollectionEquality()
                .equals(other.staffNumber, staffNumber) &&
            const DeepCollectionEquality().equals(other.role, role) &&
            const DeepCollectionEquality()
                .equals(other.inviteStaff, inviteStaff) &&
            const DeepCollectionEquality()
                .equals(other.dateOfBirth, dateOfBirth));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(facility),
      const DeepCollectionEquality().hash(staffName),
      const DeepCollectionEquality().hash(gender),
      const DeepCollectionEquality().hash(phoneNumber),
      const DeepCollectionEquality().hash(idNumber),
      const DeepCollectionEquality().hash(staffNumber),
      const DeepCollectionEquality().hash(role),
      const DeepCollectionEquality().hash(inviteStaff),
      const DeepCollectionEquality().hash(dateOfBirth));

  @JsonKey(ignore: true)
  @override
  _$RegisterStaffPayloadCopyWith<_RegisterStaffPayload> get copyWith =>
      __$RegisterStaffPayloadCopyWithImpl<_RegisterStaffPayload>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_RegisterStaffPayloadToJson(this);
  }
}

abstract class _RegisterStaffPayload implements RegisterStaffPayload {
  factory _RegisterStaffPayload(
      {@JsonKey(name: 'facility')
          String? facility,
      @JsonKey(name: 'staffName')
          String? staffName,
      @JsonKey(name: 'gender', fromJson: genderFromJson)
          Gender? gender,
      @JsonKey(name: 'phoneNumber')
          String? phoneNumber,
      @JsonKey(name: 'idNumber')
          String? idNumber,
      @JsonKey(name: 'staffNumber')
          String? staffNumber,
      @JsonKey(name: 'staffRoles', fromJson: roleValueFromJson)
          RoleValue? role,
      @JsonKey(name: 'inviteStaff')
          bool? inviteStaff,
      @JsonKey(name: 'dateOfBirth', toJson: dobToJson)
          DateTime? dateOfBirth}) = _$_RegisterStaffPayload;

  factory _RegisterStaffPayload.fromJson(Map<String, dynamic> json) =
      _$_RegisterStaffPayload.fromJson;

  @override
  @JsonKey(name: 'facility')
  String? get facility;
  @override
  @JsonKey(name: 'staffName')
  String? get staffName;
  @override
  @JsonKey(name: 'gender', fromJson: genderFromJson)
  Gender? get gender;
  @override
  @JsonKey(name: 'phoneNumber')
  String? get phoneNumber;
  @override
  @JsonKey(name: 'idNumber')
  String? get idNumber;
  @override
  @JsonKey(name: 'staffNumber')
  String? get staffNumber;
  @override
  @JsonKey(name: 'staffRoles', fromJson: roleValueFromJson)
  RoleValue? get role;
  @override
  @JsonKey(name: 'inviteStaff')
  bool? get inviteStaff;
  @override
  @JsonKey(name: 'dateOfBirth', toJson: dobToJson)
  DateTime? get dateOfBirth;
  @override
  @JsonKey(ignore: true)
  _$RegisterStaffPayloadCopyWith<_RegisterStaffPayload> get copyWith =>
      throw _privateConstructorUsedError;
}
