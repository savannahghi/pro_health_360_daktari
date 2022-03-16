// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'client_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ClientResponse _$ClientResponseFromJson(Map<String, dynamic> json) {
  return _ClientResponse.fromJson(json);
}

/// @nodoc
class _$ClientResponseTearOff {
  const _$ClientResponseTearOff();

  _ClientResponse call(
      {@JsonKey(name: 'ID') String? userId,
      @JsonKey(name: 'Username') String? username,
      @JsonKey(name: 'TermsAccepted', defaultValue: false) bool? termsAccepted,
      @JsonKey(name: 'Active', defaultValue: false) bool? active,
      @JsonKey(name: 'Contacts') Contact? primaryContact}) {
    return _ClientResponse(
      userId: userId,
      username: username,
      termsAccepted: termsAccepted,
      active: active,
      primaryContact: primaryContact,
    );
  }

  ClientResponse fromJson(Map<String, Object?> json) {
    return ClientResponse.fromJson(json);
  }
}

/// @nodoc
const $ClientResponse = _$ClientResponseTearOff();

/// @nodoc
mixin _$ClientResponse {
  @JsonKey(name: 'ID')
  String? get userId =>
      throw _privateConstructorUsedError; // This is the nickname
  @JsonKey(name: 'Username')
  String? get username => throw _privateConstructorUsedError;
  @JsonKey(name: 'TermsAccepted', defaultValue: false)
  bool? get termsAccepted => throw _privateConstructorUsedError;
  @JsonKey(name: 'Active', defaultValue: false)
  bool? get active => throw _privateConstructorUsedError;
  @JsonKey(name: 'Contacts')
  Contact? get primaryContact => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ClientResponseCopyWith<ClientResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ClientResponseCopyWith<$Res> {
  factory $ClientResponseCopyWith(
          ClientResponse value, $Res Function(ClientResponse) then) =
      _$ClientResponseCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: 'ID') String? userId,
      @JsonKey(name: 'Username') String? username,
      @JsonKey(name: 'TermsAccepted', defaultValue: false) bool? termsAccepted,
      @JsonKey(name: 'Active', defaultValue: false) bool? active,
      @JsonKey(name: 'Contacts') Contact? primaryContact});

  $ContactCopyWith<$Res>? get primaryContact;
}

/// @nodoc
class _$ClientResponseCopyWithImpl<$Res>
    implements $ClientResponseCopyWith<$Res> {
  _$ClientResponseCopyWithImpl(this._value, this._then);

  final ClientResponse _value;
  // ignore: unused_field
  final $Res Function(ClientResponse) _then;

  @override
  $Res call({
    Object? userId = freezed,
    Object? username = freezed,
    Object? termsAccepted = freezed,
    Object? active = freezed,
    Object? primaryContact = freezed,
  }) {
    return _then(_value.copyWith(
      userId: userId == freezed
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String?,
      username: username == freezed
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String?,
      termsAccepted: termsAccepted == freezed
          ? _value.termsAccepted
          : termsAccepted // ignore: cast_nullable_to_non_nullable
              as bool?,
      active: active == freezed
          ? _value.active
          : active // ignore: cast_nullable_to_non_nullable
              as bool?,
      primaryContact: primaryContact == freezed
          ? _value.primaryContact
          : primaryContact // ignore: cast_nullable_to_non_nullable
              as Contact?,
    ));
  }

  @override
  $ContactCopyWith<$Res>? get primaryContact {
    if (_value.primaryContact == null) {
      return null;
    }

    return $ContactCopyWith<$Res>(_value.primaryContact!, (value) {
      return _then(_value.copyWith(primaryContact: value));
    });
  }
}

/// @nodoc
abstract class _$ClientResponseCopyWith<$Res>
    implements $ClientResponseCopyWith<$Res> {
  factory _$ClientResponseCopyWith(
          _ClientResponse value, $Res Function(_ClientResponse) then) =
      __$ClientResponseCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: 'ID') String? userId,
      @JsonKey(name: 'Username') String? username,
      @JsonKey(name: 'TermsAccepted', defaultValue: false) bool? termsAccepted,
      @JsonKey(name: 'Active', defaultValue: false) bool? active,
      @JsonKey(name: 'Contacts') Contact? primaryContact});

  @override
  $ContactCopyWith<$Res>? get primaryContact;
}

/// @nodoc
class __$ClientResponseCopyWithImpl<$Res>
    extends _$ClientResponseCopyWithImpl<$Res>
    implements _$ClientResponseCopyWith<$Res> {
  __$ClientResponseCopyWithImpl(
      _ClientResponse _value, $Res Function(_ClientResponse) _then)
      : super(_value, (v) => _then(v as _ClientResponse));

  @override
  _ClientResponse get _value => super._value as _ClientResponse;

  @override
  $Res call({
    Object? userId = freezed,
    Object? username = freezed,
    Object? termsAccepted = freezed,
    Object? active = freezed,
    Object? primaryContact = freezed,
  }) {
    return _then(_ClientResponse(
      userId: userId == freezed
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String?,
      username: username == freezed
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String?,
      termsAccepted: termsAccepted == freezed
          ? _value.termsAccepted
          : termsAccepted // ignore: cast_nullable_to_non_nullable
              as bool?,
      active: active == freezed
          ? _value.active
          : active // ignore: cast_nullable_to_non_nullable
              as bool?,
      primaryContact: primaryContact == freezed
          ? _value.primaryContact
          : primaryContact // ignore: cast_nullable_to_non_nullable
              as Contact?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ClientResponse implements _ClientResponse {
  _$_ClientResponse(
      {@JsonKey(name: 'ID') this.userId,
      @JsonKey(name: 'Username') this.username,
      @JsonKey(name: 'TermsAccepted', defaultValue: false) this.termsAccepted,
      @JsonKey(name: 'Active', defaultValue: false) this.active,
      @JsonKey(name: 'Contacts') this.primaryContact});

  factory _$_ClientResponse.fromJson(Map<String, dynamic> json) =>
      _$$_ClientResponseFromJson(json);

  @override
  @JsonKey(name: 'ID')
  final String? userId;
  @override // This is the nickname
  @JsonKey(name: 'Username')
  final String? username;
  @override
  @JsonKey(name: 'TermsAccepted', defaultValue: false)
  final bool? termsAccepted;
  @override
  @JsonKey(name: 'Active', defaultValue: false)
  final bool? active;
  @override
  @JsonKey(name: 'Contacts')
  final Contact? primaryContact;

  @override
  String toString() {
    return 'ClientResponse(userId: $userId, username: $username, termsAccepted: $termsAccepted, active: $active, primaryContact: $primaryContact)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ClientResponse &&
            const DeepCollectionEquality().equals(other.userId, userId) &&
            const DeepCollectionEquality().equals(other.username, username) &&
            const DeepCollectionEquality()
                .equals(other.termsAccepted, termsAccepted) &&
            const DeepCollectionEquality().equals(other.active, active) &&
            const DeepCollectionEquality()
                .equals(other.primaryContact, primaryContact));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(userId),
      const DeepCollectionEquality().hash(username),
      const DeepCollectionEquality().hash(termsAccepted),
      const DeepCollectionEquality().hash(active),
      const DeepCollectionEquality().hash(primaryContact));

  @JsonKey(ignore: true)
  @override
  _$ClientResponseCopyWith<_ClientResponse> get copyWith =>
      __$ClientResponseCopyWithImpl<_ClientResponse>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ClientResponseToJson(this);
  }
}

abstract class _ClientResponse implements ClientResponse {
  factory _ClientResponse(
      {@JsonKey(name: 'ID') String? userId,
      @JsonKey(name: 'Username') String? username,
      @JsonKey(name: 'TermsAccepted', defaultValue: false) bool? termsAccepted,
      @JsonKey(name: 'Active', defaultValue: false) bool? active,
      @JsonKey(name: 'Contacts') Contact? primaryContact}) = _$_ClientResponse;

  factory _ClientResponse.fromJson(Map<String, dynamic> json) =
      _$_ClientResponse.fromJson;

  @override
  @JsonKey(name: 'ID')
  String? get userId;
  @override // This is the nickname
  @JsonKey(name: 'Username')
  String? get username;
  @override
  @JsonKey(name: 'TermsAccepted', defaultValue: false)
  bool? get termsAccepted;
  @override
  @JsonKey(name: 'Active', defaultValue: false)
  bool? get active;
  @override
  @JsonKey(name: 'Contacts')
  Contact? get primaryContact;
  @override
  @JsonKey(ignore: true)
  _$ClientResponseCopyWith<_ClientResponse> get copyWith =>
      throw _privateConstructorUsedError;
}
