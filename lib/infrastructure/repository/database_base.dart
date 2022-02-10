const String DatabaseName = 'bw.store.db';

/// [MyCareHubProfessionalDatabaseBase] defines an interface to be fulfilled so that a storage component
/// may work, for each exclusive platform. (Mobile and Web)
abstract class MyCareHubProfessionalDatabaseBase<T> {
  /// get the [database] instance
  Future<T> get database;

  /// [saveState] stores the state in the linked [database]
  Future<void> saveState({
    required Map<String, dynamic> data,
    required Tables table,
  });

  /// [countTableRecords] get how many records belong to specific table as in the
  /// case of SQLite, and key as in the case of local storage
  Future<int> countTableRecords(Tables table);

  /// [retrieveState] fetches the state from storage unit
  Future<Map<String, dynamic>> retrieveState(Tables table);

  Future<bool> isDatabaseEmpty();

  /// [clearDatabase] flushes or deletes the database.
  Future<void> clearDatabase();
}

/// [Tables] definitions
enum Tables {
  AuthCredentials,
  HomeState,
  OnboardingState,
  BottomNavigationState,
  MiscState,
  StaffState,
  SurveyState,
  ServiceRequestState,
}

/// [TablesEx] extends [Tables] enum to get the values as
/// strings
extension TablesEx on Tables {
  String get name {
    switch (this) {
      case Tables.AuthCredentials:
        return 'credentials';
      case Tables.HomeState:
        return 'homeState';
      case Tables.OnboardingState:
        return 'onboardingState';
      case Tables.BottomNavigationState:
        return 'bottomNavigationState';
      case Tables.MiscState:
        return 'miscState';
      case Tables.StaffState:
        return 'staffState';
      case Tables.SurveyState:
        return 'surveyState';
      case Tables.ServiceRequestState:
        return 'serviceRequestState';
    }
  }
}
