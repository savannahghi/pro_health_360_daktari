import 'package:bewell_pro_core/application/redux/states/user_registration_state.dart';
import 'package:healthcloud/application/redux/states/practitioner_kyc_state.dart';
import 'package:async_redux/async_redux.dart';
import 'package:healthcloud/application/redux/states/app_state.dart';
import 'package:healthcloud/infrastructure/repository/database_base.dart';
import 'package:healthcloud/infrastructure/repository/database_mobile.dart';
import 'package:healthcloud/infrastructure/repository/initialize_db.dart';
import 'package:domain_objects/entities.dart';
import 'package:flutter/foundation.dart';
import 'package:bewell_pro_core/application/redux/states/clinical_state.dart';
import 'package:bewell_pro_core/application/redux/states/misc_state.dart';
import 'package:bewell_pro_core/application/redux/states/user_feed_state.dart';
import 'package:bewell_pro_core/application/redux/states/user_state.dart';
import 'package:flutter_graphql_client/graph_sqlite.dart';

/// [AfyaMojaStateDatabase] is the middleware that interacts with the database
/// on behalf of the application. From the app's perspective, it doesn't care
/// which database its saving its state on. HCStateDatabase therefore offers
/// different implementations
/// for its method.
class AfyaMojaStateDatabase implements PersistorPrinterDecorator<AppState> {
  AfyaMojaStateDatabase(
      {Duration throttle = const Duration(seconds: 2),
      Duration saveDuration = Duration.zero,
      required this.dataBaseName})
      : _throttle = throttle,
        _saveDuration = saveDuration;

  final Duration? _saveDuration;
  final Duration? _throttle;
  final String dataBaseName;

  @override
  Duration? get throttle => _throttle;

  Duration? get saveDuration => _saveDuration;

  @override
  Future<void> deleteState() async {
    await AfyaMojaDatabaseMobile<Database>(
            initializeDB: InitializeDB<Database>(dbName: this.dataBaseName))
        .clearDatabase();
  }

  @override
  Future<void> persistDifference({
    AppState? lastPersistedState,
    required AppState newState,
  }) async {
    await Future<dynamic>.delayed(saveDuration!);

    if (lastPersistedState == null ||
        lastPersistedState.miscState != newState.miscState ||
        lastPersistedState.userFeedState != newState.userFeedState ||
        lastPersistedState.userState != newState.userState ||
        lastPersistedState.clinicalState != newState.clinicalState ||
        lastPersistedState.practitionerKYCState !=
            newState.practitionerKYCState ||
        lastPersistedState.userRegistrationState !=
            newState.userRegistrationState) {
      await persistState(
        newState,
        AfyaMojaDatabaseMobile<Database>(
          initializeDB: InitializeDB<Database>(dbName: this.dataBaseName),
        ),
      );
    }
  }

  /// we first check whether the database is empty
  ///
  /// - if the database is empty, we return null
  /// - else, we retrieve the state from the database
  @override
  Future<AppState> readState() async {
    if (await AfyaMojaDatabaseMobile<Database>(
            initializeDB: InitializeDB<Database>(dbName: this.dataBaseName))
        .isDatabaseEmpty()) {
      return AppState.initial();
    } else {
      return retrieveState(
        AfyaMojaDatabaseMobile<Database>(
            initializeDB: InitializeDB<Database>(dbName: this.dataBaseName)),
      );
    }
  }

  @override
  Future<void> saveInitialState(AppState state) async {
    return persistDifference(newState: state);
  }

  /// initialize the database
  Future<void> init() async {
    await AfyaMojaDatabaseMobile<Database>(
            initializeDB: InitializeDB<Database>(dbName: this.dataBaseName))
        .database;
  }

  @visibleForTesting
  Future<void> persistState(
      AppState newState, AfyaMojaDatabaseBase<dynamic> database) async {
    // save MISC state
    await database.saveState(
        data: newState.miscState!.toJson(), table: Tables.MiscState);

    // save user feed state
    await database.saveState(
        data: newState.userFeedState!.toJson(), table: Tables.UserFeedState);

    // save user state
    await database.saveState(
        data: newState.userState!.toJson(), table: Tables.UserState);

    await database.saveState(
        data: newState.clinicalState!.toJson(), table: Tables.ClinicalState);

    // save navigation state
    await database.saveState(
        data: newState.navigationState!.toJson(),
        table: Tables.NavigationState);

    // save practitionerKYC state
    await database.saveState(
      data: newState.practitionerKYCState!.toJson(),
      table: Tables.PractitionerKYCState,
    );

    // save userRegistrationState state
    await database.saveState(
      data: newState.userRegistrationState!.toJson(),
      table: Tables.UserRegistrationState,
    );
  }

  @visibleForTesting
  Future<AppState> retrieveState(AfyaMojaDatabaseBase<dynamic> database) async {
    return const AppState().copyWith(
      // retrieve MISC state
      miscState:
          MiscState.fromJson(await database.retrieveState(Tables.MiscState)),

      // retrieve user feed state
      userFeedState: UserFeedState.fromJson(
          await database.retrieveState(Tables.UserFeedState)),

      // retrieve user state
      userState:
          UserState.fromJson(await database.retrieveState(Tables.UserState)),

      // retrieve clinical state
      clinicalState: ClinicalState.fromJson(
          await database.retrieveState(Tables.ClinicalState)),

      // retrieve navigation state
      navigationState: Navigation.fromJson(
          await database.retrieveState(Tables.NavigationState)),

      // retrieve practitionerKYC state
      practitionerKYCState: PractitionerKYCState.fromJson(
          await database.retrieveState(Tables.PractitionerKYCState)),

      // retrieve practitionerKYC state
      userRegistrationState: UserRegistrationState.fromJson(
          await database.retrieveState(Tables.UserRegistrationState)),

      wait: Wait(),
    );
  }
}
