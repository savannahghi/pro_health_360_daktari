import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:async_redux/async_redux.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:mycarehubpro/application/redux/actions/communities/check_user_role_action.dart';
import 'package:mycarehubpro/application/redux/actions/core/update_staff_profile_action.dart';
import 'package:mycarehubpro/application/redux/states/app_state.dart';
import 'package:stream_chat_flutter/stream_chat_flutter.dart';

import 'check_user_role_action_test.mocks.dart';

@GenerateMocks(<Type>[Channel])
void main() {
  late Store<AppState> store;

  setUp(() {
    store = Store<AppState>(initialState: AppState.initial());
  });

  group('CheckUserRoleAction', () {
    test('works correctly', () async {
      final StoreTester<AppState> storeTester =
          StoreTester<AppState>.from(store);

      storeTester.dispatch(UpdateStaffProfileAction(id: 'some-id'));

      final MockChannel mockStreamChannel = MockChannel();
      when(
        mockStreamChannel.queryMembers(filter: anyNamed('filter')),
      ).thenAnswer(
        (_) => Future<QueryMembersResponse>.value(
          QueryMembersResponse.fromJson(<String, dynamic>{
            'members': <dynamic>[
              <String, dynamic>{
                'user': <String, dynamic>{
                  'id': 'some-id',
                },
              },
            ],
          }),
        ),
      );

      storeTester.dispatch(CheckUserRoleAction(channel: mockStreamChannel));

      final TestInfo<AppState> info =
          await storeTester.waitUntil(CheckUserRoleAction);

      expect(info.state.miscState?.groupState?.isModerator, true);
    });

    test('should handle errors', () async {
      final StoreTester<AppState> storeTester =
          StoreTester<AppState>.from(store);

      final MockChannel mockStreamChannel = MockChannel();
      when(
        mockStreamChannel.queryMembers(filter: anyNamed('filter')),
      ).thenThrow(MyAfyaException(cause: 'random error', message: 'message'));

      storeTester.dispatch(CheckUserRoleAction(channel: mockStreamChannel));

      final TestInfo<AppState> info =
          await storeTester.waitUntil(CheckUserRoleAction);

      expect(info.dispatchCount, 1);
      expect(info.errors.removeFirst().msg, getErrorMessage());
    });
  });
}
