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
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ListMembersResponse _$ListMembersResponseFromJson(Map<String, dynamic> json) {
  return _ListMembersResponse.fromJson(json);
}

/// @nodoc
class _$ListMembersResponseTearOff {
  const _$ListMembersResponseTearOff();

  _ListMembersResponse call(
      {@JsonKey(name: 'listMembers') List<Member>? members}) {
    return _ListMembersResponse(
      members: members,
    );
  }

  ListMembersResponse fromJson(Map<String, Object?> json) {
    return ListMembersResponse.fromJson(json);
  }
}

/// @nodoc
const $ListMembersResponse = _$ListMembersResponseTearOff();

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
abstract class _$ListMembersResponseCopyWith<$Res>
    implements $ListMembersResponseCopyWith<$Res> {
  factory _$ListMembersResponseCopyWith(_ListMembersResponse value,
          $Res Function(_ListMembersResponse) then) =
      __$ListMembersResponseCopyWithImpl<$Res>;
  @override
  $Res call({@JsonKey(name: 'listMembers') List<Member>? members});
}

/// @nodoc
class __$ListMembersResponseCopyWithImpl<$Res>
    extends _$ListMembersResponseCopyWithImpl<$Res>
    implements _$ListMembersResponseCopyWith<$Res> {
  __$ListMembersResponseCopyWithImpl(
      _ListMembersResponse _value, $Res Function(_ListMembersResponse) _then)
      : super(_value, (v) => _then(v as _ListMembersResponse));

  @override
  _ListMembersResponse get _value => super._value as _ListMembersResponse;

  @override
  $Res call({
    Object? members = freezed,
  }) {
    return _then(_ListMembersResponse(
      members: members == freezed
          ? _value.members
          : members // ignore: cast_nullable_to_non_nullable
              as List<Member>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ListMembersResponse implements _ListMembersResponse {
  _$_ListMembersResponse({@JsonKey(name: 'listMembers') this.members});

  factory _$_ListMembersResponse.fromJson(Map<String, dynamic> json) =>
      _$$_ListMembersResponseFromJson(json);

  @override
  @JsonKey(name: 'listMembers')
  final List<Member>? members;

  @override
  String toString() {
    return 'ListMembersResponse(members: $members)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ListMembersResponse &&
            const DeepCollectionEquality().equals(other.members, members));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(members));

  @JsonKey(ignore: true)
  @override
  _$ListMembersResponseCopyWith<_ListMembersResponse> get copyWith =>
      __$ListMembersResponseCopyWithImpl<_ListMembersResponse>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ListMembersResponseToJson(this);
  }
}

abstract class _ListMembersResponse implements ListMembersResponse {
  factory _ListMembersResponse(
          {@JsonKey(name: 'listMembers') List<Member>? members}) =
      _$_ListMembersResponse;

  factory _ListMembersResponse.fromJson(Map<String, dynamic> json) =
      _$_ListMembersResponse.fromJson;

  @override
  @JsonKey(name: 'listMembers')
  List<Member>? get members;
  @override
  @JsonKey(ignore: true)
  _$ListMembersResponseCopyWith<_ListMembersResponse> get copyWith =>
      throw _privateConstructorUsedError;
}
