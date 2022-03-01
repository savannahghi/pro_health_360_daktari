// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'notification_details.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

NotificationDetails _$NotificationDetailsFromJson(Map<String, dynamic> json) {
  return _NotificationDetails.fromJson(json);
}

/// @nodoc
class _$NotificationDetailsTearOff {
  const _$NotificationDetailsTearOff();

  _NotificationDetails call(
      {@JsonKey(name: 'icon') required IconDetails icon,
      @JsonKey(name: 'description') required String description,
      @JsonKey(name: 'date') required String date,
      @JsonKey(name: 'actions') List<NotificationActions>? actions,
      @JsonKey(name: 'status') String? status}) {
    return _NotificationDetails(
      icon: icon,
      description: description,
      date: date,
      actions: actions,
      status: status,
    );
  }

  NotificationDetails fromJson(Map<String, Object?> json) {
    return NotificationDetails.fromJson(json);
  }
}

/// @nodoc
const $NotificationDetails = _$NotificationDetailsTearOff();

/// @nodoc
mixin _$NotificationDetails {
  @JsonKey(name: 'icon')
  IconDetails get icon => throw _privateConstructorUsedError;
  @JsonKey(name: 'description')
  String get description => throw _privateConstructorUsedError;
  @JsonKey(name: 'date')
  String get date => throw _privateConstructorUsedError;
  @JsonKey(name: 'actions')
  List<NotificationActions>? get actions => throw _privateConstructorUsedError;
  @JsonKey(name: 'status')
  String? get status => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $NotificationDetailsCopyWith<NotificationDetails> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NotificationDetailsCopyWith<$Res> {
  factory $NotificationDetailsCopyWith(
          NotificationDetails value, $Res Function(NotificationDetails) then) =
      _$NotificationDetailsCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: 'icon') IconDetails icon,
      @JsonKey(name: 'description') String description,
      @JsonKey(name: 'date') String date,
      @JsonKey(name: 'actions') List<NotificationActions>? actions,
      @JsonKey(name: 'status') String? status});

  $IconDetailsCopyWith<$Res> get icon;
}

/// @nodoc
class _$NotificationDetailsCopyWithImpl<$Res>
    implements $NotificationDetailsCopyWith<$Res> {
  _$NotificationDetailsCopyWithImpl(this._value, this._then);

  final NotificationDetails _value;
  // ignore: unused_field
  final $Res Function(NotificationDetails) _then;

  @override
  $Res call({
    Object? icon = freezed,
    Object? description = freezed,
    Object? date = freezed,
    Object? actions = freezed,
    Object? status = freezed,
  }) {
    return _then(_value.copyWith(
      icon: icon == freezed
          ? _value.icon
          : icon // ignore: cast_nullable_to_non_nullable
              as IconDetails,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      date: date == freezed
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String,
      actions: actions == freezed
          ? _value.actions
          : actions // ignore: cast_nullable_to_non_nullable
              as List<NotificationActions>?,
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }

  @override
  $IconDetailsCopyWith<$Res> get icon {
    return $IconDetailsCopyWith<$Res>(_value.icon, (value) {
      return _then(_value.copyWith(icon: value));
    });
  }
}

/// @nodoc
abstract class _$NotificationDetailsCopyWith<$Res>
    implements $NotificationDetailsCopyWith<$Res> {
  factory _$NotificationDetailsCopyWith(_NotificationDetails value,
          $Res Function(_NotificationDetails) then) =
      __$NotificationDetailsCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: 'icon') IconDetails icon,
      @JsonKey(name: 'description') String description,
      @JsonKey(name: 'date') String date,
      @JsonKey(name: 'actions') List<NotificationActions>? actions,
      @JsonKey(name: 'status') String? status});

  @override
  $IconDetailsCopyWith<$Res> get icon;
}

/// @nodoc
class __$NotificationDetailsCopyWithImpl<$Res>
    extends _$NotificationDetailsCopyWithImpl<$Res>
    implements _$NotificationDetailsCopyWith<$Res> {
  __$NotificationDetailsCopyWithImpl(
      _NotificationDetails _value, $Res Function(_NotificationDetails) _then)
      : super(_value, (v) => _then(v as _NotificationDetails));

  @override
  _NotificationDetails get _value => super._value as _NotificationDetails;

  @override
  $Res call({
    Object? icon = freezed,
    Object? description = freezed,
    Object? date = freezed,
    Object? actions = freezed,
    Object? status = freezed,
  }) {
    return _then(_NotificationDetails(
      icon: icon == freezed
          ? _value.icon
          : icon // ignore: cast_nullable_to_non_nullable
              as IconDetails,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      date: date == freezed
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String,
      actions: actions == freezed
          ? _value.actions
          : actions // ignore: cast_nullable_to_non_nullable
              as List<NotificationActions>?,
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_NotificationDetails implements _NotificationDetails {
  _$_NotificationDetails(
      {@JsonKey(name: 'icon') required this.icon,
      @JsonKey(name: 'description') required this.description,
      @JsonKey(name: 'date') required this.date,
      @JsonKey(name: 'actions') this.actions,
      @JsonKey(name: 'status') this.status});

  factory _$_NotificationDetails.fromJson(Map<String, dynamic> json) =>
      _$$_NotificationDetailsFromJson(json);

  @override
  @JsonKey(name: 'icon')
  final IconDetails icon;
  @override
  @JsonKey(name: 'description')
  final String description;
  @override
  @JsonKey(name: 'date')
  final String date;
  @override
  @JsonKey(name: 'actions')
  final List<NotificationActions>? actions;
  @override
  @JsonKey(name: 'status')
  final String? status;

  @override
  String toString() {
    return 'NotificationDetails(icon: $icon, description: $description, date: $date, actions: $actions, status: $status)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _NotificationDetails &&
            const DeepCollectionEquality().equals(other.icon, icon) &&
            const DeepCollectionEquality()
                .equals(other.description, description) &&
            const DeepCollectionEquality().equals(other.date, date) &&
            const DeepCollectionEquality().equals(other.actions, actions) &&
            const DeepCollectionEquality().equals(other.status, status));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(icon),
      const DeepCollectionEquality().hash(description),
      const DeepCollectionEquality().hash(date),
      const DeepCollectionEquality().hash(actions),
      const DeepCollectionEquality().hash(status));

  @JsonKey(ignore: true)
  @override
  _$NotificationDetailsCopyWith<_NotificationDetails> get copyWith =>
      __$NotificationDetailsCopyWithImpl<_NotificationDetails>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_NotificationDetailsToJson(this);
  }
}

abstract class _NotificationDetails implements NotificationDetails {
  factory _NotificationDetails(
      {@JsonKey(name: 'icon') required IconDetails icon,
      @JsonKey(name: 'description') required String description,
      @JsonKey(name: 'date') required String date,
      @JsonKey(name: 'actions') List<NotificationActions>? actions,
      @JsonKey(name: 'status') String? status}) = _$_NotificationDetails;

  factory _NotificationDetails.fromJson(Map<String, dynamic> json) =
      _$_NotificationDetails.fromJson;

  @override
  @JsonKey(name: 'icon')
  IconDetails get icon;
  @override
  @JsonKey(name: 'description')
  String get description;
  @override
  @JsonKey(name: 'date')
  String get date;
  @override
  @JsonKey(name: 'actions')
  List<NotificationActions>? get actions;
  @override
  @JsonKey(name: 'status')
  String? get status;
  @override
  @JsonKey(ignore: true)
  _$NotificationDetailsCopyWith<_NotificationDetails> get copyWith =>
      throw _privateConstructorUsedError;
}
