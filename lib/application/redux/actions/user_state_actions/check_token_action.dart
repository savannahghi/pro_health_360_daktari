import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:async_redux/async_redux.dart';
import 'package:mycarehubpro/application/core/services/custom_client.dart';
import 'package:mycarehubpro/application/redux/actions/core/update_credentials_action.dart';
import 'package:mycarehubpro/application/redux/actions/user_state_actions/update_initial_route_action.dart';
import 'package:mycarehubpro/application/redux/states/app_state.dart';
import 'package:mycarehubpro/domain/core/entities/core/auth_credentials.dart';
import 'package:mycarehubpro/presentation/router/routes.dart';

class CheckTokenAction extends ReduxAction<AppState> {
  CheckTokenAction({
    required this.httpClient,
    required this.refreshTokenEndpoint,
  });

  final CustomClient httpClient;
  final String refreshTokenEndpoint;

  @override
  Future<AppState?> reduce() async {
    final bool isSignedIn = state.credentials?.isSignedIn ?? false;

    String initialRoute = AppRoutes.loginPage;

    if (isSignedIn) {
      final DateTime now = DateTime.now();

      final DateTime expiresAt = DateTime.parse(
        state.credentials?.tokenExpiryTimestamp ?? now.toIso8601String(),
      );

      if (hasTokenExpired(expiresAt, now)) {
        AuthCredentials? authCredentials = await httpClient.refreshToken();

        if (authCredentials?.idToken != null &&
            authCredentials?.expiresIn != null &&
            authCredentials?.refreshToken != null) {
          final DateTime expiryTimestamp =
              getTokenExpiryTimestamp(authCredentials?.expiresIn);

          authCredentials = authCredentials?.copyWith(
            tokenExpiryTimestamp: expiryTimestamp.toIso8601String(),
          );

          dispatch(
            UpdateCredentialsAction(
              idToken: authCredentials?.idToken,
              refreshToken: authCredentials?.refreshToken,
              expiresIn: authCredentials?.expiresIn,
              tokenExpiryTimestamp: authCredentials?.tokenExpiryTimestamp,
            ),
          );

          initialRoute = AppRoutes.homePage;
        } else {
          initialRoute = AppRoutes.loginPage;
        }
      } else {
        initialRoute = AppRoutes.homePage;
      }
    }

    dispatch(UpdateInitialRouteAction(initialRoute: initialRoute));
  }
}
