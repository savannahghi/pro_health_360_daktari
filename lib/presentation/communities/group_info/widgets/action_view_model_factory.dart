import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:async_redux/async_redux.dart';
import 'package:flutter_graphql_client/graph_client.dart';
import 'package:mycarehubpro/application/redux/actions/communities/ban_user_action.dart';
import 'package:mycarehubpro/application/redux/actions/communities/fetch_group_members_action.dart';
import 'package:mycarehubpro/application/redux/actions/communities/promote_to_moderator_action.dart';
import 'package:mycarehubpro/application/redux/actions/communities/remove_from_group_action.dart';
import 'package:mycarehubpro/application/redux/actions/communities/unban_user_action.dart';
import 'package:mycarehubpro/application/redux/states/app_state.dart';
import 'package:mycarehubpro/domain/core/value_objects/app_strings.dart';
import 'package:mycarehubpro/presentation/communities/group_info/pages/group_member_connector.dart';
import 'package:mycarehubpro/presentation/communities/group_info/widgets/moderation_actions_view_model.dart';

class ActionViewModelFactory extends VmFactory<AppState, GroupMemberConnector> {
  final IGraphQlClient client;
  final GroupMemberConnector dumbWidget;

  ActionViewModelFactory({required this.client, required this.dumbWidget});

  @override
  ModerationActionsViewModel fromStore() {
    return ModerationActionsViewModel(
      wait: state.wait!,
      unBan: () => unbanUser(),
      ban: () => banUser(),
      promote: () => promoteToModerator(),
      remove: () => remove(),
    );
  }

  void remove() {
    dispatch(
      RemoveFromGroupAction(
        client: client,
        memberID: dumbWidget.memberID,
        communityID: dumbWidget.communityId,
        onFailure: () {
          dumbWidget.onError?.call('${dumbWidget.userName} $unableToRemove');
          dispatch(NavigateAction<AppState>.pop());
        },
        onSuccess: () {
          dumbWidget.onSuccess
              ?.call('${dumbWidget.userName} $removedFromGroup');

          refreshGroupMembers();

          dispatch(NavigateAction<AppState>.pop());
        },
      ),
    );
  }

  void promoteToModerator() {
    dispatch(
      PromoteToModeratorAction(
        client: client,
        memberIds: <String>[dumbWidget.memberID],
        communityId: dumbWidget.communityId,
        successCallback: () {
          dumbWidget.onSuccess?.call('Successfully promoted to admin');

          refreshGroupMembers();
          dispatch(NavigateAction<AppState>.pop());
        },
      ),
    );
  }

  void banUser() {
    dispatch(
      BanUserAction(
        client: client,
        memberID: dumbWidget.memberID,
        communityID: dumbWidget.communityId,
        onError: () => dumbWidget.onError?.call(getErrorMessage()),
        onSuccess: () {
          dumbWidget.onSuccess?.call(
            userBannedMessage(
              communityName: dumbWidget.communityName,
            ),
          );

          refreshGroupMembers();

          dispatch(NavigateAction<AppState>.pop());
        },
      ),
    );
  }

  void unbanUser() {
    dispatch(
      UnBanUserAction(
        client: client,
        memberID: dumbWidget.memberID,
        communityID: dumbWidget.communityId,
        onError: () => dumbWidget.onError?.call(getErrorMessage()),
        onSuccess: () {
          dumbWidget.onSuccess?.call(
            userBannedMessage(
              isBanned: true,
              communityName: dumbWidget.communityName,
            ),
          );

          refreshGroupMembers();

          dispatch(NavigateAction<AppState>.pop());
        },
      ),
    );
  }

  void refreshGroupMembers() {
    dispatch(
      FetchGroupMembersAction(
        client: client,
        channelId: dumbWidget.communityId,
        onError: (String? error) {
          dumbWidget.onError
              ?.call(getErrorMessage(groupMembersText.toLowerCase()));
        },
      ),
    );
  }
}
