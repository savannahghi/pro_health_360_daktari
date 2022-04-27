// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'tool_service_request_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ToolAssessmentRequestResponse _$ToolAssessmentRequestResponseFromJson(
    Map<String, dynamic> json) {
  return _ToolAssessmentRequestResponse.fromJson(json);
}

/// @nodoc
class _$ToolAssessmentRequestResponseTearOff {
  const _$ToolAssessmentRequestResponseTearOff();

  _ToolAssessmentRequestResponse call(
      {@JsonKey(name: 'serviceRequestID')
          String? serviceRequestID,
      @JsonKey(name: 'clientContact')
          String? phoneNumber,
      @JsonKey(name: 'screeningToolResponses')
          List<AssessmentQuestionResponse>? questionsResponses}) {
    return _ToolAssessmentRequestResponse(
      serviceRequestID: serviceRequestID,
      phoneNumber: phoneNumber,
      questionsResponses: questionsResponses,
    );
  }

  ToolAssessmentRequestResponse fromJson(Map<String, Object?> json) {
    return ToolAssessmentRequestResponse.fromJson(json);
  }
}

/// @nodoc
const $ToolAssessmentRequestResponse = _$ToolAssessmentRequestResponseTearOff();

/// @nodoc
mixin _$ToolAssessmentRequestResponse {
  @JsonKey(name: 'serviceRequestID')
  String? get serviceRequestID => throw _privateConstructorUsedError;
  @JsonKey(name: 'clientContact')
  String? get phoneNumber => throw _privateConstructorUsedError;
  @JsonKey(name: 'screeningToolResponses')
  List<AssessmentQuestionResponse>? get questionsResponses =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ToolAssessmentRequestResponseCopyWith<ToolAssessmentRequestResponse>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ToolAssessmentRequestResponseCopyWith<$Res> {
  factory $ToolAssessmentRequestResponseCopyWith(
          ToolAssessmentRequestResponse value,
          $Res Function(ToolAssessmentRequestResponse) then) =
      _$ToolAssessmentRequestResponseCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: 'serviceRequestID')
          String? serviceRequestID,
      @JsonKey(name: 'clientContact')
          String? phoneNumber,
      @JsonKey(name: 'screeningToolResponses')
          List<AssessmentQuestionResponse>? questionsResponses});
}

/// @nodoc
class _$ToolAssessmentRequestResponseCopyWithImpl<$Res>
    implements $ToolAssessmentRequestResponseCopyWith<$Res> {
  _$ToolAssessmentRequestResponseCopyWithImpl(this._value, this._then);

  final ToolAssessmentRequestResponse _value;
  // ignore: unused_field
  final $Res Function(ToolAssessmentRequestResponse) _then;

  @override
  $Res call({
    Object? serviceRequestID = freezed,
    Object? phoneNumber = freezed,
    Object? questionsResponses = freezed,
  }) {
    return _then(_value.copyWith(
      serviceRequestID: serviceRequestID == freezed
          ? _value.serviceRequestID
          : serviceRequestID // ignore: cast_nullable_to_non_nullable
              as String?,
      phoneNumber: phoneNumber == freezed
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      questionsResponses: questionsResponses == freezed
          ? _value.questionsResponses
          : questionsResponses // ignore: cast_nullable_to_non_nullable
              as List<AssessmentQuestionResponse>?,
    ));
  }
}

/// @nodoc
abstract class _$ToolAssessmentRequestResponseCopyWith<$Res>
    implements $ToolAssessmentRequestResponseCopyWith<$Res> {
  factory _$ToolAssessmentRequestResponseCopyWith(
          _ToolAssessmentRequestResponse value,
          $Res Function(_ToolAssessmentRequestResponse) then) =
      __$ToolAssessmentRequestResponseCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: 'serviceRequestID')
          String? serviceRequestID,
      @JsonKey(name: 'clientContact')
          String? phoneNumber,
      @JsonKey(name: 'screeningToolResponses')
          List<AssessmentQuestionResponse>? questionsResponses});
}

/// @nodoc
class __$ToolAssessmentRequestResponseCopyWithImpl<$Res>
    extends _$ToolAssessmentRequestResponseCopyWithImpl<$Res>
    implements _$ToolAssessmentRequestResponseCopyWith<$Res> {
  __$ToolAssessmentRequestResponseCopyWithImpl(
      _ToolAssessmentRequestResponse _value,
      $Res Function(_ToolAssessmentRequestResponse) _then)
      : super(_value, (v) => _then(v as _ToolAssessmentRequestResponse));

  @override
  _ToolAssessmentRequestResponse get _value =>
      super._value as _ToolAssessmentRequestResponse;

  @override
  $Res call({
    Object? serviceRequestID = freezed,
    Object? phoneNumber = freezed,
    Object? questionsResponses = freezed,
  }) {
    return _then(_ToolAssessmentRequestResponse(
      serviceRequestID: serviceRequestID == freezed
          ? _value.serviceRequestID
          : serviceRequestID // ignore: cast_nullable_to_non_nullable
              as String?,
      phoneNumber: phoneNumber == freezed
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      questionsResponses: questionsResponses == freezed
          ? _value.questionsResponses
          : questionsResponses // ignore: cast_nullable_to_non_nullable
              as List<AssessmentQuestionResponse>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ToolAssessmentRequestResponse
    implements _ToolAssessmentRequestResponse {
  _$_ToolAssessmentRequestResponse(
      {@JsonKey(name: 'serviceRequestID') this.serviceRequestID,
      @JsonKey(name: 'clientContact') this.phoneNumber,
      @JsonKey(name: 'screeningToolResponses') this.questionsResponses});

  factory _$_ToolAssessmentRequestResponse.fromJson(
          Map<String, dynamic> json) =>
      _$$_ToolAssessmentRequestResponseFromJson(json);

  @override
  @JsonKey(name: 'serviceRequestID')
  final String? serviceRequestID;
  @override
  @JsonKey(name: 'clientContact')
  final String? phoneNumber;
  @override
  @JsonKey(name: 'screeningToolResponses')
  final List<AssessmentQuestionResponse>? questionsResponses;

  @override
  String toString() {
    return 'ToolAssessmentRequestResponse(serviceRequestID: $serviceRequestID, phoneNumber: $phoneNumber, questionsResponses: $questionsResponses)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ToolAssessmentRequestResponse &&
            const DeepCollectionEquality()
                .equals(other.serviceRequestID, serviceRequestID) &&
            const DeepCollectionEquality()
                .equals(other.phoneNumber, phoneNumber) &&
            const DeepCollectionEquality()
                .equals(other.questionsResponses, questionsResponses));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(serviceRequestID),
      const DeepCollectionEquality().hash(phoneNumber),
      const DeepCollectionEquality().hash(questionsResponses));

  @JsonKey(ignore: true)
  @override
  _$ToolAssessmentRequestResponseCopyWith<_ToolAssessmentRequestResponse>
      get copyWith => __$ToolAssessmentRequestResponseCopyWithImpl<
          _ToolAssessmentRequestResponse>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ToolAssessmentRequestResponseToJson(this);
  }
}

abstract class _ToolAssessmentRequestResponse
    implements ToolAssessmentRequestResponse {
  factory _ToolAssessmentRequestResponse(
          {@JsonKey(name: 'serviceRequestID')
              String? serviceRequestID,
          @JsonKey(name: 'clientContact')
              String? phoneNumber,
          @JsonKey(name: 'screeningToolResponses')
              List<AssessmentQuestionResponse>? questionsResponses}) =
      _$_ToolAssessmentRequestResponse;

  factory _ToolAssessmentRequestResponse.fromJson(Map<String, dynamic> json) =
      _$_ToolAssessmentRequestResponse.fromJson;

  @override
  @JsonKey(name: 'serviceRequestID')
  String? get serviceRequestID;
  @override
  @JsonKey(name: 'clientContact')
  String? get phoneNumber;
  @override
  @JsonKey(name: 'screeningToolResponses')
  List<AssessmentQuestionResponse>? get questionsResponses;
  @override
  @JsonKey(ignore: true)
  _$ToolAssessmentRequestResponseCopyWith<_ToolAssessmentRequestResponse>
      get copyWith => throw _privateConstructorUsedError;
}
