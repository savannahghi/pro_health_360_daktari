// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'invited_communities.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

InvitedCommunities _$InvitedCommunitiesFromJson(Map<String, dynamic> json) {
  return _InvitedCommunities.fromJson(json);
}

/// @nodoc
class _$InvitedCommunitiesTearOff {
  const _$InvitedCommunitiesTearOff();

  _InvitedCommunities call(
      {@JsonKey(name: 'invitedCommunities')
          List<Community>? invitedCommunities}) {
    return _InvitedCommunities(
      invitedCommunities: invitedCommunities,
    );
  }

  InvitedCommunities fromJson(Map<String, Object?> json) {
    return InvitedCommunities.fromJson(json);
  }
}

/// @nodoc
const $InvitedCommunities = _$InvitedCommunitiesTearOff();

/// @nodoc
mixin _$InvitedCommunities {
  @JsonKey(name: 'invitedCommunities')
  List<Community>? get invitedCommunities => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $InvitedCommunitiesCopyWith<InvitedCommunities> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $InvitedCommunitiesCopyWith<$Res> {
  factory $InvitedCommunitiesCopyWith(
          InvitedCommunities value, $Res Function(InvitedCommunities) then) =
      _$InvitedCommunitiesCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: 'invitedCommunities')
          List<Community>? invitedCommunities});
}

/// @nodoc
class _$InvitedCommunitiesCopyWithImpl<$Res>
    implements $InvitedCommunitiesCopyWith<$Res> {
  _$InvitedCommunitiesCopyWithImpl(this._value, this._then);

  final InvitedCommunities _value;
  // ignore: unused_field
  final $Res Function(InvitedCommunities) _then;

  @override
  $Res call({
    Object? invitedCommunities = freezed,
  }) {
    return _then(_value.copyWith(
      invitedCommunities: invitedCommunities == freezed
          ? _value.invitedCommunities
          : invitedCommunities // ignore: cast_nullable_to_non_nullable
              as List<Community>?,
    ));
  }
}

/// @nodoc
abstract class _$InvitedCommunitiesCopyWith<$Res>
    implements $InvitedCommunitiesCopyWith<$Res> {
  factory _$InvitedCommunitiesCopyWith(
          _InvitedCommunities value, $Res Function(_InvitedCommunities) then) =
      __$InvitedCommunitiesCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: 'invitedCommunities')
          List<Community>? invitedCommunities});
}

/// @nodoc
class __$InvitedCommunitiesCopyWithImpl<$Res>
    extends _$InvitedCommunitiesCopyWithImpl<$Res>
    implements _$InvitedCommunitiesCopyWith<$Res> {
  __$InvitedCommunitiesCopyWithImpl(
      _InvitedCommunities _value, $Res Function(_InvitedCommunities) _then)
      : super(_value, (v) => _then(v as _InvitedCommunities));

  @override
  _InvitedCommunities get _value => super._value as _InvitedCommunities;

  @override
  $Res call({
    Object? invitedCommunities = freezed,
  }) {
    return _then(_InvitedCommunities(
      invitedCommunities: invitedCommunities == freezed
          ? _value.invitedCommunities
          : invitedCommunities // ignore: cast_nullable_to_non_nullable
              as List<Community>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_InvitedCommunities implements _InvitedCommunities {
  _$_InvitedCommunities(
      {@JsonKey(name: 'invitedCommunities') this.invitedCommunities});

  factory _$_InvitedCommunities.fromJson(Map<String, dynamic> json) =>
      _$$_InvitedCommunitiesFromJson(json);

  @override
  @JsonKey(name: 'invitedCommunities')
  final List<Community>? invitedCommunities;

  @override
  String toString() {
    return 'InvitedCommunities(invitedCommunities: $invitedCommunities)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _InvitedCommunities &&
            const DeepCollectionEquality()
                .equals(other.invitedCommunities, invitedCommunities));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(invitedCommunities));

  @JsonKey(ignore: true)
  @override
  _$InvitedCommunitiesCopyWith<_InvitedCommunities> get copyWith =>
      __$InvitedCommunitiesCopyWithImpl<_InvitedCommunities>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_InvitedCommunitiesToJson(this);
  }
}

abstract class _InvitedCommunities implements InvitedCommunities {
  factory _InvitedCommunities(
      {@JsonKey(name: 'invitedCommunities')
          List<Community>? invitedCommunities}) = _$_InvitedCommunities;

  factory _InvitedCommunities.fromJson(Map<String, dynamic> json) =
      _$_InvitedCommunities.fromJson;

  @override
  @JsonKey(name: 'invitedCommunities')
  List<Community>? get invitedCommunities;
  @override
  @JsonKey(ignore: true)
  _$InvitedCommunitiesCopyWith<_InvitedCommunities> get copyWith =>
      throw _privateConstructorUsedError;
}
