// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'identification.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Identification _$IdentificationFromJson(Map<String, dynamic> json) {
  return _Identification.fromJson(json);
}

/// @nodoc
class _$IdentificationTearOff {
  const _$IdentificationTearOff();

  _Identification call(
      {required String type,
      required String docNumber,
      required String uploadID}) {
    return _Identification(
      type: type,
      docNumber: docNumber,
      uploadID: uploadID,
    );
  }

  Identification fromJson(Map<String, Object> json) {
    return Identification.fromJson(json);
  }
}

/// @nodoc
const $Identification = _$IdentificationTearOff();

/// @nodoc
mixin _$Identification {
  String get type => throw _privateConstructorUsedError;
  String get docNumber => throw _privateConstructorUsedError;
  String get uploadID => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $IdentificationCopyWith<Identification> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $IdentificationCopyWith<$Res> {
  factory $IdentificationCopyWith(
          Identification value, $Res Function(Identification) then) =
      _$IdentificationCopyWithImpl<$Res>;
  $Res call({String type, String docNumber, String uploadID});
}

/// @nodoc
class _$IdentificationCopyWithImpl<$Res>
    implements $IdentificationCopyWith<$Res> {
  _$IdentificationCopyWithImpl(this._value, this._then);

  final Identification _value;
  // ignore: unused_field
  final $Res Function(Identification) _then;

  @override
  $Res call({
    Object? type = freezed,
    Object? docNumber = freezed,
    Object? uploadID = freezed,
  }) {
    return _then(_value.copyWith(
      type: type == freezed
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      docNumber: docNumber == freezed
          ? _value.docNumber
          : docNumber // ignore: cast_nullable_to_non_nullable
              as String,
      uploadID: uploadID == freezed
          ? _value.uploadID
          : uploadID // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$IdentificationCopyWith<$Res>
    implements $IdentificationCopyWith<$Res> {
  factory _$IdentificationCopyWith(
          _Identification value, $Res Function(_Identification) then) =
      __$IdentificationCopyWithImpl<$Res>;
  @override
  $Res call({String type, String docNumber, String uploadID});
}

/// @nodoc
class __$IdentificationCopyWithImpl<$Res>
    extends _$IdentificationCopyWithImpl<$Res>
    implements _$IdentificationCopyWith<$Res> {
  __$IdentificationCopyWithImpl(
      _Identification _value, $Res Function(_Identification) _then)
      : super(_value, (v) => _then(v as _Identification));

  @override
  _Identification get _value => super._value as _Identification;

  @override
  $Res call({
    Object? type = freezed,
    Object? docNumber = freezed,
    Object? uploadID = freezed,
  }) {
    return _then(_Identification(
      type: type == freezed
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      docNumber: docNumber == freezed
          ? _value.docNumber
          : docNumber // ignore: cast_nullable_to_non_nullable
              as String,
      uploadID: uploadID == freezed
          ? _value.uploadID
          : uploadID // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Identification implements _Identification {
  const _$_Identification(
      {required this.type, required this.docNumber, required this.uploadID});

  factory _$_Identification.fromJson(Map<String, dynamic> json) =>
      _$_$_IdentificationFromJson(json);

  @override
  final String type;
  @override
  final String docNumber;
  @override
  final String uploadID;

  @override
  String toString() {
    return 'Identification(type: $type, docNumber: $docNumber, uploadID: $uploadID)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Identification &&
            (identical(other.type, type) ||
                const DeepCollectionEquality().equals(other.type, type)) &&
            (identical(other.docNumber, docNumber) ||
                const DeepCollectionEquality()
                    .equals(other.docNumber, docNumber)) &&
            (identical(other.uploadID, uploadID) ||
                const DeepCollectionEquality()
                    .equals(other.uploadID, uploadID)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(type) ^
      const DeepCollectionEquality().hash(docNumber) ^
      const DeepCollectionEquality().hash(uploadID);

  @JsonKey(ignore: true)
  @override
  _$IdentificationCopyWith<_Identification> get copyWith =>
      __$IdentificationCopyWithImpl<_Identification>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_IdentificationToJson(this);
  }
}

abstract class _Identification implements Identification {
  const factory _Identification(
      {required String type,
      required String docNumber,
      required String uploadID}) = _$_Identification;

  factory _Identification.fromJson(Map<String, dynamic> json) =
      _$_Identification.fromJson;

  @override
  String get type => throw _privateConstructorUsedError;
  @override
  String get docNumber => throw _privateConstructorUsedError;
  @override
  String get uploadID => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$IdentificationCopyWith<_Identification> get copyWith =>
      throw _privateConstructorUsedError;
}
