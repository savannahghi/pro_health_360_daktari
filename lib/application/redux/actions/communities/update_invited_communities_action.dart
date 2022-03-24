import 'dart:async';

import 'package:async_redux/async_redux.dart';
import 'package:mycarehubpro/application/redux/states/app_state.dart';
import 'package:mycarehubpro/domain/core/entities/community_members/community.dart';
import 'package:mycarehubpro/domain/core/entities/core/communities_state.dart';

class UpdateInvitedCommunitiesStateAction extends ReduxAction<AppState> {
  final List<Community> communitiesList;

  UpdateInvitedCommunitiesStateAction({required this.communitiesList});
  @override
  Future<AppState?> reduce() async {
    final CommunitiesState? newCommunitiesState = state
        .staffState?.communitiesState
        ?.copyWith(invitedCommunities: communitiesList);

    return state.copyWith(
      staffState:
          state.staffState?.copyWith(communitiesState: newCommunitiesState),
    );
  }
}
