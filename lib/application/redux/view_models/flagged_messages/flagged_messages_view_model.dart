import 'package:async_redux/async_redux.dart';
import 'package:mycarehubpro/application/redux/states/app_state.dart';
import 'package:mycarehubpro/domain/core/entities/flagged_messages/flagged_message.dart';

class FlaggedMessagesViewModel extends Vm {
  final Wait wait;
  final List<FlaggedMessage?>? flaggedMessages;

  FlaggedMessagesViewModel({
    required this.wait,
    required this.flaggedMessages,
  }) : super(equals: <Object?>[wait, flaggedMessages]);

  factory FlaggedMessagesViewModel.fromStore(Store<AppState> store) {
    return FlaggedMessagesViewModel(
      wait: store.state.wait!,
      flaggedMessages:
          store.state.staffState?.communitiesState?.flaggedMessages,
    );
  }
}
