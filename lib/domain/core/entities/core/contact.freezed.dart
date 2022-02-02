// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'contact.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Contact _$ContactFromJson(Map<String, dynamic> json) {
  return _Contact.fromJson(json);
}

/// @nodoc
class _$ContactTearOff {
  const _$ContactTearOff();

  _Contact call(
      {@JsonKey(name: 'contactType') ContactType? contactType,
      @JsonKey(name: 'contactValue') String? value,
      @JsonKey(name: 'active', defaultValue: false) bool? active,
      @JsonKey(name: 'optedIn', defaultValue: false) bool? optedIn}) {
    return _Contact(
      contactType: contactType,
      value: value,
      active: active,
      optedIn: optedIn,
    );
  }

  Contact fromJson(Map<String, Object> json) {
    return Contact.fromJson(json);
  }
}

/// @nodoc
const $Contact = _$ContactTearOff();

/// @nodoc
mixin _$Contact {
  @JsonKey(name: 'contactType')
  ContactType? get contactType =>
      throw _privateConstructorUsedError; // TODO(paul): this will mostly be a number value object.
  @JsonKey(name: 'contactValue')
  String? get value => throw _privateConstructorUsedError;
  @JsonKey(name: 'active', defaultValue: false)
  bool? get active => throw _privateConstructorUsedError;
  @JsonKey(name: 'optedIn', defaultValue: false)
  bool? get optedIn => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ContactCopyWith<Contact> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ContactCopyWith<$Res> {
  factory $ContactCopyWith(Contact value, $Res Function(Contact) then) =
      _$ContactCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: 'contactType') ContactType? contactType,
      @JsonKey(name: 'contactValue') String? value,
      @JsonKey(name: 'active', defaultValue: false) bool? active,
      @JsonKey(name: 'optedIn', defaultValue: false) bool? optedIn});
}

/// @nodoc
class _$ContactCopyWithImpl<$Res> implements $ContactCopyWith<$Res> {
  _$ContactCopyWithImpl(this._value, this._then);

  final Contact _value;
  // ignore: unused_field
  final $Res Function(Contact) _then;

  @override
  $Res call({
    Object? contactType = freezed,
    Object? value = freezed,
    Object? active = freezed,
    Object? optedIn = freezed,
  }) {
    return _then(_value.copyWith(
      contactType: contactType == freezed
          ? _value.contactType
          : contactType // ignore: cast_nullable_to_non_nullable
              as ContactType?,
      value: value == freezed
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as String?,
      active: active == freezed
          ? _value.active
          : active // ignore: cast_nullable_to_non_nullable
              as bool?,
      optedIn: optedIn == freezed
          ? _value.optedIn
          : optedIn // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
abstract class _$ContactCopyWith<$Res> implements $ContactCopyWith<$Res> {
  factory _$ContactCopyWith(_Contact value, $Res Function(_Contact) then) =
      __$ContactCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: 'contactType') ContactType? contactType,
      @JsonKey(name: 'contactValue') String? value,
      @JsonKey(name: 'active', defaultValue: false) bool? active,
      @JsonKey(name: 'optedIn', defaultValue: false) bool? optedIn});
}

/// @nodoc
class __$ContactCopyWithImpl<$Res> extends _$ContactCopyWithImpl<$Res>
    implements _$ContactCopyWith<$Res> {
  __$ContactCopyWithImpl(_Contact _value, $Res Function(_Contact) _then)
      : super(_value, (v) => _then(v as _Contact));

  @override
  _Contact get _value => super._value as _Contact;

  @override
  $Res call({
    Object? contactType = freezed,
    Object? value = freezed,
    Object? active = freezed,
    Object? optedIn = freezed,
  }) {
    return _then(_Contact(
      contactType: contactType == freezed
          ? _value.contactType
          : contactType // ignore: cast_nullable_to_non_nullable
              as ContactType?,
      value: value == freezed
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as String?,
      active: active == freezed
          ? _value.active
          : active // ignore: cast_nullable_to_non_nullable
              as bool?,
      optedIn: optedIn == freezed
          ? _value.optedIn
          : optedIn // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Contact implements _Contact {
  _$_Contact(
      {@JsonKey(name: 'contactType') this.contactType,
      @JsonKey(name: 'contactValue') this.value,
      @JsonKey(name: 'active', defaultValue: false) this.active,
      @JsonKey(name: 'optedIn', defaultValue: false) this.optedIn});

  factory _$_Contact.fromJson(Map<String, dynamic> json) =>
      _$_$_ContactFromJson(json);

  @override
  @JsonKey(name: 'contactType')
  final ContactType? contactType;
  @override // TODO(paul): this will mostly be a number value object.
  @JsonKey(name: 'contactValue')
  final String? value;
  @override
  @JsonKey(name: 'active', defaultValue: false)
  final bool? active;
  @override
  @JsonKey(name: 'optedIn', defaultValue: false)
  final bool? optedIn;

  @override
  String toString() {
    return 'Contact(contactType: $contactType, value: $value, active: $active, optedIn: $optedIn)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Contact &&
            (identical(other.contactType, contactType) ||
                const DeepCollectionEquality()
                    .equals(other.contactType, contactType)) &&
            (identical(other.value, value) ||
                const DeepCollectionEquality().equals(other.value, value)) &&
            (identical(other.active, active) ||
                const DeepCollectionEquality().equals(other.active, active)) &&
            (identical(other.optedIn, optedIn) ||
                const DeepCollectionEquality().equals(other.optedIn, optedIn)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(contactType) ^
      const DeepCollectionEquality().hash(value) ^
      const DeepCollectionEquality().hash(active) ^
      const DeepCollectionEquality().hash(optedIn);

  @JsonKey(ignore: true)
  @override
  _$ContactCopyWith<_Contact> get copyWith =>
      __$ContactCopyWithImpl<_Contact>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_ContactToJson(this);
  }
}

abstract class _Contact implements Contact {
  factory _Contact(
          {@JsonKey(name: 'contactType') ContactType? contactType,
          @JsonKey(name: 'contactValue') String? value,
          @JsonKey(name: 'active', defaultValue: false) bool? active,
          @JsonKey(name: 'optedIn', defaultValue: false) bool? optedIn}) =
      _$_Contact;

  factory _Contact.fromJson(Map<String, dynamic> json) = _$_Contact.fromJson;

  @override
  @JsonKey(name: 'contactType')
  ContactType? get contactType => throw _privateConstructorUsedError;
  @override // TODO(paul): this will mostly be a number value object.
  @JsonKey(name: 'contactValue')
  String? get value => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'active', defaultValue: false)
  bool? get active => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'optedIn', defaultValue: false)
  bool? get optedIn => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$ContactCopyWith<_Contact> get copyWith =>
      throw _privateConstructorUsedError;
}