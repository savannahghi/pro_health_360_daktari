import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:app_wrapper/app_wrapper.dart';
import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:mycarehubpro/application/core/services/helpers.dart';
import 'package:mycarehubpro/application/core/theme/app_themes.dart';
import 'package:mycarehubpro/application/redux/actions/flags/app_flags.dart';
import 'package:mycarehubpro/application/redux/actions/service_requests/resolve_pin_request_action.dart';
import 'package:mycarehubpro/application/redux/states/app_state.dart';
import 'package:mycarehubpro/application/redux/view_models/service_requests/service_requests_view_model.dart';
import 'package:mycarehubpro/domain/core/value_objects/app_enums.dart';
import 'package:mycarehubpro/domain/core/value_objects/app_strings.dart';
import 'package:mycarehubpro/domain/core/value_objects/app_widget_keys.dart';

class IdentityVerificationActionDialog extends StatefulWidget {
  const IdentityVerificationActionDialog({
    required this.clientId,
    required this.serviceRequestId,
    required this.cccNumber,
    required this.phoneNumber,
    required this.pinResetState,
  });
  final String clientId;
  final String serviceRequestId;
  final String cccNumber;
  final String phoneNumber;
  final PinResetState pinResetState;

  @override
  State<IdentityVerificationActionDialog> createState() =>
      _IdentityVerificationActionDialogState();
}

class _IdentityVerificationActionDialogState
    extends State<IdentityVerificationActionDialog> {
  bool physicalIdentityVerified = false;
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      elevation: 1,
      backgroundColor: Colors.white,
      child: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              haveYouVerifiedQuestionString,
              style: veryBoldSize20Text(),
            ),
            size15VerticalSizedBox,
            Text(
              identityConfirmationDialogMessageString,
              style: normalSize15Text(AppColors.greyTextColor),
            ),
            size15VerticalSizedBox,
            Row(
              children: <Widget>[
                SizedBox(
                  height: 24.0,
                  width: 24.0,
                  child: Checkbox(
                    key: verifyPhysicalIdentityCheckboxKey,
                    activeColor: AppColors.primaryColor,
                    value: this.physicalIdentityVerified,
                    onChanged: (bool? value) {
                      if (value != null) {
                        setState(() {
                          this.physicalIdentityVerified = value;
                        });
                      }
                    },
                  ),
                ),
                verySmallHorizontalSizedBox,
                Text(
                  identityVerified,
                  style: boldSize15Text(AppColors.greyTextColor),
                ),
              ],
            ),
            size15VerticalSizedBox,
            StoreConnector<AppState, ServiceRequestsViewModel>(
              converter: (Store<AppState> store) {
                return ServiceRequestsViewModel.fromStore(store);
              },
              builder: (BuildContext context, ServiceRequestsViewModel vm) {
                return SizedBox(
                  width: double.infinity,
                  height: 48,
                  child: vm.wait.isWaitingFor(
                    '${pinResetRequestFlag}_${widget.serviceRequestId}_${PinResetState.APPROVED}',
                  )
                      ? const PlatformLoader()
                      : MyAfyaHubPrimaryButton(
                          text: approveString,
                          textStyle: boldSize16Text(AppColors.whiteColor),
                          textColor: AppColors.whiteColor,
                          onPressed: () {
                            StoreProvider.dispatch(
                              context,
                              ResolvePinRequestAction(
                                clientId: widget.clientId,
                                serviceRequestId: widget.serviceRequestId,
                                cccNumber: widget.cccNumber,
                                phoneNumber: widget.phoneNumber,
                                physicalIdentityVerified:
                                    physicalIdentityVerified,
                                pinResetState: widget.pinResetState,
                                httpClient:
                                    AppWrapperBase.of(context)!.graphQLClient,
                                onPinVerified: () {
                                  showTextSnackbar(
                                    ScaffoldMessenger.of(context),
                                    content: widget.pinResetState ==
                                            PinResetState.APPROVED
                                        ? pinApprovedSuccessText
                                        : pinRejectedSuccessText,
                                  );
                                },
                                onDone: () => Navigator.of(context).pop(),
                              ),
                            );
                          },
                        ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
