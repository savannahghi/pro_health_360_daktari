import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:app_wrapper/app_wrapper.dart';
import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:mycarehubpro/application/redux/actions/flags/app_flags.dart';
import 'package:mycarehubpro/application/redux/states/app_state.dart';
import 'package:mycarehubpro/presentation/communities/group_info/widgets/action_view_model_factory.dart';
import 'package:mycarehubpro/presentation/communities/group_info/widgets/moderation_actions_view_model.dart';

class GroupMemberConnector extends StatelessWidget {
  const GroupMemberConnector({
    required this.userName,
    required this.memberID,
    required this.communityId,
    required this.communityName,
    required this.userType,
    this.isModerator = false,
    this.canModerate = false,
    this.isBanned = false,
    this.itemKey,
    this.onError,
    this.onSuccess,
  });

  final Key? itemKey;
  final String userName;
  final String memberID;
  final String communityId;
  final String communityName;
  final bool isModerator;
  final bool canModerate;
  final bool isBanned;
  final String userType;
  final void Function(String)? onError;
  final void Function(String?)? onSuccess;

  @override
  Widget build(BuildContext context) {
    return GroupMemberItem(
      itemKey: itemKey,
      userName: userName,
      memberID: memberID,
      communityId: communityId,
      communityName: communityName,
      isModerator: isModerator,
      canModerate: canModerate,
      isBanned: isBanned,
      userType: userType,
      onLongPress: () {
        if (canModerate) showModerationDialog(context);
      },
    );
  }

  void showModerationDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (_) {
        return StoreConnector<AppState, ModerationActionsViewModel>(
          vm: () => ActionViewModelFactory(
            dumbWidget: this,
            client: AppWrapperBase.of(context)!.graphQLClient,
          ),
          builder: (BuildContext context, ModerationActionsViewModel vm) {
            return MemberListActionsDialog(
              memberID: memberID,
              communityId: communityId,
              communityName: communityName,
              memberName: userName,
              isModerator: isModerator,
              isBanned: isBanned,
              isPromoting: vm.wait.isWaitingFor(promoteToAdminFlag),
              isBanning:
                  vm.wait.isWaitingFor(isBanned ? unBanUserFlag : banUserFlag),
              isRemoving: vm.wait.isWaitingFor(removeFromGroupFlag),
              onPromoteTapped: vm.promote,
              onBanTapped: isBanned ? vm.unBan : vm.ban,
              onRemoveTapped: vm.remove,
            );
          },
        );
      },
    );
  }
}
