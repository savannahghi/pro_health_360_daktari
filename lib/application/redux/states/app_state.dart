import 'package:async_redux/async_redux.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:healthcloud/application/redux/states/home/bottom_nav_state.dart';
import 'package:healthcloud/application/redux/states/home_state.dart';
import 'package:healthcloud/application/redux/states/misc_state.dart';
import 'package:healthcloud/application/redux/states/onboarding_state.dart';
import 'package:healthcloud/application/redux/states/staff_state.dart';
import 'package:healthcloud/application/redux/states/survey_requests_state.dart';
import 'package:healthcloud/application/redux/states/survey_state.dart';
import 'package:json_annotation/json_annotation.dart';

part 'app_state.freezed.dart';
part 'app_state.g.dart';

// AppState assembles all features states into one that can the pushed during creation
// to create on global app store
@freezed
class AppState with _$AppState {
  factory AppState({
    HomeState? homeState,
    OnboardingState? onboardingState,
    BottomNavigationState? bottomNavigationState,
    MiscState? miscState,
    StaffState? staffState,
    SurveyState? surveyState,
    ServiceRequestState? serviceRequestState,
    @JsonKey(ignore: true) Wait? wait,
  }) = _State;

  factory AppState.fromJson(Map<String, dynamic> json) =>
      _$AppStateFromJson(json);

  factory AppState.initial() => AppState(
        homeState: HomeState.initial(),
        onboardingState: OnboardingState.initial(),
        bottomNavigationState: BottomNavigationState.initial(),
        miscState: MiscState.initial(),
        staffState: StaffState.initial(),
        surveyState: SurveyState.initial(),
        serviceRequestState: ServiceRequestState.initial(),
        wait: Wait(),
      );
}
