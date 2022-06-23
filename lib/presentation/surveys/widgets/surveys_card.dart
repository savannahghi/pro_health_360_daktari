// Flutter imports:
import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:flutter/material.dart';
// Project imports:
import 'package:prohealth360_daktari/application/core/theme/app_themes.dart';
import 'package:prohealth360_daktari/domain/core/value_objects/app_strings.dart';

class SurveysCard extends StatelessWidget {
  const SurveysCard({
    required this.title,
    this.message,
    this.showButton = true,
    this.isLoading = false,
    this.buttonKey,
    this.buttonText = sendOutString,
    this.onTapCard,
    this.onPressButton,
  });
  final String title;
  final String? message;
  final Key? buttonKey;
  final String? buttonText;
  final bool? showButton;
  final bool isLoading;
  final VoidCallback? onTapCard;
  final void Function()? onPressButton;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTapCard,
      child: Column(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              color: const Color(0xFFF0EAF4),
              borderRadius: BorderRadius.circular(10),
            ),
            padding: const EdgeInsets.all(15),
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  title,
                  style: veryBoldSize16Text(AppColors.lightBlackTextColor),
                ),
                mediumVerticalSizedBox,
                if (message != null)
                  Column(
                    children: <Widget>[
                      Text(
                        message!,
                        style: normalSize14Text(darkGreyTextColor),
                      ),
                      const SizedBox(height: 16),
                    ],
                  ),
                if (buttonKey != null)
                  SizedBox(
                    width: double.infinity,
                    height: 48,
                    child: isLoading
                        ? const PlatformLoader()
                        : MyAfyaHubPrimaryButton(
                            buttonKey: buttonKey,
                            text: buttonText,
                            onPressed: onPressButton,
                          ),
                  )
              ],
            ),
          ),
          mediumVerticalSizedBox,
        ],
      ),
    );
  }
}
