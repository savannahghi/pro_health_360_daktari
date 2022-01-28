// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'event_object.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

EventObject _$EventObjectFromJson(Map<String, dynamic> json) {
  return _EventObject.fromJson(json);
}

/// @nodoc
class _$EventObjectTearOff {
  const _$EventObjectTearOff();

  _EventObject call(
      {@JsonKey(name: 'first_name')
          String? firstName,
      @JsonKey(name: 'last_name')
          String? lastName,
      @JsonKey(name: 'uid')
          String? uid,
      @JsonKey(name: 'route')
          String? route,
      @JsonKey(name: 'primary_phonenumber')
          String? primaryPhoneNumber,
      @JsonKey(name: 'timestamp')
          DateTime? timestamp,
      @JsonKey(name: 'flavour')
          String? flavour,
      @JsonKey(name: 'app_version', defaultValue: APPVERSION)
          String? appVersion}) {
    return _EventObject(
      firstName: firstName,
      lastName: lastName,
      uid: uid,
      route: route,
      primaryPhoneNumber: primaryPhoneNumber,
      timestamp: timestamp,
      flavour: flavour,
      appVersion: appVersion,
    );
  }

  EventObject fromJson(Map<String, Object> json) {
    return EventObject.fromJson(json);
  }
}

/// @nodoc
const $EventObject = _$EventObjectTearOff();

/// @nodoc
mixin _$EventObject {
  @JsonKey(name: 'first_name')
  String? get firstName => throw _privateConstructorUsedError;
  @JsonKey(name: 'last_name')
  String? get lastName => throw _privateConstructorUsedError;
  @JsonKey(name: 'uid')
  String? get uid => throw _privateConstructorUsedError;
  @JsonKey(name: 'route')
  String? get route => throw _privateConstructorUsedError;
  @JsonKey(name: 'primary_phonenumber')
  String? get primaryPhoneNumber => throw _privateConstructorUsedError;
  @JsonKey(name: 'timestamp')
  DateTime? get timestamp => throw _privateConstructorUsedError;
  @JsonKey(name: 'flavour')
  String? get flavour => throw _privateConstructorUsedError;
  @JsonKey(name: 'app_version', defaultValue: APPVERSION)
  String? get appVersion => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $EventObjectCopyWith<EventObject> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EventObjectCopyWith<$Res> {
  factory $EventObjectCopyWith(
          EventObject value, $Res Function(EventObject) then) =
      _$EventObjectCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: 'first_name')
          String? firstName,
      @JsonKey(name: 'last_name')
          String? lastName,
      @JsonKey(name: 'uid')
          String? uid,
      @JsonKey(name: 'route')
          String? route,
      @JsonKey(name: 'primary_phonenumber')
          String? primaryPhoneNumber,
      @JsonKey(name: 'timestamp')
          DateTime? timestamp,
      @JsonKey(name: 'flavour')
          String? flavour,
      @JsonKey(name: 'app_version', defaultValue: APPVERSION)
          String? appVersion});
}

/// @nodoc
class _$EventObjectCopyWithImpl<$Res> implements $EventObjectCopyWith<$Res> {
  _$EventObjectCopyWithImpl(this._value, this._then);

  final EventObject _value;
  // ignore: unused_field
  final $Res Function(EventObject) _then;

  @override
  $Res call({
    Object? firstName = freezed,
    Object? lastName = freezed,
    Object? uid = freezed,
    Object? route = freezed,
    Object? primaryPhoneNumber = freezed,
    Object? timestamp = freezed,
    Object? flavour = freezed,
    Object? appVersion = freezed,
  }) {
    return _then(_value.copyWith(
      firstName: firstName == freezed
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String?,
      lastName: lastName == freezed
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String?,
      uid: uid == freezed
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String?,
      route: route == freezed
          ? _value.route
          : route // ignore: cast_nullable_to_non_nullable
              as String?,
      primaryPhoneNumber: primaryPhoneNumber == freezed
          ? _value.primaryPhoneNumber
          : primaryPhoneNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      timestamp: timestamp == freezed
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      flavour: flavour == freezed
          ? _value.flavour
          : flavour // ignore: cast_nullable_to_non_nullable
              as String?,
      appVersion: appVersion == freezed
          ? _value.appVersion
          : appVersion // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$EventObjectCopyWith<$Res>
    implements $EventObjectCopyWith<$Res> {
  factory _$EventObjectCopyWith(
          _EventObject value, $Res Function(_EventObject) then) =
      __$EventObjectCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: 'first_name')
          String? firstName,
      @JsonKey(name: 'last_name')
          String? lastName,
      @JsonKey(name: 'uid')
          String? uid,
      @JsonKey(name: 'route')
          String? route,
      @JsonKey(name: 'primary_phonenumber')
          String? primaryPhoneNumber,
      @JsonKey(name: 'timestamp')
          DateTime? timestamp,
      @JsonKey(name: 'flavour')
          String? flavour,
      @JsonKey(name: 'app_version', defaultValue: APPVERSION)
          String? appVersion});
}

/// @nodoc
class __$EventObjectCopyWithImpl<$Res> extends _$EventObjectCopyWithImpl<$Res>
    implements _$EventObjectCopyWith<$Res> {
  __$EventObjectCopyWithImpl(
      _EventObject _value, $Res Function(_EventObject) _then)
      : super(_value, (v) => _then(v as _EventObject));

  @override
  _EventObject get _value => super._value as _EventObject;

  @override
  $Res call({
    Object? firstName = freezed,
    Object? lastName = freezed,
    Object? uid = freezed,
    Object? route = freezed,
    Object? primaryPhoneNumber = freezed,
    Object? timestamp = freezed,
    Object? flavour = freezed,
    Object? appVersion = freezed,
  }) {
    return _then(_EventObject(
      firstName: firstName == freezed
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String?,
      lastName: lastName == freezed
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String?,
      uid: uid == freezed
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String?,
      route: route == freezed
          ? _value.route
          : route // ignore: cast_nullable_to_non_nullable
              as String?,
      primaryPhoneNumber: primaryPhoneNumber == freezed
          ? _value.primaryPhoneNumber
          : primaryPhoneNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      timestamp: timestamp == freezed
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      flavour: flavour == freezed
          ? _value.flavour
          : flavour // ignore: cast_nullable_to_non_nullable
              as String?,
      appVersion: appVersion == freezed
          ? _value.appVersion
          : appVersion // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_EventObject implements _EventObject {
  _$_EventObject(
      {@JsonKey(name: 'first_name') this.firstName,
      @JsonKey(name: 'last_name') this.lastName,
      @JsonKey(name: 'uid') this.uid,
      @JsonKey(name: 'route') this.route,
      @JsonKey(name: 'primary_phonenumber') this.primaryPhoneNumber,
      @JsonKey(name: 'timestamp') this.timestamp,
      @JsonKey(name: 'flavour') this.flavour,
      @JsonKey(name: 'app_version', defaultValue: APPVERSION) this.appVersion});

  factory _$_EventObject.fromJson(Map<String, dynamic> json) =>
      _$_$_EventObjectFromJson(json);

  @override
  @JsonKey(name: 'first_name')
  final String? firstName;
  @override
  @JsonKey(name: 'last_name')
  final String? lastName;
  @override
  @JsonKey(name: 'uid')
  final String? uid;
  @override
  @JsonKey(name: 'route')
  final String? route;
  @override
  @JsonKey(name: 'primary_phonenumber')
  final String? primaryPhoneNumber;
  @override
  @JsonKey(name: 'timestamp')
  final DateTime? timestamp;
  @override
  @JsonKey(name: 'flavour')
  final String? flavour;
  @override
  @JsonKey(name: 'app_version', defaultValue: APPVERSION)
  final String? appVersion;

  @override
  String toString() {
    return 'EventObject(firstName: $firstName, lastName: $lastName, uid: $uid, route: $route, primaryPhoneNumber: $primaryPhoneNumber, timestamp: $timestamp, flavour: $flavour, appVersion: $appVersion)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _EventObject &&
            (identical(other.firstName, firstName) ||
                const DeepCollectionEquality()
                    .equals(other.firstName, firstName)) &&
            (identical(other.lastName, lastName) ||
                const DeepCollectionEquality()
                    .equals(other.lastName, lastName)) &&
            (identical(other.uid, uid) ||
                const DeepCollectionEquality().equals(other.uid, uid)) &&
            (identical(other.route, route) ||
                const DeepCollectionEquality().equals(other.route, route)) &&
            (identical(other.primaryPhoneNumber, primaryPhoneNumber) ||
                const DeepCollectionEquality()
                    .equals(other.primaryPhoneNumber, primaryPhoneNumber)) &&
            (identical(other.timestamp, timestamp) ||
                const DeepCollectionEquality()
                    .equals(other.timestamp, timestamp)) &&
            (identical(other.flavour, flavour) ||
                const DeepCollectionEquality()
                    .equals(other.flavour, flavour)) &&
            (identical(other.appVersion, appVersion) ||
                const DeepCollectionEquality()
                    .equals(other.appVersion, appVersion)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(firstName) ^
      const DeepCollectionEquality().hash(lastName) ^
      const DeepCollectionEquality().hash(uid) ^
      const DeepCollectionEquality().hash(route) ^
      const DeepCollectionEquality().hash(primaryPhoneNumber) ^
      const DeepCollectionEquality().hash(timestamp) ^
      const DeepCollectionEquality().hash(flavour) ^
      const DeepCollectionEquality().hash(appVersion);

  @JsonKey(ignore: true)
  @override
  _$EventObjectCopyWith<_EventObject> get copyWith =>
      __$EventObjectCopyWithImpl<_EventObject>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_EventObjectToJson(this);
  }
}

abstract class _EventObject implements EventObject {
  factory _EventObject(
      {@JsonKey(name: 'first_name')
          String? firstName,
      @JsonKey(name: 'last_name')
          String? lastName,
      @JsonKey(name: 'uid')
          String? uid,
      @JsonKey(name: 'route')
          String? route,
      @JsonKey(name: 'primary_phonenumber')
          String? primaryPhoneNumber,
      @JsonKey(name: 'timestamp')
          DateTime? timestamp,
      @JsonKey(name: 'flavour')
          String? flavour,
      @JsonKey(name: 'app_version', defaultValue: APPVERSION)
          String? appVersion}) = _$_EventObject;

  factory _EventObject.fromJson(Map<String, dynamic> json) =
      _$_EventObject.fromJson;

  @override
  @JsonKey(name: 'first_name')
  String? get firstName => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'last_name')
  String? get lastName => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'uid')
  String? get uid => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'route')
  String? get route => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'primary_phonenumber')
  String? get primaryPhoneNumber => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'timestamp')
  DateTime? get timestamp => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'flavour')
  String? get flavour => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'app_version', defaultValue: APPVERSION)
  String? get appVersion => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$EventObjectCopyWith<_EventObject> get copyWith =>
      throw _privateConstructorUsedError;
}
