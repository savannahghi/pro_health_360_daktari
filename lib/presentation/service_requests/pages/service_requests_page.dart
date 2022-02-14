// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_svg/flutter_svg.dart';

// Project imports:
import 'package:healthcloud/application/core/services/utils.dart';
import 'package:healthcloud/domain/core/value_objects/app_asset_strings.dart';
import 'package:healthcloud/domain/core/value_objects/app_strings.dart';
import 'package:healthcloud/presentation/core/app_bar/custom_app_bar.dart';
import 'package:healthcloud/presentation/engagement/home/widgets/action_card.dart';

class ServiceRequestsPage extends StatelessWidget {
  /// [ServiceRequestsPage] is used to display the user information
  ///
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: serviceRequestString),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
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
            Column(
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

                        return ActionCard(
                          backgroundColor: Theme.of(context).primaryColor.withOpacity(0.2),
                          iconUrl: iconPath,
                          title: title,
                          counter: totalNumber.toString(),
                          onTap: () => Navigator.pushNamed(context, route),
                        );
                      },
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
