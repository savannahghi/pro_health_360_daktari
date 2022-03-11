// Flutter imports:
import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:shared_themes/spaces.dart';

// Project imports:
import 'package:mycarehubpro/application/core/services/utils.dart';
import 'package:mycarehubpro/application/core/theme/app_themes.dart';
import 'package:mycarehubpro/domain/core/value_objects/app_asset_strings.dart';
import 'package:mycarehubpro/domain/core/value_objects/app_strings.dart';
import 'package:mycarehubpro/presentation/core/app_bar/custom_app_bar.dart';
import 'package:mycarehubpro/presentation/service_requests/widgets/pin_request_list_item_widget.dart';

class PINResetRequestsPage extends StatelessWidget {
  /// [PINResetRequestsPage] is used to display a list
  /// of pin reset request
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
        appBar: const CustomAppBar(title: pinResetString),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 40,
                ),
                child: Center(
                  child: SvgPicture.asset(
                    pinResetImageSvgPath,
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
                      offset: const Offset(0, -6),
                    ),
                  ],
                ),
                child: Column(
                  children: <Widget>[
                    veryLargeVerticalSizedBox,
                    ...List<Widget>.generate(pinResetRequests.length,
                        (int index) {
                      final String clientName =
                          pinResetRequests.elementAt(index).clientName;
                      final String phoneNumber =
                          pinResetRequests.elementAt(index).phoneNumber;
                      final bool? approvalStatus =
                          pinResetRequests.elementAt(index).approvalStatus;

                      return PINRequestListItem(
                        clientName: clientName,
                        phoneNumber: phoneNumber,
                        approvalStatus: approvalStatus,
                      );
                    }),
                    veryLargeVerticalSizedBox,
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
