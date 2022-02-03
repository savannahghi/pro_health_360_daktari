import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:healthcloud/application/redux/states/app_state.dart';
import 'package:healthcloud/presentation/router/routes.dart';

/// Does a check on user profile on whether logged in user has bio data and partnerType and
/// redirects accordingly
OnboardingPathConfig onboardingPath({required AppState state}) {
  return OnboardingPathConfig(route: AppRoutes.homePage);
}
