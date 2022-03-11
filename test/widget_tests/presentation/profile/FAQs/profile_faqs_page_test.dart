// Package imports:
import 'dart:convert';
import 'dart:ui';

import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:async_redux/async_redux.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mycarehubpro/application/redux/actions/faqs/update_faqs_content_action.dart';
import 'package:mycarehubpro/application/redux/actions/flags/app_flags.dart';
import 'package:mycarehubpro/application/redux/states/app_state.dart';
import 'package:mycarehubpro/domain/core/value_objects/app_widget_keys.dart';
import 'package:mycarehubpro/presentation/profile/faqs/pages/faq_detail_view_page.dart';
import 'package:mycarehubpro/presentation/profile/faqs/pages/profile_faqs_page.dart';
import 'package:mycarehubpro/presentation/profile/faqs/widgets/faq_item.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:mocktail_image_network/mocktail_image_network.dart';

import '../../../../mocks/mocks.dart';
import '../../../../mocks/test_helpers.dart';

void main() {
  late Store<AppState> store;

  final MockShortGraphQlClient mockShortSILGraphQlClient =
      MockShortGraphQlClient.withResponse(
    'idToken',
    'endpoint',
    http.Response(
      json.encode(<String, dynamic>{
        'data': <String, dynamic>{
          'getFAQContent': <dynamic>[
            mockFAQContent,
          ],
        },
      }),
      201,
    ),
  );

  group('ProfileFaqsPage', () {
    testWidgets('renders correctly', (WidgetTester tester) async {
      tester.binding.window.devicePixelRatioTestValue = 1.0;
      tester.binding.window.physicalSizeTestValue =
          typicalLargePhoneScreenSizePortrait;
      TestWidgetsFlutterBinding.ensureInitialized();
      store = Store<AppState>(initialState: AppState.initial());
      store.dispatch(
        UpdateFAQsContentAction(
          profileFAQs: <FAQContent>[
            FAQContent.initial().copyWith(title: 'title'),
          ],
        ),
      );

      await buildTestWidget(
        tester: tester,
        store: store,
        graphQlClient: MockTestGraphQlClient(),
        widget: const ProfileFaqsPage(),
      );

      await tester.pumpAndSettle();

      expect(find.byKey(appBarBackButtonKey), findsOneWidget);
      expect(find.byType(FAQItem), findsWidgets);

      await tester.tap(find.text('title'));
      await tester.pumpAndSettle();

      expect(find.byType(FAQDetailViewPage), findsWidgets);

      addTearDown(() {
        tester.binding.window.clearPhysicalSizeTestValue();
        tester.binding.window.clearDevicePixelRatioTestValue();
      });
    });

    testWidgets('Shows loading indicator when fetching FAQs',
        (WidgetTester tester) async {
      store = Store<AppState>(
        initialState: AppState.initial().copyWith(onboardingState: null),
      );

      store.dispatch(WaitAction<AppState>.add(getFAQsFlag));

      await buildTestWidget(
        tester: tester,
        store: store,
        graphQlClient: mockShortSILGraphQlClient,
        widget: const ProfileFaqsPage(),
      );

      expect(find.byType(PlatformLoader), findsOneWidget);
    });

    testWidgets('should display zero state widget',
        (WidgetTester tester) async {
      tester.binding.window.physicalSizeTestValue = const Size(1280, 800);
      tester.binding.window.devicePixelRatioTestValue = 1;
      store = Store<AppState>(initialState: AppState.initial());
      final MockShortGraphQlClient mockShortSILGraphQlClient =
          MockShortGraphQlClient.withResponse(
        'idToken',
        'endpoint',
        Response(
          json.encode(<String, dynamic>{
            'data': <String, dynamic>{
              'getFAQContent': <dynamic>[],
            },
          }),
          201,
        ),
      );

      mockNetworkImages(() async {
        await buildTestWidget(
          tester: tester,
          store: store,
          graphQlClient: mockShortSILGraphQlClient,
          widget: const ProfileFaqsPage(),
        );

        await tester.pumpAndSettle();

        expect(find.byType(GenericErrorWidget), findsOneWidget);
        await tester.ensureVisible(find.byKey(helpNoDataWidgetKey));
        await tester.tap(find.byKey(helpNoDataWidgetKey));
        await tester.pumpAndSettle();

        expect(find.byType(GenericErrorWidget), findsOneWidget);
      });
    });

    testWidgets(
        'shows a generic no data widget while fetching the FAQs '
        'and refresh the feed when prompted', (WidgetTester tester) async {
      tester.binding.window.physicalSizeTestValue = const Size(1280, 800);
      tester.binding.window.devicePixelRatioTestValue = 1;
      store = Store<AppState>(initialState: AppState.initial());

      mockNetworkImages(() async {
        final MockShortGraphQlClient client =
            MockShortGraphQlClient.withResponse(
          'idToken',
          'endpoint',
          Response(
            json.encode(<String, dynamic>{'error': 'no data'}),
            201,
          ),
        );

        store.dispatch(UpdateFAQsContentAction(errorFetchingFAQs: true));

        await buildTestWidget(
          tester: tester,
          store: store,
          graphQlClient: client,
          widget: const ProfileFaqsPage(),
        );

        await tester.pump();

        expect(find.byType(GenericErrorWidget), findsOneWidget);

        await tester.ensureVisible(find.byKey(helpNoDataWidgetKey));
        await tester.tap(find.byKey(helpNoDataWidgetKey));
        await tester.pumpAndSettle();

        expect(find.byType(GenericErrorWidget), findsOneWidget);
      });
    });
  });
}
