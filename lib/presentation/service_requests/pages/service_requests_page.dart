// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_svg/flutter_svg.dart';
import 'package:healthcloud/application/core/services/utils.dart';
import 'package:healthcloud/domain/core/value_objects/app_asset_strings.dart';
import 'package:healthcloud/presentation/core/category_item_card.dart';
import 'package:shared_themes/spaces.dart';

// Project imports:
import 'package:healthcloud/application/core/theme/app_themes.dart';
import 'package:healthcloud/domain/core/value_objects/app_strings.dart';
import 'package:healthcloud/presentation/core/app_bar/custom_app_bar.dart';

// Project imports:

class ServiceRequestsPage extends StatelessWidget {
  /// [ServiceRequestsPage] is used to display the user information
  ///
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.lightGreyBackgroundColor,
      appBar: const CustomAppBar(
        title: serviceRequestString,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 40,
                ),
                child:
                    Center(child: SvgPicture.asset(serviceHeaderImageSvgPath),),),
            Container(
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
                boxShadow: <BoxShadow>[
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    spreadRadius: 5,
                    blurRadius: 17,
                    offset: const Offset(0, -6),
                  ),
                ],
              ),
              child: Column(
                children: <Widget>[
                  Wrap(
                    children: <Widget>[
                      ...List<Widget>.generate(
                        serviceRequestItems.length,
                        (int index) {
                          final String iconPath = serviceRequestItems
                              .elementAt(index)
                              .imageAssetPath;
                          final String title =
                              serviceRequestItems.elementAt(index).title;
                              final int totalNumber =
                              serviceRequestItems.elementAt(index).totalNumber;

                          return CategoryItemCard(iconPath: iconPath, title: title, unresolvedNumber: totalNumber,);
                        },
                      ),
                    ],
                  ),
                  veryLargeVerticalSizedBox,
                  veryLargeVerticalSizedBox,
                  veryLargeVerticalSizedBox,
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
