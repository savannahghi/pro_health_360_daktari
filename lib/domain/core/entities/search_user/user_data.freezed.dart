// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'user_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UserData _$UserDataFromJson(Map<String, dynamic> json) {
  return _UserData.fromJson(json);
}

/// @nodoc
mixin _$UserData {
  @JsonKey(name: 'ID')
  String? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'Username')
  String? get userName => throw _privateConstructorUsedError;
  @JsonKey(name: 'TermsAccepted', defaultValue: false)
  bool? get termsAccepted => throw _privateConstructorUsedError;
  @JsonKey(name: 'Active', defaultValue: false)
  bool? get active => throw _privateConstructorUsedError;
  @JsonKey(name: 'Contacts')
  Contact? get primaryContact => throw _privateConstructorUsedError;
  @JsonKey(name: 'Name')
  String? get name => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserDataCopyWith<UserData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserDataCopyWith<$Res> {
  factory $UserDataCopyWith(UserData value, $Res Function(UserData) then) =
      _$UserDataCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: 'ID') String? id,
      @JsonKey(name: 'Username') String? userName,
      @JsonKey(name: 'TermsAccepted', defaultValue: false) bool? termsAccepted,
      @JsonKey(name: 'Active', defaultValue: false) bool? active,
      @JsonKey(name: 'Contacts') Contact? primaryContact,
      @JsonKey(name: 'Name') String? name});

  $ContactCopyWith<$Res>? get primaryContact;
}

/// @nodoc
class _$UserDataCopyWithImpl<$Res> implements $UserDataCopyWith<$Res> {
  _$UserDataCopyWithImpl(this._value, this._then);

  final UserData _value;
  // ignore: unused_field
  final $Res Function(UserData) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? userName = freezed,
    Object? termsAccepted = freezed,
    Object? active = freezed,
    Object? primaryContact = freezed,
    Object? name = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      userName: userName == freezed
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
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
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
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
abstract class _$$_UserDataCopyWith<$Res> implements $UserDataCopyWith<$Res> {
  factory _$$_UserDataCopyWith(
          _$_UserData value, $Res Function(_$_UserData) then) =
      __$$_UserDataCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: 'ID') String? id,
      @JsonKey(name: 'Username') String? userName,
      @JsonKey(name: 'TermsAccepted', defaultValue: false) bool? termsAccepted,
      @JsonKey(name: 'Active', defaultValue: false) bool? active,
      @JsonKey(name: 'Contacts') Contact? primaryContact,
      @JsonKey(name: 'Name') String? name});

  @override
  $ContactCopyWith<$Res>? get primaryContact;
}

/// @nodoc
class __$$_UserDataCopyWithImpl<$Res> extends _$UserDataCopyWithImpl<$Res>
    implements _$$_UserDataCopyWith<$Res> {
  __$$_UserDataCopyWithImpl(
      _$_UserData _value, $Res Function(_$_UserData) _then)
      : super(_value, (v) => _then(v as _$_UserData));

  @override
  _$_UserData get _value => super._value as _$_UserData;

  @override
  $Res call({
    Object? id = freezed,
    Object? userName = freezed,
    Object? termsAccepted = freezed,
    Object? active = freezed,
    Object? primaryContact = freezed,
    Object? name = freezed,
  }) {
    return _then(_$_UserData(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      userName: userName == freezed
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
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
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_UserData implements _UserData {
  _$_UserData(
      {@JsonKey(name: 'ID') this.id,
      @JsonKey(name: 'Username') this.userName,
      @JsonKey(name: 'TermsAccepted', defaultValue: false) this.termsAccepted,
      @JsonKey(name: 'Active', defaultValue: false) this.active,
      @JsonKey(name: 'Contacts') this.primaryContact,
      @JsonKey(name: 'Name') this.name});

  factory _$_UserData.fromJson(Map<String, dynamic> json) =>
      _$$_UserDataFromJson(json);

  @override
  @JsonKey(name: 'ID')
  final String? id;
  @override
  @JsonKey(name: 'Username')
  final String? userName;
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
  @JsonKey(name: 'Name')
  final String? name;

  @override
  String toString() {
    return 'UserData(id: $id, userName: $userName, termsAccepted: $termsAccepted, active: $active, primaryContact: $primaryContact, name: $name)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UserData &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.userName, userName) &&
            const DeepCollectionEquality()
                .equals(other.termsAccepted, termsAccepted) &&
            const DeepCollectionEquality().equals(other.active, active) &&
            const DeepCollectionEquality()
                .equals(other.primaryContact, primaryContact) &&
            const DeepCollectionEquality().equals(other.name, name));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(userName),
      const DeepCollectionEquality().hash(termsAccepted),
      const DeepCollectionEquality().hash(active),
      const DeepCollectionEquality().hash(primaryContact),
      const DeepCollectionEquality().hash(name));

  @JsonKey(ignore: true)
  @override
  _$$_UserDataCopyWith<_$_UserData> get copyWith =>
      __$$_UserDataCopyWithImpl<_$_UserData>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UserDataToJson(this);
  }
}

abstract class _UserData implements UserData {
  factory _UserData(
      {@JsonKey(name: 'ID')
          final String? id,
      @JsonKey(name: 'Username')
          final String? userName,
      @JsonKey(name: 'TermsAccepted', defaultValue: false)
          final bool? termsAccepted,
      @JsonKey(name: 'Active', defaultValue: false)
          final bool? active,
      @JsonKey(name: 'Contacts')
          final Contact? primaryContact,
      @JsonKey(name: 'Name')
          final String? name}) = _$_UserData;

  factory _UserData.fromJson(Map<String, dynamic> json) = _$_UserData.fromJson;

  @override
  @JsonKey(name: 'ID')
  String? get id => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'Username')
  String? get userName => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'TermsAccepted', defaultValue: false)
  bool? get termsAccepted => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'Active', defaultValue: false)
  bool? get active => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'Contacts')
  Contact? get primaryContact => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'Name')
  String? get name => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_UserDataCopyWith<_$_UserData> get copyWith =>
      throw _privateConstructorUsedError;
}
