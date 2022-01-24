// Package imports:
import 'package:async_redux/async_redux.dart';
import 'package:domain_objects/value_objects.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:healthcloud/application/redux/states/event_state/event_state.dart';
import 'package:healthcloud/application/redux/states/faqs/faq_content.dart';
// Project imports:
import 'package:healthcloud/application/redux/states/home/bottom_nav_state.dart';
import 'package:healthcloud/application/redux/states/user_state.dart';
import 'package:healthcloud/domain/core/entities/core/auth_credentials.dart';
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

@freezed
class StaffState with _$StaffState {
  factory StaffState({
    UserState? userState,
  }) = _StaffState;

  factory StaffState.fromJson(Map<String, dynamic> json) =>
      _$StaffStateFromJson(json);

  factory StaffState.initial() => StaffState(
        ///TODO(paul) extract UserState
        /// Code
        /// Message
        /// Credentials
        /// User
        userState: UserState.initial(),
      );
}

@freezed
class AuthState with _$AuthState {
  factory AuthState({AuthCredentials? credentials}) = _AuthState;

  factory AuthState.fromJson(Map<String, dynamic> json) =>
      _$AuthStateFromJson(json);

  factory AuthState.initial() => AuthState(
        credentials: AuthCredentials.initial(),
      );
}

@freezed
class OnboardingState with _$OnboardingState {
  factory OnboardingState() = _OnboardingState;

  factory OnboardingState.fromJson(Map<String, dynamic> json) =>
      _$OnboardingStateFromJson(json);

  factory OnboardingState.initial() => OnboardingState(

      ///   - Login state
      ///   - create pin
      );
}

@freezed
class HomeState with _$HomeState {
  factory HomeState() = _HomeState;

  factory HomeState.fromJson(Map<String, dynamic> json) =>
      _$HomeStateFromJson(json);

  factory HomeState.initial() => HomeState(

      ///   - SurveyState
      /// ServiceRequests
      );
}

@freezed
class MiscState with _$MiscState {
  factory MiscState({
    String? visitCount,
    String? title,
    String? message,
    String? phoneNumber,
    String? otpCode,
    String? pinCode,
    bool? acceptedTerms,
    List<FAQContent?>? faqList,
    EventState? eventState,

    /// [defaultLocation] the location(branch) that the user has chosen
    String? defaultLocation,

    /// [createPin] used when user is creating a PIN.
    String? createPin,

    /// [confirmPin] used when user is creating a PIN for client side validation
    String? confirmPin,

    /// [invalidCredentials] indicates the provided credentials are invalid.
    bool? invalidCredentials,

    /// [unKnownPhoneNo] indicates that the provided phone number is not known by the backend.
    bool? unKnownPhoneNo,

    /// [accountExists] a signal to the frontend that an account with the provided credentials already exists.
    bool? accountExists,

    /// [invalidPin] used when running pin verification procedure.
    bool? invalidPin,

    /// notify user when the start visit action process fails
    @JsonKey(ignore: true)
        Event<bool?>? startVisitFailed, // TODO: rename to startVisitFailedEvent

    String? patientSearchTerm,
    bool? hasCompletedEnteringOTP, // TODO: remove it is unused
    bool? isResendingOTP, // TODO: remove, it is unused
  }) = _MiscState;

  factory MiscState.fromJson(Map<String, dynamic> json) =>
      _$MiscStateFromJson(json);

  factory MiscState.initial() => MiscState(
        visitCount: UNKNOWN,
        title: UNKNOWN,
        message: UNKNOWN,
        otpCode: UNKNOWN,
        pinCode: UNKNOWN,
        faqList: <FAQContent>[],
        accountExists: false,
        acceptedTerms: false,
        createPin: UNKNOWN,
        confirmPin: UNKNOWN,
        defaultLocation: UNKNOWN,
        phoneNumber: UNKNOWN,
        invalidCredentials: false,
        unKnownPhoneNo: false,
        invalidPin: false,
        hasCompletedEnteringOTP: false,
        isResendingOTP: false,
        eventState: EventState.initial(),
        startVisitFailed: Event<bool>.spent(),
      );
}

@freezed
class SurveyState with _$SurveyState {
  factory SurveyState() = _SurveyState;

  factory SurveyState.fromJson(Map<String, dynamic> json) =>
      _$SurveyStateFromJson(json);

  factory SurveyState.initial() => SurveyState();
}

@freezed
class ServiceRequestState with _$ServiceRequestState {
  factory ServiceRequestState() = _ServiceRequestState;

  factory ServiceRequestState.fromJson(Map<String, dynamic> json) =>
      _$ServiceRequestStateFromJson(json);

  factory ServiceRequestState.initial() => ServiceRequestState();
}
