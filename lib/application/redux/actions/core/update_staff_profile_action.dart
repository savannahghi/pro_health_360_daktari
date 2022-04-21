// Package imports:
import 'package:async_redux/async_redux.dart';
// Project imports:
import 'package:mycarehubpro/application/redux/states/app_state.dart';
import 'package:mycarehubpro/domain/core/entities/core/facility.dart';
import 'package:mycarehubpro/domain/core/entities/health_diary/health_diary_entry.dart';
import 'package:mycarehubpro/domain/core/entities/notification/notification_details.dart';

class UpdateStaffProfileAction extends ReduxAction<AppState> {
  UpdateStaffProfileAction({
    this.id,
    this.userId,
    this.active,
    this.staffNumber,
    this.defaultFacility,
    this.facilities,
    this.healthDiaryEntries,
    this.notifications,
  });

  final String? id;
  final String? userId;
  final bool? active;
  final String? staffNumber;
  final List<Facility>? facilities;
  final String? defaultFacility;
  final List<HealthDiaryEntry?>? healthDiaryEntries;
  final List<NotificationDetails?>? notifications;

  @override
  AppState reduce() {
    final AppState newState = state.copyWith(
      staffState: state.staffState?.copyWith.call(
        id: this.id ?? state.staffState?.id,
        userId: this.userId ?? state.staffState?.userId,
        active: this.active ?? state.staffState?.active,
        staffNumber: this.staffNumber ?? state.staffState?.staffNumber,
        defaultFacility:
            this.defaultFacility ?? state.staffState?.defaultFacility,
        facilities: this.facilities ?? state.staffState?.facilities,
        clientSharedDiaryEntries: this.healthDiaryEntries ??
            state.staffState?.clientSharedDiaryEntries,
        notifications: this.notifications ?? state.staffState?.notifications,
      ),
    );

    return newState;
  }
}
