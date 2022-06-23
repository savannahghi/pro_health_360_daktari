import 'package:async_redux/async_redux.dart';
import 'package:prohealth360_daktari/application/redux/states/app_state.dart';
import 'package:stream_chat_flutter/stream_chat_flutter.dart';

class FlaggedMessagesViewModel extends Vm {
  final Wait wait;
  final List<Message?>? flaggedMessages;

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
