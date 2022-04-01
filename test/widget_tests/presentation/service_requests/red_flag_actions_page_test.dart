import 'package:async_redux/async_redux.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mycarehubpro/application/redux/states/app_state.dart';
import 'package:mycarehubpro/domain/core/entities/service_requests/service_request.dart';
import 'package:mycarehubpro/domain/core/value_objects/app_widget_keys.dart';
import 'package:mycarehubpro/presentation/service_requests/pages/red_flag_actions_page.dart';
import 'package:mycarehubpro/presentation/service_requests/widgets/reach_out_channel_widget.dart';

import '../../../mocks/test_helpers.dart';

void main() {
  group('RedFlagActionsPage', () {
    late Store<AppState> store;

    setUp(() {
      store = Store<AppState>(initialState: AppState.initial());
    });

    testWidgets('renders correctly', (WidgetTester tester) async {
      await buildTestWidget(
        tester: tester,
        store: store,
        widget: RedFlagActionsPage(
          serviceRequest: ServiceRequest(
            clientId: 'test',
            clientPhoneNumber: '+2547000000000',
          ),
        ),
      );
      await tester.pumpAndSettle();
      final Finder reachOutChannelWidget = find.byType(ReachOutChannelWidget);
      expect(reachOutChannelWidget, findsNWidgets(2));
    });
    testWidgets('call button works correctly', (WidgetTester tester) async {
      await buildTestWidget(
        tester: tester,
        store: store,
        widget: RedFlagActionsPage(
          serviceRequest: ServiceRequest(
            clientId: 'test',
            clientPhoneNumber: '+2547000000000',
          ),
        ),
      );
      await tester.pumpAndSettle();
      final Finder redFlagCallActionButton =
          find.byKey(redFlagCallActionButtonKey);
      expect(redFlagCallActionButton, findsOneWidget);

      await tester.tap(redFlagCallActionButton);
      await tester.pumpAndSettle();
      expect(find.byType(RedFlagActionsPage), findsOneWidget);
    });

    testWidgets('whatsapp button works correctly', (WidgetTester tester) async {
      await buildTestWidget(
        tester: tester,
        store: store,
        widget: RedFlagActionsPage(
          serviceRequest: ServiceRequest(
            clientId: 'test',
            clientPhoneNumber: '+2547000000000',
          ),
        ),
      );
      await tester.pumpAndSettle();
      final Finder redFlagWhatsappActionButton =
          find.byKey(redFlagWhatsappActionButtonKey);
      expect(redFlagWhatsappActionButton, findsOneWidget);

      await tester.tap(redFlagWhatsappActionButton);
      await tester.pumpAndSettle();
      expect(find.byType(RedFlagActionsPage), findsOneWidget);
    });
    testWidgets('whatsapp button works correctly for iOS',
        (WidgetTester tester) async {
      debugDefaultTargetPlatformOverride = TargetPlatform.iOS;
      await buildTestWidget(
        tester: tester,
        store: store,
        widget: RedFlagActionsPage(
          serviceRequest: ServiceRequest(
            clientId: 'test',
            clientPhoneNumber: '+2547000000000',
          ),
        ),
      );
      await tester.pumpAndSettle();
      final Finder redFlagWhatsappActionButton =
          find.byKey(redFlagWhatsappActionButtonKey);
      expect(redFlagWhatsappActionButton, findsOneWidget);

      await tester.tap(redFlagWhatsappActionButton);
      await tester.pumpAndSettle();
      expect(find.byType(RedFlagActionsPage), findsOneWidget);
      debugDefaultTargetPlatformOverride = null;
    });
  });
}
