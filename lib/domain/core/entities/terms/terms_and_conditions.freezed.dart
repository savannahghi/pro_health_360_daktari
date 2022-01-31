// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'terms_and_conditions.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

TermsAndConditions _$TermsAndConditionsFromJson(Map<String, dynamic> json) {
  return _TermsAndConditions.fromJson(json);
}

/// @nodoc
class _$TermsAndConditionsTearOff {
  const _$TermsAndConditionsTearOff();

  _TermsAndConditions call(
      {@JsonKey(name: 'termsID') required int termsId,
      @JsonKey(name: 'text') required String text}) {
    return _TermsAndConditions(
      termsId: termsId,
      text: text,
    );
  }

  TermsAndConditions fromJson(Map<String, Object> json) {
    return TermsAndConditions.fromJson(json);
  }
}

/// @nodoc
const $TermsAndConditions = _$TermsAndConditionsTearOff();

/// @nodoc
mixin _$TermsAndConditions {
  @JsonKey(name: 'termsID')
  int get termsId => throw _privateConstructorUsedError;
  @JsonKey(name: 'text')
  String get text => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TermsAndConditionsCopyWith<TermsAndConditions> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TermsAndConditionsCopyWith<$Res> {
  factory $TermsAndConditionsCopyWith(
          TermsAndConditions value, $Res Function(TermsAndConditions) then) =
      _$TermsAndConditionsCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: 'termsID') int termsId,
      @JsonKey(name: 'text') String text});
}

/// @nodoc
class _$TermsAndConditionsCopyWithImpl<$Res>
    implements $TermsAndConditionsCopyWith<$Res> {
  _$TermsAndConditionsCopyWithImpl(this._value, this._then);

  final TermsAndConditions _value;
  // ignore: unused_field
  final $Res Function(TermsAndConditions) _then;

  @override
  $Res call({
    Object? termsId = freezed,
    Object? text = freezed,
  }) {
    return _then(_value.copyWith(
      termsId: termsId == freezed
          ? _value.termsId
          : termsId // ignore: cast_nullable_to_non_nullable
              as int,
      text: text == freezed
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$TermsAndConditionsCopyWith<$Res>
    implements $TermsAndConditionsCopyWith<$Res> {
  factory _$TermsAndConditionsCopyWith(
          _TermsAndConditions value, $Res Function(_TermsAndConditions) then) =
      __$TermsAndConditionsCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: 'termsID') int termsId,
      @JsonKey(name: 'text') String text});
}

/// @nodoc
class __$TermsAndConditionsCopyWithImpl<$Res>
    extends _$TermsAndConditionsCopyWithImpl<$Res>
    implements _$TermsAndConditionsCopyWith<$Res> {
  __$TermsAndConditionsCopyWithImpl(
      _TermsAndConditions _value, $Res Function(_TermsAndConditions) _then)
      : super(_value, (v) => _then(v as _TermsAndConditions));

  @override
  _TermsAndConditions get _value => super._value as _TermsAndConditions;

  @override
  $Res call({
    Object? termsId = freezed,
    Object? text = freezed,
  }) {
    return _then(_TermsAndConditions(
      termsId: termsId == freezed
          ? _value.termsId
          : termsId // ignore: cast_nullable_to_non_nullable
              as int,
      text: text == freezed
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_TermsAndConditions implements _TermsAndConditions {
  _$_TermsAndConditions(
      {@JsonKey(name: 'termsID') required this.termsId,
      @JsonKey(name: 'text') required this.text});

  factory _$_TermsAndConditions.fromJson(Map<String, dynamic> json) =>
      _$_$_TermsAndConditionsFromJson(json);

  @override
  @JsonKey(name: 'termsID')
  final int termsId;
  @override
  @JsonKey(name: 'text')
  final String text;

  @override
  String toString() {
    return 'TermsAndConditions(termsId: $termsId, text: $text)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _TermsAndConditions &&
            (identical(other.termsId, termsId) ||
                const DeepCollectionEquality()
                    .equals(other.termsId, termsId)) &&
            (identical(other.text, text) ||
                const DeepCollectionEquality().equals(other.text, text)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(termsId) ^
      const DeepCollectionEquality().hash(text);

  @JsonKey(ignore: true)
  @override
  _$TermsAndConditionsCopyWith<_TermsAndConditions> get copyWith =>
      __$TermsAndConditionsCopyWithImpl<_TermsAndConditions>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_TermsAndConditionsToJson(this);
  }
}

abstract class _TermsAndConditions implements TermsAndConditions {
  factory _TermsAndConditions(
      {@JsonKey(name: 'termsID') required int termsId,
      @JsonKey(name: 'text') required String text}) = _$_TermsAndConditions;

  factory _TermsAndConditions.fromJson(Map<String, dynamic> json) =
      _$_TermsAndConditions.fromJson;

  @override
  @JsonKey(name: 'termsID')
  int get termsId => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'text')
  String get text => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$TermsAndConditionsCopyWith<_TermsAndConditions> get copyWith =>
      throw _privateConstructorUsedError;
}
