// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_svg/flutter_svg.dart';

// Project imports:
import 'package:healthcloud/application/core/services/helpers.dart';
import 'package:healthcloud/application/core/services/utils.dart';
import 'package:healthcloud/application/core/theme/app_themes.dart';
import 'package:healthcloud/domain/core/value_objects/app_asset_strings.dart';
import 'package:healthcloud/domain/core/value_objects/app_strings.dart';
import 'package:healthcloud/presentation/core/app_bar/custom_app_bar.dart';
import 'package:healthcloud/presentation/core/category_item_card.dart';

class ServiceRequestsPage extends StatelessWidget {
  /// [ServiceRequestsPage] is used to display the user information
  ///
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: serviceRequestString),
      backgroundColor: AppColors.galleryColor,
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 30),
              child: Center(
                child: SvgPicture.asset(
                  serviceRequestsIconSvg,
                  width: 200,
                ),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              padding: const EdgeInsets.all(20),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
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
                          final String route =
                              serviceRequestItems.elementAt(index).route;

                          return GestureDetector(
                            onTap: () {
                              if (route.isNotEmpty) {
                                triggerNavigationEvent(
                                  context: context,
                                  route: route,
                                );
                              }
                            },
                            child: CategoryItemCard(
                              iconPath: iconPath,
                              title: title,
                              unresolvedNumber: totalNumber,
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
