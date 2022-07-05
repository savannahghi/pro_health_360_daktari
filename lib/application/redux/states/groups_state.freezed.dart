// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'groups_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

GroupState _$GroupStateFromJson(Map<String, dynamic> json) {
  return _GroupState.fromJson(json);
}

/// @nodoc
mixin _$GroupState {
  @JsonKey(name: 'listCommunityMembers')
  List<GroupMember?>? get groupMembers => throw _privateConstructorUsedError;
  bool? get isModerator => throw _privateConstructorUsedError;
  bool? get isOwner => throw _privateConstructorUsedError;
  List<Community?>? get communities => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GroupStateCopyWith<GroupState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GroupStateCopyWith<$Res> {
  factory $GroupStateCopyWith(
          GroupState value, $Res Function(GroupState) then) =
      _$GroupStateCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: 'listCommunityMembers') List<GroupMember?>? groupMembers,
      bool? isModerator,
      bool? isOwner,
      List<Community?>? communities});
}

/// @nodoc
class _$GroupStateCopyWithImpl<$Res> implements $GroupStateCopyWith<$Res> {
  _$GroupStateCopyWithImpl(this._value, this._then);

  final GroupState _value;
  // ignore: unused_field
  final $Res Function(GroupState) _then;

  @override
  $Res call({
    Object? groupMembers = freezed,
    Object? isModerator = freezed,
    Object? isOwner = freezed,
    Object? communities = freezed,
  }) {
    return _then(_value.copyWith(
      groupMembers: groupMembers == freezed
          ? _value.groupMembers
          : groupMembers // ignore: cast_nullable_to_non_nullable
              as List<GroupMember?>?,
      isModerator: isModerator == freezed
          ? _value.isModerator
          : isModerator // ignore: cast_nullable_to_non_nullable
              as bool?,
      isOwner: isOwner == freezed
          ? _value.isOwner
          : isOwner // ignore: cast_nullable_to_non_nullable
              as bool?,
      communities: communities == freezed
          ? _value.communities
          : communities // ignore: cast_nullable_to_non_nullable
              as List<Community?>?,
    ));
  }
}

/// @nodoc
abstract class _$$_GroupStateCopyWith<$Res>
    implements $GroupStateCopyWith<$Res> {
  factory _$$_GroupStateCopyWith(
          _$_GroupState value, $Res Function(_$_GroupState) then) =
      __$$_GroupStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: 'listCommunityMembers') List<GroupMember?>? groupMembers,
      bool? isModerator,
      bool? isOwner,
      List<Community?>? communities});
}

/// @nodoc
class __$$_GroupStateCopyWithImpl<$Res> extends _$GroupStateCopyWithImpl<$Res>
    implements _$$_GroupStateCopyWith<$Res> {
  __$$_GroupStateCopyWithImpl(
      _$_GroupState _value, $Res Function(_$_GroupState) _then)
      : super(_value, (v) => _then(v as _$_GroupState));

  @override
  _$_GroupState get _value => super._value as _$_GroupState;

  @override
  $Res call({
    Object? groupMembers = freezed,
    Object? isModerator = freezed,
    Object? isOwner = freezed,
    Object? communities = freezed,
  }) {
    return _then(_$_GroupState(
      groupMembers: groupMembers == freezed
          ? _value._groupMembers
          : groupMembers // ignore: cast_nullable_to_non_nullable
              as List<GroupMember?>?,
      isModerator: isModerator == freezed
          ? _value.isModerator
          : isModerator // ignore: cast_nullable_to_non_nullable
              as bool?,
      isOwner: isOwner == freezed
          ? _value.isOwner
          : isOwner // ignore: cast_nullable_to_non_nullable
              as bool?,
      communities: communities == freezed
          ? _value._communities
          : communities // ignore: cast_nullable_to_non_nullable
              as List<Community?>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_GroupState implements _GroupState {
  _$_GroupState(
      {@JsonKey(name: 'listCommunityMembers')
          final List<GroupMember?>? groupMembers,
      this.isModerator,
      this.isOwner,
      final List<Community?>? communities})
      : _groupMembers = groupMembers,
        _communities = communities;

  factory _$_GroupState.fromJson(Map<String, dynamic> json) =>
      _$$_GroupStateFromJson(json);

  final List<GroupMember?>? _groupMembers;
  @override
  @JsonKey(name: 'listCommunityMembers')
  List<GroupMember?>? get groupMembers {
    final value = _groupMembers;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final bool? isModerator;
  @override
  final bool? isOwner;
  final List<Community?>? _communities;
  @override
  List<Community?>? get communities {
    final value = _communities;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'GroupState(groupMembers: $groupMembers, isModerator: $isModerator, isOwner: $isOwner, communities: $communities)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_GroupState &&
            const DeepCollectionEquality()
                .equals(other._groupMembers, _groupMembers) &&
            const DeepCollectionEquality()
                .equals(other.isModerator, isModerator) &&
            const DeepCollectionEquality().equals(other.isOwner, isOwner) &&
            const DeepCollectionEquality()
                .equals(other._communities, _communities));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_groupMembers),
      const DeepCollectionEquality().hash(isModerator),
      const DeepCollectionEquality().hash(isOwner),
      const DeepCollectionEquality().hash(_communities));

  @JsonKey(ignore: true)
  @override
  _$$_GroupStateCopyWith<_$_GroupState> get copyWith =>
      __$$_GroupStateCopyWithImpl<_$_GroupState>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_GroupStateToJson(this);
  }
}

abstract class _GroupState implements GroupState {
  factory _GroupState(
      {@JsonKey(name: 'listCommunityMembers')
          final List<GroupMember?>? groupMembers,
      final bool? isModerator,
      final bool? isOwner,
      final List<Community?>? communities}) = _$_GroupState;

  factory _GroupState.fromJson(Map<String, dynamic> json) =
      _$_GroupState.fromJson;

  @override
  @JsonKey(name: 'listCommunityMembers')
  List<GroupMember?>? get groupMembers => throw _privateConstructorUsedError;
  @override
  bool? get isModerator => throw _privateConstructorUsedError;
  @override
  bool? get isOwner => throw _privateConstructorUsedError;
  @override
  List<Community?>? get communities => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_GroupStateCopyWith<_$_GroupState> get copyWith =>
      throw _privateConstructorUsedError;
}
