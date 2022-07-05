// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'list_members_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ListMembersResponse _$ListMembersResponseFromJson(Map<String, dynamic> json) {
  return _ListMembersResponse.fromJson(json);
}

/// @nodoc
mixin _$ListMembersResponse {
  @JsonKey(name: 'listMembers')
  List<Member>? get members => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ListMembersResponseCopyWith<ListMembersResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ListMembersResponseCopyWith<$Res> {
  factory $ListMembersResponseCopyWith(
          ListMembersResponse value, $Res Function(ListMembersResponse) then) =
      _$ListMembersResponseCopyWithImpl<$Res>;
  $Res call({@JsonKey(name: 'listMembers') List<Member>? members});
}

/// @nodoc
class _$ListMembersResponseCopyWithImpl<$Res>
    implements $ListMembersResponseCopyWith<$Res> {
  _$ListMembersResponseCopyWithImpl(this._value, this._then);

  final ListMembersResponse _value;
  // ignore: unused_field
  final $Res Function(ListMembersResponse) _then;

  @override
  $Res call({
    Object? members = freezed,
  }) {
    return _then(_value.copyWith(
      members: members == freezed
          ? _value.members
          : members // ignore: cast_nullable_to_non_nullable
              as List<Member>?,
    ));
  }
}

/// @nodoc
abstract class _$$_ListMembersResponseCopyWith<$Res>
    implements $ListMembersResponseCopyWith<$Res> {
  factory _$$_ListMembersResponseCopyWith(_$_ListMembersResponse value,
          $Res Function(_$_ListMembersResponse) then) =
      __$$_ListMembersResponseCopyWithImpl<$Res>;
  @override
  $Res call({@JsonKey(name: 'listMembers') List<Member>? members});
}

/// @nodoc
class __$$_ListMembersResponseCopyWithImpl<$Res>
    extends _$ListMembersResponseCopyWithImpl<$Res>
    implements _$$_ListMembersResponseCopyWith<$Res> {
  __$$_ListMembersResponseCopyWithImpl(_$_ListMembersResponse _value,
      $Res Function(_$_ListMembersResponse) _then)
      : super(_value, (v) => _then(v as _$_ListMembersResponse));

  @override
  _$_ListMembersResponse get _value => super._value as _$_ListMembersResponse;

  @override
  $Res call({
    Object? members = freezed,
  }) {
    return _then(_$_ListMembersResponse(
      members: members == freezed
          ? _value._members
          : members // ignore: cast_nullable_to_non_nullable
              as List<Member>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ListMembersResponse implements _ListMembersResponse {
  _$_ListMembersResponse(
      {@JsonKey(name: 'listMembers') final List<Member>? members})
      : _members = members;

  factory _$_ListMembersResponse.fromJson(Map<String, dynamic> json) =>
      _$$_ListMembersResponseFromJson(json);

  final List<Member>? _members;
  @override
  @JsonKey(name: 'listMembers')
  List<Member>? get members {
    final value = _members;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'ListMembersResponse(members: $members)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ListMembersResponse &&
            const DeepCollectionEquality().equals(other._members, _members));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_members));

  @JsonKey(ignore: true)
  @override
  _$$_ListMembersResponseCopyWith<_$_ListMembersResponse> get copyWith =>
      __$$_ListMembersResponseCopyWithImpl<_$_ListMembersResponse>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ListMembersResponseToJson(this);
  }
}

abstract class _ListMembersResponse implements ListMembersResponse {
  factory _ListMembersResponse(
          {@JsonKey(name: 'listMembers') final List<Member>? members}) =
      _$_ListMembersResponse;

  factory _ListMembersResponse.fromJson(Map<String, dynamic> json) =
      _$_ListMembersResponse.fromJson;

  @override
  @JsonKey(name: 'listMembers')
  List<Member>? get members => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_ListMembersResponseCopyWith<_$_ListMembersResponse> get copyWith =>
      throw _privateConstructorUsedError;
}
