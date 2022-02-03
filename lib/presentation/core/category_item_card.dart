// Flutter imports:
import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:shared_themes/spaces.dart';

// Project imports:
import 'package:healthcloud/application/core/theme/app_themes.dart';

class CategoryItemCard extends StatelessWidget {
  /// [CategoryItemCard] is as shared widget in [HomePage] and
  /// [ServiceRequestsPage], used to display the category items
  ///
  /// It takes in required [iconPath], [title] and [unresolvedNumber] as
  /// required parameters
  const CategoryItemCard({
    Key? key,
    required this.iconPath,
    required this.title,
    this.unresolvedNumber = 0,
  }) : super(key: key);

  final String iconPath;
  final String title;
  final int unresolvedNumber;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(bottom: 8),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              width: 145,
              decoration: BoxDecoration(
                border: Border.all(color: AppColors.lightGreyColor),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                children: <Widget>[
                  mediumVerticalSizedBox,
                  SvgPicture.asset(
                    iconPath,
                    height: 70,
                  ),
                  smallVerticalSizedBox,
                  Text(title, style: boldSize12Text(AppColors.greyTextColor)),
                  smallVerticalSizedBox,
                ],
              ),
            ),
          ),
        ),
        if (unresolvedNumber > 0)
          Positioned(
            top: -5,
            right: 18,
            child: Container(
              width: 30,
              padding: const EdgeInsets.all(10.0),
              decoration: const BoxDecoration(
                color: Colors.red,
                shape: BoxShape.circle,
              ),
              child: FittedBox(
                fit: BoxFit.fitWidth,
                child: Text(
                  unresolvedNumber.toString(),
                  style: const TextStyle(color: Colors.white),
                ),
              ),
            ),
          ),
      ],
    );
  }
}
