// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'register_client_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

RegisterClientResponse _$RegisterClientResponseFromJson(
    Map<String, dynamic> json) {
  return _RegisterClientResponse.fromJson(json);
}

/// @nodoc
class _$RegisterClientResponseTearOff {
  const _$RegisterClientResponseTearOff();

  _RegisterClientResponse call(
      {@JsonKey(name: 'ID') String? id,
      @JsonKey(name: 'active') bool? active,
      @JsonKey(name: 'clientType') String? clientType,
      @JsonKey(name: 'enrollmentDate') String? enrollmentDate,
      @JsonKey(name: 'fhirPatientID') String? fhirPatientID,
      @JsonKey(name: 'emrHealthRecordID') String? emrHealthRecordID,
      @JsonKey(name: 'treatmentBuddy') String? treatmentBuddy,
      @JsonKey(name: 'counselled') bool? counselled,
      @JsonKey(name: 'organisation') String? organisation,
      @JsonKey(name: 'userID') String? userID,
      @JsonKey(name: 'currentFacilityID') String? currentFacilityID,
      @JsonKey(name: 'chv') String? chv,
      @JsonKey(name: 'caregiver') String? caregiver}) {
    return _RegisterClientResponse(
      id: id,
      active: active,
      clientType: clientType,
      enrollmentDate: enrollmentDate,
      fhirPatientID: fhirPatientID,
      emrHealthRecordID: emrHealthRecordID,
      treatmentBuddy: treatmentBuddy,
      counselled: counselled,
      organisation: organisation,
      userID: userID,
      currentFacilityID: currentFacilityID,
      chv: chv,
      caregiver: caregiver,
    );
  }

  RegisterClientResponse fromJson(Map<String, Object> json) {
    return RegisterClientResponse.fromJson(json);
  }
}

/// @nodoc
const $RegisterClientResponse = _$RegisterClientResponseTearOff();

/// @nodoc
mixin _$RegisterClientResponse {
  @JsonKey(name: 'ID')
  String? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'active')
  bool? get active => throw _privateConstructorUsedError;
  @JsonKey(name: 'clientType')
  String? get clientType => throw _privateConstructorUsedError;
  @JsonKey(name: 'enrollmentDate')
  String? get enrollmentDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'fhirPatientID')
  String? get fhirPatientID => throw _privateConstructorUsedError;
  @JsonKey(name: 'emrHealthRecordID')
  String? get emrHealthRecordID => throw _privateConstructorUsedError;
  @JsonKey(name: 'treatmentBuddy')
  String? get treatmentBuddy => throw _privateConstructorUsedError;
  @JsonKey(name: 'counselled')
  bool? get counselled => throw _privateConstructorUsedError;
  @JsonKey(name: 'organisation')
  String? get organisation => throw _privateConstructorUsedError;
  @JsonKey(name: 'userID')
  String? get userID => throw _privateConstructorUsedError;
  @JsonKey(name: 'currentFacilityID')
  String? get currentFacilityID => throw _privateConstructorUsedError;
  @JsonKey(name: 'chv')
  String? get chv => throw _privateConstructorUsedError;
  @JsonKey(name: 'caregiver')
  String? get caregiver => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RegisterClientResponseCopyWith<RegisterClientResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RegisterClientResponseCopyWith<$Res> {
  factory $RegisterClientResponseCopyWith(RegisterClientResponse value,
          $Res Function(RegisterClientResponse) then) =
      _$RegisterClientResponseCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: 'ID') String? id,
      @JsonKey(name: 'active') bool? active,
      @JsonKey(name: 'clientType') String? clientType,
      @JsonKey(name: 'enrollmentDate') String? enrollmentDate,
      @JsonKey(name: 'fhirPatientID') String? fhirPatientID,
      @JsonKey(name: 'emrHealthRecordID') String? emrHealthRecordID,
      @JsonKey(name: 'treatmentBuddy') String? treatmentBuddy,
      @JsonKey(name: 'counselled') bool? counselled,
      @JsonKey(name: 'organisation') String? organisation,
      @JsonKey(name: 'userID') String? userID,
      @JsonKey(name: 'currentFacilityID') String? currentFacilityID,
      @JsonKey(name: 'chv') String? chv,
      @JsonKey(name: 'caregiver') String? caregiver});
}

/// @nodoc
class _$RegisterClientResponseCopyWithImpl<$Res>
    implements $RegisterClientResponseCopyWith<$Res> {
  _$RegisterClientResponseCopyWithImpl(this._value, this._then);

  final RegisterClientResponse _value;
  // ignore: unused_field
  final $Res Function(RegisterClientResponse) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? active = freezed,
    Object? clientType = freezed,
    Object? enrollmentDate = freezed,
    Object? fhirPatientID = freezed,
    Object? emrHealthRecordID = freezed,
    Object? treatmentBuddy = freezed,
    Object? counselled = freezed,
    Object? organisation = freezed,
    Object? userID = freezed,
    Object? currentFacilityID = freezed,
    Object? chv = freezed,
    Object? caregiver = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      active: active == freezed
          ? _value.active
          : active // ignore: cast_nullable_to_non_nullable
              as bool?,
      clientType: clientType == freezed
          ? _value.clientType
          : clientType // ignore: cast_nullable_to_non_nullable
              as String?,
      enrollmentDate: enrollmentDate == freezed
          ? _value.enrollmentDate
          : enrollmentDate // ignore: cast_nullable_to_non_nullable
              as String?,
      fhirPatientID: fhirPatientID == freezed
          ? _value.fhirPatientID
          : fhirPatientID // ignore: cast_nullable_to_non_nullable
              as String?,
      emrHealthRecordID: emrHealthRecordID == freezed
          ? _value.emrHealthRecordID
          : emrHealthRecordID // ignore: cast_nullable_to_non_nullable
              as String?,
      treatmentBuddy: treatmentBuddy == freezed
          ? _value.treatmentBuddy
          : treatmentBuddy // ignore: cast_nullable_to_non_nullable
              as String?,
      counselled: counselled == freezed
          ? _value.counselled
          : counselled // ignore: cast_nullable_to_non_nullable
              as bool?,
      organisation: organisation == freezed
          ? _value.organisation
          : organisation // ignore: cast_nullable_to_non_nullable
              as String?,
      userID: userID == freezed
          ? _value.userID
          : userID // ignore: cast_nullable_to_non_nullable
              as String?,
      currentFacilityID: currentFacilityID == freezed
          ? _value.currentFacilityID
          : currentFacilityID // ignore: cast_nullable_to_non_nullable
              as String?,
      chv: chv == freezed
          ? _value.chv
          : chv // ignore: cast_nullable_to_non_nullable
              as String?,
      caregiver: caregiver == freezed
          ? _value.caregiver
          : caregiver // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$RegisterClientResponseCopyWith<$Res>
    implements $RegisterClientResponseCopyWith<$Res> {
  factory _$RegisterClientResponseCopyWith(_RegisterClientResponse value,
          $Res Function(_RegisterClientResponse) then) =
      __$RegisterClientResponseCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: 'ID') String? id,
      @JsonKey(name: 'active') bool? active,
      @JsonKey(name: 'clientType') String? clientType,
      @JsonKey(name: 'enrollmentDate') String? enrollmentDate,
      @JsonKey(name: 'fhirPatientID') String? fhirPatientID,
      @JsonKey(name: 'emrHealthRecordID') String? emrHealthRecordID,
      @JsonKey(name: 'treatmentBuddy') String? treatmentBuddy,
      @JsonKey(name: 'counselled') bool? counselled,
      @JsonKey(name: 'organisation') String? organisation,
      @JsonKey(name: 'userID') String? userID,
      @JsonKey(name: 'currentFacilityID') String? currentFacilityID,
      @JsonKey(name: 'chv') String? chv,
      @JsonKey(name: 'caregiver') String? caregiver});
}

/// @nodoc
class __$RegisterClientResponseCopyWithImpl<$Res>
    extends _$RegisterClientResponseCopyWithImpl<$Res>
    implements _$RegisterClientResponseCopyWith<$Res> {
  __$RegisterClientResponseCopyWithImpl(_RegisterClientResponse _value,
      $Res Function(_RegisterClientResponse) _then)
      : super(_value, (v) => _then(v as _RegisterClientResponse));

  @override
  _RegisterClientResponse get _value => super._value as _RegisterClientResponse;

  @override
  $Res call({
    Object? id = freezed,
    Object? active = freezed,
    Object? clientType = freezed,
    Object? enrollmentDate = freezed,
    Object? fhirPatientID = freezed,
    Object? emrHealthRecordID = freezed,
    Object? treatmentBuddy = freezed,
    Object? counselled = freezed,
    Object? organisation = freezed,
    Object? userID = freezed,
    Object? currentFacilityID = freezed,
    Object? chv = freezed,
    Object? caregiver = freezed,
  }) {
    return _then(_RegisterClientResponse(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      active: active == freezed
          ? _value.active
          : active // ignore: cast_nullable_to_non_nullable
              as bool?,
      clientType: clientType == freezed
          ? _value.clientType
          : clientType // ignore: cast_nullable_to_non_nullable
              as String?,
      enrollmentDate: enrollmentDate == freezed
          ? _value.enrollmentDate
          : enrollmentDate // ignore: cast_nullable_to_non_nullable
              as String?,
      fhirPatientID: fhirPatientID == freezed
          ? _value.fhirPatientID
          : fhirPatientID // ignore: cast_nullable_to_non_nullable
              as String?,
      emrHealthRecordID: emrHealthRecordID == freezed
          ? _value.emrHealthRecordID
          : emrHealthRecordID // ignore: cast_nullable_to_non_nullable
              as String?,
      treatmentBuddy: treatmentBuddy == freezed
          ? _value.treatmentBuddy
          : treatmentBuddy // ignore: cast_nullable_to_non_nullable
              as String?,
      counselled: counselled == freezed
          ? _value.counselled
          : counselled // ignore: cast_nullable_to_non_nullable
              as bool?,
      organisation: organisation == freezed
          ? _value.organisation
          : organisation // ignore: cast_nullable_to_non_nullable
              as String?,
      userID: userID == freezed
          ? _value.userID
          : userID // ignore: cast_nullable_to_non_nullable
              as String?,
      currentFacilityID: currentFacilityID == freezed
          ? _value.currentFacilityID
          : currentFacilityID // ignore: cast_nullable_to_non_nullable
              as String?,
      chv: chv == freezed
          ? _value.chv
          : chv // ignore: cast_nullable_to_non_nullable
              as String?,
      caregiver: caregiver == freezed
          ? _value.caregiver
          : caregiver // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_RegisterClientResponse implements _RegisterClientResponse {
  _$_RegisterClientResponse(
      {@JsonKey(name: 'ID') this.id,
      @JsonKey(name: 'active') this.active,
      @JsonKey(name: 'clientType') this.clientType,
      @JsonKey(name: 'enrollmentDate') this.enrollmentDate,
      @JsonKey(name: 'fhirPatientID') this.fhirPatientID,
      @JsonKey(name: 'emrHealthRecordID') this.emrHealthRecordID,
      @JsonKey(name: 'treatmentBuddy') this.treatmentBuddy,
      @JsonKey(name: 'counselled') this.counselled,
      @JsonKey(name: 'organisation') this.organisation,
      @JsonKey(name: 'userID') this.userID,
      @JsonKey(name: 'currentFacilityID') this.currentFacilityID,
      @JsonKey(name: 'chv') this.chv,
      @JsonKey(name: 'caregiver') this.caregiver});

  factory _$_RegisterClientResponse.fromJson(Map<String, dynamic> json) =>
      _$_$_RegisterClientResponseFromJson(json);

  @override
  @JsonKey(name: 'ID')
  final String? id;
  @override
  @JsonKey(name: 'active')
  final bool? active;
  @override
  @JsonKey(name: 'clientType')
  final String? clientType;
  @override
  @JsonKey(name: 'enrollmentDate')
  final String? enrollmentDate;
  @override
  @JsonKey(name: 'fhirPatientID')
  final String? fhirPatientID;
  @override
  @JsonKey(name: 'emrHealthRecordID')
  final String? emrHealthRecordID;
  @override
  @JsonKey(name: 'treatmentBuddy')
  final String? treatmentBuddy;
  @override
  @JsonKey(name: 'counselled')
  final bool? counselled;
  @override
  @JsonKey(name: 'organisation')
  final String? organisation;
  @override
  @JsonKey(name: 'userID')
  final String? userID;
  @override
  @JsonKey(name: 'currentFacilityID')
  final String? currentFacilityID;
  @override
  @JsonKey(name: 'chv')
  final String? chv;
  @override
  @JsonKey(name: 'caregiver')
  final String? caregiver;

  @override
  String toString() {
    return 'RegisterClientResponse(id: $id, active: $active, clientType: $clientType, enrollmentDate: $enrollmentDate, fhirPatientID: $fhirPatientID, emrHealthRecordID: $emrHealthRecordID, treatmentBuddy: $treatmentBuddy, counselled: $counselled, organisation: $organisation, userID: $userID, currentFacilityID: $currentFacilityID, chv: $chv, caregiver: $caregiver)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _RegisterClientResponse &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.active, active) ||
                const DeepCollectionEquality().equals(other.active, active)) &&
            (identical(other.clientType, clientType) ||
                const DeepCollectionEquality()
                    .equals(other.clientType, clientType)) &&
            (identical(other.enrollmentDate, enrollmentDate) ||
                const DeepCollectionEquality()
                    .equals(other.enrollmentDate, enrollmentDate)) &&
            (identical(other.fhirPatientID, fhirPatientID) ||
                const DeepCollectionEquality()
                    .equals(other.fhirPatientID, fhirPatientID)) &&
            (identical(other.emrHealthRecordID, emrHealthRecordID) ||
                const DeepCollectionEquality()
                    .equals(other.emrHealthRecordID, emrHealthRecordID)) &&
            (identical(other.treatmentBuddy, treatmentBuddy) ||
                const DeepCollectionEquality()
                    .equals(other.treatmentBuddy, treatmentBuddy)) &&
            (identical(other.counselled, counselled) ||
                const DeepCollectionEquality()
                    .equals(other.counselled, counselled)) &&
            (identical(other.organisation, organisation) ||
                const DeepCollectionEquality()
                    .equals(other.organisation, organisation)) &&
            (identical(other.userID, userID) ||
                const DeepCollectionEquality().equals(other.userID, userID)) &&
            (identical(other.currentFacilityID, currentFacilityID) ||
                const DeepCollectionEquality()
                    .equals(other.currentFacilityID, currentFacilityID)) &&
            (identical(other.chv, chv) ||
                const DeepCollectionEquality().equals(other.chv, chv)) &&
            (identical(other.caregiver, caregiver) ||
                const DeepCollectionEquality()
                    .equals(other.caregiver, caregiver)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(active) ^
      const DeepCollectionEquality().hash(clientType) ^
      const DeepCollectionEquality().hash(enrollmentDate) ^
      const DeepCollectionEquality().hash(fhirPatientID) ^
      const DeepCollectionEquality().hash(emrHealthRecordID) ^
      const DeepCollectionEquality().hash(treatmentBuddy) ^
      const DeepCollectionEquality().hash(counselled) ^
      const DeepCollectionEquality().hash(organisation) ^
      const DeepCollectionEquality().hash(userID) ^
      const DeepCollectionEquality().hash(currentFacilityID) ^
      const DeepCollectionEquality().hash(chv) ^
      const DeepCollectionEquality().hash(caregiver);

  @JsonKey(ignore: true)
  @override
  _$RegisterClientResponseCopyWith<_RegisterClientResponse> get copyWith =>
      __$RegisterClientResponseCopyWithImpl<_RegisterClientResponse>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_RegisterClientResponseToJson(this);
  }
}

abstract class _RegisterClientResponse implements RegisterClientResponse {
  factory _RegisterClientResponse(
          {@JsonKey(name: 'ID') String? id,
          @JsonKey(name: 'active') bool? active,
          @JsonKey(name: 'clientType') String? clientType,
          @JsonKey(name: 'enrollmentDate') String? enrollmentDate,
          @JsonKey(name: 'fhirPatientID') String? fhirPatientID,
          @JsonKey(name: 'emrHealthRecordID') String? emrHealthRecordID,
          @JsonKey(name: 'treatmentBuddy') String? treatmentBuddy,
          @JsonKey(name: 'counselled') bool? counselled,
          @JsonKey(name: 'organisation') String? organisation,
          @JsonKey(name: 'userID') String? userID,
          @JsonKey(name: 'currentFacilityID') String? currentFacilityID,
          @JsonKey(name: 'chv') String? chv,
          @JsonKey(name: 'caregiver') String? caregiver}) =
      _$_RegisterClientResponse;

  factory _RegisterClientResponse.fromJson(Map<String, dynamic> json) =
      _$_RegisterClientResponse.fromJson;

  @override
  @JsonKey(name: 'ID')
  String? get id => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'active')
  bool? get active => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'clientType')
  String? get clientType => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'enrollmentDate')
  String? get enrollmentDate => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'fhirPatientID')
  String? get fhirPatientID => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'emrHealthRecordID')
  String? get emrHealthRecordID => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'treatmentBuddy')
  String? get treatmentBuddy => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'counselled')
  bool? get counselled => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'organisation')
  String? get organisation => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'userID')
  String? get userID => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'currentFacilityID')
  String? get currentFacilityID => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'chv')
  String? get chv => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'caregiver')
  String? get caregiver => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$RegisterClientResponseCopyWith<_RegisterClientResponse> get copyWith =>
      throw _privateConstructorUsedError;
}
