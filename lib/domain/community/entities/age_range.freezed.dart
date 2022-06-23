// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'age_range.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

AgeRange _$AgeRangeFromJson(Map<String, dynamic> json) {
  return _AgeRange.fromJson(json);
}

/// @nodoc
class _$AgeRangeTearOff {
  const _$AgeRangeTearOff();

  _AgeRange call(
      {@JsonKey(name: 'lowerBound') int? lowerBound,
      @JsonKey(name: 'upperBound') int? upperBound}) {
    return _AgeRange(
      lowerBound: lowerBound,
      upperBound: upperBound,
    );
  }

  AgeRange fromJson(Map<String, Object?> json) {
    return AgeRange.fromJson(json);
  }
}

/// @nodoc
const $AgeRange = _$AgeRangeTearOff();

/// @nodoc
mixin _$AgeRange {
  @JsonKey(name: 'lowerBound')
  int? get lowerBound => throw _privateConstructorUsedError;
  @JsonKey(name: 'upperBound')
  int? get upperBound => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AgeRangeCopyWith<AgeRange> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AgeRangeCopyWith<$Res> {
  factory $AgeRangeCopyWith(AgeRange value, $Res Function(AgeRange) then) =
      _$AgeRangeCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: 'lowerBound') int? lowerBound,
      @JsonKey(name: 'upperBound') int? upperBound});
}

/// @nodoc
class _$AgeRangeCopyWithImpl<$Res> implements $AgeRangeCopyWith<$Res> {
  _$AgeRangeCopyWithImpl(this._value, this._then);

  final AgeRange _value;
  // ignore: unused_field
  final $Res Function(AgeRange) _then;

  @override
  $Res call({
    Object? lowerBound = freezed,
    Object? upperBound = freezed,
  }) {
    return _then(_value.copyWith(
      lowerBound: lowerBound == freezed
          ? _value.lowerBound
          : lowerBound // ignore: cast_nullable_to_non_nullable
              as int?,
      upperBound: upperBound == freezed
          ? _value.upperBound
          : upperBound // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
abstract class _$AgeRangeCopyWith<$Res> implements $AgeRangeCopyWith<$Res> {
  factory _$AgeRangeCopyWith(_AgeRange value, $Res Function(_AgeRange) then) =
      __$AgeRangeCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: 'lowerBound') int? lowerBound,
      @JsonKey(name: 'upperBound') int? upperBound});
}

/// @nodoc
class __$AgeRangeCopyWithImpl<$Res> extends _$AgeRangeCopyWithImpl<$Res>
    implements _$AgeRangeCopyWith<$Res> {
  __$AgeRangeCopyWithImpl(_AgeRange _value, $Res Function(_AgeRange) _then)
      : super(_value, (v) => _then(v as _AgeRange));

  @override
  _AgeRange get _value => super._value as _AgeRange;

  @override
  $Res call({
    Object? lowerBound = freezed,
    Object? upperBound = freezed,
  }) {
    return _then(_AgeRange(
      lowerBound: lowerBound == freezed
          ? _value.lowerBound
          : lowerBound // ignore: cast_nullable_to_non_nullable
              as int?,
      upperBound: upperBound == freezed
          ? _value.upperBound
          : upperBound // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_AgeRange implements _AgeRange {
  _$_AgeRange(
      {@JsonKey(name: 'lowerBound') this.lowerBound,
      @JsonKey(name: 'upperBound') this.upperBound});

  factory _$_AgeRange.fromJson(Map<String, dynamic> json) =>
      _$$_AgeRangeFromJson(json);

  @override
  @JsonKey(name: 'lowerBound')
  final int? lowerBound;
  @override
  @JsonKey(name: 'upperBound')
  final int? upperBound;

  @override
  String toString() {
    return 'AgeRange(lowerBound: $lowerBound, upperBound: $upperBound)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _AgeRange &&
            const DeepCollectionEquality()
                .equals(other.lowerBound, lowerBound) &&
            const DeepCollectionEquality()
                .equals(other.upperBound, upperBound));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(lowerBound),
      const DeepCollectionEquality().hash(upperBound));

  @JsonKey(ignore: true)
  @override
  _$AgeRangeCopyWith<_AgeRange> get copyWith =>
      __$AgeRangeCopyWithImpl<_AgeRange>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_AgeRangeToJson(this);
  }
}

abstract class _AgeRange implements AgeRange {
  factory _AgeRange(
      {@JsonKey(name: 'lowerBound') int? lowerBound,
      @JsonKey(name: 'upperBound') int? upperBound}) = _$_AgeRange;

  factory _AgeRange.fromJson(Map<String, dynamic> json) = _$_AgeRange.fromJson;

  @override
  @JsonKey(name: 'lowerBound')
  int? get lowerBound;
  @override
  @JsonKey(name: 'upperBound')
  int? get upperBound;
  @override
  @JsonKey(ignore: true)
  _$AgeRangeCopyWith<_AgeRange> get copyWith =>
      throw _privateConstructorUsedError;
}
