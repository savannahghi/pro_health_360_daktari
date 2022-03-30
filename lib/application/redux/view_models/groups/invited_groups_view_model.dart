import 'package:async_redux/async_redux.dart';
import 'package:mycarehubpro/application/redux/states/app_state.dart';
import 'package:mycarehubpro/domain/core/entities/community_members/community.dart';

class InvitedGroupsViewModel extends Vm {
  final Wait wait;
  final List<Community?>? invitedCommunities;

  InvitedGroupsViewModel({
    required this.wait,
    this.invitedCommunities,
  }) : super(equals: <Object?>[wait, invitedCommunities]);

  factory InvitedGroupsViewModel.fromStore(Store<AppState> store) {
    return InvitedGroupsViewModel(
      wait: store.state.wait!,
      invitedCommunities:
          store.state.staffState?.communitiesState?.invitedCommunities,
    );
  }
}
