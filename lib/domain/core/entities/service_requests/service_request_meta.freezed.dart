// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'service_request_meta.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ServiceRequestMeta _$ServiceRequestMetaFromJson(Map<String, dynamic> json) {
  return _ServiceRequestMeta.fromJson(json);
}

/// @nodoc
mixin _$ServiceRequestMeta {
  @JsonKey(name: 'ccc_number')
  String? get cccNumber => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_ccc_number_valid')
  bool? get isCccNumberValid => throw _privateConstructorUsedError;
  @JsonKey(name: 'note')
  String? get note => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ServiceRequestMetaCopyWith<ServiceRequestMeta> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ServiceRequestMetaCopyWith<$Res> {
  factory $ServiceRequestMetaCopyWith(
          ServiceRequestMeta value, $Res Function(ServiceRequestMeta) then) =
      _$ServiceRequestMetaCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: 'ccc_number') String? cccNumber,
      @JsonKey(name: 'is_ccc_number_valid') bool? isCccNumberValid,
      @JsonKey(name: 'note') String? note});
}

/// @nodoc
class _$ServiceRequestMetaCopyWithImpl<$Res>
    implements $ServiceRequestMetaCopyWith<$Res> {
  _$ServiceRequestMetaCopyWithImpl(this._value, this._then);

  final ServiceRequestMeta _value;
  // ignore: unused_field
  final $Res Function(ServiceRequestMeta) _then;

  @override
  $Res call({
    Object? cccNumber = freezed,
    Object? isCccNumberValid = freezed,
    Object? note = freezed,
  }) {
    return _then(_value.copyWith(
      cccNumber: cccNumber == freezed
          ? _value.cccNumber
          : cccNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      isCccNumberValid: isCccNumberValid == freezed
          ? _value.isCccNumberValid
          : isCccNumberValid // ignore: cast_nullable_to_non_nullable
              as bool?,
      note: note == freezed
          ? _value.note
          : note // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$$_ServiceRequestMetaCopyWith<$Res>
    implements $ServiceRequestMetaCopyWith<$Res> {
  factory _$$_ServiceRequestMetaCopyWith(_$_ServiceRequestMeta value,
          $Res Function(_$_ServiceRequestMeta) then) =
      __$$_ServiceRequestMetaCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: 'ccc_number') String? cccNumber,
      @JsonKey(name: 'is_ccc_number_valid') bool? isCccNumberValid,
      @JsonKey(name: 'note') String? note});
}

/// @nodoc
class __$$_ServiceRequestMetaCopyWithImpl<$Res>
    extends _$ServiceRequestMetaCopyWithImpl<$Res>
    implements _$$_ServiceRequestMetaCopyWith<$Res> {
  __$$_ServiceRequestMetaCopyWithImpl(
      _$_ServiceRequestMeta _value, $Res Function(_$_ServiceRequestMeta) _then)
      : super(_value, (v) => _then(v as _$_ServiceRequestMeta));

  @override
  _$_ServiceRequestMeta get _value => super._value as _$_ServiceRequestMeta;

  @override
  $Res call({
    Object? cccNumber = freezed,
    Object? isCccNumberValid = freezed,
    Object? note = freezed,
  }) {
    return _then(_$_ServiceRequestMeta(
      cccNumber: cccNumber == freezed
          ? _value.cccNumber
          : cccNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      isCccNumberValid: isCccNumberValid == freezed
          ? _value.isCccNumberValid
          : isCccNumberValid // ignore: cast_nullable_to_non_nullable
              as bool?,
      note: note == freezed
          ? _value.note
          : note // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ServiceRequestMeta implements _ServiceRequestMeta {
  _$_ServiceRequestMeta(
      {@JsonKey(name: 'ccc_number') this.cccNumber,
      @JsonKey(name: 'is_ccc_number_valid') this.isCccNumberValid,
      @JsonKey(name: 'note') this.note});

  factory _$_ServiceRequestMeta.fromJson(Map<String, dynamic> json) =>
      _$$_ServiceRequestMetaFromJson(json);

  @override
  @JsonKey(name: 'ccc_number')
  final String? cccNumber;
  @override
  @JsonKey(name: 'is_ccc_number_valid')
  final bool? isCccNumberValid;
  @override
  @JsonKey(name: 'note')
  final String? note;

  @override
  String toString() {
    return 'ServiceRequestMeta(cccNumber: $cccNumber, isCccNumberValid: $isCccNumberValid, note: $note)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ServiceRequestMeta &&
            const DeepCollectionEquality().equals(other.cccNumber, cccNumber) &&
            const DeepCollectionEquality()
                .equals(other.isCccNumberValid, isCccNumberValid) &&
            const DeepCollectionEquality().equals(other.note, note));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(cccNumber),
      const DeepCollectionEquality().hash(isCccNumberValid),
      const DeepCollectionEquality().hash(note));

  @JsonKey(ignore: true)
  @override
  _$$_ServiceRequestMetaCopyWith<_$_ServiceRequestMeta> get copyWith =>
      __$$_ServiceRequestMetaCopyWithImpl<_$_ServiceRequestMeta>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ServiceRequestMetaToJson(this);
  }
}

abstract class _ServiceRequestMeta implements ServiceRequestMeta {
  factory _ServiceRequestMeta(
      {@JsonKey(name: 'ccc_number') final String? cccNumber,
      @JsonKey(name: 'is_ccc_number_valid') final bool? isCccNumberValid,
      @JsonKey(name: 'note') final String? note}) = _$_ServiceRequestMeta;

  factory _ServiceRequestMeta.fromJson(Map<String, dynamic> json) =
      _$_ServiceRequestMeta.fromJson;

  @override
  @JsonKey(name: 'ccc_number')
  String? get cccNumber => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'is_ccc_number_valid')
  bool? get isCccNumberValid => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'note')
  String? get note => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_ServiceRequestMetaCopyWith<_$_ServiceRequestMeta> get copyWith =>
      throw _privateConstructorUsedError;
}
