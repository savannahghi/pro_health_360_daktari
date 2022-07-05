// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'notifications_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

NotificationsData _$NotificationsDataFromJson(Map<String, dynamic> json) {
  return _NotificationsData.fromJson(json);
}

/// @nodoc
mixin _$NotificationsData {
  @JsonKey(name: 'notifications')
  List<NotificationDetails> get notifications =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $NotificationsDataCopyWith<NotificationsData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NotificationsDataCopyWith<$Res> {
  factory $NotificationsDataCopyWith(
          NotificationsData value, $Res Function(NotificationsData) then) =
      _$NotificationsDataCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: 'notifications')
          List<NotificationDetails> notifications});
}

/// @nodoc
class _$NotificationsDataCopyWithImpl<$Res>
    implements $NotificationsDataCopyWith<$Res> {
  _$NotificationsDataCopyWithImpl(this._value, this._then);

  final NotificationsData _value;
  // ignore: unused_field
  final $Res Function(NotificationsData) _then;

  @override
  $Res call({
    Object? notifications = freezed,
  }) {
    return _then(_value.copyWith(
      notifications: notifications == freezed
          ? _value.notifications
          : notifications // ignore: cast_nullable_to_non_nullable
              as List<NotificationDetails>,
    ));
  }
}

/// @nodoc
abstract class _$$_NotificationsDataCopyWith<$Res>
    implements $NotificationsDataCopyWith<$Res> {
  factory _$$_NotificationsDataCopyWith(_$_NotificationsData value,
          $Res Function(_$_NotificationsData) then) =
      __$$_NotificationsDataCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: 'notifications')
          List<NotificationDetails> notifications});
}

/// @nodoc
class __$$_NotificationsDataCopyWithImpl<$Res>
    extends _$NotificationsDataCopyWithImpl<$Res>
    implements _$$_NotificationsDataCopyWith<$Res> {
  __$$_NotificationsDataCopyWithImpl(
      _$_NotificationsData _value, $Res Function(_$_NotificationsData) _then)
      : super(_value, (v) => _then(v as _$_NotificationsData));

  @override
  _$_NotificationsData get _value => super._value as _$_NotificationsData;

  @override
  $Res call({
    Object? notifications = freezed,
  }) {
    return _then(_$_NotificationsData(
      notifications: notifications == freezed
          ? _value._notifications
          : notifications // ignore: cast_nullable_to_non_nullable
              as List<NotificationDetails>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_NotificationsData implements _NotificationsData {
  _$_NotificationsData(
      {@JsonKey(name: 'notifications')
          required final List<NotificationDetails> notifications})
      : _notifications = notifications;

  factory _$_NotificationsData.fromJson(Map<String, dynamic> json) =>
      _$$_NotificationsDataFromJson(json);

  final List<NotificationDetails> _notifications;
  @override
  @JsonKey(name: 'notifications')
  List<NotificationDetails> get notifications {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_notifications);
  }

  @override
  String toString() {
    return 'NotificationsData(notifications: $notifications)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_NotificationsData &&
            const DeepCollectionEquality()
                .equals(other._notifications, _notifications));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_notifications));

  @JsonKey(ignore: true)
  @override
  _$$_NotificationsDataCopyWith<_$_NotificationsData> get copyWith =>
      __$$_NotificationsDataCopyWithImpl<_$_NotificationsData>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_NotificationsDataToJson(this);
  }
}

abstract class _NotificationsData implements NotificationsData {
  factory _NotificationsData(
          {@JsonKey(name: 'notifications')
              required final List<NotificationDetails> notifications}) =
      _$_NotificationsData;

  factory _NotificationsData.fromJson(Map<String, dynamic> json) =
      _$_NotificationsData.fromJson;

  @override
  @JsonKey(name: 'notifications')
  List<NotificationDetails> get notifications =>
      throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_NotificationsDataCopyWith<_$_NotificationsData> get copyWith =>
      throw _privateConstructorUsedError;
}
