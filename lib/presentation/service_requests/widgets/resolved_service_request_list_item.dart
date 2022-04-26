// Flutter imports:
import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mycarehubpro/application/core/services/utils.dart';
// Project imports:
import 'package:mycarehubpro/application/core/theme/app_themes.dart';
import 'package:mycarehubpro/domain/core/entities/service_requests/service_request.dart';
import 'package:mycarehubpro/domain/core/value_objects/app_asset_strings.dart';
import 'package:mycarehubpro/domain/core/value_objects/app_strings.dart';
import 'package:shared_themes/spaces.dart';

/// [RedFlagListItem] is a shared widget used in [RedFlagsPage]
///
///It takes in two required [clientName] and [feeling] parameters
class ResolvedServiceRequestListItem extends StatelessWidget {
  const ResolvedServiceRequestListItem({
    this.serviceRequest,
  });
  final ServiceRequest? serviceRequest;

  @override
  Widget build(BuildContext context) {
    final String resolvedAt = serviceRequest?.resolvedTime ?? '';
    final String resolvedBy = serviceRequest?.resolvedByName ?? '';
    return Column(
      children: <Widget>[
        Container(
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.all(15),
          decoration: BoxDecoration(
            color: Theme.of(context).primaryColor.withOpacity(0.14),
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              color: Theme.of(context).primaryColor.withOpacity(0.3),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Flexible(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          serviceRequest?.clientName ?? '',
                          style: veryBoldSize16Text(AppColors.greyTextColor),
                        ),
                        verySmallVerticalSizedBox,
                        Text(
                          serviceRequest?.clientPhoneNumber ?? '',
                          style: normalSize13Text(
                            AppColors.greyTextColor.withOpacity(0.5),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      vertical: 6,
                      horizontal: 10,
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.mountainMeadowColor.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: Text(
                      getServiceRequestName(serviceRequest?.serviceRequestType),
                      style: heavySize12Text(AppColors.mountainMeadowColor),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: Row(
                  children: <Widget>[
                    SvgPicture.asset(
                      doneIconSvgPath,
                      width: 20,
                    ),
                    verySmallHorizontalSizedBox,
                    Flexible(
                      child: RichText(
                        text: TextSpan(
                          text: resolvedString,
                          style: normalSize12Text(AppColors.greyTextColor),
                          children: <TextSpan>[
                            if (resolvedBy.isNotEmpty) ...<TextSpan>[
                              const TextSpan(
                                text: spacedByString,
                              ),
                              TextSpan(
                                text: resolvedBy,
                                style: heavySize12Text(
                                  AppColors.greyTextColor,
                                ),
                              ),
                            ],
                            if (resolvedAt.isNotEmpty &&
                                resolvedAt != UNKNOWN) ...<TextSpan>[
                              const TextSpan(
                                text: spacedOnString,
                              ),
                              TextSpan(
                                text: formatDate(resolvedAt),
                                style: heavySize12Text(
                                  AppColors.greyTextColor,
                                ),
                              ),
                            ]
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        size15VerticalSizedBox,
      ],
    );
  }
}
