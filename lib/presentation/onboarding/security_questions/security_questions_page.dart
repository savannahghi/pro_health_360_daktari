import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:app_wrapper/app_wrapper.dart';
import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:mycarehubpro/application/core/services/utils.dart';
import 'package:mycarehubpro/application/core/theme/app_themes.dart';
import 'package:mycarehubpro/application/redux/actions/flags/app_flags.dart';
import 'package:mycarehubpro/application/redux/actions/onboarding/update_onboarding_state_action.dart';
import 'package:mycarehubpro/application/redux/actions/security_questions/get_security_questions_action.dart';
import 'package:mycarehubpro/application/redux/actions/security_questions/record_security_question_responses_action.dart';
import 'package:mycarehubpro/application/redux/actions/security_questions/verify_security_questions_action.dart';
import 'package:mycarehubpro/application/redux/states/app_state.dart';
import 'package:mycarehubpro/application/redux/view_models/onboarding/security_questions_page_view_model.dart';
import 'package:mycarehubpro/domain/core/value_objects/app_asset_strings.dart';
import 'package:mycarehubpro/domain/core/value_objects/app_enums.dart';
import 'package:mycarehubpro/domain/core/value_objects/app_strings.dart';
import 'package:mycarehubpro/domain/core/value_objects/app_widget_keys.dart';
import 'package:mycarehubpro/presentation/onboarding/security_questions/security_question_widget.dart';
// Project imports:

class SecurityQuestionsPage extends StatefulWidget {
  const SecurityQuestionsPage();

  @override
  _SecurityQuestionsPageState createState() => _SecurityQuestionsPageState();
}

class _SecurityQuestionsPageState extends State<SecurityQuestionsPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController dateController = TextEditingController();
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback(
      (_) => StoreProvider.dispatch<AppState>(
        context,
        // retrieve the security questions
        GetSecurityQuestionsAction(
          context: context,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final bool isLargeScreen = ResponsiveWidget.isLargeScreen(context);

    return StoreConnector<AppState, SecurityQuestionsViewModel>(
      converter: (Store<AppState> store) {
        return SecurityQuestionsViewModel.fromStore(store);
      },
      builder: (BuildContext context, SecurityQuestionsViewModel vm) {
        final List<SecurityQuestion?> securityQuestions =
            vm.securityQuestions ?? <SecurityQuestion>[];

        final List<SecurityQuestionResponse> securityQuestionsResponses =
            vm.securityQuestionResponses ?? <SecurityQuestionResponse>[];

        final String userId = vm.userID;

        final bool isResetPin =
            vm.currentOnboardingStage == CurrentOnboardingStage.ResetPIN;

        return Form(
          key: _formKey,
          child: OnboardingScaffold(
            title: isResetPin
                ? verifySecurityQuestionsString
                : setSecurityQuestionsString,
            description: isResetPin
                ? verifyQuestionsDescriptionString
                : securityQuestionsDescriptionString,
            child: SizedBox(
              height: MediaQuery.of(context).size.height / 1.6,
              child: Stack(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(bottom: 50),
                    child: (vm.wait!.isWaitingFor(getSecurityQuestionsFlag) ||
                            vm.wait!
                                .isWaitingFor(recordSecurityQuestionsFlag) ||
                            vm.wait!.isWaitingFor(verifySecurityQuestionsFlag))
                        ? Container(
                            height: 300,
                            padding: const EdgeInsets.all(20),
                            child: const PlatformLoader(),
                          )
                        : securityQuestionsBody(
                            securityQuestions: securityQuestions,
                            securityQuestionsResponses:
                                securityQuestionsResponses,
                            userID: userId,
                          ),
                  ),
                  if ((!vm.wait!.isWaitingFor(getSecurityQuestionsFlag) &&
                          !vm.wait!.isWaitingFor(recordSecurityQuestionsFlag) &&
                          !vm.wait!
                              .isWaitingFor(verifySecurityQuestionsFlag)) &&
                      securityQuestions.isNotEmpty)
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: SizedBox(
                        width: isLargeScreen ? 300 : double.infinity,
                        height: 52,
                        child: MyAfyaHubPrimaryButton(
                          text: saveAndContinueButtonText,
                          buttonColor: AppColors.primaryColor,
                          onPressed: () {
                            final bool? isFormValid =
                                _formKey.currentState?.validate();

                            if (isFormValid != null && isFormValid == true) {
                              final List<SecurityQuestionResponse>
                                  emptyResponses = <SecurityQuestionResponse>[];

                              securityQuestionsResponses.asMap().forEach(
                                (int index, SecurityQuestionResponse value) {
                                  if (value.response == UNKNOWN ||
                                      value.response == '') {
                                    emptyResponses.add(value);
                                  }
                                },
                              );

                              if (emptyResponses.isEmpty) {
                                if (isResetPin) {
                                  StoreProvider.dispatch<AppState>(
                                    context,
                                    VerifySecurityQuestionAction(
                                      client: AppWrapperBase.of(context)!
                                          .graphQLClient,
                                      verifySecurityQuestionsEndpoint:
                                          AppWrapperBase.of(context)!
                                              .customContext!
                                              .verifySecurityQuestionsEndpoint!,
                                    ),
                                  );
                                } else {
                                  StoreProvider.dispatch<AppState>(
                                    context,
                                    RecordSecurityQuestionResponsesAction(
                                      context: context,
                                    ),
                                  );
                                }
                              }

                              StoreProvider.dispatch<AppState>(
                                context,
                                RecordSecurityQuestionResponsesAction(
                                  context: context,
                                ),
                              );
                            } else {
                              ScaffoldMessenger.of(context)
                                ..hideCurrentSnackBar()
                                ..showSnackBar(
                                  const SnackBar(
                                    content: Text(
                                      kindlyAnswerAllQuestionsString,
                                    ),
                                  ),
                                );
                            }
                          },
                        ),
                      ),
                    )
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget securityQuestionsBody({
    required List<SecurityQuestion?> securityQuestions,
    required List<SecurityQuestionResponse> securityQuestionsResponses,
    required String userID,
  }) {
    if (securityQuestions.isEmpty) {
      return GenericErrorWidget(
        actionKey: helpNoDataWidgetKey,
        headerIconSvgUrl: noSecurityQuestionsImage,
        recoverCallback: () async {
          StoreProvider.dispatch<AppState>(
            context,
            GetSecurityQuestionsAction(
              context: context,
            ),
          );
        },
        messageTitle: noQuestionsLoadedString,
        messageBody: const <TextSpan>[
          TextSpan(text: noQuestionsLoadedDescription)
        ],
      );
    } else {
      return ListView.builder(
        itemCount: securityQuestions.length,
        shrinkWrap: true,
        padding: const EdgeInsets.only(top: 5, bottom: 5),
        itemBuilder: (BuildContext context, int index) {
          final SecurityQuestion? question = securityQuestions.elementAt(index);

          return SecurityQuestionWidget(
            securityQuestion: question!,
            response: (securityQuestionsResponses.elementAt(index).response ==
                    UNKNOWN)
                ? null
                : securityQuestionsResponses.elementAt(index).response,
            onChanged: (String? value) {
              if (question.responseType == SecurityQuestionResponseType.DATE &&
                  value != null) {
                final String convertedDate = formatSecurityQuestionDate(
                  value,
                  format: 'dd-MM-yyyy',
                );

                securityQuestionsResponses[index] = SecurityQuestionResponse(
                  userID: userID,
                  securityQuestionID: question.securityQuestionID,
                  response: convertedDate,
                );
              } else {
                securityQuestionsResponses[index] = SecurityQuestionResponse(
                  userID: userID,
                  securityQuestionID: question.securityQuestionID,
                  response: value,
                );
              }

              StoreProvider.dispatch<AppState>(
                context,
                UpdateOnboardingStateAction(
                  securityQuestionsResponses: securityQuestionsResponses,
                ),
              );
            },
          );
        },
      );
    }
  }
}
