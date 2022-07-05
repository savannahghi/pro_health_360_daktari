// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'screening_tools_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ScreeningToolsState _$ScreeningToolsStateFromJson(Map<String, dynamic> json) {
  return _ScreeningToolsState.fromJson(json);
}

/// @nodoc
mixin _$ScreeningToolsState {
  @JsonKey(name: 'getAvailableFacilityScreeningTools')
  List<ToolType>? get availableTools => throw _privateConstructorUsedError;
  @JsonKey(name: 'getAssessmentResponsesByToolType')
  List<ToolAssessmentResponse>? get toolAssessmentResponses =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ScreeningToolsStateCopyWith<ScreeningToolsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ScreeningToolsStateCopyWith<$Res> {
  factory $ScreeningToolsStateCopyWith(
          ScreeningToolsState value, $Res Function(ScreeningToolsState) then) =
      _$ScreeningToolsStateCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: 'getAvailableFacilityScreeningTools')
          List<ToolType>? availableTools,
      @JsonKey(name: 'getAssessmentResponsesByToolType')
          List<ToolAssessmentResponse>? toolAssessmentResponses});
}

/// @nodoc
class _$ScreeningToolsStateCopyWithImpl<$Res>
    implements $ScreeningToolsStateCopyWith<$Res> {
  _$ScreeningToolsStateCopyWithImpl(this._value, this._then);

  final ScreeningToolsState _value;
  // ignore: unused_field
  final $Res Function(ScreeningToolsState) _then;

  @override
  $Res call({
    Object? availableTools = freezed,
    Object? toolAssessmentResponses = freezed,
  }) {
    return _then(_value.copyWith(
      availableTools: availableTools == freezed
          ? _value.availableTools
          : availableTools // ignore: cast_nullable_to_non_nullable
              as List<ToolType>?,
      toolAssessmentResponses: toolAssessmentResponses == freezed
          ? _value.toolAssessmentResponses
          : toolAssessmentResponses // ignore: cast_nullable_to_non_nullable
              as List<ToolAssessmentResponse>?,
    ));
  }
}

/// @nodoc
abstract class _$$_ScreeningToolsStateCopyWith<$Res>
    implements $ScreeningToolsStateCopyWith<$Res> {
  factory _$$_ScreeningToolsStateCopyWith(_$_ScreeningToolsState value,
          $Res Function(_$_ScreeningToolsState) then) =
      __$$_ScreeningToolsStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: 'getAvailableFacilityScreeningTools')
          List<ToolType>? availableTools,
      @JsonKey(name: 'getAssessmentResponsesByToolType')
          List<ToolAssessmentResponse>? toolAssessmentResponses});
}

/// @nodoc
class __$$_ScreeningToolsStateCopyWithImpl<$Res>
    extends _$ScreeningToolsStateCopyWithImpl<$Res>
    implements _$$_ScreeningToolsStateCopyWith<$Res> {
  __$$_ScreeningToolsStateCopyWithImpl(_$_ScreeningToolsState _value,
      $Res Function(_$_ScreeningToolsState) _then)
      : super(_value, (v) => _then(v as _$_ScreeningToolsState));

  @override
  _$_ScreeningToolsState get _value => super._value as _$_ScreeningToolsState;

  @override
  $Res call({
    Object? availableTools = freezed,
    Object? toolAssessmentResponses = freezed,
  }) {
    return _then(_$_ScreeningToolsState(
      availableTools: availableTools == freezed
          ? _value.availableTools
          : availableTools // ignore: cast_nullable_to_non_nullable
              as List<ToolType>?,
      toolAssessmentResponses: toolAssessmentResponses == freezed
          ? _value.toolAssessmentResponses
          : toolAssessmentResponses // ignore: cast_nullable_to_non_nullable
              as List<ToolAssessmentResponse>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ScreeningToolsState implements _ScreeningToolsState {
  _$_ScreeningToolsState(
      {@JsonKey(name: 'getAvailableFacilityScreeningTools')
          this.availableTools,
      @JsonKey(name: 'getAssessmentResponsesByToolType')
          this.toolAssessmentResponses});

  factory _$_ScreeningToolsState.fromJson(Map<String, dynamic> json) =>
      _$$_ScreeningToolsStateFromJson(json);

  @override
  @JsonKey(name: 'getAvailableFacilityScreeningTools')
  final List<ToolType>? availableTools;
  @override
  @JsonKey(name: 'getAssessmentResponsesByToolType')
  final List<ToolAssessmentResponse>? toolAssessmentResponses;

  @override
  String toString() {
    return 'ScreeningToolsState(availableTools: $availableTools, toolAssessmentResponses: $toolAssessmentResponses)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ScreeningToolsState &&
            const DeepCollectionEquality()
                .equals(other.availableTools, availableTools) &&
            const DeepCollectionEquality().equals(
                other.toolAssessmentResponses, toolAssessmentResponses));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(availableTools),
      const DeepCollectionEquality().hash(toolAssessmentResponses));

  @JsonKey(ignore: true)
  @override
  _$$_ScreeningToolsStateCopyWith<_$_ScreeningToolsState> get copyWith =>
      __$$_ScreeningToolsStateCopyWithImpl<_$_ScreeningToolsState>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ScreeningToolsStateToJson(this);
  }
}

abstract class _ScreeningToolsState implements ScreeningToolsState {
  factory _ScreeningToolsState(
          {@JsonKey(name: 'getAvailableFacilityScreeningTools')
              final List<ToolType>? availableTools,
          @JsonKey(name: 'getAssessmentResponsesByToolType')
              final List<ToolAssessmentResponse>? toolAssessmentResponses}) =
      _$_ScreeningToolsState;

  factory _ScreeningToolsState.fromJson(Map<String, dynamic> json) =
      _$_ScreeningToolsState.fromJson;

  @override
  @JsonKey(name: 'getAvailableFacilityScreeningTools')
  List<ToolType>? get availableTools => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'getAssessmentResponsesByToolType')
  List<ToolAssessmentResponse>? get toolAssessmentResponses =>
      throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_ScreeningToolsStateCopyWith<_$_ScreeningToolsState> get copyWith =>
      throw _privateConstructorUsedError;
}
