// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'practitioner_kyc_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PractitionerKYCState _$PractitionerKYCStateFromJson(Map<String, dynamic> json) {
  return _PractitionerKYCState.fromJson(json);
}

/// @nodoc
class _$PractitionerKYCStateTearOff {
  const _$PractitionerKYCStateTearOff();

  _PractitionerKYCState call(
      {Identification? identificationDoc,
      List<SupportingDocument>? supportingDocuments,
      String? registrationNumber,
      String? practiceLicenseID,
      String? practiceLicenseUploadID,
      List<String>? practiceServices,
      String? cadre,
      bool practitionerSetupComplete = false,
      bool kycSubmitted = false,
      required String kraPin,
      required String kraPinUploadId,
      @JsonKey(unknownEnumValue: KYCType.Unknown, defaultValue: KYCType.Unknown)
          required KYCType kycType}) {
    return _PractitionerKYCState(
      identificationDoc: identificationDoc,
      supportingDocuments: supportingDocuments,
      registrationNumber: registrationNumber,
      practiceLicenseID: practiceLicenseID,
      practiceLicenseUploadID: practiceLicenseUploadID,
      practiceServices: practiceServices,
      cadre: cadre,
      practitionerSetupComplete: practitionerSetupComplete,
      kycSubmitted: kycSubmitted,
      kraPin: kraPin,
      kraPinUploadId: kraPinUploadId,
      kycType: kycType,
    );
  }

  PractitionerKYCState fromJson(Map<String, Object> json) {
    return PractitionerKYCState.fromJson(json);
  }
}

/// @nodoc
const $PractitionerKYCState = _$PractitionerKYCStateTearOff();

/// @nodoc
mixin _$PractitionerKYCState {
  Identification? get identificationDoc => throw _privateConstructorUsedError;
  List<SupportingDocument>? get supportingDocuments =>
      throw _privateConstructorUsedError;
  String? get registrationNumber => throw _privateConstructorUsedError;
  String? get practiceLicenseID => throw _privateConstructorUsedError;
  String? get practiceLicenseUploadID => throw _privateConstructorUsedError;
  List<String>? get practiceServices => throw _privateConstructorUsedError;
  String? get cadre => throw _privateConstructorUsedError;
  bool get practitionerSetupComplete => throw _privateConstructorUsedError;
  bool get kycSubmitted => throw _privateConstructorUsedError;
  String get kraPin => throw _privateConstructorUsedError;
  String get kraPinUploadId => throw _privateConstructorUsedError;
  @JsonKey(unknownEnumValue: KYCType.Unknown, defaultValue: KYCType.Unknown)
  KYCType get kycType => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PractitionerKYCStateCopyWith<PractitionerKYCState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PractitionerKYCStateCopyWith<$Res> {
  factory $PractitionerKYCStateCopyWith(PractitionerKYCState value,
          $Res Function(PractitionerKYCState) then) =
      _$PractitionerKYCStateCopyWithImpl<$Res>;
  $Res call(
      {Identification? identificationDoc,
      List<SupportingDocument>? supportingDocuments,
      String? registrationNumber,
      String? practiceLicenseID,
      String? practiceLicenseUploadID,
      List<String>? practiceServices,
      String? cadre,
      bool practitionerSetupComplete,
      bool kycSubmitted,
      String kraPin,
      String kraPinUploadId,
      @JsonKey(unknownEnumValue: KYCType.Unknown, defaultValue: KYCType.Unknown)
          KYCType kycType});

  $IdentificationCopyWith<$Res>? get identificationDoc;
}

/// @nodoc
class _$PractitionerKYCStateCopyWithImpl<$Res>
    implements $PractitionerKYCStateCopyWith<$Res> {
  _$PractitionerKYCStateCopyWithImpl(this._value, this._then);

  final PractitionerKYCState _value;
  // ignore: unused_field
  final $Res Function(PractitionerKYCState) _then;

  @override
  $Res call({
    Object? identificationDoc = freezed,
    Object? supportingDocuments = freezed,
    Object? registrationNumber = freezed,
    Object? practiceLicenseID = freezed,
    Object? practiceLicenseUploadID = freezed,
    Object? practiceServices = freezed,
    Object? cadre = freezed,
    Object? practitionerSetupComplete = freezed,
    Object? kycSubmitted = freezed,
    Object? kraPin = freezed,
    Object? kraPinUploadId = freezed,
    Object? kycType = freezed,
  }) {
    return _then(_value.copyWith(
      identificationDoc: identificationDoc == freezed
          ? _value.identificationDoc
          : identificationDoc // ignore: cast_nullable_to_non_nullable
              as Identification?,
      supportingDocuments: supportingDocuments == freezed
          ? _value.supportingDocuments
          : supportingDocuments // ignore: cast_nullable_to_non_nullable
              as List<SupportingDocument>?,
      registrationNumber: registrationNumber == freezed
          ? _value.registrationNumber
          : registrationNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      practiceLicenseID: practiceLicenseID == freezed
          ? _value.practiceLicenseID
          : practiceLicenseID // ignore: cast_nullable_to_non_nullable
              as String?,
      practiceLicenseUploadID: practiceLicenseUploadID == freezed
          ? _value.practiceLicenseUploadID
          : practiceLicenseUploadID // ignore: cast_nullable_to_non_nullable
              as String?,
      practiceServices: practiceServices == freezed
          ? _value.practiceServices
          : practiceServices // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      cadre: cadre == freezed
          ? _value.cadre
          : cadre // ignore: cast_nullable_to_non_nullable
              as String?,
      practitionerSetupComplete: practitionerSetupComplete == freezed
          ? _value.practitionerSetupComplete
          : practitionerSetupComplete // ignore: cast_nullable_to_non_nullable
              as bool,
      kycSubmitted: kycSubmitted == freezed
          ? _value.kycSubmitted
          : kycSubmitted // ignore: cast_nullable_to_non_nullable
              as bool,
      kraPin: kraPin == freezed
          ? _value.kraPin
          : kraPin // ignore: cast_nullable_to_non_nullable
              as String,
      kraPinUploadId: kraPinUploadId == freezed
          ? _value.kraPinUploadId
          : kraPinUploadId // ignore: cast_nullable_to_non_nullable
              as String,
      kycType: kycType == freezed
          ? _value.kycType
          : kycType // ignore: cast_nullable_to_non_nullable
              as KYCType,
    ));
  }

  @override
  $IdentificationCopyWith<$Res>? get identificationDoc {
    if (_value.identificationDoc == null) {
      return null;
    }

    return $IdentificationCopyWith<$Res>(_value.identificationDoc!, (value) {
      return _then(_value.copyWith(identificationDoc: value));
    });
  }
}

/// @nodoc
abstract class _$PractitionerKYCStateCopyWith<$Res>
    implements $PractitionerKYCStateCopyWith<$Res> {
  factory _$PractitionerKYCStateCopyWith(_PractitionerKYCState value,
          $Res Function(_PractitionerKYCState) then) =
      __$PractitionerKYCStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {Identification? identificationDoc,
      List<SupportingDocument>? supportingDocuments,
      String? registrationNumber,
      String? practiceLicenseID,
      String? practiceLicenseUploadID,
      List<String>? practiceServices,
      String? cadre,
      bool practitionerSetupComplete,
      bool kycSubmitted,
      String kraPin,
      String kraPinUploadId,
      @JsonKey(unknownEnumValue: KYCType.Unknown, defaultValue: KYCType.Unknown)
          KYCType kycType});

  @override
  $IdentificationCopyWith<$Res>? get identificationDoc;
}

/// @nodoc
class __$PractitionerKYCStateCopyWithImpl<$Res>
    extends _$PractitionerKYCStateCopyWithImpl<$Res>
    implements _$PractitionerKYCStateCopyWith<$Res> {
  __$PractitionerKYCStateCopyWithImpl(
      _PractitionerKYCState _value, $Res Function(_PractitionerKYCState) _then)
      : super(_value, (v) => _then(v as _PractitionerKYCState));

  @override
  _PractitionerKYCState get _value => super._value as _PractitionerKYCState;

  @override
  $Res call({
    Object? identificationDoc = freezed,
    Object? supportingDocuments = freezed,
    Object? registrationNumber = freezed,
    Object? practiceLicenseID = freezed,
    Object? practiceLicenseUploadID = freezed,
    Object? practiceServices = freezed,
    Object? cadre = freezed,
    Object? practitionerSetupComplete = freezed,
    Object? kycSubmitted = freezed,
    Object? kraPin = freezed,
    Object? kraPinUploadId = freezed,
    Object? kycType = freezed,
  }) {
    return _then(_PractitionerKYCState(
      identificationDoc: identificationDoc == freezed
          ? _value.identificationDoc
          : identificationDoc // ignore: cast_nullable_to_non_nullable
              as Identification?,
      supportingDocuments: supportingDocuments == freezed
          ? _value.supportingDocuments
          : supportingDocuments // ignore: cast_nullable_to_non_nullable
              as List<SupportingDocument>?,
      registrationNumber: registrationNumber == freezed
          ? _value.registrationNumber
          : registrationNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      practiceLicenseID: practiceLicenseID == freezed
          ? _value.practiceLicenseID
          : practiceLicenseID // ignore: cast_nullable_to_non_nullable
              as String?,
      practiceLicenseUploadID: practiceLicenseUploadID == freezed
          ? _value.practiceLicenseUploadID
          : practiceLicenseUploadID // ignore: cast_nullable_to_non_nullable
              as String?,
      practiceServices: practiceServices == freezed
          ? _value.practiceServices
          : practiceServices // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      cadre: cadre == freezed
          ? _value.cadre
          : cadre // ignore: cast_nullable_to_non_nullable
              as String?,
      practitionerSetupComplete: practitionerSetupComplete == freezed
          ? _value.practitionerSetupComplete
          : practitionerSetupComplete // ignore: cast_nullable_to_non_nullable
              as bool,
      kycSubmitted: kycSubmitted == freezed
          ? _value.kycSubmitted
          : kycSubmitted // ignore: cast_nullable_to_non_nullable
              as bool,
      kraPin: kraPin == freezed
          ? _value.kraPin
          : kraPin // ignore: cast_nullable_to_non_nullable
              as String,
      kraPinUploadId: kraPinUploadId == freezed
          ? _value.kraPinUploadId
          : kraPinUploadId // ignore: cast_nullable_to_non_nullable
              as String,
      kycType: kycType == freezed
          ? _value.kycType
          : kycType // ignore: cast_nullable_to_non_nullable
              as KYCType,
    ));
  }
}

/// @nodoc
@JsonSerializable()
@Implements(KRADetails)
class _$_PractitionerKYCState implements _PractitionerKYCState {
  _$_PractitionerKYCState(
      {this.identificationDoc,
      this.supportingDocuments,
      this.registrationNumber,
      this.practiceLicenseID,
      this.practiceLicenseUploadID,
      this.practiceServices,
      this.cadre,
      this.practitionerSetupComplete = false,
      this.kycSubmitted = false,
      required this.kraPin,
      required this.kraPinUploadId,
      @JsonKey(unknownEnumValue: KYCType.Unknown, defaultValue: KYCType.Unknown)
          required this.kycType});

  factory _$_PractitionerKYCState.fromJson(Map<String, dynamic> json) =>
      _$_$_PractitionerKYCStateFromJson(json);

  @override
  final Identification? identificationDoc;
  @override
  final List<SupportingDocument>? supportingDocuments;
  @override
  final String? registrationNumber;
  @override
  final String? practiceLicenseID;
  @override
  final String? practiceLicenseUploadID;
  @override
  final List<String>? practiceServices;
  @override
  final String? cadre;
  @JsonKey(defaultValue: false)
  @override
  final bool practitionerSetupComplete;
  @JsonKey(defaultValue: false)
  @override
  final bool kycSubmitted;
  @override
  final String kraPin;
  @override
  final String kraPinUploadId;
  @override
  @JsonKey(unknownEnumValue: KYCType.Unknown, defaultValue: KYCType.Unknown)
  final KYCType kycType;

  @override
  String toString() {
    return 'PractitionerKYCState(identificationDoc: $identificationDoc, supportingDocuments: $supportingDocuments, registrationNumber: $registrationNumber, practiceLicenseID: $practiceLicenseID, practiceLicenseUploadID: $practiceLicenseUploadID, practiceServices: $practiceServices, cadre: $cadre, practitionerSetupComplete: $practitionerSetupComplete, kycSubmitted: $kycSubmitted, kraPin: $kraPin, kraPinUploadId: $kraPinUploadId, kycType: $kycType)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _PractitionerKYCState &&
            (identical(other.identificationDoc, identificationDoc) ||
                const DeepCollectionEquality()
                    .equals(other.identificationDoc, identificationDoc)) &&
            (identical(other.supportingDocuments, supportingDocuments) ||
                const DeepCollectionEquality()
                    .equals(other.supportingDocuments, supportingDocuments)) &&
            (identical(other.registrationNumber, registrationNumber) ||
                const DeepCollectionEquality()
                    .equals(other.registrationNumber, registrationNumber)) &&
            (identical(other.practiceLicenseID, practiceLicenseID) ||
                const DeepCollectionEquality()
                    .equals(other.practiceLicenseID, practiceLicenseID)) &&
            (identical(
                    other.practiceLicenseUploadID, practiceLicenseUploadID) ||
                const DeepCollectionEquality().equals(
                    other.practiceLicenseUploadID, practiceLicenseUploadID)) &&
            (identical(other.practiceServices, practiceServices) ||
                const DeepCollectionEquality()
                    .equals(other.practiceServices, practiceServices)) &&
            (identical(other.cadre, cadre) ||
                const DeepCollectionEquality().equals(other.cadre, cadre)) &&
            (identical(other.practitionerSetupComplete,
                    practitionerSetupComplete) ||
                const DeepCollectionEquality().equals(
                    other.practitionerSetupComplete,
                    practitionerSetupComplete)) &&
            (identical(other.kycSubmitted, kycSubmitted) ||
                const DeepCollectionEquality()
                    .equals(other.kycSubmitted, kycSubmitted)) &&
            (identical(other.kraPin, kraPin) ||
                const DeepCollectionEquality().equals(other.kraPin, kraPin)) &&
            (identical(other.kraPinUploadId, kraPinUploadId) ||
                const DeepCollectionEquality()
                    .equals(other.kraPinUploadId, kraPinUploadId)) &&
            (identical(other.kycType, kycType) ||
                const DeepCollectionEquality().equals(other.kycType, kycType)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(identificationDoc) ^
      const DeepCollectionEquality().hash(supportingDocuments) ^
      const DeepCollectionEquality().hash(registrationNumber) ^
      const DeepCollectionEquality().hash(practiceLicenseID) ^
      const DeepCollectionEquality().hash(practiceLicenseUploadID) ^
      const DeepCollectionEquality().hash(practiceServices) ^
      const DeepCollectionEquality().hash(cadre) ^
      const DeepCollectionEquality().hash(practitionerSetupComplete) ^
      const DeepCollectionEquality().hash(kycSubmitted) ^
      const DeepCollectionEquality().hash(kraPin) ^
      const DeepCollectionEquality().hash(kraPinUploadId) ^
      const DeepCollectionEquality().hash(kycType);

  @JsonKey(ignore: true)
  @override
  _$PractitionerKYCStateCopyWith<_PractitionerKYCState> get copyWith =>
      __$PractitionerKYCStateCopyWithImpl<_PractitionerKYCState>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_PractitionerKYCStateToJson(this);
  }
}

abstract class _PractitionerKYCState
    implements PractitionerKYCState, KRADetails {
  factory _PractitionerKYCState(
      {Identification? identificationDoc,
      List<SupportingDocument>? supportingDocuments,
      String? registrationNumber,
      String? practiceLicenseID,
      String? practiceLicenseUploadID,
      List<String>? practiceServices,
      String? cadre,
      bool practitionerSetupComplete,
      bool kycSubmitted,
      required String kraPin,
      required String kraPinUploadId,
      @JsonKey(unknownEnumValue: KYCType.Unknown, defaultValue: KYCType.Unknown)
          required KYCType kycType}) = _$_PractitionerKYCState;

  factory _PractitionerKYCState.fromJson(Map<String, dynamic> json) =
      _$_PractitionerKYCState.fromJson;

  @override
  Identification? get identificationDoc => throw _privateConstructorUsedError;
  @override
  List<SupportingDocument>? get supportingDocuments =>
      throw _privateConstructorUsedError;
  @override
  String? get registrationNumber => throw _privateConstructorUsedError;
  @override
  String? get practiceLicenseID => throw _privateConstructorUsedError;
  @override
  String? get practiceLicenseUploadID => throw _privateConstructorUsedError;
  @override
  List<String>? get practiceServices => throw _privateConstructorUsedError;
  @override
  String? get cadre => throw _privateConstructorUsedError;
  @override
  bool get practitionerSetupComplete => throw _privateConstructorUsedError;
  @override
  bool get kycSubmitted => throw _privateConstructorUsedError;
  @override
  String get kraPin => throw _privateConstructorUsedError;
  @override
  String get kraPinUploadId => throw _privateConstructorUsedError;
  @override
  @JsonKey(unknownEnumValue: KYCType.Unknown, defaultValue: KYCType.Unknown)
  KYCType get kycType => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$PractitionerKYCStateCopyWith<_PractitionerKYCState> get copyWith =>
      throw _privateConstructorUsedError;
}
