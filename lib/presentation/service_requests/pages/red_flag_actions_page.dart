import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:mycarehubpro/application/core/theme/app_themes.dart';
import 'package:mycarehubpro/application/redux/states/app_state.dart';
import 'package:mycarehubpro/domain/core/entities/service_requests/service_request.dart';
import 'package:mycarehubpro/domain/core/value_objects/app_strings.dart';
import 'package:mycarehubpro/presentation/core/app_bar/custom_app_bar.dart';
import 'package:mycarehubpro/presentation/service_requests/widgets/reach_out_widget.dart';
import 'package:mycarehubpro/presentation/service_requests/widgets/red_flag_list_item.dart';
import 'package:shared_themes/spaces.dart';

class RedFlagActionsPage extends StatelessWidget {
  final ServiceRequest? serviceRequest;

  const RedFlagActionsPage({Key? key, this.serviceRequest}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TargetPlatform _platform = Theme.of(context).platform;

    final String phoneNumber = serviceRequest?.clientPhoneNumber ?? '';
    final String clientName = serviceRequest?.clientName ?? '';
    final String staffFirstName =
        StoreProvider.state<AppState>(context)?.staffState?.user?.firstName ??
            '';
    final String staffLastName =
        StoreProvider.state<AppState>(context)?.staffState?.user?.lastName ??
            '';
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const CustomAppBar(
        title: redFlagString,
        showNotificationIcon: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              smallVerticalSizedBox,
              RichText(
                text: TextSpan(
                  text: serviceRequest?.clientName ?? '',
                  style: veryBoldSize16Text(AppColors.greyTextColor),
                  children: <TextSpan>[
                    TextSpan(
                      text: spacedIsFeelingString,
                      style: normalSize16Text(AppColors.greyTextColor),
                    ),
                    TextSpan(
                      text: verySadString.toLowerCase(),
                    ),
                    TextSpan(
                      text: hereIsEntryString,
                      style: normalSize16Text(AppColors.greyTextColor),
                    ),
                  ],
                ),
              ),
              mediumVerticalSizedBox,
              RedFlagListItem(
                serviceRequest: serviceRequest,
              ),
              largeVerticalSizedBox,
              ReachOutWidget(
                platform: _platform,
                phoneNumber: phoneNumber,
                clientName: clientName,
                staffFirstName: staffFirstName,
                staffLastName: staffLastName,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
