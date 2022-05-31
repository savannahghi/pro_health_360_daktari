import 'dart:async';

import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:async_redux/async_redux.dart';
import 'package:flutter/foundation.dart';
import 'package:mycarehubpro/application/redux/actions/flags/app_flags.dart';
import 'package:mycarehubpro/application/redux/states/app_state.dart';
import 'package:sentry_flutter/sentry_flutter.dart';
import 'package:stream_chat_flutter/stream_chat_flutter.dart';

class DeleteGroupAction extends ReduxAction<AppState> {
  final Channel channel;
  final VoidCallback? onSuccess;

  DeleteGroupAction({required this.channel, this.onSuccess});

  @override
  void before() {
    super.before();
    dispatch(WaitAction<AppState>.add(deleteGroupFlag));
  }

  @override
  void after() {
    dispatch(WaitAction<AppState>.remove(deleteGroupFlag));
    super.after();
  }

  @override
  Future<AppState?> reduce() async {
    await channel.delete();
    onSuccess?.call();
  }

  @override
  Object? wrapError(dynamic error) {
    Sentry.captureException(error);
    return UserException(getErrorMessage());
  }
}
