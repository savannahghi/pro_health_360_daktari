import 'package:healthcloud/application/core/theme/app_themes.dart';
import 'package:healthcloud/application/redux/actions/kyc_state_actions/organization/organization_practitioner_kyc_action.dart';
import 'package:healthcloud/application/redux/states/app_state.dart';
import 'package:healthcloud/application/redux/states/practitioner_kyc_models/practitioner.dart';
import 'package:healthcloud/domain/core/entities/practice_service.dart';
import 'package:healthcloud/domain/core/value_objects/app_strings.dart';
import 'package:healthcloud/presentation/onboarding/practitioner_kyc/common/kyc_utils.dart';
import 'package:healthcloud/presentation/onboarding/practitioner_kyc/common/practitioner_kyc_state_view_model.dart';
import 'package:healthcloud/presentation/onboarding/practitioner_kyc/common/widgets/kyc_license_reg_page.dart';
import 'package:healthcloud/presentation/onboarding/practitioner_kyc/common/widgets/kyc_page_bottom_actions.dart';
import 'package:healthcloud/presentation/onboarding/practitioner_kyc/common/widgets/kyc_page_header.dart';
import 'package:healthcloud/presentation/onboarding/practitioner_kyc/common/widgets/kyc_scaffold.dart';
import 'package:healthcloud/presentation/router/routes.dart';
import 'package:async_redux/async_redux.dart';
import 'package:bewell_pro_core/application/core/services/helpers.dart';
import 'package:bewell_pro_core/application/redux/states/core_state.dart';
import 'package:bewell_pro_core/presentation/onboarding/login/widgets/error_alert_box.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_themes/text_themes.dart';
import 'package:shared_themes/spaces.dart';
import 'package:shared_ui_components/inputs.dart';

class OrganizationPractitionerKYCStepTwo extends StatefulWidget {
  @override
  _OrganizationPractitionerKYCStepTwoState createState() =>
      _OrganizationPractitionerKYCStepTwoState();
}

class _OrganizationPractitionerKYCStepTwoState
    extends State<OrganizationPractitionerKYCStepTwo> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String? cadre;

  String? registrationNumber;

  @override
  Widget build(BuildContext context) {
    return KYCScaffold(
      child: SingleChildScrollView(
        child: StoreConnector<CoreState, PractitionerKYCStateViewModel>(
            converter: (Store<CoreState> store) {
          return PractitionerKYCStateViewModel.fromState(
              store.state as AppState);
        }, builder: (BuildContext context,
                PractitionerKYCStateViewModel viewModel) {
          final OrganizationPractitioner state =
              viewModel.state.organizationPractitioner!;
          return Form(
            key: _formKey,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const KYCPageHeader(
                    title: orgPractitionerKYCHeaderTitle,
                    currentStep: 2,
                    totalSteps: 4,
                  ),
                  mediumVerticalSizedBox,
                  Container(
                    width: double.infinity,
                    height: 1,
                    color: Theme.of(context).accentColor.withOpacity(0.3),
                  ),
                  smallVerticalSizedBox,
                  KYCLicenceAndRegistrationNumber(
                    isPractitioner: true,
                    hasLicence: false,
                    hasRegistrationNumber: true,
                    registrationNumberOnChanged: (String value) {
                      registrationNumber = value;
                    },
                    cadreOnChanged: (String? v) => cadre = v,
                  ),
                  mediumVerticalSizedBox,
                  //practice services
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
                            value: state.practiceServices!
                                .contains(serviceData.value),
                            text: serviceData.display,
                            onChanged: (bool? val) {
                              StoreProvider.dispatch<CoreState>(
                                context,
                                OrganizationPractitionerKYCAction(
                                  practiceServices: addOrRemoveService(
                                    services: state.practiceServices!,
                                    value: serviceData.value,
                                    shouldAdd: val!,
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                        if (state.practiceServices!.isEmpty) ...<Widget>[
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
                    onNextOrFinish: () {
                      _formKey.currentState!.save();
                      if (_formKey.currentState!.validate()) {
                        StoreProvider.dispatch<CoreState>(
                          context,
                          OrganizationPractitionerKYCAction(
                            registrationNumber: registrationNumber,
                            cadre: cadre,
                          ),
                        );
                      }
                      if (state.practiceServices!.isEmpty || cadre == null) {
                        //notify the user
                        showAlertSnackBar(
                          context: context,
                          message: provideAllRequiredInfoString,
                          title: '',
                        );
                        return;
                      }
                      Navigator.of(context, rootNavigator: true)
                          .pushNamed(organizationPractitionerKYCStepThreeRoute);
                    },
                  ),
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}
