/// Acts as a blueprint for onboarding path configs
class OnboardingPathConfig {
  // The route to navigate to
  final String route;

  // Any route arguments that may need to be passed while navigating
  final dynamic arguments;

  OnboardingPathConfig(this.route, {this.arguments});
}
