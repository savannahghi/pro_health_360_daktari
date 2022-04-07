import 'package:async_redux/async_redux.dart';

class ResumePinViewModel extends Vm {
  final String username;
  final void Function(String) onSubmit;
  final bool isLoading;

  ResumePinViewModel({
    required this.username,
    required this.onSubmit,
    required this.isLoading,
  }) : super(equals: <Object?>[username, isLoading]);
}
