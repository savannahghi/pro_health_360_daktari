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
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

FlaggedMessagesResponse _$FlaggedMessagesResponseFromJson(
    Map<String, dynamic> json) {
  return _FlaggedMessagesResponse.fromJson(json);
}

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
abstract class _$$_FlaggedMessagesResponseCopyWith<$Res>
    implements $FlaggedMessagesResponseCopyWith<$Res> {
  factory _$$_FlaggedMessagesResponseCopyWith(_$_FlaggedMessagesResponse value,
          $Res Function(_$_FlaggedMessagesResponse) then) =
      __$$_FlaggedMessagesResponseCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: 'listFlaggedMessages') List<MessageObject?>? messages});
}

/// @nodoc
class __$$_FlaggedMessagesResponseCopyWithImpl<$Res>
    extends _$FlaggedMessagesResponseCopyWithImpl<$Res>
    implements _$$_FlaggedMessagesResponseCopyWith<$Res> {
  __$$_FlaggedMessagesResponseCopyWithImpl(_$_FlaggedMessagesResponse _value,
      $Res Function(_$_FlaggedMessagesResponse) _then)
      : super(_value, (v) => _then(v as _$_FlaggedMessagesResponse));

  @override
  _$_FlaggedMessagesResponse get _value =>
      super._value as _$_FlaggedMessagesResponse;

  @override
  $Res call({
    Object? messages = freezed,
  }) {
    return _then(_$_FlaggedMessagesResponse(
      messages: messages == freezed
          ? _value._messages
          : messages // ignore: cast_nullable_to_non_nullable
              as List<MessageObject?>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_FlaggedMessagesResponse implements _FlaggedMessagesResponse {
  _$_FlaggedMessagesResponse(
      {@JsonKey(name: 'listFlaggedMessages')
          final List<MessageObject?>? messages})
      : _messages = messages;

  factory _$_FlaggedMessagesResponse.fromJson(Map<String, dynamic> json) =>
      _$$_FlaggedMessagesResponseFromJson(json);

  final List<MessageObject?>? _messages;
  @override
  @JsonKey(name: 'listFlaggedMessages')
  List<MessageObject?>? get messages {
    final value = _messages;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'FlaggedMessagesResponse(messages: $messages)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_FlaggedMessagesResponse &&
            const DeepCollectionEquality().equals(other._messages, _messages));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_messages));

  @JsonKey(ignore: true)
  @override
  _$$_FlaggedMessagesResponseCopyWith<_$_FlaggedMessagesResponse>
      get copyWith =>
          __$$_FlaggedMessagesResponseCopyWithImpl<_$_FlaggedMessagesResponse>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_FlaggedMessagesResponseToJson(this);
  }
}

abstract class _FlaggedMessagesResponse implements FlaggedMessagesResponse {
  factory _FlaggedMessagesResponse(
      {@JsonKey(name: 'listFlaggedMessages')
          final List<MessageObject?>? messages}) = _$_FlaggedMessagesResponse;

  factory _FlaggedMessagesResponse.fromJson(Map<String, dynamic> json) =
      _$_FlaggedMessagesResponse.fromJson;

  @override
  @JsonKey(name: 'listFlaggedMessages')
  List<MessageObject?>? get messages => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_FlaggedMessagesResponseCopyWith<_$_FlaggedMessagesResponse>
      get copyWith => throw _privateConstructorUsedError;
}
