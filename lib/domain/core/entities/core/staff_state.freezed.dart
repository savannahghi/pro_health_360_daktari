// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'staff_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

StaffState _$StaffStateFromJson(Map<String, dynamic> json) {
  return _StaffState.fromJson(json);
}

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
  @JsonKey(name: 'defaultFacilityName')
  String? get defaultFacilityName => throw _privateConstructorUsedError;
  @JsonKey(name: 'user')
  User? get user => throw _privateConstructorUsedError; // invited communities
  CommunitiesState? get communitiesState =>
      throw _privateConstructorUsedError; // recently shared health diary entries
  List<HealthDiaryEntry?>? get clientSharedDiaryEntries =>
      throw _privateConstructorUsedError; // staff notifications
  List<NotificationDetails?>? get notifications =>
      throw _privateConstructorUsedError;
  NotificationFilterState? get notificationFilterState =>
      throw _privateConstructorUsedError;

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
      @JsonKey(name: 'defaultFacilityName') String? defaultFacilityName,
      @JsonKey(name: 'user') User? user,
      CommunitiesState? communitiesState,
      List<HealthDiaryEntry?>? clientSharedDiaryEntries,
      List<NotificationDetails?>? notifications,
      NotificationFilterState? notificationFilterState});

  $UserCopyWith<$Res>? get user;
  $CommunitiesStateCopyWith<$Res>? get communitiesState;
  $NotificationFilterStateCopyWith<$Res>? get notificationFilterState;
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
    Object? defaultFacilityName = freezed,
    Object? user = freezed,
    Object? communitiesState = freezed,
    Object? clientSharedDiaryEntries = freezed,
    Object? notifications = freezed,
    Object? notificationFilterState = freezed,
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
      defaultFacilityName: defaultFacilityName == freezed
          ? _value.defaultFacilityName
          : defaultFacilityName // ignore: cast_nullable_to_non_nullable
              as String?,
      user: user == freezed
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User?,
      communitiesState: communitiesState == freezed
          ? _value.communitiesState
          : communitiesState // ignore: cast_nullable_to_non_nullable
              as CommunitiesState?,
      clientSharedDiaryEntries: clientSharedDiaryEntries == freezed
          ? _value.clientSharedDiaryEntries
          : clientSharedDiaryEntries // ignore: cast_nullable_to_non_nullable
              as List<HealthDiaryEntry?>?,
      notifications: notifications == freezed
          ? _value.notifications
          : notifications // ignore: cast_nullable_to_non_nullable
              as List<NotificationDetails?>?,
      notificationFilterState: notificationFilterState == freezed
          ? _value.notificationFilterState
          : notificationFilterState // ignore: cast_nullable_to_non_nullable
              as NotificationFilterState?,
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

  @override
  $CommunitiesStateCopyWith<$Res>? get communitiesState {
    if (_value.communitiesState == null) {
      return null;
    }

    return $CommunitiesStateCopyWith<$Res>(_value.communitiesState!, (value) {
      return _then(_value.copyWith(communitiesState: value));
    });
  }

  @override
  $NotificationFilterStateCopyWith<$Res>? get notificationFilterState {
    if (_value.notificationFilterState == null) {
      return null;
    }

    return $NotificationFilterStateCopyWith<$Res>(
        _value.notificationFilterState!, (value) {
      return _then(_value.copyWith(notificationFilterState: value));
    });
  }
}

/// @nodoc
abstract class _$$_StaffStateCopyWith<$Res>
    implements $StaffStateCopyWith<$Res> {
  factory _$$_StaffStateCopyWith(
          _$_StaffState value, $Res Function(_$_StaffState) then) =
      __$$_StaffStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: 'id') String? id,
      @JsonKey(name: 'user_id') String? userId,
      @JsonKey(name: 'active', defaultValue: false) bool? active,
      @JsonKey(name: 'staff_number') String? staffNumber,
      @JsonKey(name: 'facilities') List<Facility>? facilities,
      @JsonKey(name: 'default_facility') String? defaultFacility,
      @JsonKey(name: 'defaultFacilityName') String? defaultFacilityName,
      @JsonKey(name: 'user') User? user,
      CommunitiesState? communitiesState,
      List<HealthDiaryEntry?>? clientSharedDiaryEntries,
      List<NotificationDetails?>? notifications,
      NotificationFilterState? notificationFilterState});

  @override
  $UserCopyWith<$Res>? get user;
  @override
  $CommunitiesStateCopyWith<$Res>? get communitiesState;
  @override
  $NotificationFilterStateCopyWith<$Res>? get notificationFilterState;
}

/// @nodoc
class __$$_StaffStateCopyWithImpl<$Res> extends _$StaffStateCopyWithImpl<$Res>
    implements _$$_StaffStateCopyWith<$Res> {
  __$$_StaffStateCopyWithImpl(
      _$_StaffState _value, $Res Function(_$_StaffState) _then)
      : super(_value, (v) => _then(v as _$_StaffState));

  @override
  _$_StaffState get _value => super._value as _$_StaffState;

  @override
  $Res call({
    Object? id = freezed,
    Object? userId = freezed,
    Object? active = freezed,
    Object? staffNumber = freezed,
    Object? facilities = freezed,
    Object? defaultFacility = freezed,
    Object? defaultFacilityName = freezed,
    Object? user = freezed,
    Object? communitiesState = freezed,
    Object? clientSharedDiaryEntries = freezed,
    Object? notifications = freezed,
    Object? notificationFilterState = freezed,
  }) {
    return _then(_$_StaffState(
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
          ? _value._facilities
          : facilities // ignore: cast_nullable_to_non_nullable
              as List<Facility>?,
      defaultFacility: defaultFacility == freezed
          ? _value.defaultFacility
          : defaultFacility // ignore: cast_nullable_to_non_nullable
              as String?,
      defaultFacilityName: defaultFacilityName == freezed
          ? _value.defaultFacilityName
          : defaultFacilityName // ignore: cast_nullable_to_non_nullable
              as String?,
      user: user == freezed
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User?,
      communitiesState: communitiesState == freezed
          ? _value.communitiesState
          : communitiesState // ignore: cast_nullable_to_non_nullable
              as CommunitiesState?,
      clientSharedDiaryEntries: clientSharedDiaryEntries == freezed
          ? _value._clientSharedDiaryEntries
          : clientSharedDiaryEntries // ignore: cast_nullable_to_non_nullable
              as List<HealthDiaryEntry?>?,
      notifications: notifications == freezed
          ? _value._notifications
          : notifications // ignore: cast_nullable_to_non_nullable
              as List<NotificationDetails?>?,
      notificationFilterState: notificationFilterState == freezed
          ? _value.notificationFilterState
          : notificationFilterState // ignore: cast_nullable_to_non_nullable
              as NotificationFilterState?,
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
      @JsonKey(name: 'facilities') final List<Facility>? facilities,
      @JsonKey(name: 'default_facility') this.defaultFacility,
      @JsonKey(name: 'defaultFacilityName') this.defaultFacilityName,
      @JsonKey(name: 'user') this.user,
      this.communitiesState,
      final List<HealthDiaryEntry?>? clientSharedDiaryEntries,
      final List<NotificationDetails?>? notifications,
      this.notificationFilterState})
      : _facilities = facilities,
        _clientSharedDiaryEntries = clientSharedDiaryEntries,
        _notifications = notifications;

  factory _$_StaffState.fromJson(Map<String, dynamic> json) =>
      _$$_StaffStateFromJson(json);

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
  final List<Facility>? _facilities;
  @override
  @JsonKey(name: 'facilities')
  List<Facility>? get facilities {
    final value = _facilities;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey(name: 'default_facility')
  final String? defaultFacility;
  @override
  @JsonKey(name: 'defaultFacilityName')
  final String? defaultFacilityName;
  @override
  @JsonKey(name: 'user')
  final User? user;
// invited communities
  @override
  final CommunitiesState? communitiesState;
// recently shared health diary entries
  final List<HealthDiaryEntry?>? _clientSharedDiaryEntries;
// recently shared health diary entries
  @override
  List<HealthDiaryEntry?>? get clientSharedDiaryEntries {
    final value = _clientSharedDiaryEntries;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

// staff notifications
  final List<NotificationDetails?>? _notifications;
// staff notifications
  @override
  List<NotificationDetails?>? get notifications {
    final value = _notifications;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final NotificationFilterState? notificationFilterState;

  @override
  String toString() {
    return 'StaffState(id: $id, userId: $userId, active: $active, staffNumber: $staffNumber, facilities: $facilities, defaultFacility: $defaultFacility, defaultFacilityName: $defaultFacilityName, user: $user, communitiesState: $communitiesState, clientSharedDiaryEntries: $clientSharedDiaryEntries, notifications: $notifications, notificationFilterState: $notificationFilterState)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_StaffState &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.userId, userId) &&
            const DeepCollectionEquality().equals(other.active, active) &&
            const DeepCollectionEquality()
                .equals(other.staffNumber, staffNumber) &&
            const DeepCollectionEquality()
                .equals(other._facilities, _facilities) &&
            const DeepCollectionEquality()
                .equals(other.defaultFacility, defaultFacility) &&
            const DeepCollectionEquality()
                .equals(other.defaultFacilityName, defaultFacilityName) &&
            const DeepCollectionEquality().equals(other.user, user) &&
            const DeepCollectionEquality()
                .equals(other.communitiesState, communitiesState) &&
            const DeepCollectionEquality().equals(
                other._clientSharedDiaryEntries, _clientSharedDiaryEntries) &&
            const DeepCollectionEquality()
                .equals(other._notifications, _notifications) &&
            const DeepCollectionEquality().equals(
                other.notificationFilterState, notificationFilterState));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(userId),
      const DeepCollectionEquality().hash(active),
      const DeepCollectionEquality().hash(staffNumber),
      const DeepCollectionEquality().hash(_facilities),
      const DeepCollectionEquality().hash(defaultFacility),
      const DeepCollectionEquality().hash(defaultFacilityName),
      const DeepCollectionEquality().hash(user),
      const DeepCollectionEquality().hash(communitiesState),
      const DeepCollectionEquality().hash(_clientSharedDiaryEntries),
      const DeepCollectionEquality().hash(_notifications),
      const DeepCollectionEquality().hash(notificationFilterState));

  @JsonKey(ignore: true)
  @override
  _$$_StaffStateCopyWith<_$_StaffState> get copyWith =>
      __$$_StaffStateCopyWithImpl<_$_StaffState>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_StaffStateToJson(this);
  }
}

abstract class _StaffState implements StaffState {
  factory _StaffState(
      {@JsonKey(name: 'id') final String? id,
      @JsonKey(name: 'user_id') final String? userId,
      @JsonKey(name: 'active', defaultValue: false) final bool? active,
      @JsonKey(name: 'staff_number') final String? staffNumber,
      @JsonKey(name: 'facilities') final List<Facility>? facilities,
      @JsonKey(name: 'default_facility') final String? defaultFacility,
      @JsonKey(name: 'defaultFacilityName') final String? defaultFacilityName,
      @JsonKey(name: 'user') final User? user,
      final CommunitiesState? communitiesState,
      final List<HealthDiaryEntry?>? clientSharedDiaryEntries,
      final List<NotificationDetails?>? notifications,
      final NotificationFilterState? notificationFilterState}) = _$_StaffState;

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
  @JsonKey(name: 'defaultFacilityName')
  String? get defaultFacilityName => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'user')
  User? get user => throw _privateConstructorUsedError;
  @override // invited communities
  CommunitiesState? get communitiesState => throw _privateConstructorUsedError;
  @override // recently shared health diary entries
  List<HealthDiaryEntry?>? get clientSharedDiaryEntries =>
      throw _privateConstructorUsedError;
  @override // staff notifications
  List<NotificationDetails?>? get notifications =>
      throw _privateConstructorUsedError;
  @override
  NotificationFilterState? get notificationFilterState =>
      throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_StaffStateCopyWith<_$_StaffState> get copyWith =>
      throw _privateConstructorUsedError;
}
