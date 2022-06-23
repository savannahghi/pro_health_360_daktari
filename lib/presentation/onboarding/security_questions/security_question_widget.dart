// Flutter imports:
import 'package:afya_moja_core/afya_moja_core.dart';
// Package imports:
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:prohealth360_daktari/application/core/services/utils.dart';
import 'package:prohealth360_daktari/application/core/theme/app_themes.dart';
import 'package:prohealth360_daktari/domain/core/value_objects/app_strings.dart';

class SecurityQuestionWidget extends StatefulWidget {
  const SecurityQuestionWidget({
    Key? key,
    required this.securityQuestion,
    required this.response,
    required this.onChanged,
  }) : super(key: key);

  final SecurityQuestion securityQuestion;
  final String? response;
  final ValueChanged<String?> onChanged;

  @override
  _SecurityQuestionWidgetState createState() => _SecurityQuestionWidgetState();
}

class _SecurityQuestionWidgetState extends State<SecurityQuestionWidget> {
  TextEditingController dateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final SecurityQuestion question = widget.securityQuestion;
    final String? initialResponse = widget.response;
    return Container(
      padding: const EdgeInsets.only(
        top: 5,
        bottom: 5,
      ),
      child: ExpandableQuestion(
        isDateType: question.responseType == SecurityQuestionResponseType.DATE,
        dateController: dateController,
        question: question.questionStem ?? UNKNOWN,
        hintText: answerHereString,
        validator: securityQuestionValidator,
        initialValue: initialResponse,
        questionTextStyle: const TextStyle(
          color: AppColors.greyTextColor,
          fontSize: 14.0,
          fontWeight: FontWeight.normal,
        ),
        keyboardType:
            question.responseType == SecurityQuestionResponseType.NUMBER
                ? TextInputType.number
                : null,
        onChanged: (String? value) {
          widget.onChanged(value);
        },
      ),
    );
  }
}
