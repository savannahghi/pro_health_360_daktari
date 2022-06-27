// Flutter imports:
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

// Package imports:
import 'package:afya_moja_core/afya_moja_core.dart';

// Project imports:
import 'package:prohealth360_daktari/application/core/theme/app_themes.dart';
import 'package:prohealth360_daktari/domain/core/value_objects/app_strings.dart';

class ContactAdminCard extends StatelessWidget {
  const ContactAdminCard({
    required this.title,
    required this.message,
    required this.buttonKey,
    this.adminPhoneNumber,
    this.adminEmail,
  });
  final String title;
  final String message;
  final String? adminPhoneNumber;
  final String? adminEmail;
  final Key buttonKey;

  @override
  Widget build(BuildContext context) {
    return Container(
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
          Text(
            adminPhoneNumber ?? adminEmail!,
            style: veryBoldSize14Text(darkGreyTextColor),
          ),
          const SizedBox(height: 16),
          SizedBox(
            width: double.infinity,
            child: MyAfyaHubPrimaryButton(
              buttonKey: buttonKey,
              text: (adminPhoneNumber != null) ? callString : emailString,
              onPressed: () async {
                // TODO: revert and change to a real number
                // if (adminPhoneNumber != null) {
                //   final Uri launchUri = Uri(
                //     scheme: 'tel',
                //     path: adminPhoneNumber,
                //   );
                //   await launch(launchUri.toString());
                // } else {
                final Uri launchUri = Uri(
                  scheme: 'mailto',
                  path: adminEmail,
                );
                await launchUrl(launchUri);
              },
            ),
          )
        ],
      ),
    );
  }
}
