// Flutter imports:
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:shared_themes/colors.dart';
import 'package:shared_themes/spaces.dart';
import 'package:shared_themes/text_themes.dart';

// Project imports:
import 'package:healthcloud/domain/core/value_objects/app_asset_strings.dart';

class KYCPreCheckErrorBanner extends StatelessWidget {
  const KYCPreCheckErrorBanner({required this.bannerText});

  final String bannerText;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20.0),
      margin: const EdgeInsets.only(top: 15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30.0),
        color: white,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          const Image(
            image: AssetImage(warningImage),
            height: 120.0,
            width: 120.0,
          ),
          largeVerticalSizedBox,
          Text(
            bannerText,
            style: TextThemes.normalSize15Text(),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
