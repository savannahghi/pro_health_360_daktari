import 'package:async_redux/async_redux.dart';
import 'package:mycarehubpro/application/redux/states/app_state.dart';
import 'package:mycarehubpro/domain/core/entities/core/staff_state.dart';
import 'package:mycarehubpro/domain/core/entities/health_diary/health_diary_entry.dart';

class UpdateHomeStateAction extends ReduxAction<AppState> {
  UpdateHomeStateAction({this.healthDiaryEntry});

  final HealthDiaryEntry? healthDiaryEntry;

  @override
  AppState reduce() {
    final StaffState? newStaffState =
        state.staffState?.copyWith(clientSharedDiaryEntries: healthDiaryEntry);

    return state.copyWith(staffState: newStaffState ?? state.staffState);
  }
}
