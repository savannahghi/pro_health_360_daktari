// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'event_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

EventState _$EventStateFromJson(Map<String, dynamic> json) {
  return _EventState.fromJson(json);
}

/// @nodoc
class _$EventStateTearOff {
  const _$EventStateTearOff();

  _EventState call({String? eventName, String? eventPayload}) {
    return _EventState(
      eventName: eventName,
      eventPayload: eventPayload,
    );
  }

  EventState fromJson(Map<String, Object> json) {
    return EventState.fromJson(json);
  }
}

/// @nodoc
const $EventState = _$EventStateTearOff();

/// @nodoc
mixin _$EventState {
  String? get eventName => throw _privateConstructorUsedError;
  String? get eventPayload => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $EventStateCopyWith<EventState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EventStateCopyWith<$Res> {
  factory $EventStateCopyWith(
          EventState value, $Res Function(EventState) then) =
      _$EventStateCopyWithImpl<$Res>;
  $Res call({String? eventName, String? eventPayload});
}

/// @nodoc
class _$EventStateCopyWithImpl<$Res> implements $EventStateCopyWith<$Res> {
  _$EventStateCopyWithImpl(this._value, this._then);

  final EventState _value;
  // ignore: unused_field
  final $Res Function(EventState) _then;

  @override
  $Res call({
    Object? eventName = freezed,
    Object? eventPayload = freezed,
  }) {
    return _then(_value.copyWith(
      eventName: eventName == freezed
          ? _value.eventName
          : eventName // ignore: cast_nullable_to_non_nullable
              as String?,
      eventPayload: eventPayload == freezed
          ? _value.eventPayload
          : eventPayload // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$EventStateCopyWith<$Res> implements $EventStateCopyWith<$Res> {
  factory _$EventStateCopyWith(
          _EventState value, $Res Function(_EventState) then) =
      __$EventStateCopyWithImpl<$Res>;
  @override
  $Res call({String? eventName, String? eventPayload});
}

/// @nodoc
class __$EventStateCopyWithImpl<$Res> extends _$EventStateCopyWithImpl<$Res>
    implements _$EventStateCopyWith<$Res> {
  __$EventStateCopyWithImpl(
      _EventState _value, $Res Function(_EventState) _then)
      : super(_value, (v) => _then(v as _EventState));

  @override
  _EventState get _value => super._value as _EventState;

  @override
  $Res call({
    Object? eventName = freezed,
    Object? eventPayload = freezed,
  }) {
    return _then(_EventState(
      eventName: eventName == freezed
          ? _value.eventName
          : eventName // ignore: cast_nullable_to_non_nullable
              as String?,
      eventPayload: eventPayload == freezed
          ? _value.eventPayload
          : eventPayload // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_EventState implements _EventState {
  _$_EventState({this.eventName, this.eventPayload});

  factory _$_EventState.fromJson(Map<String, dynamic> json) =>
      _$_$_EventStateFromJson(json);

  @override
  final String? eventName;
  @override
  final String? eventPayload;

  @override
  String toString() {
    return 'EventState(eventName: $eventName, eventPayload: $eventPayload)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _EventState &&
            (identical(other.eventName, eventName) ||
                const DeepCollectionEquality()
                    .equals(other.eventName, eventName)) &&
            (identical(other.eventPayload, eventPayload) ||
                const DeepCollectionEquality()
                    .equals(other.eventPayload, eventPayload)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(eventName) ^
      const DeepCollectionEquality().hash(eventPayload);

  @JsonKey(ignore: true)
  @override
  _$EventStateCopyWith<_EventState> get copyWith =>
      __$EventStateCopyWithImpl<_EventState>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_EventStateToJson(this);
  }
}

abstract class _EventState implements EventState {
  factory _EventState({String? eventName, String? eventPayload}) =
      _$_EventState;

  factory _EventState.fromJson(Map<String, dynamic> json) =
      _$_EventState.fromJson;

  @override
  String? get eventName => throw _privateConstructorUsedError;
  @override
  String? get eventPayload => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$EventStateCopyWith<_EventState> get copyWith =>
      throw _privateConstructorUsedError;
}
