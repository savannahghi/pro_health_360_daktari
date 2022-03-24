// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'pending_invites_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PendingInvitesState _$PendingInvitesStateFromJson(Map<String, dynamic> json) {
  return _PendingInvitesState.fromJson(json);
}

/// @nodoc
class _$PendingInvitesStateTearOff {
  const _$PendingInvitesStateTearOff();

  _PendingInvitesState call(
      {@JsonKey(name: 'listPendingInvites') List<Community>? communitiesList}) {
    return _PendingInvitesState(
      communitiesList: communitiesList,
    );
  }

  PendingInvitesState fromJson(Map<String, Object?> json) {
    return PendingInvitesState.fromJson(json);
  }
}

/// @nodoc
const $PendingInvitesState = _$PendingInvitesStateTearOff();

/// @nodoc
mixin _$PendingInvitesState {
  @JsonKey(name: 'listPendingInvites')
  List<Community>? get communitiesList => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PendingInvitesStateCopyWith<PendingInvitesState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PendingInvitesStateCopyWith<$Res> {
  factory $PendingInvitesStateCopyWith(
          PendingInvitesState value, $Res Function(PendingInvitesState) then) =
      _$PendingInvitesStateCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: 'listPendingInvites') List<Community>? communitiesList});
}

/// @nodoc
class _$PendingInvitesStateCopyWithImpl<$Res>
    implements $PendingInvitesStateCopyWith<$Res> {
  _$PendingInvitesStateCopyWithImpl(this._value, this._then);

  final PendingInvitesState _value;
  // ignore: unused_field
  final $Res Function(PendingInvitesState) _then;

  @override
  $Res call({
    Object? communitiesList = freezed,
  }) {
    return _then(_value.copyWith(
      communitiesList: communitiesList == freezed
          ? _value.communitiesList
          : communitiesList // ignore: cast_nullable_to_non_nullable
              as List<Community>?,
    ));
  }
}

/// @nodoc
abstract class _$PendingInvitesStateCopyWith<$Res>
    implements $PendingInvitesStateCopyWith<$Res> {
  factory _$PendingInvitesStateCopyWith(_PendingInvitesState value,
          $Res Function(_PendingInvitesState) then) =
      __$PendingInvitesStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: 'listPendingInvites') List<Community>? communitiesList});
}

/// @nodoc
class __$PendingInvitesStateCopyWithImpl<$Res>
    extends _$PendingInvitesStateCopyWithImpl<$Res>
    implements _$PendingInvitesStateCopyWith<$Res> {
  __$PendingInvitesStateCopyWithImpl(
      _PendingInvitesState _value, $Res Function(_PendingInvitesState) _then)
      : super(_value, (v) => _then(v as _PendingInvitesState));

  @override
  _PendingInvitesState get _value => super._value as _PendingInvitesState;

  @override
  $Res call({
    Object? communitiesList = freezed,
  }) {
    return _then(_PendingInvitesState(
      communitiesList: communitiesList == freezed
          ? _value.communitiesList
          : communitiesList // ignore: cast_nullable_to_non_nullable
              as List<Community>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_PendingInvitesState implements _PendingInvitesState {
  _$_PendingInvitesState(
      {@JsonKey(name: 'listPendingInvites') this.communitiesList});

  factory _$_PendingInvitesState.fromJson(Map<String, dynamic> json) =>
      _$$_PendingInvitesStateFromJson(json);

  @override
  @JsonKey(name: 'listPendingInvites')
  final List<Community>? communitiesList;

  @override
  String toString() {
    return 'PendingInvitesState(communitiesList: $communitiesList)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _PendingInvitesState &&
            const DeepCollectionEquality()
                .equals(other.communitiesList, communitiesList));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(communitiesList));

  @JsonKey(ignore: true)
  @override
  _$PendingInvitesStateCopyWith<_PendingInvitesState> get copyWith =>
      __$PendingInvitesStateCopyWithImpl<_PendingInvitesState>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PendingInvitesStateToJson(this);
  }
}

abstract class _PendingInvitesState implements PendingInvitesState {
  factory _PendingInvitesState(
      {@JsonKey(name: 'listPendingInvites')
          List<Community>? communitiesList}) = _$_PendingInvitesState;

  factory _PendingInvitesState.fromJson(Map<String, dynamic> json) =
      _$_PendingInvitesState.fromJson;

  @override
  @JsonKey(name: 'listPendingInvites')
  List<Community>? get communitiesList;
  @override
  @JsonKey(ignore: true)
  _$PendingInvitesStateCopyWith<_PendingInvitesState> get copyWith =>
      throw _privateConstructorUsedError;
}
