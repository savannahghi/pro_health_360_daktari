// Package imports:
import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:chewie/chewie.dart';

import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mycarehubpro/application/core/services/utils.dart';
import 'package:mycarehubpro/application/core/theme/app_themes.dart';
import 'package:mycarehubpro/domain/core/value_objects/app_asset_strings.dart';
import 'package:mycarehubpro/domain/core/value_objects/app_strings.dart';
import 'package:mycarehubpro/domain/core/value_objects/app_widget_keys.dart';
import 'package:mycarehubpro/presentation/profile/faqs/widgets/chewie_video_player.dart';
import 'package:mycarehubpro/presentation/profile/faqs/widgets/estimated_read_time_badge_widget.dart';
import 'package:mycarehubpro/presentation/profile/faqs/widgets/gallery_image_widget.dart';
import 'package:mycarehubpro/presentation/router/routes.dart';
// Project imports:
import 'package:shared_themes/spaces.dart';

class ContentDetailPage extends StatefulWidget {
  const ContentDetailPage({
    required this.payload,
    this.chewieVideoPlayer,
  });

  final ContentDetails payload;
  final ChewieVideoPlayer? chewieVideoPlayer;

  @override
  State<ContentDetailPage> createState() => _ContentDetailPageState();
}

class _ContentDetailPageState extends State<ContentDetailPage> {
  ChewieVideoPlayer? _chewieVideoPlayer;

  @override
  void initState() {
    _chewieVideoPlayer = widget.chewieVideoPlayer;
    if (widget.payload.content.contentType == ContentType.AUDIO_VIDEO) {
      _chewieVideoPlayer = _chewieVideoPlayer ??
          ChewieVideoPlayer(
            chewieController: initializeChewieController(
              dataSource:
                  widget.payload.content.featuredMedia?.first?.mediaUrl ??
                      UNKNOWN,
            ),
            thumbnail: widget.payload.content.heroImage?.url ?? UNKNOWN,
          );
    }
    super.initState();
  }

  @override
  void dispose() {
    _chewieVideoPlayer?.chewieController?.then((ChewieController? value) {
      value?.dispose();
      value?.videoPlayerController.dispose();
    });
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final String createdAt =
        widget.payload.content.metadata?.createdAt ?? DateTime.now().toString();

    final Widget publishDate = createdAt.isNotEmpty
        ? humanizeDate(
            dateTextStyle: boldSize12Text(AppColors.greyTextColor),
            loadedDate: createdAt,
          )
        : const SizedBox();

    final bool hasVideo = widget.payload.content.featuredMedia != null &&
        widget.payload.content.featuredMedia!.isNotEmpty &&
        widget.payload.content.featuredMedia?[0]?.featuredMediaType ==
            FeaturedMediaType.video;

    final List<Widget> galleryItems = getGalleryItems(context: context);

    return Scaffold(
      backgroundColor: AppColors.lightGreyBackgroundColor,
      body: Stack(
        children: <Widget>[
          ListView(
            shrinkWrap: true,
            children: <Widget>[
              Stack(
                children: <Widget>[
                  if (widget.payload.content.contentType ==
                      ContentType.AUDIO_VIDEO)
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 3.5,
                      width: MediaQuery.of(context).size.width,
                      child: _chewieVideoPlayer,
                    )
                  else
                    Container(
                      height: MediaQuery.of(context).size.height / 3.5,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(
                            widget.payload.content.heroImage!.url!,
                          ),
                        ),
                      ),
                    ),
                ],
              ),
              if (galleryItems.isNotEmpty)
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    height: 300,
                    child: GestureDetector(
                      key: galleryImagePageKey,
                      behavior: HitTestBehavior.opaque,
                      onTap: () {
                        if (widget.payload.content.galleryImages != null &&
                            widget.payload.content.galleryImages!.length > 3) {
                          Navigator.of(context).pushNamed(
                            AppRoutes.galleryImagesPage,
                            arguments: widget.payload.content.galleryImages,
                          );
                        }
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[...galleryItems],
                      ),
                    ),
                  ),
                ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      widget.payload.content.title ?? UNKNOWN,
                      style: veryBoldSize18Text(Colors.black),
                    ),
                    mediumVerticalSizedBox,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Container(
                              width: 40,
                              height: 40,
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                  fit: BoxFit.fill,
                                  image: AssetImage(profileImage),
                                ),
                              ),
                            ),
                            smallHorizontalSizedBox,
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text(
                                  widget.payload.content.authorName ?? UNKNOWN,
                                  style: veryBoldSize15Text(
                                    AppColors.greyTextColor,
                                  ),
                                ),
                                verySmallVerticalSizedBox,
                                Row(
                                  children: <Widget>[
                                    Text(
                                      datePublishedString,
                                      style: boldSize12Text(
                                        AppColors.greyTextColor,
                                      ),
                                    ),
                                    publishDate,
                                  ],
                                ),
                              ],
                            )
                          ],
                        ),
                        EstimatedReadTimeBadge(
                          contentType: widget.payload.content.contentType ??
                              ContentType.UNKNOWN,
                          estimateReadTime:
                              widget.payload.content.estimate ?? 0,
                          videoDuration: hasVideo
                              ? widget.payload.content.featuredMedia?.first
                                  ?.duration
                              : null,
                        ),
                      ],
                    ),
                    largeVerticalSizedBox,
                  ],
                ),
              ),
              if (widget.payload.content.body != null)
                Container(
                  padding: const EdgeInsets.only(
                    left: 25,
                    right: 25,
                    bottom: 20,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Html(
                    data: widget.payload.content.body,
                  ),
                )
            ],
          ),
          Positioned(
            top: widget.payload.content.contentType == ContentType.AUDIO_VIDEO
                ? 75
                : 30,
            left: -6,
            child: Container(
              margin: const EdgeInsets.all(10.0),
              child: ElevatedButton(
                key: cancelButtonKey,
                onPressed: () => Navigator.pop(context),
                style: ElevatedButton.styleFrom(
                  primary: AppColors.readTimeBackgroundColor.withOpacity(0.5),
                  shape: const CircleBorder(),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: SvgPicture.asset(
                    whiteCloseIconSvgPath,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> getGalleryItems({required BuildContext context}) {
    final List<GalleryImage>? galleryImages =
        widget.payload.content.galleryImages;
    final BorderRadius imageBorderRadius = BorderRadius.circular(12);
    const double galleryImageHeight = 500;

    final bool hasGalleryImages =
        galleryImages != null && galleryImages.isNotEmpty;

    final List<Widget> galleryItems = <Widget>[];

    if (hasGalleryImages) {
      if (galleryImages.length == 1) {
        galleryItems.addAll(<Widget>[
          GalleryImageWidget(
            borderRadius: imageBorderRadius,
            imageUrl: galleryImages[0].image?.meta?.imageDownloadUrl ?? '',
            height: galleryImageHeight,
            width: MediaQuery.of(context).size.width - 16,
          ),
        ]);
      } else if (galleryImages.length == 2) {
        galleryItems.addAll(<Widget>[
          Expanded(
            child: GalleryImageWidget(
              borderRadius: imageBorderRadius,
              imageUrl: galleryImages[0].image?.meta?.imageDownloadUrl ?? '',
              height: galleryImageHeight,
            ),
          ),
          const SizedBox(width: 4),
          Expanded(
            child: GalleryImageWidget(
              borderRadius: imageBorderRadius,
              imageUrl: galleryImages[1].image?.meta?.imageDownloadUrl ?? '',
              height: galleryImageHeight,
            ),
          ),
        ]);
      } else {
        galleryItems.addAll(<Widget>[
          Expanded(
            child: GalleryImageWidget(
              borderRadius: imageBorderRadius,
              imageUrl: galleryImages[0].image?.meta?.imageDownloadUrl ?? '',
              height: MediaQuery.of(context).size.height,
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Column(
              children: <Widget>[
                Expanded(
                  child: GalleryImageWidget(
                    borderRadius: imageBorderRadius,
                    imageUrl:
                        galleryImages[1].image?.meta?.imageDownloadUrl ?? '',
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                  ),
                ),
                const SizedBox(height: 4),
                Expanded(
                  child: Stack(
                    children: <Widget>[
                      GalleryImageWidget(
                        borderRadius: imageBorderRadius,
                        imageUrl:
                            galleryImages[2].image?.meta?.imageDownloadUrl ??
                                '',
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height,
                      ),
                      if (galleryImages.length > 3)
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: imageBorderRadius,
                            color: Colors.black.withOpacity(0.5),
                          ),
                          child: Center(
                            child: Text(
                              '+ ${galleryImages.length - 3} more',
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                              ),
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ]);
      }
    }

    return galleryItems;
  }
}
