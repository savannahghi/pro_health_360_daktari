import 'package:async_redux/async_redux.dart';

class AppEntryPointViewModel extends Vm {
  AppEntryPointViewModel({
    required this.idToken,
    required this.userId,
  }) : super(equals: <Object?>[idToken, userId]);

  final String? idToken;
  final String? userId;
}
