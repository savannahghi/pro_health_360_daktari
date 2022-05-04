import 'package:async_redux/async_redux.dart';
import 'package:flutter/foundation.dart';

class ModerationActionsViewModel extends Vm {
  final Wait wait;
  final VoidCallback? unBan;
  final VoidCallback? ban;
  final VoidCallback? promote;
  final VoidCallback? remove;

  ModerationActionsViewModel({
    required this.wait,
    required this.unBan,
    required this.ban,
    required this.promote,
    required this.remove,
  }) : super(equals: <Object?>[wait]);
}
