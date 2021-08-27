import 'package:healthcloud/application/redux/actions/kyc_state_actions/individual/individual_practitioner_kyc_action.dart';
import 'package:healthcloud/application/redux/states/app_state.dart';
import 'package:healthcloud/domain/core/value_objects/app_strings.dart';
import 'package:healthcloud/presentation/onboarding/practitioner_kyc/common/kyc_utils.dart';
import 'package:healthcloud/presentation/onboarding/practitioner_kyc/common/widgets/kyc_id_doc_and_kra.dart';
import 'package:healthcloud/presentation/onboarding/practitioner_kyc/common/widgets/kyc_page_bottom_actions.dart';
import 'package:healthcloud/presentation/onboarding/practitioner_kyc/common/widgets/kyc_page_header.dart';
import 'package:healthcloud/presentation/onboarding/practitioner_kyc/common/widgets/kyc_scaffold.dart';
import 'package:healthcloud/presentation/onboarding/practitioner_kyc/individual/individual_practitioner_view_model.dart';
import 'package:healthcloud/presentation/router/routes.dart';
import 'package:async_redux/async_redux.dart';
import 'package:bewell_pro_core/application/core/services/helpers.dart';
import 'package:bewell_pro_core/application/redux/states/core_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_themes/spaces.dart';

class IndividualPractitionerKYCStepTwo extends StatefulWidget {
  @override
  _IndividualPractitionerKYCStepTwoState createState() =>
      _IndividualPractitionerKYCStepTwoState();
}

class _IndividualPractitionerKYCStepTwoState
    extends State<IndividualPractitionerKYCStepTwo> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String? idNumber;
  String idDocType = nationalIdText;
  String? idUploadId;
  String? kraPin;
  String? kraUploadId;

  void processAndNavigateIndividualPractitionerKYC(
      {required GlobalKey<FormState> formKey,
      required IndividualPractitionerViewModel vm}) {
    if (_formKey.currentState!.validate()) {
      StoreProvider.dispatch<CoreState>(
        context,
        IndividualPractitionerKYCAction(
          kraPinDocID: kraUploadId,
          kraPin: kraPin,
          idDocID: idUploadId,
          idNumber: idNumber,
          idType: idDocType,
        ),
      );
      if (!validateKYCFields(
          context: context,
          idType: vm.idType,
          idUploadId: idUploadId,
          kraUploadId: kraUploadId)) return;

      triggerNavigationEvent(
        context: context,
        route: individualPractitionerKYCStepThreeRoute,
      );
    }
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
                      currentStep: 2,
                      totalSteps: 3,
                    ),
                    mediumVerticalSizedBox,
                    Container(
                      width: double.infinity,
                      height: 1,
                      color: Theme.of(context).accentColor.withOpacity(0.3),
                    ),
                    mediumVerticalSizedBox,
                    KYCIdDocAndKraPIN(
                      idType: vm.idType,
                      idDocTypeOnChanged: (String? v) {
                        idDocType = v!;
                      },
                      idNumberOnChanged: (String val) {
                        idNumber = val;
                      },
                      idDocIDOnChanged: (dynamic value) {
                        idUploadId = value.toString();
                      },
                      kraNumOnChanged: (String value) {
                        kraPin = value;
                      },
                      kraNumIDOnChanged: (dynamic value) {
                        kraUploadId = value.toString();
                      },
                    ),
                    size40VerticalSizedBox,
                    KYCPagesBottomActions(
                      onNextOrFinish: () =>
                          processAndNavigateIndividualPractitionerKYC(
                              formKey: _formKey, vm: vm),
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
