// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'notification_filter_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

NotificationFilterState _$NotificationFilterStateFromJson(
    Map<String, dynamic> json) {
  return _NotificationFilterState.fromJson(json);
}

/// @nodoc
mixin _$NotificationFilterState {
  List<NotificationFilter?>? get notificationFilters =>
      throw _privateConstructorUsedError;
  NotificationFilter? get selectedFilter => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $NotificationFilterStateCopyWith<NotificationFilterState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NotificationFilterStateCopyWith<$Res> {
  factory $NotificationFilterStateCopyWith(NotificationFilterState value,
          $Res Function(NotificationFilterState) then) =
      _$NotificationFilterStateCopyWithImpl<$Res>;
  $Res call(
      {List<NotificationFilter?>? notificationFilters,
      NotificationFilter? selectedFilter});

  $NotificationFilterCopyWith<$Res>? get selectedFilter;
}

/// @nodoc
class _$NotificationFilterStateCopyWithImpl<$Res>
    implements $NotificationFilterStateCopyWith<$Res> {
  _$NotificationFilterStateCopyWithImpl(this._value, this._then);

  final NotificationFilterState _value;
  // ignore: unused_field
  final $Res Function(NotificationFilterState) _then;

  @override
  $Res call({
    Object? notificationFilters = freezed,
    Object? selectedFilter = freezed,
  }) {
    return _then(_value.copyWith(
      notificationFilters: notificationFilters == freezed
          ? _value.notificationFilters
          : notificationFilters // ignore: cast_nullable_to_non_nullable
              as List<NotificationFilter?>?,
      selectedFilter: selectedFilter == freezed
          ? _value.selectedFilter
          : selectedFilter // ignore: cast_nullable_to_non_nullable
              as NotificationFilter?,
    ));
  }

  @override
  $NotificationFilterCopyWith<$Res>? get selectedFilter {
    if (_value.selectedFilter == null) {
      return null;
    }

    return $NotificationFilterCopyWith<$Res>(_value.selectedFilter!, (value) {
      return _then(_value.copyWith(selectedFilter: value));
    });
  }
}

/// @nodoc
abstract class _$$_NotificationFilterStateCopyWith<$Res>
    implements $NotificationFilterStateCopyWith<$Res> {
  factory _$$_NotificationFilterStateCopyWith(_$_NotificationFilterState value,
          $Res Function(_$_NotificationFilterState) then) =
      __$$_NotificationFilterStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {List<NotificationFilter?>? notificationFilters,
      NotificationFilter? selectedFilter});

  @override
  $NotificationFilterCopyWith<$Res>? get selectedFilter;
}

/// @nodoc
class __$$_NotificationFilterStateCopyWithImpl<$Res>
    extends _$NotificationFilterStateCopyWithImpl<$Res>
    implements _$$_NotificationFilterStateCopyWith<$Res> {
  __$$_NotificationFilterStateCopyWithImpl(_$_NotificationFilterState _value,
      $Res Function(_$_NotificationFilterState) _then)
      : super(_value, (v) => _then(v as _$_NotificationFilterState));

  @override
  _$_NotificationFilterState get _value =>
      super._value as _$_NotificationFilterState;

  @override
  $Res call({
    Object? notificationFilters = freezed,
    Object? selectedFilter = freezed,
  }) {
    return _then(_$_NotificationFilterState(
      notificationFilters: notificationFilters == freezed
          ? _value._notificationFilters
          : notificationFilters // ignore: cast_nullable_to_non_nullable
              as List<NotificationFilter?>?,
      selectedFilter: selectedFilter == freezed
          ? _value.selectedFilter
          : selectedFilter // ignore: cast_nullable_to_non_nullable
              as NotificationFilter?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_NotificationFilterState implements _NotificationFilterState {
  _$_NotificationFilterState(
      {final List<NotificationFilter?>? notificationFilters,
      this.selectedFilter})
      : _notificationFilters = notificationFilters;

  factory _$_NotificationFilterState.fromJson(Map<String, dynamic> json) =>
      _$$_NotificationFilterStateFromJson(json);

  final List<NotificationFilter?>? _notificationFilters;
  @override
  List<NotificationFilter?>? get notificationFilters {
    final value = _notificationFilters;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final NotificationFilter? selectedFilter;

  @override
  String toString() {
    return 'NotificationFilterState(notificationFilters: $notificationFilters, selectedFilter: $selectedFilter)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_NotificationFilterState &&
            const DeepCollectionEquality()
                .equals(other._notificationFilters, _notificationFilters) &&
            const DeepCollectionEquality()
                .equals(other.selectedFilter, selectedFilter));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_notificationFilters),
      const DeepCollectionEquality().hash(selectedFilter));

  @JsonKey(ignore: true)
  @override
  _$$_NotificationFilterStateCopyWith<_$_NotificationFilterState>
      get copyWith =>
          __$$_NotificationFilterStateCopyWithImpl<_$_NotificationFilterState>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_NotificationFilterStateToJson(this);
  }
}

abstract class _NotificationFilterState implements NotificationFilterState {
  factory _NotificationFilterState(
      {final List<NotificationFilter?>? notificationFilters,
      final NotificationFilter? selectedFilter}) = _$_NotificationFilterState;

  factory _NotificationFilterState.fromJson(Map<String, dynamic> json) =
      _$_NotificationFilterState.fromJson;

  @override
  List<NotificationFilter?>? get notificationFilters =>
      throw _privateConstructorUsedError;
  @override
  NotificationFilter? get selectedFilter => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_NotificationFilterStateCopyWith<_$_NotificationFilterState>
      get copyWith => throw _privateConstructorUsedError;
}
