import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:prohealth360_daktari/application/redux/actions/flags/app_flags.dart';
import 'package:prohealth360_daktari/application/redux/states/app_state.dart';
import 'package:sentry_flutter/sentry_flutter.dart';
import 'package:stream_chat_flutter/stream_chat_flutter.dart';

class UpdateGroupInfoAction extends ReduxAction<AppState> {
  final String groupName;
  final String groupDescription;
  final Channel channel;
  final VoidCallback? onSuccess;

  UpdateGroupInfoAction({
    required this.groupName,
    required this.groupDescription,
    required this.channel,
    this.onSuccess,
  });

  @override
  void before() {
    super.before();
    dispatch(WaitAction<AppState>.add(updateGroupInfoFlag));
  }

  @override
  void after() {
    dispatch(WaitAction<AppState>.remove(updateGroupInfoFlag));
    super.after();
  }

  @override
  Future<AppState?> reduce() async {
    await channel.updatePartial(
      set: <String, dynamic>{
        'Name': groupName,
        'Description': groupDescription,
      },
    );

    onSuccess?.call();

    return null;
  }

  @override
  Object? wrapError(dynamic error) {
    Sentry.captureException(error);
    return UserException(getErrorMessage());
  }
}
