// Dart imports:
import 'dart:io';

// Package imports:
import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:async_redux/async_redux.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:prohealth360_daktari/application/redux/states/app_state.dart';
import 'package:prohealth360_daktari/domain/core/value_objects/app_widget_keys.dart';
import 'package:prohealth360_daktari/presentation/profile/faqs/pages/content_details_page.dart';

import '../../../../mock_image_http_client.dart';
import '../../../../mocks/mocks.dart';
import '../../../../mocks/test_helpers.dart';

void main() {
  group('ContentDetailPage', () {
    late Store<AppState> store;

    setUp(() {
      store = Store<AppState>(initialState: AppState.initial());
      HttpOverrides.global = TestHttpOverrides();
    });

    testWidgets('renders correctly with the correct content data',
        (WidgetTester tester) async {
      await buildTestWidget(
        tester: tester,
        store: store,
        graphQlClient: MockTestGraphQlClient(),
        widget: ContentDetailPage(
          payload: ContentDetails(
            content: Content.fromJson(contentMock.first).copyWith(
              metadata: ContentMetadata.initial(),
            ),
          ),
        ),
      );
      expect(find.byKey(cancelButtonKey), findsOneWidget);
    });
  });
}
