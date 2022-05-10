// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'surveys_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

SurveysResponse _$SurveysResponseFromJson(Map<String, dynamic> json) {
  return _SurveysResponse.fromJson(json);
}

/// @nodoc
class _$SurveysResponseTearOff {
  const _$SurveysResponseTearOff();

  _SurveysResponse call(
      {@JsonKey(name: 'listSurveys') List<Survey?>? surveys}) {
    return _SurveysResponse(
      surveys: surveys,
    );
  }

  SurveysResponse fromJson(Map<String, Object?> json) {
    return SurveysResponse.fromJson(json);
  }
}

/// @nodoc
const $SurveysResponse = _$SurveysResponseTearOff();

/// @nodoc
mixin _$SurveysResponse {
  @JsonKey(name: 'listSurveys')
  List<Survey?>? get surveys => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SurveysResponseCopyWith<SurveysResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SurveysResponseCopyWith<$Res> {
  factory $SurveysResponseCopyWith(
          SurveysResponse value, $Res Function(SurveysResponse) then) =
      _$SurveysResponseCopyWithImpl<$Res>;
  $Res call({@JsonKey(name: 'listSurveys') List<Survey?>? surveys});
}

/// @nodoc
class _$SurveysResponseCopyWithImpl<$Res>
    implements $SurveysResponseCopyWith<$Res> {
  _$SurveysResponseCopyWithImpl(this._value, this._then);

  final SurveysResponse _value;
  // ignore: unused_field
  final $Res Function(SurveysResponse) _then;

  @override
  $Res call({
    Object? surveys = freezed,
  }) {
    return _then(_value.copyWith(
      surveys: surveys == freezed
          ? _value.surveys
          : surveys // ignore: cast_nullable_to_non_nullable
              as List<Survey?>?,
    ));
  }
}

/// @nodoc
abstract class _$SurveysResponseCopyWith<$Res>
    implements $SurveysResponseCopyWith<$Res> {
  factory _$SurveysResponseCopyWith(
          _SurveysResponse value, $Res Function(_SurveysResponse) then) =
      __$SurveysResponseCopyWithImpl<$Res>;
  @override
  $Res call({@JsonKey(name: 'listSurveys') List<Survey?>? surveys});
}

/// @nodoc
class __$SurveysResponseCopyWithImpl<$Res>
    extends _$SurveysResponseCopyWithImpl<$Res>
    implements _$SurveysResponseCopyWith<$Res> {
  __$SurveysResponseCopyWithImpl(
      _SurveysResponse _value, $Res Function(_SurveysResponse) _then)
      : super(_value, (v) => _then(v as _SurveysResponse));

  @override
  _SurveysResponse get _value => super._value as _SurveysResponse;

  @override
  $Res call({
    Object? surveys = freezed,
  }) {
    return _then(_SurveysResponse(
      surveys: surveys == freezed
          ? _value.surveys
          : surveys // ignore: cast_nullable_to_non_nullable
              as List<Survey?>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_SurveysResponse implements _SurveysResponse {
  _$_SurveysResponse({@JsonKey(name: 'listSurveys') this.surveys});

  factory _$_SurveysResponse.fromJson(Map<String, dynamic> json) =>
      _$$_SurveysResponseFromJson(json);

  @override
  @JsonKey(name: 'listSurveys')
  final List<Survey?>? surveys;

  @override
  String toString() {
    return 'SurveysResponse(surveys: $surveys)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _SurveysResponse &&
            const DeepCollectionEquality().equals(other.surveys, surveys));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(surveys));

  @JsonKey(ignore: true)
  @override
  _$SurveysResponseCopyWith<_SurveysResponse> get copyWith =>
      __$SurveysResponseCopyWithImpl<_SurveysResponse>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_SurveysResponseToJson(this);
  }
}

abstract class _SurveysResponse implements SurveysResponse {
  factory _SurveysResponse(
          {@JsonKey(name: 'listSurveys') List<Survey?>? surveys}) =
      _$_SurveysResponse;

  factory _SurveysResponse.fromJson(Map<String, dynamic> json) =
      _$_SurveysResponse.fromJson;

  @override
  @JsonKey(name: 'listSurveys')
  List<Survey?>? get surveys;
  @override
  @JsonKey(ignore: true)
  _$SurveysResponseCopyWith<_SurveysResponse> get copyWith =>
      throw _privateConstructorUsedError;
}
