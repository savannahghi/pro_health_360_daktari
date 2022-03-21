import 'package:freezed_annotation/freezed_annotation.dart';

part 'onboarding_path_info.freezed.dart';

@freezed
class OnboardingPathInfo with _$OnboardingPathInfo {
  factory OnboardingPathInfo({
    // The next route to navigate to
    required String nextRoute,

    // The previous route to navigate to
    required String previousRoute,

    // Any route arguments that may need to be passed while navigating
    @Default(null) dynamic arguments,
  }) = _OnboardingPathInfo;
}
