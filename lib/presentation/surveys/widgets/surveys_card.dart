// Flutter imports:
import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:flutter/material.dart';
// Project imports:
import 'package:mycarehubpro/application/core/theme/app_themes.dart';
import 'package:mycarehubpro/domain/core/value_objects/app_strings.dart';

class SurveysCard extends StatelessWidget {
  const SurveysCard({
    required this.title,
    required this.message,
    this.showButton = true,
    this.buttonKey,
    this.buttonText = sendOutString,
    this.onTapCard,
    this.onPressButton,
  });
  final String title;
  final String message;
  final Key? buttonKey;
  final String? buttonText;
  final bool? showButton;
  final VoidCallback? onTapCard;
  final void Function()? onPressButton;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTapCard,
      child: Container(
        decoration: BoxDecoration(
          color: const Color(0xFFF0EAF4),
          borderRadius: BorderRadius.circular(10),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              title,
              style: veryBoldSize16Text(AppColors.lightBlackTextColor),
            ),
            const SizedBox(height: 10),
            Text(
              message,
              style: normalSize14Text(darkGreyTextColor),
            ),
            const SizedBox(height: 16),
            if (buttonKey != null)
              SizedBox(
                width: double.infinity,
                child: MyAfyaHubPrimaryButton(
                  buttonKey: buttonKey,
                  text: buttonText,
                  onPressed: onPressButton,
                ),
              )
          ],
        ),
      ),
    );
  }
}
