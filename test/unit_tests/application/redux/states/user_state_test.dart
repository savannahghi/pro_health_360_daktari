// Package imports:
import 'package:flutter_test/flutter_test.dart';

// Project imports:
import 'package:healthcloud/application/redux/states/user_state.dart';

void main() {
  group('UserState:', () {
    final Map<String, dynamic> modifiedUserStateJson = <String, dynamic>{
      'userProfile': <String, dynamic>{
        'primaryEmailAddress': 'unknown@bewell.co.ke',
        'userBioData': <String, dynamic>{
          'firstName': 'Be.Well',
          'lastName': 'By Slade360',
          'dateOfBirth': 'UNKNOWN',
          'gender': 'unknown'
        },
      },
      'auth': <String, dynamic>{
        'customToken': 'some-custom-token',
        'id_token': 'some-id-token',
        'is_anonymous': true,
        'can_experiment': false
      },
    };

    test('should serialize user state json correctly', () {
      final UserState modifiedUserState =
          UserState.fromJson(modifiedUserStateJson);

      expect(
        modifiedUserState.userProfile!.userBioData!.firstName!.getValue(),
        'Be.Well',
      );
      expect(modifiedUserState.auth!.customToken, 'some-custom-token');
    });
  });
}
