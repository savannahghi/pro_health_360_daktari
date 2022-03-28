// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'flagged_message.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

FlaggedMessage _$FlaggedMessageFromJson(Map<String, dynamic> json) {
  return _FlaggedMessage.fromJson(json);
}

/// @nodoc
class _$FlaggedMessageTearOff {
  const _$FlaggedMessageTearOff();

  _FlaggedMessage call({@JsonKey(name: 'message') Message? message}) {
    return _FlaggedMessage(
      message: message,
    );
  }

  FlaggedMessage fromJson(Map<String, Object?> json) {
    return FlaggedMessage.fromJson(json);
  }
}

/// @nodoc
const $FlaggedMessage = _$FlaggedMessageTearOff();

/// @nodoc
mixin _$FlaggedMessage {
  @JsonKey(name: 'message')
  Message? get message => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FlaggedMessageCopyWith<FlaggedMessage> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FlaggedMessageCopyWith<$Res> {
  factory $FlaggedMessageCopyWith(
          FlaggedMessage value, $Res Function(FlaggedMessage) then) =
      _$FlaggedMessageCopyWithImpl<$Res>;
  $Res call({@JsonKey(name: 'message') Message? message});

  $MessageCopyWith<$Res>? get message;
}

/// @nodoc
class _$FlaggedMessageCopyWithImpl<$Res>
    implements $FlaggedMessageCopyWith<$Res> {
  _$FlaggedMessageCopyWithImpl(this._value, this._then);

  final FlaggedMessage _value;
  // ignore: unused_field
  final $Res Function(FlaggedMessage) _then;

  @override
  $Res call({
    Object? message = freezed,
  }) {
    return _then(_value.copyWith(
      message: message == freezed
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as Message?,
    ));
  }

  @override
  $MessageCopyWith<$Res>? get message {
    if (_value.message == null) {
      return null;
    }

    return $MessageCopyWith<$Res>(_value.message!, (value) {
      return _then(_value.copyWith(message: value));
    });
  }
}

/// @nodoc
abstract class _$FlaggedMessageCopyWith<$Res>
    implements $FlaggedMessageCopyWith<$Res> {
  factory _$FlaggedMessageCopyWith(
          _FlaggedMessage value, $Res Function(_FlaggedMessage) then) =
      __$FlaggedMessageCopyWithImpl<$Res>;
  @override
  $Res call({@JsonKey(name: 'message') Message? message});

  @override
  $MessageCopyWith<$Res>? get message;
}

/// @nodoc
class __$FlaggedMessageCopyWithImpl<$Res>
    extends _$FlaggedMessageCopyWithImpl<$Res>
    implements _$FlaggedMessageCopyWith<$Res> {
  __$FlaggedMessageCopyWithImpl(
      _FlaggedMessage _value, $Res Function(_FlaggedMessage) _then)
      : super(_value, (v) => _then(v as _FlaggedMessage));

  @override
  _FlaggedMessage get _value => super._value as _FlaggedMessage;

  @override
  $Res call({
    Object? message = freezed,
  }) {
    return _then(_FlaggedMessage(
      message: message == freezed
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as Message?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_FlaggedMessage implements _FlaggedMessage {
  _$_FlaggedMessage({@JsonKey(name: 'message') this.message});

  factory _$_FlaggedMessage.fromJson(Map<String, dynamic> json) =>
      _$$_FlaggedMessageFromJson(json);

  @override
  @JsonKey(name: 'message')
  final Message? message;

  @override
  String toString() {
    return 'FlaggedMessage(message: $message)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _FlaggedMessage &&
            const DeepCollectionEquality().equals(other.message, message));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(message));

  @JsonKey(ignore: true)
  @override
  _$FlaggedMessageCopyWith<_FlaggedMessage> get copyWith =>
      __$FlaggedMessageCopyWithImpl<_FlaggedMessage>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_FlaggedMessageToJson(this);
  }
}

abstract class _FlaggedMessage implements FlaggedMessage {
  factory _FlaggedMessage({@JsonKey(name: 'message') Message? message}) =
      _$_FlaggedMessage;

  factory _FlaggedMessage.fromJson(Map<String, dynamic> json) =
      _$_FlaggedMessage.fromJson;

  @override
  @JsonKey(name: 'message')
  Message? get message;
  @override
  @JsonKey(ignore: true)
  _$FlaggedMessageCopyWith<_FlaggedMessage> get copyWith =>
      throw _privateConstructorUsedError;
}
