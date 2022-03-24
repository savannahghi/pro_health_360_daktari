import 'package:async_redux/async_redux.dart';
import 'package:mycarehubpro/application/redux/states/app_state.dart';
import 'package:mycarehubpro/domain/core/entities/core/communities_state.dart';

class InvitedGroupsViewModel extends Vm {
  final Wait wait;
  final CommunitiesState? communitiesState;

  InvitedGroupsViewModel({
    required this.wait,
    this.communitiesState,
  }) : super(equals: <Object?>[wait, communitiesState]);

  factory InvitedGroupsViewModel.fromStore(Store<AppState> store) {
    return InvitedGroupsViewModel(
      wait: store.state.wait!,
      communitiesState: store.state.staffState?.communitiesState,
    );
  }
}
