// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'flagged_messages_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

FlaggedMessagesResponse _$FlaggedMessagesResponseFromJson(
    Map<String, dynamic> json) {
  return _FlaggedMessagesResponse.fromJson(json);
}

/// @nodoc
class _$FlaggedMessagesResponseTearOff {
  const _$FlaggedMessagesResponseTearOff();

  _FlaggedMessagesResponse call(
      {@JsonKey(name: 'listFlaggedMessages') List<MessageObject?>? messages}) {
    return _FlaggedMessagesResponse(
      messages: messages,
    );
  }

  FlaggedMessagesResponse fromJson(Map<String, Object?> json) {
    return FlaggedMessagesResponse.fromJson(json);
  }
}

/// @nodoc
const $FlaggedMessagesResponse = _$FlaggedMessagesResponseTearOff();

/// @nodoc
mixin _$FlaggedMessagesResponse {
  @JsonKey(name: 'listFlaggedMessages')
  List<MessageObject?>? get messages => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FlaggedMessagesResponseCopyWith<FlaggedMessagesResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FlaggedMessagesResponseCopyWith<$Res> {
  factory $FlaggedMessagesResponseCopyWith(FlaggedMessagesResponse value,
          $Res Function(FlaggedMessagesResponse) then) =
      _$FlaggedMessagesResponseCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: 'listFlaggedMessages') List<MessageObject?>? messages});
}

/// @nodoc
class _$FlaggedMessagesResponseCopyWithImpl<$Res>
    implements $FlaggedMessagesResponseCopyWith<$Res> {
  _$FlaggedMessagesResponseCopyWithImpl(this._value, this._then);

  final FlaggedMessagesResponse _value;
  // ignore: unused_field
  final $Res Function(FlaggedMessagesResponse) _then;

  @override
  $Res call({
    Object? messages = freezed,
  }) {
    return _then(_value.copyWith(
      messages: messages == freezed
          ? _value.messages
          : messages // ignore: cast_nullable_to_non_nullable
              as List<MessageObject?>?,
    ));
  }
}

/// @nodoc
abstract class _$FlaggedMessagesResponseCopyWith<$Res>
    implements $FlaggedMessagesResponseCopyWith<$Res> {
  factory _$FlaggedMessagesResponseCopyWith(_FlaggedMessagesResponse value,
          $Res Function(_FlaggedMessagesResponse) then) =
      __$FlaggedMessagesResponseCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: 'listFlaggedMessages') List<MessageObject?>? messages});
}

/// @nodoc
class __$FlaggedMessagesResponseCopyWithImpl<$Res>
    extends _$FlaggedMessagesResponseCopyWithImpl<$Res>
    implements _$FlaggedMessagesResponseCopyWith<$Res> {
  __$FlaggedMessagesResponseCopyWithImpl(_FlaggedMessagesResponse _value,
      $Res Function(_FlaggedMessagesResponse) _then)
      : super(_value, (v) => _then(v as _FlaggedMessagesResponse));

  @override
  _FlaggedMessagesResponse get _value =>
      super._value as _FlaggedMessagesResponse;

  @override
  $Res call({
    Object? messages = freezed,
  }) {
    return _then(_FlaggedMessagesResponse(
      messages: messages == freezed
          ? _value.messages
          : messages // ignore: cast_nullable_to_non_nullable
              as List<MessageObject?>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_FlaggedMessagesResponse implements _FlaggedMessagesResponse {
  _$_FlaggedMessagesResponse(
      {@JsonKey(name: 'listFlaggedMessages') this.messages});

  factory _$_FlaggedMessagesResponse.fromJson(Map<String, dynamic> json) =>
      _$$_FlaggedMessagesResponseFromJson(json);

  @override
  @JsonKey(name: 'listFlaggedMessages')
  final List<MessageObject?>? messages;

  @override
  String toString() {
    return 'FlaggedMessagesResponse(messages: $messages)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _FlaggedMessagesResponse &&
            const DeepCollectionEquality().equals(other.messages, messages));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(messages));

  @JsonKey(ignore: true)
  @override
  _$FlaggedMessagesResponseCopyWith<_FlaggedMessagesResponse> get copyWith =>
      __$FlaggedMessagesResponseCopyWithImpl<_FlaggedMessagesResponse>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_FlaggedMessagesResponseToJson(this);
  }
}

abstract class _FlaggedMessagesResponse implements FlaggedMessagesResponse {
  factory _FlaggedMessagesResponse(
      {@JsonKey(name: 'listFlaggedMessages')
          List<MessageObject?>? messages}) = _$_FlaggedMessagesResponse;

  factory _FlaggedMessagesResponse.fromJson(Map<String, dynamic> json) =
      _$_FlaggedMessagesResponse.fromJson;

  @override
  @JsonKey(name: 'listFlaggedMessages')
  List<MessageObject?>? get messages;
  @override
  @JsonKey(ignore: true)
  _$FlaggedMessagesResponseCopyWith<_FlaggedMessagesResponse> get copyWith =>
      throw _privateConstructorUsedError;
}
