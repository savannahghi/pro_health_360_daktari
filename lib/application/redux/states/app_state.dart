import 'package:bewell_pro_core/application/redux/states/user_registration_state.dart';
import 'package:healthcloud/application/redux/states/practitioner_kyc_state.dart';
import 'package:async_redux/async_redux.dart';
import 'package:bewell_pro_core/application/redux/states/clinical_state.dart';
import 'package:bewell_pro_core/application/redux/states/connectivity_state.dart';
import 'package:bewell_pro_core/application/redux/states/core_state.dart';
import 'package:bewell_pro_core/application/redux/states/misc_state.dart';
import 'package:bewell_pro_core/application/redux/states/user_feed_state.dart';
import 'package:bewell_pro_core/application/redux/states/user_state.dart';
import 'package:domain_objects/entities.dart';

class AppState extends CoreState {
  const AppState({
    this.practitionerKYCState,
    MiscState? miscState,
    UserFeedState? userFeedState,
    UserState? userState,
    ConnectivityState? connectivityState,
    ClinicalState? clinicalState,
    Navigation? navigationState,
    UserRegistrationState? userRegistrationState,
    SupplierProfile? supplierProfileState,
    Wait? wait,
  }) : super(
          clinicalState: clinicalState,
          miscState: miscState,
          userFeedState: userFeedState,
          userState: userState,
          connectivityState: connectivityState,
          navigationState: navigationState,
          userRegistrationState: userRegistrationState,
          wait: wait,
          supplierProfileState: supplierProfileState,
        );

  factory AppState.initial() => AppState(
        practitionerKYCState: PractitionerKYCState.initial(),
        miscState: MiscState.initial(),
        userFeedState: UserFeedState.initial(),
        userState: UserState.initial(),
        connectivityState: ConnectivityState.initial(),
        clinicalState: ClinicalState.initial(),
        navigationState: Navigation.initial(),
        userRegistrationState: UserRegistrationState.initial(),
        wait: Wait(),
      );

  final PractitionerKYCState? practitionerKYCState;

  @override
  AppState copyWith({
    PractitionerKYCState? practitionerKYCState,
    MiscState? miscState,
    UserFeedState? userFeedState,
    UserState? userState,
    ConnectivityState? connectivityState,
    ClinicalState? clinicalState,
    Navigation? navigationState,
    UserRegistrationState? userRegistrationState,
    SupplierProfile? supplierProfileState,
    Wait? wait,
  }) {
    return AppState(
      practitionerKYCState: practitionerKYCState ?? this.practitionerKYCState,
      miscState: miscState ?? this.miscState,
      userFeedState: userFeedState ?? this.userFeedState,
      userState: userState ?? this.userState,
      connectivityState: connectivityState ?? this.connectivityState,
      clinicalState: clinicalState ?? this.clinicalState,
      navigationState: navigationState ?? this.navigationState,
      userRegistrationState:
          userRegistrationState ?? this.userRegistrationState,
      wait: wait ?? this.wait,
      supplierProfileState: supplierProfileState ?? this.supplierProfileState,
    );
  }

  @override
  List<Object?> get props => <Object?>[
        practitionerKYCState,
        miscState,
        userFeedState,
        userState,
        connectivityState,
        clinicalState,
        navigationState,
        userRegistrationState,
        supplierProfileState,
        wait
      ];
}
