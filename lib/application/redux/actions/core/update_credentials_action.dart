// Package imports:
import 'package:async_redux/async_redux.dart';
// Project imports:
import 'package:healthcloud/application/redux/states/app_state.dart';
import 'package:healthcloud/domain/core/entities/core/auth_credentials.dart';

class UpdateCredentialsAction extends ReduxAction<AppState> {
  UpdateCredentialsAction({
    this.idToken,
    this.refreshToken,
    this.expiresIn,
    this.isSignedIn,
    this.signedInTime,
    this.tokenExpiryTimestamp,
  });

  final String? expiresIn;
  final String? idToken;
  final bool? isSignedIn;
  final String? refreshToken;
  final String? signedInTime;
  final String? tokenExpiryTimestamp;

  @override
  AppState? reduce() {
    final AuthCredentials? newCredentials = state.credentials?.copyWith(
      idToken: idToken ?? state.credentials?.idToken,
      expiresIn: expiresIn ?? state.credentials?.expiresIn,
      refreshToken: refreshToken ?? state.credentials?.refreshToken,
      isSignedIn: isSignedIn ?? state.credentials?.isSignedIn,
      signedInTime: signedInTime ?? state.credentials?.signedInTime,
      tokenExpiryTimestamp:
          tokenExpiryTimestamp ?? state.credentials?.tokenExpiryTimestamp,
    );

    return state.copyWith(credentials: newCredentials ?? state.credentials);
  }
}
