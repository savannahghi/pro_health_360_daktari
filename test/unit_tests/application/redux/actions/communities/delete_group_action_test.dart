import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:async_redux/async_redux.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:prohealth360_daktari/application/redux/actions/communities/delete_group_action.dart';
import 'package:prohealth360_daktari/application/redux/states/app_state.dart';
import 'package:stream_chat_flutter/stream_chat_flutter.dart';

import 'delete_group_action_test.mocks.dart';

@GenerateMocks(<Type>[Channel])
void main() {
  late Store<AppState> store;

  setUp(() {
    store = Store<AppState>(initialState: AppState.initial());
  });

  group('DeleteGroupAction', () {
    test('works correctly', () async {
      final StoreTester<AppState> storeTester =
          StoreTester<AppState>.from(store);

      final MockChannel mockStreamChannel = MockChannel();
      when(
        mockStreamChannel.delete(),
      ).thenAnswer(
        (_) => Future<EmptyResponse>.value(EmptyResponse()),
      );

      storeTester.dispatch(DeleteGroupAction(channel: mockStreamChannel));

      final TestInfo<AppState> info =
          await storeTester.waitUntil(DeleteGroupAction);

      expect(info.dispatchCount, 3);
    });

    test('should handle errors', () async {
      final StoreTester<AppState> storeTester =
          StoreTester<AppState>.from(store);

      final MockChannel mockStreamChannel = MockChannel();
      when(
        mockStreamChannel.delete(),
      ).thenThrow(MyAfyaException(cause: 'random error', message: 'message'));

      storeTester.dispatch(DeleteGroupAction(channel: mockStreamChannel));

      final TestInfo<AppState> info =
          await storeTester.waitUntil(DeleteGroupAction);

      expect(info.dispatchCount, 3);
      expect(info.errors.removeFirst().msg, getErrorMessage());
    });
  });
}
