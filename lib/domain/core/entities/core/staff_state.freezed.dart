// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'staff_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

StaffState _$StaffStateFromJson(Map<String, dynamic> json) {
  return _StaffState.fromJson(json);
}

/// @nodoc
class _$StaffStateTearOff {
  const _$StaffStateTearOff();

  _StaffState call(
      {@JsonKey(name: 'id') String? id,
      @JsonKey(name: 'user_id') String? userId,
      @JsonKey(name: 'active', defaultValue: false) bool? active,
      @JsonKey(name: 'staff_number') String? staffNumber,
      @JsonKey(name: 'facilities') List<Facility>? facilities,
      @JsonKey(name: 'default_facility') String? defaultFacility,
      @JsonKey(name: 'user') User? user}) {
    return _StaffState(
      id: id,
      userId: userId,
      active: active,
      staffNumber: staffNumber,
      facilities: facilities,
      defaultFacility: defaultFacility,
      user: user,
    );
  }

  StaffState fromJson(Map<String, Object> json) {
    return StaffState.fromJson(json);
  }
}

/// @nodoc
const $StaffState = _$StaffStateTearOff();

/// @nodoc
mixin _$StaffState {
  @JsonKey(name: 'id')
  String? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'user_id')
  String? get userId => throw _privateConstructorUsedError;
  @JsonKey(name: 'active', defaultValue: false)
  bool? get active => throw _privateConstructorUsedError;
  @JsonKey(name: 'staff_number')
  String? get staffNumber => throw _privateConstructorUsedError;
  @JsonKey(name: 'facilities')
  List<Facility>? get facilities => throw _privateConstructorUsedError;
  @JsonKey(name: 'default_facility')
  String? get defaultFacility => throw _privateConstructorUsedError;
  @JsonKey(name: 'user')
  User? get user => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $StaffStateCopyWith<StaffState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StaffStateCopyWith<$Res> {
  factory $StaffStateCopyWith(
          StaffState value, $Res Function(StaffState) then) =
      _$StaffStateCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: 'id') String? id,
      @JsonKey(name: 'user_id') String? userId,
      @JsonKey(name: 'active', defaultValue: false) bool? active,
      @JsonKey(name: 'staff_number') String? staffNumber,
      @JsonKey(name: 'facilities') List<Facility>? facilities,
      @JsonKey(name: 'default_facility') String? defaultFacility,
      @JsonKey(name: 'user') User? user});

  $UserCopyWith<$Res>? get user;
}

/// @nodoc
class _$StaffStateCopyWithImpl<$Res> implements $StaffStateCopyWith<$Res> {
  _$StaffStateCopyWithImpl(this._value, this._then);

  final StaffState _value;
  // ignore: unused_field
  final $Res Function(StaffState) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? userId = freezed,
    Object? active = freezed,
    Object? staffNumber = freezed,
    Object? facilities = freezed,
    Object? defaultFacility = freezed,
    Object? user = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      userId: userId == freezed
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String?,
      active: active == freezed
          ? _value.active
          : active // ignore: cast_nullable_to_non_nullable
              as bool?,
      staffNumber: staffNumber == freezed
          ? _value.staffNumber
          : staffNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      facilities: facilities == freezed
          ? _value.facilities
          : facilities // ignore: cast_nullable_to_non_nullable
              as List<Facility>?,
      defaultFacility: defaultFacility == freezed
          ? _value.defaultFacility
          : defaultFacility // ignore: cast_nullable_to_non_nullable
              as String?,
      user: user == freezed
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User?,
    ));
  }

  @override
  $UserCopyWith<$Res>? get user {
    if (_value.user == null) {
      return null;
    }

    return $UserCopyWith<$Res>(_value.user!, (value) {
      return _then(_value.copyWith(user: value));
    });
  }
}

/// @nodoc
abstract class _$StaffStateCopyWith<$Res> implements $StaffStateCopyWith<$Res> {
  factory _$StaffStateCopyWith(
          _StaffState value, $Res Function(_StaffState) then) =
      __$StaffStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: 'id') String? id,
      @JsonKey(name: 'user_id') String? userId,
      @JsonKey(name: 'active', defaultValue: false) bool? active,
      @JsonKey(name: 'staff_number') String? staffNumber,
      @JsonKey(name: 'facilities') List<Facility>? facilities,
      @JsonKey(name: 'default_facility') String? defaultFacility,
      @JsonKey(name: 'user') User? user});

  @override
  $UserCopyWith<$Res>? get user;
}

/// @nodoc
class __$StaffStateCopyWithImpl<$Res> extends _$StaffStateCopyWithImpl<$Res>
    implements _$StaffStateCopyWith<$Res> {
  __$StaffStateCopyWithImpl(
      _StaffState _value, $Res Function(_StaffState) _then)
      : super(_value, (v) => _then(v as _StaffState));

  @override
  _StaffState get _value => super._value as _StaffState;

  @override
  $Res call({
    Object? id = freezed,
    Object? userId = freezed,
    Object? active = freezed,
    Object? staffNumber = freezed,
    Object? facilities = freezed,
    Object? defaultFacility = freezed,
    Object? user = freezed,
  }) {
    return _then(_StaffState(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      userId: userId == freezed
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String?,
      active: active == freezed
          ? _value.active
          : active // ignore: cast_nullable_to_non_nullable
              as bool?,
      staffNumber: staffNumber == freezed
          ? _value.staffNumber
          : staffNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      facilities: facilities == freezed
          ? _value.facilities
          : facilities // ignore: cast_nullable_to_non_nullable
              as List<Facility>?,
      defaultFacility: defaultFacility == freezed
          ? _value.defaultFacility
          : defaultFacility // ignore: cast_nullable_to_non_nullable
              as String?,
      user: user == freezed
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_StaffState implements _StaffState {
  _$_StaffState(
      {@JsonKey(name: 'id') this.id,
      @JsonKey(name: 'user_id') this.userId,
      @JsonKey(name: 'active', defaultValue: false) this.active,
      @JsonKey(name: 'staff_number') this.staffNumber,
      @JsonKey(name: 'facilities') this.facilities,
      @JsonKey(name: 'default_facility') this.defaultFacility,
      @JsonKey(name: 'user') this.user});

  factory _$_StaffState.fromJson(Map<String, dynamic> json) =>
      _$_$_StaffStateFromJson(json);

  @override
  @JsonKey(name: 'id')
  final String? id;
  @override
  @JsonKey(name: 'user_id')
  final String? userId;
  @override
  @JsonKey(name: 'active', defaultValue: false)
  final bool? active;
  @override
  @JsonKey(name: 'staff_number')
  final String? staffNumber;
  @override
  @JsonKey(name: 'facilities')
  final List<Facility>? facilities;
  @override
  @JsonKey(name: 'default_facility')
  final String? defaultFacility;
  @override
  @JsonKey(name: 'user')
  final User? user;

  @override
  String toString() {
    return 'StaffState(id: $id, userId: $userId, active: $active, staffNumber: $staffNumber, facilities: $facilities, defaultFacility: $defaultFacility, user: $user)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _StaffState &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.userId, userId) ||
                const DeepCollectionEquality().equals(other.userId, userId)) &&
            (identical(other.active, active) ||
                const DeepCollectionEquality().equals(other.active, active)) &&
            (identical(other.staffNumber, staffNumber) ||
                const DeepCollectionEquality()
                    .equals(other.staffNumber, staffNumber)) &&
            (identical(other.facilities, facilities) ||
                const DeepCollectionEquality()
                    .equals(other.facilities, facilities)) &&
            (identical(other.defaultFacility, defaultFacility) ||
                const DeepCollectionEquality()
                    .equals(other.defaultFacility, defaultFacility)) &&
            (identical(other.user, user) ||
                const DeepCollectionEquality().equals(other.user, user)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(userId) ^
      const DeepCollectionEquality().hash(active) ^
      const DeepCollectionEquality().hash(staffNumber) ^
      const DeepCollectionEquality().hash(facilities) ^
      const DeepCollectionEquality().hash(defaultFacility) ^
      const DeepCollectionEquality().hash(user);

  @JsonKey(ignore: true)
  @override
  _$StaffStateCopyWith<_StaffState> get copyWith =>
      __$StaffStateCopyWithImpl<_StaffState>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_StaffStateToJson(this);
  }
}

abstract class _StaffState implements StaffState {
  factory _StaffState(
      {@JsonKey(name: 'id') String? id,
      @JsonKey(name: 'user_id') String? userId,
      @JsonKey(name: 'active', defaultValue: false) bool? active,
      @JsonKey(name: 'staff_number') String? staffNumber,
      @JsonKey(name: 'facilities') List<Facility>? facilities,
      @JsonKey(name: 'default_facility') String? defaultFacility,
      @JsonKey(name: 'user') User? user}) = _$_StaffState;

  factory _StaffState.fromJson(Map<String, dynamic> json) =
      _$_StaffState.fromJson;

  @override
  @JsonKey(name: 'id')
  String? get id => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'user_id')
  String? get userId => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'active', defaultValue: false)
  bool? get active => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'staff_number')
  String? get staffNumber => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'facilities')
  List<Facility>? get facilities => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'default_facility')
  String? get defaultFacility => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'user')
  User? get user => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$StaffStateCopyWith<_StaffState> get copyWith =>
      throw _privateConstructorUsedError;
}
