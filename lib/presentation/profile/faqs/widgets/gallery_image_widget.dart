import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:mycarehubpro/presentation/profile/faqs/widgets/placeholder_image.dart';

class GalleryImageWidget extends StatelessWidget {
  const GalleryImageWidget({
    Key? key,
    this.height,
    this.width,
    BorderRadius? borderRadius,
    required this.imageUrl,
  })  : borderRadius = borderRadius ?? BorderRadius.zero,
        super(key: key);

  final String imageUrl;
  final double? height;
  final double? width;
  final BorderRadius borderRadius;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: borderRadius,
      child: CachedNetworkImage(
        height: height,
        width: width,
        fit: BoxFit.cover,
        placeholder: (BuildContext context, String url) {
          return const PlaceHolderImage();
        },
        imageUrl: imageUrl,
      ),
    );
  }
}
