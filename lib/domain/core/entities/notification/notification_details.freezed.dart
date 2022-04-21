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
      {@JsonKey(name: 'id') String? id,
      @JsonKey(name: 'title') String? title,
      @JsonKey(name: 'body') String? body,
      @JsonKey(name: 'type') String? type,
      @JsonKey(name: 'isRead', defaultValue: false) bool? isRead,
      @JsonKey(name: 'icon') IconDetails? icon,
      @JsonKey(name: 'date') String? date,
      @JsonKey(name: 'actions') List<NotificationActions>? actions,
      @JsonKey(name: 'status') String? status}) {
    return _NotificationDetails(
      id: id,
      title: title,
      body: body,
      type: type,
      isRead: isRead,
      icon: icon,
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
  @JsonKey(name: 'id')
  String? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'title')
  String? get title => throw _privateConstructorUsedError;
  @JsonKey(name: 'body')
  String? get body => throw _privateConstructorUsedError;
  @JsonKey(name: 'type')
  String? get type => throw _privateConstructorUsedError;
  @JsonKey(name: 'isRead', defaultValue: false)
  bool? get isRead => throw _privateConstructorUsedError;
  @JsonKey(name: 'icon')
  IconDetails? get icon => throw _privateConstructorUsedError;
  @JsonKey(name: 'date')
  String? get date => throw _privateConstructorUsedError;
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
      {@JsonKey(name: 'id') String? id,
      @JsonKey(name: 'title') String? title,
      @JsonKey(name: 'body') String? body,
      @JsonKey(name: 'type') String? type,
      @JsonKey(name: 'isRead', defaultValue: false) bool? isRead,
      @JsonKey(name: 'icon') IconDetails? icon,
      @JsonKey(name: 'date') String? date,
      @JsonKey(name: 'actions') List<NotificationActions>? actions,
      @JsonKey(name: 'status') String? status});

  $IconDetailsCopyWith<$Res>? get icon;
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
    Object? id = freezed,
    Object? title = freezed,
    Object? body = freezed,
    Object? type = freezed,
    Object? isRead = freezed,
    Object? icon = freezed,
    Object? date = freezed,
    Object? actions = freezed,
    Object? status = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      body: body == freezed
          ? _value.body
          : body // ignore: cast_nullable_to_non_nullable
              as String?,
      type: type == freezed
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      isRead: isRead == freezed
          ? _value.isRead
          : isRead // ignore: cast_nullable_to_non_nullable
              as bool?,
      icon: icon == freezed
          ? _value.icon
          : icon // ignore: cast_nullable_to_non_nullable
              as IconDetails?,
      date: date == freezed
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String?,
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
  $IconDetailsCopyWith<$Res>? get icon {
    if (_value.icon == null) {
      return null;
    }

    return $IconDetailsCopyWith<$Res>(_value.icon!, (value) {
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
      {@JsonKey(name: 'id') String? id,
      @JsonKey(name: 'title') String? title,
      @JsonKey(name: 'body') String? body,
      @JsonKey(name: 'type') String? type,
      @JsonKey(name: 'isRead', defaultValue: false) bool? isRead,
      @JsonKey(name: 'icon') IconDetails? icon,
      @JsonKey(name: 'date') String? date,
      @JsonKey(name: 'actions') List<NotificationActions>? actions,
      @JsonKey(name: 'status') String? status});

  @override
  $IconDetailsCopyWith<$Res>? get icon;
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
    Object? id = freezed,
    Object? title = freezed,
    Object? body = freezed,
    Object? type = freezed,
    Object? isRead = freezed,
    Object? icon = freezed,
    Object? date = freezed,
    Object? actions = freezed,
    Object? status = freezed,
  }) {
    return _then(_NotificationDetails(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      body: body == freezed
          ? _value.body
          : body // ignore: cast_nullable_to_non_nullable
              as String?,
      type: type == freezed
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      isRead: isRead == freezed
          ? _value.isRead
          : isRead // ignore: cast_nullable_to_non_nullable
              as bool?,
      icon: icon == freezed
          ? _value.icon
          : icon // ignore: cast_nullable_to_non_nullable
              as IconDetails?,
      date: date == freezed
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String?,
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
      {@JsonKey(name: 'id') this.id,
      @JsonKey(name: 'title') this.title,
      @JsonKey(name: 'body') this.body,
      @JsonKey(name: 'type') this.type,
      @JsonKey(name: 'isRead', defaultValue: false) this.isRead,
      @JsonKey(name: 'icon') this.icon,
      @JsonKey(name: 'date') this.date,
      @JsonKey(name: 'actions') this.actions,
      @JsonKey(name: 'status') this.status});

  factory _$_NotificationDetails.fromJson(Map<String, dynamic> json) =>
      _$$_NotificationDetailsFromJson(json);

  @override
  @JsonKey(name: 'id')
  final String? id;
  @override
  @JsonKey(name: 'title')
  final String? title;
  @override
  @JsonKey(name: 'body')
  final String? body;
  @override
  @JsonKey(name: 'type')
  final String? type;
  @override
  @JsonKey(name: 'isRead', defaultValue: false)
  final bool? isRead;
  @override
  @JsonKey(name: 'icon')
  final IconDetails? icon;
  @override
  @JsonKey(name: 'date')
  final String? date;
  @override
  @JsonKey(name: 'actions')
  final List<NotificationActions>? actions;
  @override
  @JsonKey(name: 'status')
  final String? status;

  @override
  String toString() {
    return 'NotificationDetails(id: $id, title: $title, body: $body, type: $type, isRead: $isRead, icon: $icon, date: $date, actions: $actions, status: $status)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _NotificationDetails &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.title, title) &&
            const DeepCollectionEquality().equals(other.body, body) &&
            const DeepCollectionEquality().equals(other.type, type) &&
            const DeepCollectionEquality().equals(other.isRead, isRead) &&
            const DeepCollectionEquality().equals(other.icon, icon) &&
            const DeepCollectionEquality().equals(other.date, date) &&
            const DeepCollectionEquality().equals(other.actions, actions) &&
            const DeepCollectionEquality().equals(other.status, status));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(title),
      const DeepCollectionEquality().hash(body),
      const DeepCollectionEquality().hash(type),
      const DeepCollectionEquality().hash(isRead),
      const DeepCollectionEquality().hash(icon),
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
      {@JsonKey(name: 'id') String? id,
      @JsonKey(name: 'title') String? title,
      @JsonKey(name: 'body') String? body,
      @JsonKey(name: 'type') String? type,
      @JsonKey(name: 'isRead', defaultValue: false) bool? isRead,
      @JsonKey(name: 'icon') IconDetails? icon,
      @JsonKey(name: 'date') String? date,
      @JsonKey(name: 'actions') List<NotificationActions>? actions,
      @JsonKey(name: 'status') String? status}) = _$_NotificationDetails;

  factory _NotificationDetails.fromJson(Map<String, dynamic> json) =
      _$_NotificationDetails.fromJson;

  @override
  @JsonKey(name: 'id')
  String? get id;
  @override
  @JsonKey(name: 'title')
  String? get title;
  @override
  @JsonKey(name: 'body')
  String? get body;
  @override
  @JsonKey(name: 'type')
  String? get type;
  @override
  @JsonKey(name: 'isRead', defaultValue: false)
  bool? get isRead;
  @override
  @JsonKey(name: 'icon')
  IconDetails? get icon;
  @override
  @JsonKey(name: 'date')
  String? get date;
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
