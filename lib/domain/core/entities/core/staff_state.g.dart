// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'staff_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_StaffState _$$_StaffStateFromJson(Map<String, dynamic> json) =>
    _$_StaffState(
      id: json['id'] as String?,
      userId: json['user_id'] as String?,
      active: json['active'] as bool? ?? false,
      staffNumber: json['staff_number'] as String?,
      facilities: (json['facilities'] as List<dynamic>?)
          ?.map((e) => Facility.fromJson(e as Map<String, dynamic>))
          .toList(),
      defaultFacility: json['default_facility'] as String?,
      user: json['user'] == null
          ? null
          : User.fromJson(json['user'] as Map<String, dynamic>),
      communitiesState: json['communitiesState'] == null
          ? null
          : CommunitiesState.fromJson(
              json['communitiesState'] as Map<String, dynamic>),
      clientSharedDiaryEntries:
          (json['clientSharedDiaryEntries'] as List<dynamic>?)
              ?.map((e) => e == null
                  ? null
                  : HealthDiaryEntry.fromJson(e as Map<String, dynamic>))
              .toList(),
      notifications: (json['notifications'] as List<dynamic>?)
          ?.map((e) => e == null
              ? null
              : NotificationDetails.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_StaffStateToJson(_$_StaffState instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user_id': instance.userId,
      'active': instance.active,
      'staff_number': instance.staffNumber,
      'facilities': instance.facilities,
      'default_facility': instance.defaultFacility,
      'user': instance.user,
      'communitiesState': instance.communitiesState,
      'clientSharedDiaryEntries': instance.clientSharedDiaryEntries,
      'notifications': instance.notifications,
    };
