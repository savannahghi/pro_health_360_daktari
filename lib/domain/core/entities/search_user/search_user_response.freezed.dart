// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'search_user_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

SearchUserResponse _$SearchUserResponseFromJson(Map<String, dynamic> json) {
  return _SearchUserResponse.fromJson(json);
}

/// @nodoc
mixin _$SearchUserResponse {
  @JsonKey(name: 'ID')
  String? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'CCCNumber')
  String? get clientCCCNumber =>
      throw _privateConstructorUsedError; // This is the CCCNumber if the person being searched is a client
  @JsonKey(name: 'Active')
  bool? get isActive =>
      throw _privateConstructorUsedError; // This is a boolean for checking if the user was deactivated from the platform
  @JsonKey(name: 'StaffNumber')
  String? get staffNumber =>
      throw _privateConstructorUsedError; // this is the staff number if the person being searched is a staff member
  @JsonKey(name: 'User')
  UserData? get user => throw _privateConstructorUsedError;
  @JsonKey(name: 'FacilityID')
  String? get facilityID => throw _privateConstructorUsedError;
  @JsonKey(name: 'rolesList')
  RolesList? get rolesList => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SearchUserResponseCopyWith<SearchUserResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SearchUserResponseCopyWith<$Res> {
  factory $SearchUserResponseCopyWith(
          SearchUserResponse value, $Res Function(SearchUserResponse) then) =
      _$SearchUserResponseCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: 'ID') String? id,
      @JsonKey(name: 'CCCNumber') String? clientCCCNumber,
      @JsonKey(name: 'Active') bool? isActive,
      @JsonKey(name: 'StaffNumber') String? staffNumber,
      @JsonKey(name: 'User') UserData? user,
      @JsonKey(name: 'FacilityID') String? facilityID,
      @JsonKey(name: 'rolesList') RolesList? rolesList});

  $UserDataCopyWith<$Res>? get user;
  $RolesListCopyWith<$Res>? get rolesList;
}

/// @nodoc
class _$SearchUserResponseCopyWithImpl<$Res>
    implements $SearchUserResponseCopyWith<$Res> {
  _$SearchUserResponseCopyWithImpl(this._value, this._then);

  final SearchUserResponse _value;
  // ignore: unused_field
  final $Res Function(SearchUserResponse) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? clientCCCNumber = freezed,
    Object? isActive = freezed,
    Object? staffNumber = freezed,
    Object? user = freezed,
    Object? facilityID = freezed,
    Object? rolesList = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      clientCCCNumber: clientCCCNumber == freezed
          ? _value.clientCCCNumber
          : clientCCCNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      isActive: isActive == freezed
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool?,
      staffNumber: staffNumber == freezed
          ? _value.staffNumber
          : staffNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      user: user == freezed
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as UserData?,
      facilityID: facilityID == freezed
          ? _value.facilityID
          : facilityID // ignore: cast_nullable_to_non_nullable
              as String?,
      rolesList: rolesList == freezed
          ? _value.rolesList
          : rolesList // ignore: cast_nullable_to_non_nullable
              as RolesList?,
    ));
  }

  @override
  $UserDataCopyWith<$Res>? get user {
    if (_value.user == null) {
      return null;
    }

    return $UserDataCopyWith<$Res>(_value.user!, (value) {
      return _then(_value.copyWith(user: value));
    });
  }

  @override
  $RolesListCopyWith<$Res>? get rolesList {
    if (_value.rolesList == null) {
      return null;
    }

    return $RolesListCopyWith<$Res>(_value.rolesList!, (value) {
      return _then(_value.copyWith(rolesList: value));
    });
  }
}

/// @nodoc
abstract class _$$_SearchUserResponseCopyWith<$Res>
    implements $SearchUserResponseCopyWith<$Res> {
  factory _$$_SearchUserResponseCopyWith(_$_SearchUserResponse value,
          $Res Function(_$_SearchUserResponse) then) =
      __$$_SearchUserResponseCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: 'ID') String? id,
      @JsonKey(name: 'CCCNumber') String? clientCCCNumber,
      @JsonKey(name: 'Active') bool? isActive,
      @JsonKey(name: 'StaffNumber') String? staffNumber,
      @JsonKey(name: 'User') UserData? user,
      @JsonKey(name: 'FacilityID') String? facilityID,
      @JsonKey(name: 'rolesList') RolesList? rolesList});

  @override
  $UserDataCopyWith<$Res>? get user;
  @override
  $RolesListCopyWith<$Res>? get rolesList;
}

/// @nodoc
class __$$_SearchUserResponseCopyWithImpl<$Res>
    extends _$SearchUserResponseCopyWithImpl<$Res>
    implements _$$_SearchUserResponseCopyWith<$Res> {
  __$$_SearchUserResponseCopyWithImpl(
      _$_SearchUserResponse _value, $Res Function(_$_SearchUserResponse) _then)
      : super(_value, (v) => _then(v as _$_SearchUserResponse));

  @override
  _$_SearchUserResponse get _value => super._value as _$_SearchUserResponse;

  @override
  $Res call({
    Object? id = freezed,
    Object? clientCCCNumber = freezed,
    Object? isActive = freezed,
    Object? staffNumber = freezed,
    Object? user = freezed,
    Object? facilityID = freezed,
    Object? rolesList = freezed,
  }) {
    return _then(_$_SearchUserResponse(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      clientCCCNumber: clientCCCNumber == freezed
          ? _value.clientCCCNumber
          : clientCCCNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      isActive: isActive == freezed
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool?,
      staffNumber: staffNumber == freezed
          ? _value.staffNumber
          : staffNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      user: user == freezed
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as UserData?,
      facilityID: facilityID == freezed
          ? _value.facilityID
          : facilityID // ignore: cast_nullable_to_non_nullable
              as String?,
      rolesList: rolesList == freezed
          ? _value.rolesList
          : rolesList // ignore: cast_nullable_to_non_nullable
              as RolesList?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_SearchUserResponse implements _SearchUserResponse {
  _$_SearchUserResponse(
      {@JsonKey(name: 'ID') this.id,
      @JsonKey(name: 'CCCNumber') this.clientCCCNumber,
      @JsonKey(name: 'Active') this.isActive,
      @JsonKey(name: 'StaffNumber') this.staffNumber,
      @JsonKey(name: 'User') this.user,
      @JsonKey(name: 'FacilityID') this.facilityID,
      @JsonKey(name: 'rolesList') this.rolesList});

  factory _$_SearchUserResponse.fromJson(Map<String, dynamic> json) =>
      _$$_SearchUserResponseFromJson(json);

  @override
  @JsonKey(name: 'ID')
  final String? id;
  @override
  @JsonKey(name: 'CCCNumber')
  final String? clientCCCNumber;
// This is the CCCNumber if the person being searched is a client
  @override
  @JsonKey(name: 'Active')
  final bool? isActive;
// This is a boolean for checking if the user was deactivated from the platform
  @override
  @JsonKey(name: 'StaffNumber')
  final String? staffNumber;
// this is the staff number if the person being searched is a staff member
  @override
  @JsonKey(name: 'User')
  final UserData? user;
  @override
  @JsonKey(name: 'FacilityID')
  final String? facilityID;
  @override
  @JsonKey(name: 'rolesList')
  final RolesList? rolesList;

  @override
  String toString() {
    return 'SearchUserResponse(id: $id, clientCCCNumber: $clientCCCNumber, isActive: $isActive, staffNumber: $staffNumber, user: $user, facilityID: $facilityID, rolesList: $rolesList)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SearchUserResponse &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality()
                .equals(other.clientCCCNumber, clientCCCNumber) &&
            const DeepCollectionEquality().equals(other.isActive, isActive) &&
            const DeepCollectionEquality()
                .equals(other.staffNumber, staffNumber) &&
            const DeepCollectionEquality().equals(other.user, user) &&
            const DeepCollectionEquality()
                .equals(other.facilityID, facilityID) &&
            const DeepCollectionEquality().equals(other.rolesList, rolesList));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(clientCCCNumber),
      const DeepCollectionEquality().hash(isActive),
      const DeepCollectionEquality().hash(staffNumber),
      const DeepCollectionEquality().hash(user),
      const DeepCollectionEquality().hash(facilityID),
      const DeepCollectionEquality().hash(rolesList));

  @JsonKey(ignore: true)
  @override
  _$$_SearchUserResponseCopyWith<_$_SearchUserResponse> get copyWith =>
      __$$_SearchUserResponseCopyWithImpl<_$_SearchUserResponse>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_SearchUserResponseToJson(this);
  }
}

abstract class _SearchUserResponse implements SearchUserResponse {
  factory _SearchUserResponse(
          {@JsonKey(name: 'ID') final String? id,
          @JsonKey(name: 'CCCNumber') final String? clientCCCNumber,
          @JsonKey(name: 'Active') final bool? isActive,
          @JsonKey(name: 'StaffNumber') final String? staffNumber,
          @JsonKey(name: 'User') final UserData? user,
          @JsonKey(name: 'FacilityID') final String? facilityID,
          @JsonKey(name: 'rolesList') final RolesList? rolesList}) =
      _$_SearchUserResponse;

  factory _SearchUserResponse.fromJson(Map<String, dynamic> json) =
      _$_SearchUserResponse.fromJson;

  @override
  @JsonKey(name: 'ID')
  String? get id => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'CCCNumber')
  String? get clientCCCNumber => throw _privateConstructorUsedError;
  @override // This is the CCCNumber if the person being searched is a client
  @JsonKey(name: 'Active')
  bool? get isActive => throw _privateConstructorUsedError;
  @override // This is a boolean for checking if the user was deactivated from the platform
  @JsonKey(name: 'StaffNumber')
  String? get staffNumber => throw _privateConstructorUsedError;
  @override // this is the staff number if the person being searched is a staff member
  @JsonKey(name: 'User')
  UserData? get user => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'FacilityID')
  String? get facilityID => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'rolesList')
  RolesList? get rolesList => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_SearchUserResponseCopyWith<_$_SearchUserResponse> get copyWith =>
      throw _privateConstructorUsedError;
}
