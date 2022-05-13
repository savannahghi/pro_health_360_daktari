import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mycarehubpro/domain/core/value_objects/app_asset_strings.dart';

class PlaceHolderImage extends StatelessWidget {
  const PlaceHolderImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      placeholderImageUrl,
    );
  }
}
