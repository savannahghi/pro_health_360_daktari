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
    MiscState? miscState,
    UserFeedState? userFeedState,
    UserState? userState,
    ConnectivityState? connectivityState,
    ClinicalState? clinicalState,
    Navigation? navigationState,
    Wait? wait,
  }) : super(
          clinicalState: clinicalState,
          miscState: miscState,
          userFeedState: userFeedState,
          userState: userState,
          connectivityState: connectivityState,
          navigationState: navigationState,
          wait: wait,
        );

  factory AppState.initial() => AppState(
        miscState: MiscState.initial(),
        userFeedState: UserFeedState.initial(),
        userState: UserState.initial(),
        connectivityState: ConnectivityState.initial(),
        clinicalState: ClinicalState.initial(),
        navigationState: Navigation.initial(),
        wait: Wait(),
      );

  @override
  AppState copyWith({
    MiscState? miscState,
    UserFeedState? userFeedState,
    UserState? userState,
    ConnectivityState? connectivityState,
    ClinicalState? clinicalState,
    Navigation? navigationState,
    Wait? wait,
  }) {
    return AppState(
      miscState: miscState ?? this.miscState,
      userFeedState: userFeedState ?? this.userFeedState,
      userState: userState ?? this.userState,
      connectivityState: connectivityState ?? this.connectivityState,
      clinicalState: clinicalState ?? this.clinicalState,
      navigationState: navigationState ?? this.navigationState,
      wait: wait ?? this.wait,
    );
  }

  @override
  List<Object?> get props => <Object?>[
        miscState,
        userFeedState,
        userState,
        connectivityState,
        clinicalState,
        navigationState,
        wait
      ];
}
