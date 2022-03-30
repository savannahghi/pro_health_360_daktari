import 'package:async_redux/async_redux.dart';
import 'package:mycarehubpro/application/redux/states/app_state.dart';
import 'package:mycarehubpro/application/redux/states/communities_state.dart';
import 'package:mycarehubpro/domain/core/entities/community_members/community.dart';
import 'package:mycarehubpro/domain/core/entities/flagged_messages/flagged_message.dart';

class UpdateCommunitiesStateAction extends ReduxAction<AppState> {
  UpdateCommunitiesStateAction({
    this.communitiesList,
    this.flaggedMessages,
  });

  final List<Community?>? communitiesList;
  final List<FlaggedMessage?>? flaggedMessages;

  @override
  AppState reduce() {
    final CommunitiesState? communitiesState =
        state.staffState?.communitiesState;

    final CommunitiesState? newCommunitiesState =
        state.staffState?.communitiesState?.copyWith(
      invitedCommunities:
          communitiesList ?? communitiesState?.invitedCommunities,
      flaggedMessages: flaggedMessages ?? communitiesState?.flaggedMessages,
    );

    final AppState newState = state.copyWith(
      staffState:
          state.staffState?.copyWith(communitiesState: newCommunitiesState),
    );
    return newState;
  }
}
