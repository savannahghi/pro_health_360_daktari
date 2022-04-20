// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'assessment_question_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

AssessmentQuestionResponse _$AssessmentQuestionResponseFromJson(
    Map<String, dynamic> json) {
  return _AssessmentQuestionResponse.fromJson(json);
}

/// @nodoc
class _$AssessmentQuestionResponseTearOff {
  const _$AssessmentQuestionResponseTearOff();

  _AssessmentQuestionResponse call(
      {@JsonKey(name: 'toolIndex') int? index,
      @JsonKey(name: 'tool') String? tool,
      @JsonKey(name: 'response') String? response}) {
    return _AssessmentQuestionResponse(
      index: index,
      tool: tool,
      response: response,
    );
  }

  AssessmentQuestionResponse fromJson(Map<String, Object?> json) {
    return AssessmentQuestionResponse.fromJson(json);
  }
}

/// @nodoc
const $AssessmentQuestionResponse = _$AssessmentQuestionResponseTearOff();

/// @nodoc
mixin _$AssessmentQuestionResponse {
  @JsonKey(name: 'toolIndex')
  int? get index => throw _privateConstructorUsedError;
  @JsonKey(name: 'tool')
  String? get tool => throw _privateConstructorUsedError;
  @JsonKey(name: 'response')
  String? get response => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AssessmentQuestionResponseCopyWith<AssessmentQuestionResponse>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AssessmentQuestionResponseCopyWith<$Res> {
  factory $AssessmentQuestionResponseCopyWith(AssessmentQuestionResponse value,
          $Res Function(AssessmentQuestionResponse) then) =
      _$AssessmentQuestionResponseCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: 'toolIndex') int? index,
      @JsonKey(name: 'tool') String? tool,
      @JsonKey(name: 'response') String? response});
}

/// @nodoc
class _$AssessmentQuestionResponseCopyWithImpl<$Res>
    implements $AssessmentQuestionResponseCopyWith<$Res> {
  _$AssessmentQuestionResponseCopyWithImpl(this._value, this._then);

  final AssessmentQuestionResponse _value;
  // ignore: unused_field
  final $Res Function(AssessmentQuestionResponse) _then;

  @override
  $Res call({
    Object? index = freezed,
    Object? tool = freezed,
    Object? response = freezed,
  }) {
    return _then(_value.copyWith(
      index: index == freezed
          ? _value.index
          : index // ignore: cast_nullable_to_non_nullable
              as int?,
      tool: tool == freezed
          ? _value.tool
          : tool // ignore: cast_nullable_to_non_nullable
              as String?,
      response: response == freezed
          ? _value.response
          : response // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$AssessmentQuestionResponseCopyWith<$Res>
    implements $AssessmentQuestionResponseCopyWith<$Res> {
  factory _$AssessmentQuestionResponseCopyWith(
          _AssessmentQuestionResponse value,
          $Res Function(_AssessmentQuestionResponse) then) =
      __$AssessmentQuestionResponseCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: 'toolIndex') int? index,
      @JsonKey(name: 'tool') String? tool,
      @JsonKey(name: 'response') String? response});
}

/// @nodoc
class __$AssessmentQuestionResponseCopyWithImpl<$Res>
    extends _$AssessmentQuestionResponseCopyWithImpl<$Res>
    implements _$AssessmentQuestionResponseCopyWith<$Res> {
  __$AssessmentQuestionResponseCopyWithImpl(_AssessmentQuestionResponse _value,
      $Res Function(_AssessmentQuestionResponse) _then)
      : super(_value, (v) => _then(v as _AssessmentQuestionResponse));

  @override
  _AssessmentQuestionResponse get _value =>
      super._value as _AssessmentQuestionResponse;

  @override
  $Res call({
    Object? index = freezed,
    Object? tool = freezed,
    Object? response = freezed,
  }) {
    return _then(_AssessmentQuestionResponse(
      index: index == freezed
          ? _value.index
          : index // ignore: cast_nullable_to_non_nullable
              as int?,
      tool: tool == freezed
          ? _value.tool
          : tool // ignore: cast_nullable_to_non_nullable
              as String?,
      response: response == freezed
          ? _value.response
          : response // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_AssessmentQuestionResponse implements _AssessmentQuestionResponse {
  _$_AssessmentQuestionResponse(
      {@JsonKey(name: 'toolIndex') this.index,
      @JsonKey(name: 'tool') this.tool,
      @JsonKey(name: 'response') this.response});

  factory _$_AssessmentQuestionResponse.fromJson(Map<String, dynamic> json) =>
      _$$_AssessmentQuestionResponseFromJson(json);

  @override
  @JsonKey(name: 'toolIndex')
  final int? index;
  @override
  @JsonKey(name: 'tool')
  final String? tool;
  @override
  @JsonKey(name: 'response')
  final String? response;

  @override
  String toString() {
    return 'AssessmentQuestionResponse(index: $index, tool: $tool, response: $response)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _AssessmentQuestionResponse &&
            const DeepCollectionEquality().equals(other.index, index) &&
            const DeepCollectionEquality().equals(other.tool, tool) &&
            const DeepCollectionEquality().equals(other.response, response));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(index),
      const DeepCollectionEquality().hash(tool),
      const DeepCollectionEquality().hash(response));

  @JsonKey(ignore: true)
  @override
  _$AssessmentQuestionResponseCopyWith<_AssessmentQuestionResponse>
      get copyWith => __$AssessmentQuestionResponseCopyWithImpl<
          _AssessmentQuestionResponse>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_AssessmentQuestionResponseToJson(this);
  }
}

abstract class _AssessmentQuestionResponse
    implements AssessmentQuestionResponse {
  factory _AssessmentQuestionResponse(
          {@JsonKey(name: 'toolIndex') int? index,
          @JsonKey(name: 'tool') String? tool,
          @JsonKey(name: 'response') String? response}) =
      _$_AssessmentQuestionResponse;

  factory _AssessmentQuestionResponse.fromJson(Map<String, dynamic> json) =
      _$_AssessmentQuestionResponse.fromJson;

  @override
  @JsonKey(name: 'toolIndex')
  int? get index;
  @override
  @JsonKey(name: 'tool')
  String? get tool;
  @override
  @JsonKey(name: 'response')
  String? get response;
  @override
  @JsonKey(ignore: true)
  _$AssessmentQuestionResponseCopyWith<_AssessmentQuestionResponse>
      get copyWith => throw _privateConstructorUsedError;
}
