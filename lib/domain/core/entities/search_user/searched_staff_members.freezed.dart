// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'searched_staff_members.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

SearchedStaffMembers _$SearchedStaffMembersFromJson(Map<String, dynamic> json) {
  return _SearchedStaffMembers.fromJson(json);
}

/// @nodoc
class _$SearchedStaffMembersTearOff {
  const _$SearchedStaffMembersTearOff();

  _SearchedStaffMembers call(
      {@JsonKey(name: 'getStaffByStaffNumber')
          List<SearchUserResponse>? staffMembers}) {
    return _SearchedStaffMembers(
      staffMembers: staffMembers,
    );
  }

  SearchedStaffMembers fromJson(Map<String, Object?> json) {
    return SearchedStaffMembers.fromJson(json);
  }
}

/// @nodoc
const $SearchedStaffMembers = _$SearchedStaffMembersTearOff();

/// @nodoc
mixin _$SearchedStaffMembers {
  @JsonKey(name: 'getStaffByStaffNumber')
  List<SearchUserResponse>? get staffMembers =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SearchedStaffMembersCopyWith<SearchedStaffMembers> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SearchedStaffMembersCopyWith<$Res> {
  factory $SearchedStaffMembersCopyWith(SearchedStaffMembers value,
          $Res Function(SearchedStaffMembers) then) =
      _$SearchedStaffMembersCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: 'getStaffByStaffNumber')
          List<SearchUserResponse>? staffMembers});
}

/// @nodoc
class _$SearchedStaffMembersCopyWithImpl<$Res>
    implements $SearchedStaffMembersCopyWith<$Res> {
  _$SearchedStaffMembersCopyWithImpl(this._value, this._then);

  final SearchedStaffMembers _value;
  // ignore: unused_field
  final $Res Function(SearchedStaffMembers) _then;

  @override
  $Res call({
    Object? staffMembers = freezed,
  }) {
    return _then(_value.copyWith(
      staffMembers: staffMembers == freezed
          ? _value.staffMembers
          : staffMembers // ignore: cast_nullable_to_non_nullable
              as List<SearchUserResponse>?,
    ));
  }
}

/// @nodoc
abstract class _$SearchedStaffMembersCopyWith<$Res>
    implements $SearchedStaffMembersCopyWith<$Res> {
  factory _$SearchedStaffMembersCopyWith(_SearchedStaffMembers value,
          $Res Function(_SearchedStaffMembers) then) =
      __$SearchedStaffMembersCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: 'getStaffByStaffNumber')
          List<SearchUserResponse>? staffMembers});
}

/// @nodoc
class __$SearchedStaffMembersCopyWithImpl<$Res>
    extends _$SearchedStaffMembersCopyWithImpl<$Res>
    implements _$SearchedStaffMembersCopyWith<$Res> {
  __$SearchedStaffMembersCopyWithImpl(
      _SearchedStaffMembers _value, $Res Function(_SearchedStaffMembers) _then)
      : super(_value, (v) => _then(v as _SearchedStaffMembers));

  @override
  _SearchedStaffMembers get _value => super._value as _SearchedStaffMembers;

  @override
  $Res call({
    Object? staffMembers = freezed,
  }) {
    return _then(_SearchedStaffMembers(
      staffMembers: staffMembers == freezed
          ? _value.staffMembers
          : staffMembers // ignore: cast_nullable_to_non_nullable
              as List<SearchUserResponse>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_SearchedStaffMembers implements _SearchedStaffMembers {
  _$_SearchedStaffMembers(
      {@JsonKey(name: 'getStaffByStaffNumber') this.staffMembers});

  factory _$_SearchedStaffMembers.fromJson(Map<String, dynamic> json) =>
      _$$_SearchedStaffMembersFromJson(json);

  @override
  @JsonKey(name: 'getStaffByStaffNumber')
  final List<SearchUserResponse>? staffMembers;

  @override
  String toString() {
    return 'SearchedStaffMembers(staffMembers: $staffMembers)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _SearchedStaffMembers &&
            const DeepCollectionEquality()
                .equals(other.staffMembers, staffMembers));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(staffMembers));

  @JsonKey(ignore: true)
  @override
  _$SearchedStaffMembersCopyWith<_SearchedStaffMembers> get copyWith =>
      __$SearchedStaffMembersCopyWithImpl<_SearchedStaffMembers>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_SearchedStaffMembersToJson(this);
  }
}

abstract class _SearchedStaffMembers implements SearchedStaffMembers {
  factory _SearchedStaffMembers(
      {@JsonKey(name: 'getStaffByStaffNumber')
          List<SearchUserResponse>? staffMembers}) = _$_SearchedStaffMembers;

  factory _SearchedStaffMembers.fromJson(Map<String, dynamic> json) =
      _$_SearchedStaffMembers.fromJson;

  @override
  @JsonKey(name: 'getStaffByStaffNumber')
  List<SearchUserResponse>? get staffMembers;
  @override
  @JsonKey(ignore: true)
  _$SearchedStaffMembersCopyWith<_SearchedStaffMembers> get copyWith =>
      throw _privateConstructorUsedError;
}
