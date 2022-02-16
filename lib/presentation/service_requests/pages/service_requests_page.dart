// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_svg/flutter_svg.dart';
import 'package:healthcloud/domain/core/entities/service_requests/pending_service_requests.dart';
import 'package:healthcloud/domain/core/entities/service_requests/request_count_content.dart';

// Project imports:
import 'package:healthcloud/domain/core/value_objects/app_asset_strings.dart';
import 'package:healthcloud/domain/core/value_objects/app_enums.dart';
import 'package:healthcloud/domain/core/value_objects/app_strings.dart';
import 'package:healthcloud/domain/core/value_objects/app_widget_keys.dart';
import 'package:healthcloud/presentation/core/app_bar/custom_app_bar.dart';
import 'package:healthcloud/presentation/core/widgets/generic_no_data_widget.dart';
import 'package:healthcloud/presentation/engagement/home/widgets/action_card.dart';
import 'package:healthcloud/presentation/router/routes.dart';

class ServiceRequestsPage extends StatelessWidget {
  /// [ServiceRequestsPage] is used to display the user information
  ///
  final PendingServiceRequest pendingServiceRequest;

  const ServiceRequestsPage({Key? key, required this.pendingServiceRequest})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    final int total = pendingServiceRequest.total ?? 0;
    final int? redFlagCount = pendingServiceRequest.serviceRequestsCount
        ?.singleWhere(
          (RequestCountContent? element) =>
              element?.requestType == ServiceRequestType.RED_FLAG,
          orElse: () => RequestCountContent.initial(),
        )
        .count;
    final int? pinResetCount = pendingServiceRequest.serviceRequestsCount
        ?.singleWhere(
          (RequestCountContent? element) =>
              element?.requestType == ServiceRequestType.PIN_RESET,
          orElse: () => RequestCountContent.initial(),
        )
        .count;
    final int? profileUpdateCount = pendingServiceRequest.serviceRequestsCount
        ?.singleWhere(
          (RequestCountContent? element) =>
              element?.requestType == ServiceRequestType.PROFILE_UPDATE,
          orElse: () => RequestCountContent.initial(),
        )
        .count;
    return Scaffold(
      appBar: const CustomAppBar(title: serviceRequestString),
      backgroundColor: Colors.white,
      body: total > 0
          ? SingleChildScrollView(
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
                    padding: const EdgeInsets.only(
                      top: 16.0,
                      left: 16.0,
                      right: 16.0,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Wrap(
                          children: <Widget>[
                            if (pinResetCount != null && pinResetCount > 0)
                              ActionCard(
                                counter: pinResetCount.toString(),
                                iconUrl: pinResetImageSvgPath,
                                title: pinResetString,
                                backgroundColor: Theme.of(context)
                                    .primaryColor
                                    .withOpacity(0.2),
                                onTap: () => Navigator.pushNamed(
                                  context,
                                  AppRoutes.pinResetRequestsPage,
                                ),
                              ),
                            if (redFlagCount != null && redFlagCount > 0)
                              ActionCard(
                                counter: redFlagCount.toString(),
                                iconUrl: redFlagStressSvgPath,
                                title: redFlagString,
                                backgroundColor: Theme.of(context)
                                    .primaryColor
                                    .withOpacity(0.2),
                                onTap: () => Navigator.pushNamed(
                                  context,
                                  AppRoutes.redFlagsPage,
                                ),
                              ),
                            if (profileUpdateCount != null &&
                                profileUpdateCount > 0)
                              ActionCard(
                                counter: profileUpdateCount.toString(),
                                iconUrl: profileUpdateImageSvgPath,
                                title: profileUpdateString,
                                backgroundColor: Theme.of(context)
                                    .primaryColor
                                    .withOpacity(0.2),
                                onTap: () => Navigator.pushNamed(
                                  context,
                                  AppRoutes.profileUpdateRequestsPage,
                                ),
                              )
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )
          : GenericNoDataWidget(
              key: helpNoDataWidgetKey,
              actionText: actionTextGenericNoData,
              type: GenericNoDataTypes.noData,
              recoverCallback: () {
                if (Navigator.canPop(context)) {
                  Navigator.of(context).pop();
                }
              },
              messageTitle: getNoDataTile(serviceRequestsText.toLowerCase()),
              messageBody: noDataBodyString,
            ),
    );
  }
}
