// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_user_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_SearchUserResponse _$$_SearchUserResponseFromJson(
        Map<String, dynamic> json) =>
    _$_SearchUserResponse(
      id: json['ID'] as String?,
      clientCCCNumber: json['CCCNumber'] as String?,
      isActive: json['Active'] as bool?,
      staffNumber: json['StaffNumber'] as String?,
      user: json['User'] == null
          ? null
          : UserData.fromJson(json['User'] as Map<String, dynamic>),
      facilityID: json['FacilityID'] as String?,
      rolesList: json['rolesList'] == null
          ? null
          : RolesList.fromJson(json['rolesList'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_SearchUserResponseToJson(
        _$_SearchUserResponse instance) =>
    <String, dynamic>{
      'ID': instance.id,
      'CCCNumber': instance.clientCCCNumber,
      'Active': instance.isActive,
      'StaffNumber': instance.staffNumber,
      'User': instance.user,
      'FacilityID': instance.facilityID,
      'rolesList': instance.rolesList,
    };
