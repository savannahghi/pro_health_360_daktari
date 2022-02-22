import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:healthcloud/application/core/theme/app_themes.dart';
import 'package:healthcloud/domain/core/value_objects/app_asset_strings.dart';
import 'package:shared_themes/spaces.dart';

class MemberListItem extends StatelessWidget {
  const MemberListItem({
    required this.username,
    this.isChecked = false,
  });

  final String username;
  final bool isChecked;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Row(
            children: <Widget>[
              Container(
                height: 38,
                width: 38,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.galleryColor,
                ),
                child: Center(
                  child: Text(
                    username.trim()[0].toUpperCase(),
                    style: boldSize14Text(AppColors.primaryColor),
                  ),
                ),
              ),
              smallHorizontalSizedBox,
              Text(
                username,
                style: boldSize12Text(),
              ),
            ],
          ),
          if (isChecked) SvgPicture.asset(doneIconSvgPath) else const SizedBox()
        ],
      ),
    );
  }
}
