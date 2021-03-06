// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'survey.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Survey _$SurveyFromJson(Map<String, dynamic> json) {
  return _Survey.fromJson(json);
}

/// @nodoc
mixin _$Survey {
  @JsonKey(name: 'projectId')
  int? get projectId => throw _privateConstructorUsedError;
  @JsonKey(name: 'xmlFormId')
  String? get xmlFormId => throw _privateConstructorUsedError;
  @JsonKey(name: 'name')
  String? get name => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SurveyCopyWith<Survey> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SurveyCopyWith<$Res> {
  factory $SurveyCopyWith(Survey value, $Res Function(Survey) then) =
      _$SurveyCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: 'projectId') int? projectId,
      @JsonKey(name: 'xmlFormId') String? xmlFormId,
      @JsonKey(name: 'name') String? name});
}

/// @nodoc
class _$SurveyCopyWithImpl<$Res> implements $SurveyCopyWith<$Res> {
  _$SurveyCopyWithImpl(this._value, this._then);

  final Survey _value;
  // ignore: unused_field
  final $Res Function(Survey) _then;

  @override
  $Res call({
    Object? projectId = freezed,
    Object? xmlFormId = freezed,
    Object? name = freezed,
  }) {
    return _then(_value.copyWith(
      projectId: projectId == freezed
          ? _value.projectId
          : projectId // ignore: cast_nullable_to_non_nullable
              as int?,
      xmlFormId: xmlFormId == freezed
          ? _value.xmlFormId
          : xmlFormId // ignore: cast_nullable_to_non_nullable
              as String?,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$$_SurveyCopyWith<$Res> implements $SurveyCopyWith<$Res> {
  factory _$$_SurveyCopyWith(_$_Survey value, $Res Function(_$_Survey) then) =
      __$$_SurveyCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: 'projectId') int? projectId,
      @JsonKey(name: 'xmlFormId') String? xmlFormId,
      @JsonKey(name: 'name') String? name});
}

/// @nodoc
class __$$_SurveyCopyWithImpl<$Res> extends _$SurveyCopyWithImpl<$Res>
    implements _$$_SurveyCopyWith<$Res> {
  __$$_SurveyCopyWithImpl(_$_Survey _value, $Res Function(_$_Survey) _then)
      : super(_value, (v) => _then(v as _$_Survey));

  @override
  _$_Survey get _value => super._value as _$_Survey;

  @override
  $Res call({
    Object? projectId = freezed,
    Object? xmlFormId = freezed,
    Object? name = freezed,
  }) {
    return _then(_$_Survey(
      projectId: projectId == freezed
          ? _value.projectId
          : projectId // ignore: cast_nullable_to_non_nullable
              as int?,
      xmlFormId: xmlFormId == freezed
          ? _value.xmlFormId
          : xmlFormId // ignore: cast_nullable_to_non_nullable
              as String?,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Survey implements _Survey {
  _$_Survey(
      {@JsonKey(name: 'projectId') this.projectId,
      @JsonKey(name: 'xmlFormId') this.xmlFormId,
      @JsonKey(name: 'name') this.name});

  factory _$_Survey.fromJson(Map<String, dynamic> json) =>
      _$$_SurveyFromJson(json);

  @override
  @JsonKey(name: 'projectId')
  final int? projectId;
  @override
  @JsonKey(name: 'xmlFormId')
  final String? xmlFormId;
  @override
  @JsonKey(name: 'name')
  final String? name;

  @override
  String toString() {
    return 'Survey(projectId: $projectId, xmlFormId: $xmlFormId, name: $name)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Survey &&
            const DeepCollectionEquality().equals(other.projectId, projectId) &&
            const DeepCollectionEquality().equals(other.xmlFormId, xmlFormId) &&
            const DeepCollectionEquality().equals(other.name, name));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(projectId),
      const DeepCollectionEquality().hash(xmlFormId),
      const DeepCollectionEquality().hash(name));

  @JsonKey(ignore: true)
  @override
  _$$_SurveyCopyWith<_$_Survey> get copyWith =>
      __$$_SurveyCopyWithImpl<_$_Survey>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_SurveyToJson(this);
  }
}

abstract class _Survey implements Survey {
  factory _Survey(
      {@JsonKey(name: 'projectId') final int? projectId,
      @JsonKey(name: 'xmlFormId') final String? xmlFormId,
      @JsonKey(name: 'name') final String? name}) = _$_Survey;

  factory _Survey.fromJson(Map<String, dynamic> json) = _$_Survey.fromJson;

  @override
  @JsonKey(name: 'projectId')
  int? get projectId => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'xmlFormId')
  String? get xmlFormId => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'name')
  String? get name => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_SurveyCopyWith<_$_Survey> get copyWith =>
      throw _privateConstructorUsedError;
}
