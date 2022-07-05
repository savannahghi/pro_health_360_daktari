// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'list_group_info_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ListGroupInfoResponse _$ListGroupInfoResponseFromJson(
    Map<String, dynamic> json) {
  return _ListGroupInfoResponse.fromJson(json);
}

/// @nodoc
mixin _$ListGroupInfoResponse {
  @JsonKey(name: 'listCommunityMembers')
  List<GroupMember?>? get groupMembers => throw _privateConstructorUsedError;
  @JsonKey(name: 'listCommunities')
  List<Community?>? get communities => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ListGroupInfoResponseCopyWith<ListGroupInfoResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ListGroupInfoResponseCopyWith<$Res> {
  factory $ListGroupInfoResponseCopyWith(ListGroupInfoResponse value,
          $Res Function(ListGroupInfoResponse) then) =
      _$ListGroupInfoResponseCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: 'listCommunityMembers') List<GroupMember?>? groupMembers,
      @JsonKey(name: 'listCommunities') List<Community?>? communities});
}

/// @nodoc
class _$ListGroupInfoResponseCopyWithImpl<$Res>
    implements $ListGroupInfoResponseCopyWith<$Res> {
  _$ListGroupInfoResponseCopyWithImpl(this._value, this._then);

  final ListGroupInfoResponse _value;
  // ignore: unused_field
  final $Res Function(ListGroupInfoResponse) _then;

  @override
  $Res call({
    Object? groupMembers = freezed,
    Object? communities = freezed,
  }) {
    return _then(_value.copyWith(
      groupMembers: groupMembers == freezed
          ? _value.groupMembers
          : groupMembers // ignore: cast_nullable_to_non_nullable
              as List<GroupMember?>?,
      communities: communities == freezed
          ? _value.communities
          : communities // ignore: cast_nullable_to_non_nullable
              as List<Community?>?,
    ));
  }
}

/// @nodoc
abstract class _$$_ListGroupInfoResponseCopyWith<$Res>
    implements $ListGroupInfoResponseCopyWith<$Res> {
  factory _$$_ListGroupInfoResponseCopyWith(_$_ListGroupInfoResponse value,
          $Res Function(_$_ListGroupInfoResponse) then) =
      __$$_ListGroupInfoResponseCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: 'listCommunityMembers') List<GroupMember?>? groupMembers,
      @JsonKey(name: 'listCommunities') List<Community?>? communities});
}

/// @nodoc
class __$$_ListGroupInfoResponseCopyWithImpl<$Res>
    extends _$ListGroupInfoResponseCopyWithImpl<$Res>
    implements _$$_ListGroupInfoResponseCopyWith<$Res> {
  __$$_ListGroupInfoResponseCopyWithImpl(_$_ListGroupInfoResponse _value,
      $Res Function(_$_ListGroupInfoResponse) _then)
      : super(_value, (v) => _then(v as _$_ListGroupInfoResponse));

  @override
  _$_ListGroupInfoResponse get _value =>
      super._value as _$_ListGroupInfoResponse;

  @override
  $Res call({
    Object? groupMembers = freezed,
    Object? communities = freezed,
  }) {
    return _then(_$_ListGroupInfoResponse(
      groupMembers: groupMembers == freezed
          ? _value._groupMembers
          : groupMembers // ignore: cast_nullable_to_non_nullable
              as List<GroupMember?>?,
      communities: communities == freezed
          ? _value._communities
          : communities // ignore: cast_nullable_to_non_nullable
              as List<Community?>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ListGroupInfoResponse implements _ListGroupInfoResponse {
  _$_ListGroupInfoResponse(
      {@JsonKey(name: 'listCommunityMembers')
          final List<GroupMember?>? groupMembers,
      @JsonKey(name: 'listCommunities')
          final List<Community?>? communities})
      : _groupMembers = groupMembers,
        _communities = communities;

  factory _$_ListGroupInfoResponse.fromJson(Map<String, dynamic> json) =>
      _$$_ListGroupInfoResponseFromJson(json);

  final List<GroupMember?>? _groupMembers;
  @override
  @JsonKey(name: 'listCommunityMembers')
  List<GroupMember?>? get groupMembers {
    final value = _groupMembers;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<Community?>? _communities;
  @override
  @JsonKey(name: 'listCommunities')
  List<Community?>? get communities {
    final value = _communities;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'ListGroupInfoResponse(groupMembers: $groupMembers, communities: $communities)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ListGroupInfoResponse &&
            const DeepCollectionEquality()
                .equals(other._groupMembers, _groupMembers) &&
            const DeepCollectionEquality()
                .equals(other._communities, _communities));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_groupMembers),
      const DeepCollectionEquality().hash(_communities));

  @JsonKey(ignore: true)
  @override
  _$$_ListGroupInfoResponseCopyWith<_$_ListGroupInfoResponse> get copyWith =>
      __$$_ListGroupInfoResponseCopyWithImpl<_$_ListGroupInfoResponse>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ListGroupInfoResponseToJson(this);
  }
}

abstract class _ListGroupInfoResponse implements ListGroupInfoResponse {
  factory _ListGroupInfoResponse(
      {@JsonKey(name: 'listCommunityMembers')
          final List<GroupMember?>? groupMembers,
      @JsonKey(name: 'listCommunities')
          final List<Community?>? communities}) = _$_ListGroupInfoResponse;

  factory _ListGroupInfoResponse.fromJson(Map<String, dynamic> json) =
      _$_ListGroupInfoResponse.fromJson;

  @override
  @JsonKey(name: 'listCommunityMembers')
  List<GroupMember?>? get groupMembers => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'listCommunities')
  List<Community?>? get communities => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_ListGroupInfoResponseCopyWith<_$_ListGroupInfoResponse> get copyWith =>
      throw _privateConstructorUsedError;
}
