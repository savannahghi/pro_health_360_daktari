// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:afya_moja_core/buttons.dart';
import 'package:afya_moja_core/inputs.dart';
import 'package:afya_moja_core/onboarding_scaffold.dart';
import 'package:misc_utilities/number_constants.dart';
import 'package:misc_utilities/responsive_widget.dart';
import 'package:user_feed/user_feed.dart';

// Project imports:
import 'package:healthcloud/domain/core/entities/security_questions/security_question.dart';
import 'package:healthcloud/domain/core/value_objects/app_strings.dart';

class SecurityQuestionsPage extends StatelessWidget {
  const SecurityQuestionsPage();

  @override
  Widget build(BuildContext context) {
    final List<SecurityQuestion> securityQuestions = <SecurityQuestion>[
      SecurityQuestion(
        id: 'sec_q_1',
        questionStem: whereWereYouBornString,
        responseType: '',
        flavour: Flavour.CONSUMER.name,
      ),
      SecurityQuestion(
        id: 'sec_q_2',
        questionStem: whatsTheNameOfYourPetString,
        responseType: '',
        flavour: Flavour.CONSUMER.name,
      ),
      SecurityQuestion(
        id: 'sec_q_3',
        questionStem: whatsYourFavoriteFoodString,
        responseType: '',
        flavour: Flavour.CONSUMER.name,
      ),
      SecurityQuestion(
        id: 'sec_q_4',
        questionStem: whereDidYouFirstLiveString,
        responseType: '',
        flavour: Flavour.CONSUMER.name,
      ),
    ];

    final bool isLargeScreen = ResponsiveWidget.isLargeScreen(context);
    return OnboardingScaffold(
      title: setSecurityQuestionsString,
      description: securityQuestionsDescriptionString,
      child: SizedBox(
        height: MediaQuery.of(context).size.height / 1.6,
        child: Stack(
          children: <Widget>[
            ListView.builder(
              itemCount: securityQuestions.length,
              shrinkWrap: true,
              padding: const EdgeInsets.only(top: 10, bottom: 10),
              itemBuilder: (BuildContext context, int index) {
                final SecurityQuestion question =
                    securityQuestions.elementAt(index);
                return Container(
                  padding: const EdgeInsets.all(10.0),
                  child: ExpandableQuestion(
                    dateController: TextEditingController(),
                    question: question.questionStem,
                    hintText: answerHereString,
                    onChanged: (String? value) {},
                  ),
                );
              },
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: SizedBox(
                width: isLargeScreen ? number300 : double.infinity,
                height: number52,
                child: MyAfyaHubPrimaryButton(
                  text: continueButtonText,
                  buttonColor: Theme.of(context).primaryColor,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
