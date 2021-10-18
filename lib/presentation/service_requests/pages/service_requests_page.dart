// Flutter imports:
import 'package:bewell_pro_core/application/core/services/helpers.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_svg/flutter_svg.dart';
import 'package:healthcloud/application/core/services/utils.dart';
import 'package:healthcloud/domain/core/value_objects/app_asset_strings.dart';
import 'package:healthcloud/presentation/core/category_item_card.dart';

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
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: <Color>[
            AppColors.lightGreyBackgroundColor,
            Colors.white,
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          stops: <double>[0.0, 1.0],
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
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
                child: Center(
                  child: SvgPicture.asset(
                    serviceHeaderImageSvgPath,
                    width: 180,
                  ),
                ),
              ),
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
                      spreadRadius: 1,
                      blurRadius: 8,
                      offset: const Offset(0, -20),
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
      ),
    );
  }
}
