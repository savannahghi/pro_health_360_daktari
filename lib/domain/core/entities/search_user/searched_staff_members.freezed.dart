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
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

SearchedStaffMembers _$SearchedStaffMembersFromJson(Map<String, dynamic> json) {
  return _SearchedStaffMembers.fromJson(json);
}

/// @nodoc
mixin _$SearchedStaffMembers {
  @JsonKey(name: 'searchStaffUser')
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
      {@JsonKey(name: 'searchStaffUser')
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
abstract class _$$_SearchedStaffMembersCopyWith<$Res>
    implements $SearchedStaffMembersCopyWith<$Res> {
  factory _$$_SearchedStaffMembersCopyWith(_$_SearchedStaffMembers value,
          $Res Function(_$_SearchedStaffMembers) then) =
      __$$_SearchedStaffMembersCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: 'searchStaffUser')
          List<SearchUserResponse>? staffMembers});
}

/// @nodoc
class __$$_SearchedStaffMembersCopyWithImpl<$Res>
    extends _$SearchedStaffMembersCopyWithImpl<$Res>
    implements _$$_SearchedStaffMembersCopyWith<$Res> {
  __$$_SearchedStaffMembersCopyWithImpl(_$_SearchedStaffMembers _value,
      $Res Function(_$_SearchedStaffMembers) _then)
      : super(_value, (v) => _then(v as _$_SearchedStaffMembers));

  @override
  _$_SearchedStaffMembers get _value => super._value as _$_SearchedStaffMembers;

  @override
  $Res call({
    Object? staffMembers = freezed,
  }) {
    return _then(_$_SearchedStaffMembers(
      staffMembers: staffMembers == freezed
          ? _value._staffMembers
          : staffMembers // ignore: cast_nullable_to_non_nullable
              as List<SearchUserResponse>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_SearchedStaffMembers implements _SearchedStaffMembers {
  _$_SearchedStaffMembers(
      {@JsonKey(name: 'searchStaffUser')
          final List<SearchUserResponse>? staffMembers})
      : _staffMembers = staffMembers;

  factory _$_SearchedStaffMembers.fromJson(Map<String, dynamic> json) =>
      _$$_SearchedStaffMembersFromJson(json);

  final List<SearchUserResponse>? _staffMembers;
  @override
  @JsonKey(name: 'searchStaffUser')
  List<SearchUserResponse>? get staffMembers {
    final value = _staffMembers;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'SearchedStaffMembers(staffMembers: $staffMembers)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SearchedStaffMembers &&
            const DeepCollectionEquality()
                .equals(other._staffMembers, _staffMembers));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_staffMembers));

  @JsonKey(ignore: true)
  @override
  _$$_SearchedStaffMembersCopyWith<_$_SearchedStaffMembers> get copyWith =>
      __$$_SearchedStaffMembersCopyWithImpl<_$_SearchedStaffMembers>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_SearchedStaffMembersToJson(this);
  }
}

abstract class _SearchedStaffMembers implements SearchedStaffMembers {
  factory _SearchedStaffMembers(
          {@JsonKey(name: 'searchStaffUser')
              final List<SearchUserResponse>? staffMembers}) =
      _$_SearchedStaffMembers;

  factory _SearchedStaffMembers.fromJson(Map<String, dynamic> json) =
      _$_SearchedStaffMembers.fromJson;

  @override
  @JsonKey(name: 'searchStaffUser')
  List<SearchUserResponse>? get staffMembers =>
      throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_SearchedStaffMembersCopyWith<_$_SearchedStaffMembers> get copyWith =>
      throw _privateConstructorUsedError;
}
