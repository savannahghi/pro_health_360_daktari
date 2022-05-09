// Package imports:
import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:async_redux/async_redux.dart';
// Project imports:
import 'package:mycarehubpro/application/redux/states/app_state.dart';

/// [BatchUpdateMiscStateAction] is the ONLY action that should be called to update [miscState]
/// with the exception of [IncrementUserVisitCountAction]
/// This action should be called in the following scenarios;
/// - creating an account
/// - logging in a user
/// - resetting PIN
class BatchUpdateMiscStateAction extends ReduxAction<AppState> {
  final String? initialRoute;
  final String? error;
  final List<Member>? communityMembers;
  final String? inactiveTime;
  final bool? resumeWithPin;

  BatchUpdateMiscStateAction({
    this.initialRoute,
    this.error,
    this.communityMembers,
    this.inactiveTime,
    this.resumeWithPin,
  });

  @override
  AppState reduce() {
    final AppState newState = state.copyWith(
      miscState: state.miscState!.copyWith(
        error: error ?? state.miscState?.error,
        initialRoute: initialRoute ?? state.miscState?.initialRoute,
        communityMembers: communityMembers,
        inactiveTime: inactiveTime ?? state.miscState?.inactiveTime,
        resumeWithPin: resumeWithPin ?? state.miscState?.resumeWithPin,
      ),
    );

    return newState;
  }
}
