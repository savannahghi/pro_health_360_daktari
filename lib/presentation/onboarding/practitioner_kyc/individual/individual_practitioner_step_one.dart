import 'package:healthcloud/application/core/theme/app_themes.dart';
import 'package:healthcloud/domain/core/entities/practice_service.dart';
import 'package:healthcloud/domain/core/value_objects/app_strings.dart';
import 'package:healthcloud/presentation/onboarding/practitioner_kyc/common/kyc_utils.dart';
import 'package:healthcloud/presentation/onboarding/practitioner_kyc/common/widgets/kyc_license_reg_page.dart';
import 'package:healthcloud/presentation/onboarding/practitioner_kyc/common/widgets/kyc_page_bottom_actions.dart';
import 'package:healthcloud/presentation/onboarding/practitioner_kyc/common/widgets/kyc_page_header.dart';
import 'package:healthcloud/presentation/onboarding/practitioner_kyc/common/widgets/kyc_scaffold.dart';
import 'package:healthcloud/presentation/onboarding/practitioner_kyc/individual/individual_practitioner_view_model.dart';
import 'package:healthcloud/presentation/router/routes.dart';
import 'package:async_redux/async_redux.dart';
import 'package:bewell_pro_core/application/core/services/helpers.dart';
import 'package:bewell_pro_core/application/redux/states/core_state.dart';
import 'package:bewell_pro_core/presentation/onboarding/login/widgets/error_alert_box.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:healthcloud/application/redux/actions/kyc_state_actions/individual_practitioner_kyc_action.dart';
import 'package:healthcloud/application/redux/states/app_state.dart';
import 'package:shared_themes/text_themes.dart';
import 'package:shared_themes/spaces.dart';
import 'package:shared_ui_components/inputs.dart';

class IndividualPractitionerKYCStepOne extends StatefulWidget {
  @override
  _IndividualPractitionerKYCStepOneState createState() =>
      _IndividualPractitionerKYCStepOneState();
}

class _IndividualPractitionerKYCStepOneState
    extends State<IndividualPractitionerKYCStepOne> {
  String? cadre;
  String? license;
  String? licenseUploadID;
  String? registrationNumber;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  void processAndNavigateToStepTwo({
    required GlobalKey<FormState> formKey,
    required List<String>? services,
    required BuildContext context,
  }) {
    _formKey.currentState!.save();
    if (_formKey.currentState!.validate()) {
      StoreProvider.dispatch<CoreState>(
        context,
        IndividualPractitionerKYCAction(
          practiceLicenseID: license,
          registrationNumber: registrationNumber,
          practiceLicenseDocID: licenseUploadID,
          cadre: cadre,
        ),
      );
    }
    if (services!.isEmpty || cadre == null || licenseUploadID == null) {
      // notify the user
      showAlertSnackBar(
        context: context,
        message: provideAllRequiredInfoString,
        title: '',
      );
      return;
    }

    Navigator.of(context, rootNavigator: true)
        .pushNamed(individualPractitionerKYCStepTwoRoute);
  }

  @override
  Widget build(BuildContext context) {
    return KYCScaffold(
      child: SingleChildScrollView(
        child: StoreConnector<CoreState, IndividualPractitionerViewModel>(
          converter: (Store<CoreState> store) {
            return IndividualPractitionerViewModel.fromState(
                store.state as AppState);
          },
          builder: (BuildContext context, IndividualPractitionerViewModel vm) {
            return Form(
              key: _formKey,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    const KYCPageHeader(
                      title: indPractitionerKYCHeaderTitle,
                      currentStep: 1,
                      totalSteps: 3,
                    ),
                    mediumVerticalSizedBox,
                    KYCLicenceAndRegistrationNumber(
                      hasRegistrationNumber: true,
                      isLicenceUploadRequired: true,
                      isPractitioner: true,
                      licenseHint: licenseLabel,
                      licenseLabel: licenseHintText,
                      registrationNumberOnChanged: (String val) {
                        registrationNumber = val;
                      },
                      licenseUploadIDOnChanged: (dynamic value) {
                        licenseUploadID = value.toString();
                      },
                      licenseNumberOnChanged: (String value) {
                        license = value;
                      },
                      cadreOnChanged: (String? v) {
                        cadre = v;
                      },
                    ),
                    mediumVerticalSizedBox,
                    Text(
                      practiceServicesText,
                      style: TextThemes.normalSize16Text(Colors.black87),
                    ),
                    mediumVerticalSizedBox,
                    Container(
                      decoration: decoration(context: context),
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        children: <Widget>[
                          ...practiceServicesList.map(
                            (PracticeService serviceData) => SILCheckbox(
                              checkboxKey: Key(serviceData.value),
                              value: vm.services!.contains(serviceData.value),
                              text: serviceData.display,
                              onChanged: (bool? val) {
                                StoreProvider.dispatch<CoreState>(
                                  context,
                                  IndividualPractitionerKYCAction(
                                    practiceServices: addOrRemoveService(
                                      services: vm.services!,
                                      value: serviceData.value,
                                      shouldAdd: val!,
                                    ),
                                  ),
                                );
                                setState(() {});
                              },
                            ),
                          ),
                          if (vm.services!.isEmpty) ...<Widget>[
                            smallVerticalSizedBox,
                            const ErrorAlertBox(
                              message: practiceServicesRequired,
                              actionSpan: null,
                            ),
                          ],
                        ],
                      ),
                    ),
                    size40VerticalSizedBox,
                    KYCPagesBottomActions(
                      onNextOrFinish: () => processAndNavigateToStepTwo(
                        context: context,
                        formKey: _formKey,
                        services: vm.services,
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
