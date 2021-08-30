import 'package:healthcloud/application/redux/actions/kyc_state_actions/organization/organization_practitioner_kyc_action.dart';
import 'package:healthcloud/application/redux/states/app_state.dart';
import 'package:healthcloud/application/redux/states/practitioner_kyc_models/practitioner.dart';
import 'package:healthcloud/domain/core/value_objects/app_strings.dart';
import 'package:healthcloud/presentation/onboarding/practitioner_kyc/common/kyc_utils.dart';
import 'package:healthcloud/presentation/onboarding/practitioner_kyc/common/practitioner_kyc_state_view_model.dart';
import 'package:healthcloud/presentation/onboarding/practitioner_kyc/common/widgets/director_identifications.dart';
import 'package:healthcloud/presentation/onboarding/practitioner_kyc/common/widgets/kyc_id_doc_and_kra.dart';
import 'package:healthcloud/presentation/onboarding/practitioner_kyc/common/widgets/kyc_page_bottom_actions.dart';
import 'package:healthcloud/presentation/onboarding/practitioner_kyc/common/widgets/kyc_page_header.dart';
import 'package:healthcloud/presentation/onboarding/practitioner_kyc/common/widgets/kyc_scaffold.dart';
import 'package:healthcloud/presentation/router/routes.dart';
import 'package:async_redux/async_redux.dart';
import 'package:bewell_pro_core/application/redux/states/core_state.dart';
import 'package:flutter/material.dart';
import 'package:shared_themes/spaces.dart';

class OrganizationPractitionerKYCStepThree extends StatefulWidget {
  const OrganizationPractitionerKYCStepThree({Key? key}) : super(key: key);

  @override
  OrganizationPractitionerKYCStepThreeState createState() =>
      OrganizationPractitionerKYCStepThreeState();
}

class OrganizationPractitionerKYCStepThreeState
    extends State<OrganizationPractitionerKYCStepThree> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  String? idNumber;
  String? idDocType;
  String? idUploadId;
  String? kraPin;
  String? kraUploadId;

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
            final OrganizationPractitioner state =
                viewModel.state.organizationPractitioner!;
            return Form(
              key: formKey,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    const KYCPageHeader(
                      title: orgPractitionerKYCHeaderTitle,
                      currentStep: 3,
                      totalSteps: 4,
                    ),
                    mediumVerticalSizedBox,
                    Container(
                      width: double.infinity,
                      height: 1,
                      color: Theme.of(context).accentColor.withOpacity(0.3),
                    ),
                    mediumVerticalSizedBox,
                    KYCIdDocAndKraPIN(
                      showId: false,
                      kraNumOnChanged: (String value) {
                        kraPin = value;
                      },
                      kraNumIDOnChanged: (dynamic value) {
                        kraUploadId = value.toString();
                      },
                    ),
                    mediumVerticalSizedBox,
                    KYCDirectorIdentifications(
                      docs: state.directorIdentifications!,
                      directorIDsDocOnChanged: (dynamic value) {
                        StoreProvider.dispatch<CoreState>(
                          context,
                          OrganizationPractitionerKYCAction(
                            idNumber: value['idNumber'].toString(),
                            idDocID: value['docID'].toString(),
                            idType: value['idType'].toString(),
                          ),
                        );
                      },
                      removeIdentificationFunc: ({
                        required String idNumber,
                      }) {
                        StoreProvider.dispatch<CoreState>(
                          context,
                          OrganizationPractitionerKYCAction(
                              directorIdentificationsBatchUpdate:
                                  removeIdentificationDoc(
                            state.directorIdentifications!,
                            idNumber,
                          )),
                        );
                      },
                    ),
                    size40VerticalSizedBox,
                    KYCPagesBottomActions(
                      onNextOrFinish: () async {
                        formKey.currentState!.save();
                        if (formKey.currentState!.validate()) {
                          await StoreProvider.dispatch<CoreState>(
                              context,
                              OrganizationPractitionerKYCAction(
                                kraPinDocID: kraUploadId,
                                kraPin: kraPin,
                              ));

                          if (!mounted) return;

                          final bool isValidKycFields = validateKYCFields(
                            context: context,
                            idType: state.directorIdentifications!.first.type,
                            idUploadId:
                                state.directorIdentifications!.first.uploadID,
                            kraUploadId: kraUploadId,
                          );

                          if (!isValidKycFields) return;
                        }

                        if (mounted) {
                          Navigator.of(context, rootNavigator: true).pushNamed(
                              organizationPractitionerKYCStepFourRoute);
                        }
                      },
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
