// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'terms_and_conditions_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

TermsAndConditionsResponse _$TermsAndConditionsResponseFromJson(
    Map<String, dynamic> json) {
  return _TermsAndConditionsResponse.fromJson(json);
}

/// @nodoc
class _$TermsAndConditionsResponseTearOff {
  const _$TermsAndConditionsResponseTearOff();

  _TermsAndConditionsResponse call(
      {@JsonKey(name: 'getCurrentTerms')
          required TermsAndConditions termsAndConditions}) {
    return _TermsAndConditionsResponse(
      termsAndConditions: termsAndConditions,
    );
  }

  TermsAndConditionsResponse fromJson(Map<String, Object> json) {
    return TermsAndConditionsResponse.fromJson(json);
  }
}

/// @nodoc
const $TermsAndConditionsResponse = _$TermsAndConditionsResponseTearOff();

/// @nodoc
mixin _$TermsAndConditionsResponse {
  @JsonKey(name: 'getCurrentTerms')
  TermsAndConditions get termsAndConditions =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TermsAndConditionsResponseCopyWith<TermsAndConditionsResponse>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TermsAndConditionsResponseCopyWith<$Res> {
  factory $TermsAndConditionsResponseCopyWith(TermsAndConditionsResponse value,
          $Res Function(TermsAndConditionsResponse) then) =
      _$TermsAndConditionsResponseCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: 'getCurrentTerms')
          TermsAndConditions termsAndConditions});

  $TermsAndConditionsCopyWith<$Res> get termsAndConditions;
}

/// @nodoc
class _$TermsAndConditionsResponseCopyWithImpl<$Res>
    implements $TermsAndConditionsResponseCopyWith<$Res> {
  _$TermsAndConditionsResponseCopyWithImpl(this._value, this._then);

  final TermsAndConditionsResponse _value;
  // ignore: unused_field
  final $Res Function(TermsAndConditionsResponse) _then;

  @override
  $Res call({
    Object? termsAndConditions = freezed,
  }) {
    return _then(_value.copyWith(
      termsAndConditions: termsAndConditions == freezed
          ? _value.termsAndConditions
          : termsAndConditions // ignore: cast_nullable_to_non_nullable
              as TermsAndConditions,
    ));
  }

  @override
  $TermsAndConditionsCopyWith<$Res> get termsAndConditions {
    return $TermsAndConditionsCopyWith<$Res>(_value.termsAndConditions,
        (value) {
      return _then(_value.copyWith(termsAndConditions: value));
    });
  }
}

/// @nodoc
abstract class _$TermsAndConditionsResponseCopyWith<$Res>
    implements $TermsAndConditionsResponseCopyWith<$Res> {
  factory _$TermsAndConditionsResponseCopyWith(
          _TermsAndConditionsResponse value,
          $Res Function(_TermsAndConditionsResponse) then) =
      __$TermsAndConditionsResponseCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: 'getCurrentTerms')
          TermsAndConditions termsAndConditions});

  @override
  $TermsAndConditionsCopyWith<$Res> get termsAndConditions;
}

/// @nodoc
class __$TermsAndConditionsResponseCopyWithImpl<$Res>
    extends _$TermsAndConditionsResponseCopyWithImpl<$Res>
    implements _$TermsAndConditionsResponseCopyWith<$Res> {
  __$TermsAndConditionsResponseCopyWithImpl(_TermsAndConditionsResponse _value,
      $Res Function(_TermsAndConditionsResponse) _then)
      : super(_value, (v) => _then(v as _TermsAndConditionsResponse));

  @override
  _TermsAndConditionsResponse get _value =>
      super._value as _TermsAndConditionsResponse;

  @override
  $Res call({
    Object? termsAndConditions = freezed,
  }) {
    return _then(_TermsAndConditionsResponse(
      termsAndConditions: termsAndConditions == freezed
          ? _value.termsAndConditions
          : termsAndConditions // ignore: cast_nullable_to_non_nullable
              as TermsAndConditions,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_TermsAndConditionsResponse implements _TermsAndConditionsResponse {
  _$_TermsAndConditionsResponse(
      {@JsonKey(name: 'getCurrentTerms') required this.termsAndConditions});

  factory _$_TermsAndConditionsResponse.fromJson(Map<String, dynamic> json) =>
      _$_$_TermsAndConditionsResponseFromJson(json);

  @override
  @JsonKey(name: 'getCurrentTerms')
  final TermsAndConditions termsAndConditions;

  @override
  String toString() {
    return 'TermsAndConditionsResponse(termsAndConditions: $termsAndConditions)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _TermsAndConditionsResponse &&
            (identical(other.termsAndConditions, termsAndConditions) ||
                const DeepCollectionEquality()
                    .equals(other.termsAndConditions, termsAndConditions)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(termsAndConditions);

  @JsonKey(ignore: true)
  @override
  _$TermsAndConditionsResponseCopyWith<_TermsAndConditionsResponse>
      get copyWith => __$TermsAndConditionsResponseCopyWithImpl<
          _TermsAndConditionsResponse>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_TermsAndConditionsResponseToJson(this);
  }
}

abstract class _TermsAndConditionsResponse
    implements TermsAndConditionsResponse {
  factory _TermsAndConditionsResponse(
          {@JsonKey(name: 'getCurrentTerms')
              required TermsAndConditions termsAndConditions}) =
      _$_TermsAndConditionsResponse;

  factory _TermsAndConditionsResponse.fromJson(Map<String, dynamic> json) =
      _$_TermsAndConditionsResponse.fromJson;

  @override
  @JsonKey(name: 'getCurrentTerms')
  TermsAndConditions get termsAndConditions =>
      throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$TermsAndConditionsResponseCopyWith<_TermsAndConditionsResponse>
      get copyWith => throw _privateConstructorUsedError;
}
