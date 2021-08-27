// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'practitioner.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

IndividualPractitioner _$IndividualPractitionerFromJson(
    Map<String, dynamic> json) {
  return _IndividualPractitioner.fromJson(json);
}

/// @nodoc
class _$IndividualPractitionerTearOff {
  const _$IndividualPractitionerTearOff();

  _IndividualPractitioner call(
      {Identification? identificationDoc,
      List<SupportingDocument>? supportingDocuments,
      String? registrationNumber,
      String? practiceLicenseID,
      String? practiceLicenseUploadID,
      List<String>? practiceServices,
      String? cadre,
      required String kraPin,
      required String kraPinUploadId}) {
    return _IndividualPractitioner(
      identificationDoc: identificationDoc,
      supportingDocuments: supportingDocuments,
      registrationNumber: registrationNumber,
      practiceLicenseID: practiceLicenseID,
      practiceLicenseUploadID: practiceLicenseUploadID,
      practiceServices: practiceServices,
      cadre: cadre,
      kraPin: kraPin,
      kraPinUploadId: kraPinUploadId,
    );
  }

  IndividualPractitioner fromJson(Map<String, Object> json) {
    return IndividualPractitioner.fromJson(json);
  }
}

/// @nodoc
const $IndividualPractitioner = _$IndividualPractitionerTearOff();

/// @nodoc
mixin _$IndividualPractitioner {
  Identification? get identificationDoc => throw _privateConstructorUsedError;
  List<SupportingDocument>? get supportingDocuments =>
      throw _privateConstructorUsedError;
  String? get registrationNumber => throw _privateConstructorUsedError;
  String? get practiceLicenseID => throw _privateConstructorUsedError;
  String? get practiceLicenseUploadID => throw _privateConstructorUsedError;
  List<String>? get practiceServices => throw _privateConstructorUsedError;
  String? get cadre => throw _privateConstructorUsedError;
  String get kraPin => throw _privateConstructorUsedError;
  String get kraPinUploadId => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $IndividualPractitionerCopyWith<IndividualPractitioner> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $IndividualPractitionerCopyWith<$Res> {
  factory $IndividualPractitionerCopyWith(IndividualPractitioner value,
          $Res Function(IndividualPractitioner) then) =
      _$IndividualPractitionerCopyWithImpl<$Res>;
  $Res call(
      {Identification? identificationDoc,
      List<SupportingDocument>? supportingDocuments,
      String? registrationNumber,
      String? practiceLicenseID,
      String? practiceLicenseUploadID,
      List<String>? practiceServices,
      String? cadre,
      String kraPin,
      String kraPinUploadId});

  $IdentificationCopyWith<$Res>? get identificationDoc;
}

/// @nodoc
class _$IndividualPractitionerCopyWithImpl<$Res>
    implements $IndividualPractitionerCopyWith<$Res> {
  _$IndividualPractitionerCopyWithImpl(this._value, this._then);

  final IndividualPractitioner _value;
  // ignore: unused_field
  final $Res Function(IndividualPractitioner) _then;

  @override
  $Res call({
    Object? identificationDoc = freezed,
    Object? supportingDocuments = freezed,
    Object? registrationNumber = freezed,
    Object? practiceLicenseID = freezed,
    Object? practiceLicenseUploadID = freezed,
    Object? practiceServices = freezed,
    Object? cadre = freezed,
    Object? kraPin = freezed,
    Object? kraPinUploadId = freezed,
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
      kraPin: kraPin == freezed
          ? _value.kraPin
          : kraPin // ignore: cast_nullable_to_non_nullable
              as String,
      kraPinUploadId: kraPinUploadId == freezed
          ? _value.kraPinUploadId
          : kraPinUploadId // ignore: cast_nullable_to_non_nullable
              as String,
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
abstract class _$IndividualPractitionerCopyWith<$Res>
    implements $IndividualPractitionerCopyWith<$Res> {
  factory _$IndividualPractitionerCopyWith(_IndividualPractitioner value,
          $Res Function(_IndividualPractitioner) then) =
      __$IndividualPractitionerCopyWithImpl<$Res>;
  @override
  $Res call(
      {Identification? identificationDoc,
      List<SupportingDocument>? supportingDocuments,
      String? registrationNumber,
      String? practiceLicenseID,
      String? practiceLicenseUploadID,
      List<String>? practiceServices,
      String? cadre,
      String kraPin,
      String kraPinUploadId});

  @override
  $IdentificationCopyWith<$Res>? get identificationDoc;
}

/// @nodoc
class __$IndividualPractitionerCopyWithImpl<$Res>
    extends _$IndividualPractitionerCopyWithImpl<$Res>
    implements _$IndividualPractitionerCopyWith<$Res> {
  __$IndividualPractitionerCopyWithImpl(_IndividualPractitioner _value,
      $Res Function(_IndividualPractitioner) _then)
      : super(_value, (v) => _then(v as _IndividualPractitioner));

  @override
  _IndividualPractitioner get _value => super._value as _IndividualPractitioner;

  @override
  $Res call({
    Object? identificationDoc = freezed,
    Object? supportingDocuments = freezed,
    Object? registrationNumber = freezed,
    Object? practiceLicenseID = freezed,
    Object? practiceLicenseUploadID = freezed,
    Object? practiceServices = freezed,
    Object? cadre = freezed,
    Object? kraPin = freezed,
    Object? kraPinUploadId = freezed,
  }) {
    return _then(_IndividualPractitioner(
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
      kraPin: kraPin == freezed
          ? _value.kraPin
          : kraPin // ignore: cast_nullable_to_non_nullable
              as String,
      kraPinUploadId: kraPinUploadId == freezed
          ? _value.kraPinUploadId
          : kraPinUploadId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
@Implements(KRADetails)
class _$_IndividualPractitioner implements _IndividualPractitioner {
  _$_IndividualPractitioner(
      {this.identificationDoc,
      this.supportingDocuments,
      this.registrationNumber,
      this.practiceLicenseID,
      this.practiceLicenseUploadID,
      this.practiceServices,
      this.cadre,
      required this.kraPin,
      required this.kraPinUploadId});

  factory _$_IndividualPractitioner.fromJson(Map<String, dynamic> json) =>
      _$_$_IndividualPractitionerFromJson(json);

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
  @override
  final String kraPin;
  @override
  final String kraPinUploadId;

  @override
  String toString() {
    return 'IndividualPractitioner(identificationDoc: $identificationDoc, supportingDocuments: $supportingDocuments, registrationNumber: $registrationNumber, practiceLicenseID: $practiceLicenseID, practiceLicenseUploadID: $practiceLicenseUploadID, practiceServices: $practiceServices, cadre: $cadre, kraPin: $kraPin, kraPinUploadId: $kraPinUploadId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _IndividualPractitioner &&
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
            (identical(other.kraPin, kraPin) ||
                const DeepCollectionEquality().equals(other.kraPin, kraPin)) &&
            (identical(other.kraPinUploadId, kraPinUploadId) ||
                const DeepCollectionEquality()
                    .equals(other.kraPinUploadId, kraPinUploadId)));
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
      const DeepCollectionEquality().hash(kraPin) ^
      const DeepCollectionEquality().hash(kraPinUploadId);

  @JsonKey(ignore: true)
  @override
  _$IndividualPractitionerCopyWith<_IndividualPractitioner> get copyWith =>
      __$IndividualPractitionerCopyWithImpl<_IndividualPractitioner>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_IndividualPractitionerToJson(this);
  }
}

abstract class _IndividualPractitioner
    implements IndividualPractitioner, KRADetails {
  factory _IndividualPractitioner(
      {Identification? identificationDoc,
      List<SupportingDocument>? supportingDocuments,
      String? registrationNumber,
      String? practiceLicenseID,
      String? practiceLicenseUploadID,
      List<String>? practiceServices,
      String? cadre,
      required String kraPin,
      required String kraPinUploadId}) = _$_IndividualPractitioner;

  factory _IndividualPractitioner.fromJson(Map<String, dynamic> json) =
      _$_IndividualPractitioner.fromJson;

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
  String get kraPin => throw _privateConstructorUsedError;
  @override
  String get kraPinUploadId => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$IndividualPractitionerCopyWith<_IndividualPractitioner> get copyWith =>
      throw _privateConstructorUsedError;
}

OrganizationPractitioner _$OrganizationPractitionerFromJson(
    Map<String, dynamic> json) {
  return _OrganizationPractitioner.fromJson(json);
}

/// @nodoc
class _$OrganizationPractitionerTearOff {
  const _$OrganizationPractitionerTearOff();

  _OrganizationPractitioner call(
      {String? registrationNumber,
      String? practiceLicenseID,
      String? practiceLicenseUploadID,
      List<String>? practiceServices,
      String? cadre,
      String? organizationTypeName,
      String? certificateOfIncorporation,
      String? certificateOfInCorporationUploadID,
      List<Identification>? directorIdentifications,
      List<SupportingDocument>? supportingDocuments,
      required String kraPin,
      required String kraPinUploadId}) {
    return _OrganizationPractitioner(
      registrationNumber: registrationNumber,
      practiceLicenseID: practiceLicenseID,
      practiceLicenseUploadID: practiceLicenseUploadID,
      practiceServices: practiceServices,
      cadre: cadre,
      organizationTypeName: organizationTypeName,
      certificateOfIncorporation: certificateOfIncorporation,
      certificateOfInCorporationUploadID: certificateOfInCorporationUploadID,
      directorIdentifications: directorIdentifications,
      supportingDocuments: supportingDocuments,
      kraPin: kraPin,
      kraPinUploadId: kraPinUploadId,
    );
  }

  OrganizationPractitioner fromJson(Map<String, Object> json) {
    return OrganizationPractitioner.fromJson(json);
  }
}

/// @nodoc
const $OrganizationPractitioner = _$OrganizationPractitionerTearOff();

/// @nodoc
mixin _$OrganizationPractitioner {
  String? get registrationNumber => throw _privateConstructorUsedError;
  String? get practiceLicenseID => throw _privateConstructorUsedError;
  String? get practiceLicenseUploadID => throw _privateConstructorUsedError;
  List<String>? get practiceServices => throw _privateConstructorUsedError;
  String? get cadre => throw _privateConstructorUsedError;
  String? get organizationTypeName => throw _privateConstructorUsedError;
  String? get certificateOfIncorporation => throw _privateConstructorUsedError;
  String? get certificateOfInCorporationUploadID =>
      throw _privateConstructorUsedError;
  List<Identification>? get directorIdentifications =>
      throw _privateConstructorUsedError;
  List<SupportingDocument>? get supportingDocuments =>
      throw _privateConstructorUsedError;
  String get kraPin => throw _privateConstructorUsedError;
  String get kraPinUploadId => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $OrganizationPractitionerCopyWith<OrganizationPractitioner> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrganizationPractitionerCopyWith<$Res> {
  factory $OrganizationPractitionerCopyWith(OrganizationPractitioner value,
          $Res Function(OrganizationPractitioner) then) =
      _$OrganizationPractitionerCopyWithImpl<$Res>;
  $Res call(
      {String? registrationNumber,
      String? practiceLicenseID,
      String? practiceLicenseUploadID,
      List<String>? practiceServices,
      String? cadre,
      String? organizationTypeName,
      String? certificateOfIncorporation,
      String? certificateOfInCorporationUploadID,
      List<Identification>? directorIdentifications,
      List<SupportingDocument>? supportingDocuments,
      String kraPin,
      String kraPinUploadId});
}

/// @nodoc
class _$OrganizationPractitionerCopyWithImpl<$Res>
    implements $OrganizationPractitionerCopyWith<$Res> {
  _$OrganizationPractitionerCopyWithImpl(this._value, this._then);

  final OrganizationPractitioner _value;
  // ignore: unused_field
  final $Res Function(OrganizationPractitioner) _then;

  @override
  $Res call({
    Object? registrationNumber = freezed,
    Object? practiceLicenseID = freezed,
    Object? practiceLicenseUploadID = freezed,
    Object? practiceServices = freezed,
    Object? cadre = freezed,
    Object? organizationTypeName = freezed,
    Object? certificateOfIncorporation = freezed,
    Object? certificateOfInCorporationUploadID = freezed,
    Object? directorIdentifications = freezed,
    Object? supportingDocuments = freezed,
    Object? kraPin = freezed,
    Object? kraPinUploadId = freezed,
  }) {
    return _then(_value.copyWith(
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
      organizationTypeName: organizationTypeName == freezed
          ? _value.organizationTypeName
          : organizationTypeName // ignore: cast_nullable_to_non_nullable
              as String?,
      certificateOfIncorporation: certificateOfIncorporation == freezed
          ? _value.certificateOfIncorporation
          : certificateOfIncorporation // ignore: cast_nullable_to_non_nullable
              as String?,
      certificateOfInCorporationUploadID: certificateOfInCorporationUploadID ==
              freezed
          ? _value.certificateOfInCorporationUploadID
          : certificateOfInCorporationUploadID // ignore: cast_nullable_to_non_nullable
              as String?,
      directorIdentifications: directorIdentifications == freezed
          ? _value.directorIdentifications
          : directorIdentifications // ignore: cast_nullable_to_non_nullable
              as List<Identification>?,
      supportingDocuments: supportingDocuments == freezed
          ? _value.supportingDocuments
          : supportingDocuments // ignore: cast_nullable_to_non_nullable
              as List<SupportingDocument>?,
      kraPin: kraPin == freezed
          ? _value.kraPin
          : kraPin // ignore: cast_nullable_to_non_nullable
              as String,
      kraPinUploadId: kraPinUploadId == freezed
          ? _value.kraPinUploadId
          : kraPinUploadId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$OrganizationPractitionerCopyWith<$Res>
    implements $OrganizationPractitionerCopyWith<$Res> {
  factory _$OrganizationPractitionerCopyWith(_OrganizationPractitioner value,
          $Res Function(_OrganizationPractitioner) then) =
      __$OrganizationPractitionerCopyWithImpl<$Res>;
  @override
  $Res call(
      {String? registrationNumber,
      String? practiceLicenseID,
      String? practiceLicenseUploadID,
      List<String>? practiceServices,
      String? cadre,
      String? organizationTypeName,
      String? certificateOfIncorporation,
      String? certificateOfInCorporationUploadID,
      List<Identification>? directorIdentifications,
      List<SupportingDocument>? supportingDocuments,
      String kraPin,
      String kraPinUploadId});
}

/// @nodoc
class __$OrganizationPractitionerCopyWithImpl<$Res>
    extends _$OrganizationPractitionerCopyWithImpl<$Res>
    implements _$OrganizationPractitionerCopyWith<$Res> {
  __$OrganizationPractitionerCopyWithImpl(_OrganizationPractitioner _value,
      $Res Function(_OrganizationPractitioner) _then)
      : super(_value, (v) => _then(v as _OrganizationPractitioner));

  @override
  _OrganizationPractitioner get _value =>
      super._value as _OrganizationPractitioner;

  @override
  $Res call({
    Object? registrationNumber = freezed,
    Object? practiceLicenseID = freezed,
    Object? practiceLicenseUploadID = freezed,
    Object? practiceServices = freezed,
    Object? cadre = freezed,
    Object? organizationTypeName = freezed,
    Object? certificateOfIncorporation = freezed,
    Object? certificateOfInCorporationUploadID = freezed,
    Object? directorIdentifications = freezed,
    Object? supportingDocuments = freezed,
    Object? kraPin = freezed,
    Object? kraPinUploadId = freezed,
  }) {
    return _then(_OrganizationPractitioner(
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
      organizationTypeName: organizationTypeName == freezed
          ? _value.organizationTypeName
          : organizationTypeName // ignore: cast_nullable_to_non_nullable
              as String?,
      certificateOfIncorporation: certificateOfIncorporation == freezed
          ? _value.certificateOfIncorporation
          : certificateOfIncorporation // ignore: cast_nullable_to_non_nullable
              as String?,
      certificateOfInCorporationUploadID: certificateOfInCorporationUploadID ==
              freezed
          ? _value.certificateOfInCorporationUploadID
          : certificateOfInCorporationUploadID // ignore: cast_nullable_to_non_nullable
              as String?,
      directorIdentifications: directorIdentifications == freezed
          ? _value.directorIdentifications
          : directorIdentifications // ignore: cast_nullable_to_non_nullable
              as List<Identification>?,
      supportingDocuments: supportingDocuments == freezed
          ? _value.supportingDocuments
          : supportingDocuments // ignore: cast_nullable_to_non_nullable
              as List<SupportingDocument>?,
      kraPin: kraPin == freezed
          ? _value.kraPin
          : kraPin // ignore: cast_nullable_to_non_nullable
              as String,
      kraPinUploadId: kraPinUploadId == freezed
          ? _value.kraPinUploadId
          : kraPinUploadId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
@Implements(OrganizationDetails)
class _$_OrganizationPractitioner implements _OrganizationPractitioner {
  _$_OrganizationPractitioner(
      {this.registrationNumber,
      this.practiceLicenseID,
      this.practiceLicenseUploadID,
      this.practiceServices,
      this.cadre,
      this.organizationTypeName,
      this.certificateOfIncorporation,
      this.certificateOfInCorporationUploadID,
      this.directorIdentifications,
      this.supportingDocuments,
      required this.kraPin,
      required this.kraPinUploadId});

  factory _$_OrganizationPractitioner.fromJson(Map<String, dynamic> json) =>
      _$_$_OrganizationPractitionerFromJson(json);

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
  @override
  final String? organizationTypeName;
  @override
  final String? certificateOfIncorporation;
  @override
  final String? certificateOfInCorporationUploadID;
  @override
  final List<Identification>? directorIdentifications;
  @override
  final List<SupportingDocument>? supportingDocuments;
  @override
  final String kraPin;
  @override
  final String kraPinUploadId;

  @override
  String toString() {
    return 'OrganizationPractitioner(registrationNumber: $registrationNumber, practiceLicenseID: $practiceLicenseID, practiceLicenseUploadID: $practiceLicenseUploadID, practiceServices: $practiceServices, cadre: $cadre, organizationTypeName: $organizationTypeName, certificateOfIncorporation: $certificateOfIncorporation, certificateOfInCorporationUploadID: $certificateOfInCorporationUploadID, directorIdentifications: $directorIdentifications, supportingDocuments: $supportingDocuments, kraPin: $kraPin, kraPinUploadId: $kraPinUploadId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _OrganizationPractitioner &&
            (identical(other.registrationNumber, registrationNumber) ||
                const DeepCollectionEquality()
                    .equals(other.registrationNumber, registrationNumber)) &&
            (identical(other.practiceLicenseID, practiceLicenseID) ||
                const DeepCollectionEquality()
                    .equals(other.practiceLicenseID, practiceLicenseID)) &&
            (identical(other.practiceLicenseUploadID, practiceLicenseUploadID) ||
                const DeepCollectionEquality().equals(
                    other.practiceLicenseUploadID, practiceLicenseUploadID)) &&
            (identical(other.practiceServices, practiceServices) ||
                const DeepCollectionEquality()
                    .equals(other.practiceServices, practiceServices)) &&
            (identical(other.cadre, cadre) ||
                const DeepCollectionEquality().equals(other.cadre, cadre)) &&
            (identical(other.organizationTypeName, organizationTypeName) ||
                const DeepCollectionEquality().equals(
                    other.organizationTypeName, organizationTypeName)) &&
            (identical(other.certificateOfIncorporation, certificateOfIncorporation) ||
                const DeepCollectionEquality().equals(
                    other.certificateOfIncorporation,
                    certificateOfIncorporation)) &&
            (identical(other.certificateOfInCorporationUploadID,
                    certificateOfInCorporationUploadID) ||
                const DeepCollectionEquality().equals(
                    other.certificateOfInCorporationUploadID,
                    certificateOfInCorporationUploadID)) &&
            (identical(other.directorIdentifications, directorIdentifications) ||
                const DeepCollectionEquality().equals(
                    other.directorIdentifications, directorIdentifications)) &&
            (identical(other.supportingDocuments, supportingDocuments) ||
                const DeepCollectionEquality()
                    .equals(other.supportingDocuments, supportingDocuments)) &&
            (identical(other.kraPin, kraPin) ||
                const DeepCollectionEquality().equals(other.kraPin, kraPin)) &&
            (identical(other.kraPinUploadId, kraPinUploadId) ||
                const DeepCollectionEquality()
                    .equals(other.kraPinUploadId, kraPinUploadId)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(registrationNumber) ^
      const DeepCollectionEquality().hash(practiceLicenseID) ^
      const DeepCollectionEquality().hash(practiceLicenseUploadID) ^
      const DeepCollectionEquality().hash(practiceServices) ^
      const DeepCollectionEquality().hash(cadre) ^
      const DeepCollectionEquality().hash(organizationTypeName) ^
      const DeepCollectionEquality().hash(certificateOfIncorporation) ^
      const DeepCollectionEquality().hash(certificateOfInCorporationUploadID) ^
      const DeepCollectionEquality().hash(directorIdentifications) ^
      const DeepCollectionEquality().hash(supportingDocuments) ^
      const DeepCollectionEquality().hash(kraPin) ^
      const DeepCollectionEquality().hash(kraPinUploadId);

  @JsonKey(ignore: true)
  @override
  _$OrganizationPractitionerCopyWith<_OrganizationPractitioner> get copyWith =>
      __$OrganizationPractitionerCopyWithImpl<_OrganizationPractitioner>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_OrganizationPractitionerToJson(this);
  }
}

abstract class _OrganizationPractitioner
    implements OrganizationPractitioner, OrganizationDetails {
  factory _OrganizationPractitioner(
      {String? registrationNumber,
      String? practiceLicenseID,
      String? practiceLicenseUploadID,
      List<String>? practiceServices,
      String? cadre,
      String? organizationTypeName,
      String? certificateOfIncorporation,
      String? certificateOfInCorporationUploadID,
      List<Identification>? directorIdentifications,
      List<SupportingDocument>? supportingDocuments,
      required String kraPin,
      required String kraPinUploadId}) = _$_OrganizationPractitioner;

  factory _OrganizationPractitioner.fromJson(Map<String, dynamic> json) =
      _$_OrganizationPractitioner.fromJson;

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
  String? get organizationTypeName => throw _privateConstructorUsedError;
  @override
  String? get certificateOfIncorporation => throw _privateConstructorUsedError;
  @override
  String? get certificateOfInCorporationUploadID =>
      throw _privateConstructorUsedError;
  @override
  List<Identification>? get directorIdentifications =>
      throw _privateConstructorUsedError;
  @override
  List<SupportingDocument>? get supportingDocuments =>
      throw _privateConstructorUsedError;
  @override
  String get kraPin => throw _privateConstructorUsedError;
  @override
  String get kraPinUploadId => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$OrganizationPractitionerCopyWith<_OrganizationPractitioner> get copyWith =>
      throw _privateConstructorUsedError;
}
