// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification_filter_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_NotificationFilterState _$$_NotificationFilterStateFromJson(
        Map<String, dynamic> json) =>
    _$_NotificationFilterState(
      notificationFilters: (json['notificationFilters'] as List<dynamic>?)
          ?.map((e) => e == null
              ? null
              : NotificationFilter.fromJson(e as Map<String, dynamic>))
          .toList(),
      selectedFilter: json['selectedFilter'] == null
          ? null
          : NotificationFilter.fromJson(
              json['selectedFilter'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_NotificationFilterStateToJson(
        _$_NotificationFilterState instance) =>
    <String, dynamic>{
      'notificationFilters': instance.notificationFilters,
      'selectedFilter': instance.selectedFilter,
    };
