// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:async_redux/async_redux.dart';
import 'package:bewell_pro_core/application/core/services/helpers.dart';
import 'package:bewell_pro_core/application/redux/states/core_state.dart';
import 'package:shared_themes/spaces.dart';
import 'package:shared_ui_components/platform_loader.dart';

// Project imports:
import 'package:healthcloud/application/core/graphql/mutations.dart';
import 'package:healthcloud/application/redux/actions/flags/app_flags.dart';
import 'package:healthcloud/application/redux/actions/kyc_state_actions/individual_practitioner_kyc_action.dart';
import 'package:healthcloud/application/redux/actions/kyc_state_actions/save_kyc_details_action.dart';
import 'package:healthcloud/application/redux/states/app_state.dart';
import 'package:healthcloud/domain/core/value_objects/app_event_strings.dart';
import 'package:healthcloud/domain/core/value_objects/app_strings.dart';
import 'package:healthcloud/presentation/onboarding/practitioner_kyc/common/kyc_utils.dart';
import 'package:healthcloud/presentation/onboarding/practitioner_kyc/common/widgets/kyc_page_bottom_actions.dart';
import 'package:healthcloud/presentation/onboarding/practitioner_kyc/common/widgets/kyc_page_header.dart';
import 'package:healthcloud/presentation/onboarding/practitioner_kyc/common/widgets/kyc_scaffold.dart';
import 'package:healthcloud/presentation/onboarding/practitioner_kyc/common/widgets/kyc_supporting_documents.dart';
import 'package:healthcloud/presentation/onboarding/practitioner_kyc/individual/individual_practitioner_view_model.dart';

class IndividualPractitionerKYCStepThree extends StatefulWidget {
  const IndividualPractitionerKYCStepThree({Key? key}) : super(key: key);

  @override
  _IndividualPractitionerKYCStepThreeState createState() =>
      _IndividualPractitionerKYCStepThreeState();
}

class _IndividualPractitionerKYCStepThreeState
    extends State<IndividualPractitionerKYCStepThree> {
  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

    return KYCScaffold(
      child: SingleChildScrollView(
        child: StoreConnector<CoreState, IndividualPractitionerViewModel>(
          converter: (Store<CoreState> store) {
            return IndividualPractitionerViewModel.fromState(
              store.state as AppState,
            );
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
                      currentStep: 3,
                      totalSteps: 3,
                    ),
                    mediumVerticalSizedBox,
                    Container(
                      width: double.infinity,
                      height: 1,
                      color: Theme.of(context)
                          .colorScheme
                          .secondary
                          .withOpacity(0.3),
                    ),
                    mediumVerticalSizedBox,
                    KYCSupportingDocuments(
                      docs: vm.supportingDocuments!,
                      supportingDocOnChanged: (dynamic value) {
                        StoreProvider.dispatch<CoreState>(
                          context,
                          IndividualPractitionerKYCAction(
                            supportingDocumentTitle: value['title'].toString(),
                            supportingDocumentDescription:
                                value['description'].toString(),
                            supportingDocumentUpload: value['docID'].toString(),
                          ),
                        );
                      },
                      removeDocumentFunc: ({
                        required String title,
                        required String description,
                      }) {
                        StoreProvider.dispatch<CoreState>(
                          context,
                          IndividualPractitionerKYCAction(
                            supportingDocsBatchUpdate: removeSupportingDoc(
                              vm.supportingDocuments!,
                              title,
                              description,
                            ),
                          ),
                        );
                      },
                    ),
                    size40VerticalSizedBox,
                    if (vm.wait.isWaitingFor(kycSavingFlag))
                      const Center(
                        child: SILPlatformLoader(),
                      ),
                    if (!vm.wait.isWaitingFor(kycSavingFlag))
                      KYCPagesBottomActions(
                        onNextOrFinish: () async {
                          if (_formKey.currentState!.validate()) {
                            triggerEvent(
                              individualPractitionerEvent,
                              context,
                            );
                            StoreProvider.dispatch<CoreState>(
                              context,
                              SaveKYCDetailsAction(
                                kycName: individualPractitionerKYCString,
                                context: context,
                                queryString:
                                    addIndividualPractitionerKYCMutation,
                                variables:
                                    individualPractitionerKYCMutationVariables(
                                  payload:
                                      (StoreProvider.state<CoreState>(context)
                                              as AppState?)!
                                          .practitionerKYCState!,
                                ),
                              ),
                            );
                          }
                        },
                        nextText: saveText,
                      )
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
