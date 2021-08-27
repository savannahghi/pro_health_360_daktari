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
      {@JsonKey(unknownEnumValue: KYCType.unknown, defaultValue: KYCType.unknown)
          required KYCType kycType,
      IndividualPractitioner? individualPractitioner,
      OrganizationPractitioner? organizationPractitioner}) {
    return _PractitionerKYCState(
      kycType: kycType,
      individualPractitioner: individualPractitioner,
      organizationPractitioner: organizationPractitioner,
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
  @JsonKey(unknownEnumValue: KYCType.unknown, defaultValue: KYCType.unknown)
  KYCType get kycType => throw _privateConstructorUsedError;
  IndividualPractitioner? get individualPractitioner =>
      throw _privateConstructorUsedError;
  OrganizationPractitioner? get organizationPractitioner =>
      throw _privateConstructorUsedError;

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
      {@JsonKey(unknownEnumValue: KYCType.unknown, defaultValue: KYCType.unknown)
          KYCType kycType,
      IndividualPractitioner? individualPractitioner,
      OrganizationPractitioner? organizationPractitioner});

  $IndividualPractitionerCopyWith<$Res>? get individualPractitioner;
  $OrganizationPractitionerCopyWith<$Res>? get organizationPractitioner;
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
    Object? kycType = freezed,
    Object? individualPractitioner = freezed,
    Object? organizationPractitioner = freezed,
  }) {
    return _then(_value.copyWith(
      kycType: kycType == freezed
          ? _value.kycType
          : kycType // ignore: cast_nullable_to_non_nullable
              as KYCType,
      individualPractitioner: individualPractitioner == freezed
          ? _value.individualPractitioner
          : individualPractitioner // ignore: cast_nullable_to_non_nullable
              as IndividualPractitioner?,
      organizationPractitioner: organizationPractitioner == freezed
          ? _value.organizationPractitioner
          : organizationPractitioner // ignore: cast_nullable_to_non_nullable
              as OrganizationPractitioner?,
    ));
  }

  @override
  $IndividualPractitionerCopyWith<$Res>? get individualPractitioner {
    if (_value.individualPractitioner == null) {
      return null;
    }

    return $IndividualPractitionerCopyWith<$Res>(_value.individualPractitioner!,
        (value) {
      return _then(_value.copyWith(individualPractitioner: value));
    });
  }

  @override
  $OrganizationPractitionerCopyWith<$Res>? get organizationPractitioner {
    if (_value.organizationPractitioner == null) {
      return null;
    }

    return $OrganizationPractitionerCopyWith<$Res>(
        _value.organizationPractitioner!, (value) {
      return _then(_value.copyWith(organizationPractitioner: value));
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
      {@JsonKey(unknownEnumValue: KYCType.unknown, defaultValue: KYCType.unknown)
          KYCType kycType,
      IndividualPractitioner? individualPractitioner,
      OrganizationPractitioner? organizationPractitioner});

  @override
  $IndividualPractitionerCopyWith<$Res>? get individualPractitioner;
  @override
  $OrganizationPractitionerCopyWith<$Res>? get organizationPractitioner;
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
    Object? kycType = freezed,
    Object? individualPractitioner = freezed,
    Object? organizationPractitioner = freezed,
  }) {
    return _then(_PractitionerKYCState(
      kycType: kycType == freezed
          ? _value.kycType
          : kycType // ignore: cast_nullable_to_non_nullable
              as KYCType,
      individualPractitioner: individualPractitioner == freezed
          ? _value.individualPractitioner
          : individualPractitioner // ignore: cast_nullable_to_non_nullable
              as IndividualPractitioner?,
      organizationPractitioner: organizationPractitioner == freezed
          ? _value.organizationPractitioner
          : organizationPractitioner // ignore: cast_nullable_to_non_nullable
              as OrganizationPractitioner?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_PractitionerKYCState implements _PractitionerKYCState {
  const _$_PractitionerKYCState(
      {@JsonKey(unknownEnumValue: KYCType.unknown, defaultValue: KYCType.unknown)
          required this.kycType,
      this.individualPractitioner,
      this.organizationPractitioner});

  factory _$_PractitionerKYCState.fromJson(Map<String, dynamic> json) =>
      _$_$_PractitionerKYCStateFromJson(json);

  @override
  @JsonKey(unknownEnumValue: KYCType.unknown, defaultValue: KYCType.unknown)
  final KYCType kycType;
  @override
  final IndividualPractitioner? individualPractitioner;
  @override
  final OrganizationPractitioner? organizationPractitioner;

  @override
  String toString() {
    return 'PractitionerKYCState(kycType: $kycType, individualPractitioner: $individualPractitioner, organizationPractitioner: $organizationPractitioner)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _PractitionerKYCState &&
            (identical(other.kycType, kycType) ||
                const DeepCollectionEquality()
                    .equals(other.kycType, kycType)) &&
            (identical(other.individualPractitioner, individualPractitioner) ||
                const DeepCollectionEquality().equals(
                    other.individualPractitioner, individualPractitioner)) &&
            (identical(
                    other.organizationPractitioner, organizationPractitioner) ||
                const DeepCollectionEquality().equals(
                    other.organizationPractitioner, organizationPractitioner)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(kycType) ^
      const DeepCollectionEquality().hash(individualPractitioner) ^
      const DeepCollectionEquality().hash(organizationPractitioner);

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

abstract class _PractitionerKYCState implements PractitionerKYCState {
  const factory _PractitionerKYCState(
      {@JsonKey(unknownEnumValue: KYCType.unknown, defaultValue: KYCType.unknown)
          required KYCType kycType,
      IndividualPractitioner? individualPractitioner,
      OrganizationPractitioner?
          organizationPractitioner}) = _$_PractitionerKYCState;

  factory _PractitionerKYCState.fromJson(Map<String, dynamic> json) =
      _$_PractitionerKYCState.fromJson;

  @override
  @JsonKey(unknownEnumValue: KYCType.unknown, defaultValue: KYCType.unknown)
  KYCType get kycType => throw _privateConstructorUsedError;
  @override
  IndividualPractitioner? get individualPractitioner =>
      throw _privateConstructorUsedError;
  @override
  OrganizationPractitioner? get organizationPractitioner =>
      throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$PractitionerKYCStateCopyWith<_PractitionerKYCState> get copyWith =>
      throw _privateConstructorUsedError;
}
