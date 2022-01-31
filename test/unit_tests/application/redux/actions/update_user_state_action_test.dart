// Package imports:
import 'package:async_redux/async_redux.dart';
import 'package:domain_objects/entities.dart';
import 'package:domain_objects/value_objects.dart';
import 'package:flutter_test/flutter_test.dart';

// Project imports:
import 'package:healthcloud/application/redux/actions/core/update_user_state_action.dart';
import 'package:healthcloud/application/redux/states/app_state.dart';
import '../../../../mocks/mocks.dart';

void main() {
  group('UpdateUserStateAction', () {
    final StoreTester<AppState> storeTester = StoreTester<AppState>(
      initialState: AppState.initial(),
      testInfoPrinter: (TestInfo<dynamic> testInfo) {},
    );

    test(
        'should retain values in the state when adding new ones, if the new'
        ' values being added are null', () async {
      // Set the values in state
      await storeTester.dispatch(
        UpdateUserStateAction(
          userProfile: UserProfile(
            secondaryPhoneNumbers: <PhoneNumber>[
              PhoneNumber.withValue('+2547123455678')
            ],
            secondaryEmailAddresses: <EmailAddress>[testEmailAddress],
          ),
        ),
      );

      final TestInfo<AppState> info =
          await storeTester.wait(UpdateUserStateAction);

      expect(info.dispatchCount, 1);

      // trigger a state change with empty values and confirm the state is
      // not changed
      storeTester.dispatch(UpdateUserStateAction());

      final TestInfo<AppState> info2 =
          await storeTester.wait(UpdateUserStateAction);

      expect(info2.dispatchCount, 2);
    });
  });
}
