// Dart imports:
import 'dart:io';

// Package imports:
import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:async_redux/async_redux.dart';
import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail_image_network/mocktail_image_network.dart';
import 'package:mycarehubpro/application/core/services/video_player_initializer.dart';
import 'package:mycarehubpro/application/redux/states/app_state.dart';
import 'package:mycarehubpro/domain/core/value_objects/app_widget_keys.dart';
import 'package:mycarehubpro/presentation/profile/faqs/pages/content_details_page.dart';
import 'package:mycarehubpro/presentation/profile/faqs/pages/gallery_images_page.dart';
import 'package:mycarehubpro/presentation/profile/faqs/widgets/chewie_video_player.dart';
import 'package:mycarehubpro/presentation/profile/faqs/widgets/gallery_image_widget.dart';

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

    testWidgets('renders correctly with the correct video content data',
        (WidgetTester tester) async {
     
      await buildTestWidget(
        tester: tester,
        store: store,
        graphQlClient: MockTestGraphQlClient(),
        widget: ContentDetailPage(
          payload: ContentDetails(
            content: mockVideoContent,
            contentDisplayedType: ContentDisplayedType.BOOKMARK,
          ),
        ),
      );

      expect(find.byType(ChewieVideoPlayer), findsOneWidget);
    });

    testWidgets('chewie video player disposes correctly',
        (WidgetTester tester) async {
      await mockNetworkImages(() async {
        final MockVideoPlayerController controller =
            MockVideoPlayerController();

        controller.value = controller.value.copyWith(
          duration: const Duration(milliseconds: 100),
          isInitialized: true,
        );

        await buildTestWidget(
          tester: tester,
          store: store,
          graphQlClient: MockTestGraphQlClient(),
          widget: ContentDetailPage(
            payload: ContentDetails(
              content: mockVideoContent,
              contentDisplayedType: ContentDisplayedType.BOOKMARK,
            ),
            chewieVideoPlayer: ChewieVideoPlayer(
              chewieController: VideoPlayerInitializer().initializePlayer(
                videoPlayerController: controller,
                autoPlay: true,
              ),
              thumbnail: 'https://127.0.0.1',
            ),
          ),
        );

        await tester.pump(const Duration(seconds: 1));
        await tester.pumpAndSettle();

        expect(find.byType(Chewie), findsOneWidget);
        expect(find.byType(CircularProgressIndicator), findsNothing);
      });
    });
  

    testWidgets('should show gallery image if present',
        (WidgetTester tester) async {
      final Content content = Content(
        heroImage: HeroImage(url: 'url'),
        galleryImages: <GalleryImage>[
          GalleryImage.fromJson(mockGalleryImage),
        ],
      );

      await buildTestWidget(
        tester: tester,
        store: store,
        graphQlClient: MockTestGraphQlClient(),
        widget: ContentDetailPage(payload: ContentDetails(content: content)),
      );
      await tester.pumpAndSettle();

      expect(find.byType(GalleryImageWidget), findsOneWidget);
    });

    testWidgets('should show two gallery images if present',
        (WidgetTester tester) async {
      final Content content = Content(
        heroImage: HeroImage(url: 'url'),
        galleryImages: <GalleryImage>[
          GalleryImage.fromJson(mockGalleryImage),
          GalleryImage.fromJson(mockGalleryImage),
        ],
      );

      await buildTestWidget(
        tester: tester,
        store: store,
        graphQlClient: MockTestGraphQlClient(),
        widget: ContentDetailPage(payload: ContentDetails(content: content)),
      );
      await tester.pumpAndSettle();

      expect(find.byType(GalleryImageWidget), findsNWidgets(2));
    });

    testWidgets('should show three gallery images if present',
        (WidgetTester tester) async {
      final Content content = Content(
        heroImage: HeroImage(url: 'url'),
        galleryImages: <GalleryImage>[
          GalleryImage.fromJson(mockGalleryImage),
          GalleryImage.fromJson(mockGalleryImage),
          GalleryImage.fromJson(mockGalleryImage),
        ],
      );

      await buildTestWidget(
        tester: tester,
        store: store,
        graphQlClient: MockTestGraphQlClient(),
        widget: ContentDetailPage(payload: ContentDetails(content: content)),
      );
      await tester.pumpAndSettle();

      expect(find.byType(GalleryImageWidget), findsNWidgets(3));
    });

    testWidgets(
        'if gallery images are more than 3 should navigate to gallery '
        'images page', (WidgetTester tester) async {
      final Content content = Content(
        heroImage: HeroImage(url: 'url'),
        galleryImages: <GalleryImage>[
          GalleryImage.fromJson(mockGalleryImage),
          GalleryImage.fromJson(mockGalleryImage),
          GalleryImage.fromJson(mockGalleryImage),
          GalleryImage.fromJson(mockGalleryImage),
        ],
      );

      await buildTestWidget(
        tester: tester,
        store: store,
        graphQlClient: MockTestGraphQlClient(),
        widget: ContentDetailPage(payload: ContentDetails(content: content)),
      );
      await tester.pumpAndSettle();

      expect(find.byType(GalleryImageWidget), findsNWidgets(3));

      final Finder galleryImagesKey = find.byKey(galleryImagePageKey);
      expect(galleryImagesKey, findsOneWidget);

      await tester.tap(galleryImagesKey);
      await tester.pumpAndSettle();
      expect(find.byType(GalleryImagesPage), findsOneWidget);
    });

    testWidgets(
        'if gallery images are more than 3 should navigate to gallery '
        'images page', (WidgetTester tester) async {
      final Content content = Content(
        heroImage: HeroImage(url: 'url'),
        galleryImages: <GalleryImage>[
          GalleryImage.fromJson(mockGalleryImage),
          GalleryImage.fromJson(mockGalleryImage),
          GalleryImage.fromJson(mockGalleryImage),
          GalleryImage.fromJson(mockGalleryImage),
        ],
      );

      await buildTestWidget(
        tester: tester,
        store: store,
        graphQlClient: MockTestGraphQlClient(),
        widget: ContentDetailPage(payload: ContentDetails(content: content)),
      );
      await tester.pumpAndSettle();

      expect(find.byType(GalleryImageWidget), findsNWidgets(3));

      final Finder galleryImagesKey = find.byKey(galleryImagePageKey);
      expect(galleryImagesKey, findsOneWidget);

      await tester.tap(galleryImagesKey);
      await tester.pumpAndSettle();
      expect(find.byType(GalleryImagesPage), findsOneWidget);
    });
  });
}
