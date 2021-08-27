import 'package:healthcloud/application/redux/actions/kyc_state_actions/organization/organization_practitioner_kyc_action.dart';
import 'package:healthcloud/application/redux/states/app_state.dart';
import 'package:healthcloud/domain/core/value_objects/app_strings.dart';
import 'package:healthcloud/presentation/onboarding/practitioner_kyc/common/practitioner_kyc_state_view_model.dart';
import 'package:healthcloud/presentation/onboarding/practitioner_kyc/common/widgets/kyc_license_reg_page.dart';
import 'package:healthcloud/presentation/onboarding/practitioner_kyc/common/widgets/kyc_page_bottom_actions.dart';
import 'package:healthcloud/presentation/onboarding/practitioner_kyc/common/widgets/kyc_page_header.dart';
import 'package:healthcloud/presentation/onboarding/practitioner_kyc/common/widgets/kyc_scaffold.dart';
import 'package:healthcloud/presentation/router/routes.dart';
import 'package:async_redux/async_redux.dart';
import 'package:bewell_pro_core/application/core/services/helpers.dart';
import 'package:bewell_pro_core/application/redux/states/core_state.dart';
import 'package:flutter/material.dart';
import 'package:shared_themes/spaces.dart';

class OrganizationPractitionerKYCStepOne extends StatefulWidget {
  const OrganizationPractitionerKYCStepOne({Key? key}) : super(key: key);

  @override
  _OrganizationPractitionerKYCStepOneState createState() =>
      _OrganizationPractitionerKYCStepOneState();
}

class _OrganizationPractitionerKYCStepOneState
    extends State<OrganizationPractitionerKYCStepOne> {
  String? practiceLicenceUploadId;
  String? practiceLicence;
  String? certificateOfIncorporation;
  String? certificateOfIncorporationUploadId;
  String? organizationType;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return KYCScaffold(
      child: SingleChildScrollView(
        child: StoreConnector<CoreState, PractitionerKYCStateViewModel>(
          converter: (Store<CoreState> store) {
            return PractitionerKYCStateViewModel.fromState(
                store.state as AppState);
          },
          builder:
              (BuildContext context, PractitionerKYCStateViewModel viewModel) {
            return Form(
              key: _formKey,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    const KYCPageHeader(
                      title: orgPractitionerKYCHeaderTitle,
                      currentStep: 1,
                      totalSteps: 4,
                    ),
                    mediumVerticalSizedBox,
                    Container(
                      width: double.infinity,
                      height: 1,
                      color: Theme.of(context).accentColor.withOpacity(0.3),
                    ),
                    mediumVerticalSizedBox,
                    KYCLicenceAndRegistrationNumber(
                      isOrganization: true,
                      licenseHint: licenseHintText,
                      licenseLabel: licenseLabel,
                      licenseNumberOnChanged: (String value) {
                        practiceLicence = value;
                      },
                      licenseUploadIDOnChanged: (dynamic value) {
                        practiceLicenceUploadId = value.toString();
                      },
                      certificateOfIncorporationDocID: (dynamic value) {
                        certificateOfIncorporationUploadId = value.toString();
                      },
                      onCertificateOfIncorporationNumberChanged: (String val) {
                        certificateOfIncorporation = val;
                      },
                      organizationTypeOnChanged: (String? v) {
                        organizationType = v.toString();
                      },
                    ),

                    size40VerticalSizedBox,

                    //bottom action
                    KYCPagesBottomActions(onNextOrFinish: () {
                      _formKey.currentState!.save();
                      if (_formKey.currentState!.validate()) {
                        StoreProvider.dispatch<CoreState>(
                          context,
                          OrganizationPractitionerKYCAction(
                              organizationTypeName: organizationType,
                              practiceLicenseID: practiceLicence,
                              practiceLicenseDocID: practiceLicenceUploadId,
                              certificateOfIncorporationDocID:
                                  certificateOfIncorporationUploadId,
                              certificateOfIncorporation:
                                  certificateOfIncorporation),
                        );
                      }
                      if (organizationType == null) {
                        //notify the user
                        showAlertSnackBar(
                          context: context,
                          message: orgTypeRequired,
                          title: '',
                        );

                        return;
                      }
                      Navigator.of(context, rootNavigator: true)
                          .pushNamed(organizationPractitionerKYCStepTwoRoute);
                    })
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
