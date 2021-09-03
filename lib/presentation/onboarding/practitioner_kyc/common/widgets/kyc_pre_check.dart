import 'package:async_redux/async_redux.dart';
import 'package:bewell_pro_core/application/redux/states/core_state.dart';
import 'package:bewell_pro_core/domain/core/value_objects/numbers_constants.dart';
import 'package:bewell_pro_core/presentation/router/routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:healthcloud/application/redux/states/app_state.dart';
import 'package:healthcloud/domain/core/value_objects/app_strings.dart';
import 'package:healthcloud/domain/core/value_objects/app_widget_keys.dart';
import 'package:healthcloud/presentation/onboarding/practitioner_kyc/common/kyc_utils.dart';
import 'package:healthcloud/presentation/onboarding/practitioner_kyc/common/practitioner_kyc_state_view_model.dart';
import 'package:healthcloud/presentation/onboarding/practitioner_kyc/common/widgets/kyc_pre_check_error_banner.dart';
import 'package:shared_themes/colors.dart';
import 'package:shared_themes/spaces.dart';

import 'package:shared_ui_components/buttons.dart';

class KYCPreCheck extends StatefulWidget {
  const KYCPreCheck({required this.continueFunc});

  final VoidCallback continueFunc;

  @override
  _KYCPreCheckState createState() => _KYCPreCheckState();
}

class _KYCPreCheckState extends State<KYCPreCheck> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    WidgetsBinding.instance!.addPostFrameCallback((_) async {
      await hasSupplierSubmittedKYC(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    final bool isUserEmailFilled = userEmailFilled(context);

    return StoreConnector<CoreState, PractitionerKYCStateViewModel>(
      converter: (Store<CoreState> store) {
        return PractitionerKYCStateViewModel.fromState(store.state as AppState);
      },
      builder: (BuildContext context, PractitionerKYCStateViewModel vm) {
        final bool hasUserSubmittedKYC = vm.state.kycSubmitted;
        return Column(
          children: <Widget>[
            if (!isUserEmailFilled) ...<Widget>[
              const KYCPreCheckErrorBanner(
                bannerText: primaryEmailAddressNotFilled,
              ),
              largeVerticalSizedBox
            ],
            if (hasUserSubmittedKYC && isUserEmailFilled) ...<Widget>[
              const KYCPreCheckErrorBanner(
                bannerText: kycAlreadySubmitted,
              ),
              largeVerticalSizedBox,
            ],
            if (!isUserEmailFilled || !hasUserSubmittedKYC) ...<Widget>[
              SizedBox(
                width: double.infinity,
                height: number48,
                child: SILPrimaryButton(
                  onPressed: !isUserEmailFilled
                      ? () => Navigator.of(context)
                          .pushNamed(profileContactDetailsRoute)
                      : () => widget.continueFunc.call(),
                  text: !isUserEmailFilled ? addEmail : continueButtonText,
                ),
              ),
              largeVerticalSizedBox,
            ],
            SizedBox(
              width: double.infinity,
              height: number48,
              child: SILSecondaryButton(
                buttonKey: kycDoItLaterButtonKey,
                borderColor: healthcloudPrimaryColor,
                onPressed: () => Navigator.pop(context),
                text: hasUserSubmittedKYC ? thanksText : doItLater,
              ),
            ),
          ],
        );
      },
    );
  }
}
