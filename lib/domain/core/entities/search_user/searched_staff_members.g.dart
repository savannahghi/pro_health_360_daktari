// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'searched_staff_members.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_SearchedStaffMembers _$$_SearchedStaffMembersFromJson(
        Map<String, dynamic> json) =>
    _$_SearchedStaffMembers(
      staffMembers: (json['searchStaffUser'] as List<dynamic>?)
          ?.map((e) => SearchUserResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_SearchedStaffMembersToJson(
        _$_SearchedStaffMembers instance) =>
    <String, dynamic>{
      'searchStaffUser': instance.staffMembers,
    };
