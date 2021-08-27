import 'package:healthcloud/application/core/graphql/mutations.dart';
import 'package:healthcloud/application/redux/actions/flags/app_flags.dart';
import 'package:healthcloud/application/redux/actions/kyc_state_actions/organization/organization_practitioner_kyc_action.dart';
import 'package:healthcloud/application/redux/actions/kyc_state_actions/save_kyc_details_action.dart';
import 'package:healthcloud/application/redux/states/app_state.dart';
import 'package:healthcloud/application/redux/states/practitioner_kyc_models/practitioner.dart';
import 'package:healthcloud/domain/core/value_objects/app_event_strings.dart';
import 'package:healthcloud/domain/core/value_objects/app_strings.dart';
import 'package:healthcloud/presentation/onboarding/practitioner_kyc/common/kyc_utils.dart';
import 'package:healthcloud/presentation/onboarding/practitioner_kyc/common/practitioner_kyc_state_view_model.dart';
import 'package:healthcloud/presentation/onboarding/practitioner_kyc/common/widgets/kyc_page_bottom_actions.dart';
import 'package:healthcloud/presentation/onboarding/practitioner_kyc/common/widgets/kyc_page_header.dart';
import 'package:healthcloud/presentation/onboarding/practitioner_kyc/common/widgets/kyc_scaffold.dart';
import 'package:healthcloud/presentation/onboarding/practitioner_kyc/common/widgets/kyc_supporting_documents.dart';
import 'package:async_redux/async_redux.dart';
import 'package:bewell_pro_core/application/core/services/helpers.dart';
import 'package:bewell_pro_core/application/redux/states/core_state.dart';
import 'package:flutter/material.dart';
import 'package:shared_themes/spaces.dart';
import 'package:shared_ui_components/platform_loader.dart';

class OrganizationPractitionerKYCStepFour extends StatefulWidget {
  const OrganizationPractitionerKYCStepFour({Key? key}) : super(key: key);

  @override
  _OrganizationPractitionerKYCStepFourState createState() =>
      _OrganizationPractitionerKYCStepFourState();
}

class _OrganizationPractitionerKYCStepFourState
    extends State<OrganizationPractitionerKYCStepFour> {
  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

    return KYCScaffold(
      child: SingleChildScrollView(
        child: StoreConnector<CoreState, PractitionerKYCStateViewModel>(
          converter: (Store<CoreState> store) {
            return PractitionerKYCStateViewModel.fromState(
                store.state as AppState);
          },
          builder:
              (BuildContext context, PractitionerKYCStateViewModel viewModel) {
            final OrganizationPractitioner state =
                viewModel.state.organizationPractitioner!;
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
                      currentStep: 4,
                      totalSteps: 4,
                    ),
                    mediumVerticalSizedBox,
                    Container(
                      width: double.infinity,
                      height: 1,
                      color: Theme.of(context).accentColor.withOpacity(0.3),
                    ),
                    mediumVerticalSizedBox,
                    KYCSupportingDocuments(
                      docs: state.supportingDocuments!,
                      supportingDocOnChanged: (dynamic value) {
                        StoreProvider.dispatch<CoreState>(
                          context,
                          OrganizationPractitionerKYCAction(
                            supportingDocumentTitle: value['title'].toString(),
                            supportingDocumentDescription:
                                value['description'].toString(),
                            supportingDocumentUpload: value['docID'].toString(),
                          ),
                        );
                      },
                      removeDocumentFunc: (
                          {required String title,
                          required String description}) {
                        StoreProvider.dispatch<CoreState>(
                          context,
                          OrganizationPractitionerKYCAction(
                            supportingDocsBatchUpdate: removeSupportingDoc(
                                state.supportingDocuments!, title, description),
                          ),
                        );
                      },
                    ),
                    size40VerticalSizedBox,
                    if (viewModel.wait.isWaitingFor(kycSavingFlag))
                      const Center(
                        child: SILPlatformLoader(),
                      ),
                    if (!viewModel.wait.isWaitingFor(kycSavingFlag))
                      KYCPagesBottomActions(
                          onNextOrFinish: () async {
                            if (_formKey.currentState!.validate()) {
                              triggerEvent(
                                  organizationPractitionerEvent, context);

                              StoreProvider.dispatch<CoreState>(
                                context,
                                SaveKYCDetailsAction(
                                  kycName: organizationPractitionerKYCString,
                                  context: context,
                                  queryString:
                                      addOrganizationPractitionerKYCMutation,
                                  variables:
                                      organizationPractitionerKYCMutationVariables(
                                          payload:
                                              (StoreProvider.state<CoreState>(
                                                      context) as AppState?)!
                                                  .practitionerKYCState!
                                                  .organizationPractitioner!),
                                ),
                              );
                            }
                          },
                          nextText: saveText)
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
