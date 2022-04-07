// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'tool_type.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ToolType _$ToolTypeFromJson(Map<String, dynamic> json) {
  return _ToolType.fromJson(json);
}

/// @nodoc
class _$ToolTypeTearOff {
  const _$ToolTypeTearOff();

  _ToolType call({@JsonKey(name: 'toolType') ScreeningToolsType? toolType}) {
    return _ToolType(
      toolType: toolType,
    );
  }

  ToolType fromJson(Map<String, Object?> json) {
    return ToolType.fromJson(json);
  }
}

/// @nodoc
const $ToolType = _$ToolTypeTearOff();

/// @nodoc
mixin _$ToolType {
  @JsonKey(name: 'toolType')
  ScreeningToolsType? get toolType => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ToolTypeCopyWith<ToolType> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ToolTypeCopyWith<$Res> {
  factory $ToolTypeCopyWith(ToolType value, $Res Function(ToolType) then) =
      _$ToolTypeCopyWithImpl<$Res>;
  $Res call({@JsonKey(name: 'toolType') ScreeningToolsType? toolType});
}

/// @nodoc
class _$ToolTypeCopyWithImpl<$Res> implements $ToolTypeCopyWith<$Res> {
  _$ToolTypeCopyWithImpl(this._value, this._then);

  final ToolType _value;
  // ignore: unused_field
  final $Res Function(ToolType) _then;

  @override
  $Res call({
    Object? toolType = freezed,
  }) {
    return _then(_value.copyWith(
      toolType: toolType == freezed
          ? _value.toolType
          : toolType // ignore: cast_nullable_to_non_nullable
              as ScreeningToolsType?,
    ));
  }
}

/// @nodoc
abstract class _$ToolTypeCopyWith<$Res> implements $ToolTypeCopyWith<$Res> {
  factory _$ToolTypeCopyWith(_ToolType value, $Res Function(_ToolType) then) =
      __$ToolTypeCopyWithImpl<$Res>;
  @override
  $Res call({@JsonKey(name: 'toolType') ScreeningToolsType? toolType});
}

/// @nodoc
class __$ToolTypeCopyWithImpl<$Res> extends _$ToolTypeCopyWithImpl<$Res>
    implements _$ToolTypeCopyWith<$Res> {
  __$ToolTypeCopyWithImpl(_ToolType _value, $Res Function(_ToolType) _then)
      : super(_value, (v) => _then(v as _ToolType));

  @override
  _ToolType get _value => super._value as _ToolType;

  @override
  $Res call({
    Object? toolType = freezed,
  }) {
    return _then(_ToolType(
      toolType: toolType == freezed
          ? _value.toolType
          : toolType // ignore: cast_nullable_to_non_nullable
              as ScreeningToolsType?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ToolType implements _ToolType {
  _$_ToolType({@JsonKey(name: 'toolType') this.toolType});

  factory _$_ToolType.fromJson(Map<String, dynamic> json) =>
      _$$_ToolTypeFromJson(json);

  @override
  @JsonKey(name: 'toolType')
  final ScreeningToolsType? toolType;

  @override
  String toString() {
    return 'ToolType(toolType: $toolType)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ToolType &&
            const DeepCollectionEquality().equals(other.toolType, toolType));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(toolType));

  @JsonKey(ignore: true)
  @override
  _$ToolTypeCopyWith<_ToolType> get copyWith =>
      __$ToolTypeCopyWithImpl<_ToolType>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ToolTypeToJson(this);
  }
}

abstract class _ToolType implements ToolType {
  factory _ToolType({@JsonKey(name: 'toolType') ScreeningToolsType? toolType}) =
      _$_ToolType;

  factory _ToolType.fromJson(Map<String, dynamic> json) = _$_ToolType.fromJson;

  @override
  @JsonKey(name: 'toolType')
  ScreeningToolsType? get toolType;
  @override
  @JsonKey(ignore: true)
  _$ToolTypeCopyWith<_ToolType> get copyWith =>
      throw _privateConstructorUsedError;
}
