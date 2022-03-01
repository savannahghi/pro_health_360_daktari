// Flutter imports:
import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:healthcloud/domain/core/value_objects/app_asset_strings.dart';
import 'package:healthcloud/domain/core/value_objects/app_strings.dart';

// Package imports:
import 'package:shared_themes/spaces.dart';

// Project imports:
import 'package:healthcloud/application/core/theme/app_themes.dart';
import 'package:healthcloud/presentation/service_requests/widgets/schedule_meet_dialog.dart';

/// [RedFlagListItem] is a shared widget used in [RedFlagsPage]
///
///It takes in two required [clientName] and [feeling] parameters
class RedFlagListItem extends StatelessWidget {
  const RedFlagListItem({
    required this.clientName,
    required this.feelingDescription,
    required this.phoneNumber,
    this.isResolved = false,
    this.resolvedBy,
    this.resolvedAt,
  });

  final String clientName;
  final String feelingDescription;
  final String phoneNumber;
  final bool isResolved;
  final String? resolvedBy;
  final String? resolvedAt;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (phoneNumber.isNotEmpty && !isResolved) {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return ScheduleMeetDialog(
                phoneNumber: phoneNumber,
              );
            },
          );
        }
      },
      child: Column(
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
                            clientName,
                            style: veryBoldSize16Text(AppColors.greyTextColor),
                          ),
                          verySmallVerticalSizedBox,
                          Text(
                            phoneNumber,
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
                        color: AppColors.redColor.withOpacity(0.3),
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: Text(
                        verySadString,
                        style: heavySize12Text(
                          AppColors.redColor,
                        ),
                      ),
                    ),
                  ],
                ),
                size15VerticalSizedBox,
                Text(
                  feelingDescription,
                  style: normalSize14Text(
                    AppColors.greyTextColor,
                  ),
                ),
                if (isResolved)
                  Padding(
                    padding: const EdgeInsets.only(top: 10.0),
                    child: Row(
                      children: <Widget>[
                        SvgPicture.asset(
                          doneIconSvgPath,
                          width: 20,
                        ),
                        verySmallHorizontalSizedBox,
                        RichText(
                          text: TextSpan(
                            text: resolvedString,
                            style: normalSize12Text(
                              AppColors.greyTextColor,
                            ),
                            children: <TextSpan>[
                              if (resolvedBy != null &&
                                  resolvedBy!.isNotEmpty &&
                                  resolvedBy != UNKNOWN) ...<TextSpan>[
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
                              if (resolvedAt != null &&
                                  resolvedAt!.isNotEmpty &&
                                  resolvedAt != UNKNOWN) ...<TextSpan>[
                                const TextSpan(
                                  text: spacedOnString,
                                ),
                                TextSpan(
                                  text: resolvedAt,
                                  style: heavySize12Text(
                                    AppColors.greyTextColor,
                                  ),
                                ),
                              ]
                            ],
                          ),
                        ),
                      ],
                    ),
                  )
              ],
            ),
          ),
          size15VerticalSizedBox,
        ],
      ),
    );
  }
}
