// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'facility.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Facility _$FacilityFromJson(Map<String, dynamic> json) {
  return _Facility.fromJson(json);
}

/// @nodoc
mixin _$Facility {
  @JsonKey(name: 'ID')
  String? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'name')
  String? get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'code')
  int? get code => throw _privateConstructorUsedError;
  @JsonKey(name: 'phone')
  String? get phone => throw _privateConstructorUsedError;
  @JsonKey(name: 'active', defaultValue: false)
  bool? get active => throw _privateConstructorUsedError;
  @JsonKey(name: 'county')
  String? get county => throw _privateConstructorUsedError;
  @JsonKey(name: 'description')
  String? get description => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FacilityCopyWith<Facility> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FacilityCopyWith<$Res> {
  factory $FacilityCopyWith(Facility value, $Res Function(Facility) then) =
      _$FacilityCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: 'ID') String? id,
      @JsonKey(name: 'name') String? name,
      @JsonKey(name: 'code') int? code,
      @JsonKey(name: 'phone') String? phone,
      @JsonKey(name: 'active', defaultValue: false) bool? active,
      @JsonKey(name: 'county') String? county,
      @JsonKey(name: 'description') String? description});
}

/// @nodoc
class _$FacilityCopyWithImpl<$Res> implements $FacilityCopyWith<$Res> {
  _$FacilityCopyWithImpl(this._value, this._then);

  final Facility _value;
  // ignore: unused_field
  final $Res Function(Facility) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? code = freezed,
    Object? phone = freezed,
    Object? active = freezed,
    Object? county = freezed,
    Object? description = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      code: code == freezed
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as int?,
      phone: phone == freezed
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String?,
      active: active == freezed
          ? _value.active
          : active // ignore: cast_nullable_to_non_nullable
              as bool?,
      county: county == freezed
          ? _value.county
          : county // ignore: cast_nullable_to_non_nullable
              as String?,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$$_FacilityCopyWith<$Res> implements $FacilityCopyWith<$Res> {
  factory _$$_FacilityCopyWith(
          _$_Facility value, $Res Function(_$_Facility) then) =
      __$$_FacilityCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: 'ID') String? id,
      @JsonKey(name: 'name') String? name,
      @JsonKey(name: 'code') int? code,
      @JsonKey(name: 'phone') String? phone,
      @JsonKey(name: 'active', defaultValue: false) bool? active,
      @JsonKey(name: 'county') String? county,
      @JsonKey(name: 'description') String? description});
}

/// @nodoc
class __$$_FacilityCopyWithImpl<$Res> extends _$FacilityCopyWithImpl<$Res>
    implements _$$_FacilityCopyWith<$Res> {
  __$$_FacilityCopyWithImpl(
      _$_Facility _value, $Res Function(_$_Facility) _then)
      : super(_value, (v) => _then(v as _$_Facility));

  @override
  _$_Facility get _value => super._value as _$_Facility;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? code = freezed,
    Object? phone = freezed,
    Object? active = freezed,
    Object? county = freezed,
    Object? description = freezed,
  }) {
    return _then(_$_Facility(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      code: code == freezed
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as int?,
      phone: phone == freezed
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String?,
      active: active == freezed
          ? _value.active
          : active // ignore: cast_nullable_to_non_nullable
              as bool?,
      county: county == freezed
          ? _value.county
          : county // ignore: cast_nullable_to_non_nullable
              as String?,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Facility implements _Facility {
  _$_Facility(
      {@JsonKey(name: 'ID') this.id,
      @JsonKey(name: 'name') this.name,
      @JsonKey(name: 'code') this.code,
      @JsonKey(name: 'phone') this.phone,
      @JsonKey(name: 'active', defaultValue: false) this.active,
      @JsonKey(name: 'county') this.county,
      @JsonKey(name: 'description') this.description});

  factory _$_Facility.fromJson(Map<String, dynamic> json) =>
      _$$_FacilityFromJson(json);

  @override
  @JsonKey(name: 'ID')
  final String? id;
  @override
  @JsonKey(name: 'name')
  final String? name;
  @override
  @JsonKey(name: 'code')
  final int? code;
  @override
  @JsonKey(name: 'phone')
  final String? phone;
  @override
  @JsonKey(name: 'active', defaultValue: false)
  final bool? active;
  @override
  @JsonKey(name: 'county')
  final String? county;
  @override
  @JsonKey(name: 'description')
  final String? description;

  @override
  String toString() {
    return 'Facility(id: $id, name: $name, code: $code, phone: $phone, active: $active, county: $county, description: $description)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Facility &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality().equals(other.code, code) &&
            const DeepCollectionEquality().equals(other.phone, phone) &&
            const DeepCollectionEquality().equals(other.active, active) &&
            const DeepCollectionEquality().equals(other.county, county) &&
            const DeepCollectionEquality()
                .equals(other.description, description));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(code),
      const DeepCollectionEquality().hash(phone),
      const DeepCollectionEquality().hash(active),
      const DeepCollectionEquality().hash(county),
      const DeepCollectionEquality().hash(description));

  @JsonKey(ignore: true)
  @override
  _$$_FacilityCopyWith<_$_Facility> get copyWith =>
      __$$_FacilityCopyWithImpl<_$_Facility>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_FacilityToJson(this);
  }
}

abstract class _Facility implements Facility {
  factory _Facility(
      {@JsonKey(name: 'ID') final String? id,
      @JsonKey(name: 'name') final String? name,
      @JsonKey(name: 'code') final int? code,
      @JsonKey(name: 'phone') final String? phone,
      @JsonKey(name: 'active', defaultValue: false) final bool? active,
      @JsonKey(name: 'county') final String? county,
      @JsonKey(name: 'description') final String? description}) = _$_Facility;

  factory _Facility.fromJson(Map<String, dynamic> json) = _$_Facility.fromJson;

  @override
  @JsonKey(name: 'ID')
  String? get id => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'name')
  String? get name => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'code')
  int? get code => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'phone')
  String? get phone => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'active', defaultValue: false)
  bool? get active => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'county')
  String? get county => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'description')
  String? get description => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_FacilityCopyWith<_$_Facility> get copyWith =>
      throw _privateConstructorUsedError;
}
