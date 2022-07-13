import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:app_wrapper/app_wrapper.dart';
import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:prohealth360_daktari/application/core/services/helpers.dart';
import 'package:prohealth360_daktari/application/core/theme/app_themes.dart';
import 'package:prohealth360_daktari/application/redux/actions/flags/app_flags.dart';
import 'package:prohealth360_daktari/application/redux/actions/service_requests/resolve_service_request_action.dart';
import 'package:prohealth360_daktari/application/redux/states/app_state.dart';
import 'package:prohealth360_daktari/application/redux/view_models/service_requests/service_requests_view_model.dart';
import 'package:prohealth360_daktari/domain/core/entities/core/staff_state.dart';
import 'package:prohealth360_daktari/domain/core/entities/service_requests/service_request.dart';
import 'package:prohealth360_daktari/domain/core/value_objects/app_strings.dart';
import 'package:prohealth360_daktari/domain/core/value_objects/app_widget_keys.dart';
import 'package:prohealth360_daktari/presentation/core/app_bar/custom_app_bar.dart';
import 'package:prohealth360_daktari/presentation/service_requests/widgets/reach_out_widget.dart';
import 'package:prohealth360_daktari/presentation/service_requests/widgets/red_flag_list_item.dart';

class RedFlagActionsPage extends StatelessWidget {
  const RedFlagActionsPage({Key? key, this.serviceRequest}) : super(key: key);

  final ServiceRequest? serviceRequest;

  @override
  Widget build(BuildContext context) {
    final TargetPlatform _platform = Theme.of(context).platform;
    final TextEditingController actionInputController = TextEditingController();

    final String phoneNumber = serviceRequest?.clientPhoneNumber ?? '';
    final String clientName = serviceRequest?.clientName ?? '';
    final StaffState? staffState =
        StoreProvider.state<AppState>(context)?.staffState;
    final String staffFirstName = staffState?.user?.firstName ?? '';
    final String staffLastName = staffState?.user?.lastName ?? '';
    final String facilityName = staffState?.defaultFacilityName ?? '';

    return Scaffold(
      backgroundColor: Colors.white,
      appBar:
          const CustomAppBar(title: redFlagString, showNotificationIcon: true),
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
              RedFlagListItem(serviceRequest: serviceRequest),
              largeVerticalSizedBox,
              ReachOutWidget(
                platform: _platform,
                phoneNumber: phoneNumber,
                clientName: clientName,
                staffFirstName: staffFirstName,
                staffLastName: staffLastName,
                facilityName: facilityName,
              ),
              mediumVerticalSizedBox,
              Text(
                resolveString,
                style: veryBoldSize18Text(AppColors.greyTextColor),
              ),
              smallVerticalSizedBox,
              RichText(
                text: TextSpan(
                  text: ifYouHaveReachedOutString,
                  style: normalSize16Text(AppColors.greyTextColor),
                  children: <TextSpan>[
                    TextSpan(
                      text: clientName,
                      style: veryBoldSize16Text(AppColors.greyTextColor),
                    ),
                    const TextSpan(
                      text: tapTapBelowToResolveString,
                    ),
                  ],
                ),
              ),
              smallVerticalSizedBox,
              Text(
                actionTakenString,
                style: veryBoldSize18Text(AppColors.greyTextColor),
              ),
              smallVerticalSizedBox,
              TextField(
                key: serviceRequestNotesTextFieldKey,
                keyboardType: TextInputType.visiblePassword,
                controller: actionInputController,
                style: normalSize14Text(
                  AppColors.greyTextColor,
                ),
                maxLines: 9,
                minLines: 3,
                decoration: InputDecoration(
                  hintText: describeActionTakenString,
                  hintStyle: normalSize14Text(
                    AppColors.greyTextColor.withOpacity(0.4),
                  ),
                  filled: true,
                  fillColor: AppColors.galleryColor,
                  enabledBorder: const OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.transparent,
                    ),
                    borderRadius: BorderRadius.all(
                      Radius.circular(6),
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: AppColors.primaryColor.withOpacity(0.3),
                    ),
                    borderRadius: const BorderRadius.all(
                      Radius.circular(6),
                    ),
                  ),
                  focusColor: AppColors.greyTextColor,
                ),
              ),
              mediumVerticalSizedBox,
              StoreConnector<AppState, ServiceRequestsViewModel>(
                converter: (Store<AppState> store) =>
                    ServiceRequestsViewModel.fromStore(store),
                builder: (BuildContext context, ServiceRequestsViewModel vm) {
                  return SizedBox(
                    width: double.infinity,
                    height: 48,
                    child: vm.wait.isWaitingFor(resolveServiceRequestFlag)
                        ? const PlatformLoader()
                        : MyAfyaHubPrimaryButton(
                            buttonKey: resolveRequestButtonKey,
                            text: resolveString,
                            onPressed: () => StoreProvider.dispatch<AppState>(
                              context,
                              ResolveServiceRequestAction(
                                client:
                                    AppWrapperBase.of(context)!.graphQLClient,
                                serviceRequestId: serviceRequest?.id ?? '',
                                actionTakenDescription:
                                    actionInputController.text,
                                onSuccess: () {
                                  showTextSnackbar(
                                    ScaffoldMessenger.of(context),
                                    content: requestResolvedSuccessText,
                                  );
                                  Navigator.of(context).pop();
                                },
                                onFailure: () => showTextSnackbar(
                                  ScaffoldMessenger.of(context),
                                  content: somethingWentWrongText,
                                ),
                              ),
                            ),
                          ),
                  );
                },
              ),
              largeVerticalSizedBox,
            ],
          ),
        ),
      ),
    );
  }
}
