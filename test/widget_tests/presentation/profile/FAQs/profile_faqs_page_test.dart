// Package imports:
import 'dart:convert';
import 'dart:ui';

import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:async_redux/async_redux.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:mocktail_image_network/mocktail_image_network.dart';

import 'package:mycarehubpro/application/redux/actions/faqs/update_faqs_content_action.dart';
import 'package:mycarehubpro/application/redux/actions/flags/app_flags.dart';
import 'package:mycarehubpro/application/redux/states/app_state.dart';
import 'package:mycarehubpro/domain/core/value_objects/app_strings.dart';
import 'package:mycarehubpro/domain/core/value_objects/app_widget_keys.dart';
import 'package:mycarehubpro/presentation/profile/faqs/pages/content_details_page.dart';
import 'package:mycarehubpro/presentation/profile/faqs/pages/gallery_images_page.dart';
import 'package:mycarehubpro/presentation/profile/faqs/pages/profile_faqs_page.dart';

import '../../../../mocks/mocks.dart';
import '../../../../mocks/test_helpers.dart';

void main() {
  final MockShortGraphQlClient mockShortSILGraphQlClient =
      MockShortGraphQlClient.withResponse(
    'idToken',
    'endpoint',
    http.Response(
      json.encode(<String, dynamic>{
        'data': <String, dynamic>{
          'getContent': <String, dynamic>{
            'items': <dynamic>[
              contentMock.first,
              documentContentMock,
            ]
          },
          'listContentCategories': categoriesMock,
        },
      }),
      201,
    ),
  );
  late Store<AppState> store;

  setUp(() {
    store = Store<AppState>(initialState: AppState.initial());
    store.dispatch(
      UpdateFAQsContentAction(
        contentCategories: <ContentCategory>[
          ContentCategory(id: 10002, name: 'pro-faqs', icon: 'test')
        ],
      ),
    );
  });
  group('ProfileFaqsPage', () {
    testWidgets('renders correctly', (WidgetTester tester) async {
      store.dispatch(
        UpdateFAQsContentAction(
          profileFAQs: <Content>[
            Content.initial().copyWith(title: 'title'),
          ],
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

        expect(find.text(faqsText), findsOneWidget);
        expect(find.byKey(appBarBackButtonKey), findsOneWidget);
        expect(find.byType(ContentItem), findsNWidgets(2));

        await tester.tap(find.text('Tips on how to keep yourself healthy'));
        await tester.pumpAndSettle();

        expect(find.byType(ContentDetailPage), findsWidgets);
      });
    });

    testWidgets('Shows loading indicator when fetching FAQs',
        (WidgetTester tester) async {
      store.dispatch(WaitAction<AppState>.add(fetchContentCategoriesFlag));
      final MockShortGraphQlClient client = MockShortGraphQlClient.withResponse(
        'idToken',
        'endpoint',
        Response(
          json.encode(<String, dynamic>{
            'data': <String, dynamic>{'loading': true}
          }),
          201,
        ),
      );
      await buildTestWidget(
        tester: tester,
        store: store,
        graphQlClient: client,
        widget: const ProfileFaqsPage(),
      );

      expect(find.byType(PlatformLoader), findsOneWidget);
    });
    testWidgets('navigates to the detail view of a feed item and document page',
        (WidgetTester tester) async {
      final MockShortGraphQlClient mockSILGraphQlClient =
          MockShortGraphQlClient.withResponse(
        'idToken',
        'endpoint',
        Response(
          json.encode(<String, dynamic>{
            'data': <String, dynamic>{
              'listContentCategories': categoriesMock,
              'getContent': <String, dynamic>{
                'items': <dynamic>[documentContentMock]
              }
            }
          }),
          201,
        ),
      );
      tester.binding.window.physicalSizeTestValue = const Size(1280, 800);
      tester.binding.window.devicePixelRatioTestValue = 1;
      mockNetworkImages(() async {
        await buildTestWidget(
          tester: tester,
          store: store,
          graphQlClient: mockSILGraphQlClient,
          widget: const ProfileFaqsPage(),
        );

        await tester.pumpAndSettle();

        expect(find.byType(ContentItem), findsOneWidget);

        await tester.tap(find.byType(ContentItem));
      });
    });
    testWidgets('should refresh FAQs correctly', (WidgetTester tester) async {
      tester.binding.window.physicalSizeTestValue = const Size(1280, 800);
      tester.binding.window.devicePixelRatioTestValue = 1;

      mockNetworkImages(() async {
        await buildTestWidget(
          tester: tester,
          store: store,
          graphQlClient: mockShortSILGraphQlClient,
          widget: const ProfileFaqsPage(),
        );
        final Finder contentItem = find.byType(ContentItem);
        await tester.pumpAndSettle();

        expect(contentItem, findsNWidgets(2));

        await tester.fling(
          contentItem.first,
          const Offset(0.0, 300.0),
          1000.0,
        );
        await tester.pumpAndSettle();
        expect(contentItem, findsNWidgets(2));
      });
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
              'getContent': <String, dynamic>{'items': <dynamic>[]},
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
    testWidgets('shows a generic timeout widget while fetching the feed',
        (WidgetTester tester) async {
      mockNetworkImages(() async {
        final MockShortGraphQlClient client =
            MockShortGraphQlClient.withResponse(
          'idToken',
          'endpoint',
          Response(
            json.encode(<String, dynamic>{'error': 'timeout'}),
            201,
          ),
        );
        store.dispatch(UpdateFAQsContentAction(timeoutFetchingFAQs: true));
        await buildTestWidget(
          tester: tester,
          store: store,
          graphQlClient: client,
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
        'and there is no id', (WidgetTester tester) async {
      tester.binding.window.physicalSizeTestValue = const Size(1280, 800);
      tester.binding.window.devicePixelRatioTestValue = 1;
      store.dispatch(
        UpdateFAQsContentAction(
          contentCategories: <ContentCategory>[
            ContentCategory(id: 0, name: 'test', icon: 'test')
          ],
        ),
      );
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

        await tester.ensureVisible(find.byKey(helpNoDataWidgetKey));
        await tester.tap(find.byKey(helpNoDataWidgetKey));
        await tester.pumpAndSettle();

        expect(find.byType(GenericErrorWidget), findsOneWidget);
      });
    });
    testWidgets('if gallery images are more than 3 should navigate to gallery ',
        (WidgetTester tester) async {
      final MockShortGraphQlClient mockSILGraphQlClient =
          MockShortGraphQlClient.withResponse(
        'idToken',
        'endpoint',
        Response(
          json.encode(<String, dynamic>{
            'data': <String, dynamic>{
              'listContentCategories': categoriesMock,
              'getContent': <String, dynamic>{
                'items': <dynamic>[contentMock.last]
              }
            }
          }),
          201,
        ),
      );
      tester.binding.window.physicalSizeTestValue = const Size(1280, 800);
      tester.binding.window.devicePixelRatioTestValue = 1;
      mockNetworkImages(() async {
        await buildTestWidget(
          tester: tester,
          store: store,
          graphQlClient: mockSILGraphQlClient,
          widget: const ProfileFaqsPage(),
        );

        await tester.pumpAndSettle();

        final Finder contentItem = find.byType(ContentItem);
        expect(find.byType(ContentItem), findsOneWidget);

        await tester.tap(contentItem);
        await tester.pumpAndSettle();

        expect(find.byType(ContentDetailPage), findsOneWidget);

        await tester.tap(find.byKey(const Key('gallery_image_page_key')));
        await tester.pumpAndSettle();
        expect(find.byType(GalleryImagesPage), findsOneWidget);
      });
    });
    testWidgets('navigates to the detail view of a feed item',
        (WidgetTester tester) async {
      tester.binding.window.physicalSizeTestValue = const Size(1280, 800);
      tester.binding.window.devicePixelRatioTestValue = 1;
      mockNetworkImages(() async {
        await buildTestWidget(
          tester: tester,
          store: store,
          graphQlClient: mockShortSILGraphQlClient,
          widget: const ProfileFaqsPage(),
        );

        await tester.pumpAndSettle();
        final Finder contentItem = find.byType(ContentItem);

        expect(contentItem, findsNWidgets(2));

        await tester.tap(contentItem.first);
        await tester.pumpAndSettle();

        expect(find.byType(ContentDetailPage), findsOneWidget);

        final Finder cancelButton = find.byKey(cancelButtonKey);
        expect(cancelButton, findsOneWidget);
        await tester.ensureVisible(cancelButton);
        await tester.pumpAndSettle();
        await tester.tap(cancelButton);
        await tester.pumpAndSettle();
        expect(contentItem, findsNWidgets(2));
      });
    });
  });
}
