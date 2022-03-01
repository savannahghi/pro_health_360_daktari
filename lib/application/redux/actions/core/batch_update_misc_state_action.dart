// Package imports:
import 'package:async_redux/async_redux.dart';
// Project imports:
import 'package:healthcloud/application/redux/states/app_state.dart';
import 'package:healthcloud/domain/core/entities/community_members/member.dart';

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

  BatchUpdateMiscStateAction({
    this.initialRoute,
    this.error,
    this.communityMembers,
  });

  @override
  AppState reduce() {
    final AppState newState = state.copyWith.call(
      miscState: state.miscState!.copyWith(
        error: error ?? state.miscState?.error,
        initialRoute: initialRoute ?? state.miscState?.initialRoute,
        communityMembers: communityMembers ?? state.miscState?.communityMembers,
      ),
    );

    return newState;
  }
}
