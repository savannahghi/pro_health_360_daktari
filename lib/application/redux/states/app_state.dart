// Package imports:
import 'package:async_redux/async_redux.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:prohealth360_daktari/application/redux/states/connectivity_state.dart';
import 'package:json_annotation/json_annotation.dart';

// Project imports:
import 'package:prohealth360_daktari/application/redux/states/home/bottom_nav_state.dart';
import 'package:prohealth360_daktari/application/redux/states/home_state.dart';
import 'package:prohealth360_daktari/application/redux/states/misc_state.dart';
import 'package:prohealth360_daktari/application/redux/states/onboarding/onboarding_state.dart';
import 'package:prohealth360_daktari/application/redux/states/service_requests/service_requests_state.dart';
import 'package:prohealth360_daktari/application/redux/states/survey_state.dart';
import 'package:prohealth360_daktari/domain/core/entities/core/auth_credentials.dart';
import 'package:prohealth360_daktari/domain/core/entities/core/staff_state.dart';

part 'app_state.freezed.dart';
part 'app_state.g.dart';

// AppState assembles all features states into one that can the pushed during creation
// to create on global app store
@freezed
class AppState with _$AppState {
  factory AppState({
    AuthCredentials? credentials,
    HomeState? homeState,
    OnboardingState? onboardingState,
    BottomNavigationState? bottomNavigationState,
    MiscState? miscState,
    StaffState? staffState,
    SurveyState? surveyState,
    ServiceRequestState? serviceRequestState,
    ConnectivityState? connectivityState,
    @JsonKey(ignore: true) Wait? wait,
  }) = _State;

  factory AppState.fromJson(Map<String, dynamic> json) =>
      _$AppStateFromJson(json);

  factory AppState.initial() => AppState(
        credentials: AuthCredentials.initial(),
        homeState: HomeState.initial(),
        onboardingState: OnboardingState.initial(),
        bottomNavigationState: BottomNavigationState.initial(),
        miscState: MiscState.initial(),
        staffState: StaffState.initial(),
        surveyState: SurveyState.initial(),
        serviceRequestState: ServiceRequestState.initial(),
        connectivityState: ConnectivityState.initial(),
        wait: Wait(),
      );
}
