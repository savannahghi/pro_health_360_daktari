import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:flutter/material.dart';
import 'package:prohealth360_daktari/application/core/theme/app_themes.dart';
import 'package:prohealth360_daktari/domain/core/value_objects/app_strings.dart';
import 'package:url_launcher/url_launcher.dart';

class StaffPinResetRequestWidget extends StatelessWidget {
  const StaffPinResetRequestWidget({
    required this.name,
    required this.phoneNumber,
    this.acceptKey,
    this.staffId,
    this.serviceRequestId,
    this.onAccept,
    this.isAccepting = false,
  });

  final String name;
  final String phoneNumber;
  final Key? acceptKey;
  final String? staffId;
  final String? serviceRequestId;
  final VoidCallback? onAccept;
  final bool isAccepting;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: AppColors.primaryColor.withOpacity(0.1),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    name,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: AppColors.lightBlackTextColor,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    phoneNumber,
                    style: const TextStyle(
                      color: AppColors.lightGrey,
                      fontSize: 15,
                    ),
                  )
                ],
              ),
              Container(
                decoration: BoxDecoration(
                  color: AppColors.primaryColor.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: IconButton(
                  icon: const Icon(Icons.phone_outlined),
                  color: AppColors.primaryColor,
                  onPressed: () {
                    final Uri launchUri = Uri(
                      scheme: 'tel',
                      path: phoneNumber,
                    );
                    launchUrl(launchUri);
                  },
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          const SizedBox(height: 12),
          SizedBox(
            height: 42,
            width: double.infinity,
            child: isAccepting
                ? const PlatformLoader()
                : MyAfyaHubPrimaryButton(
                    text: approveText,
                    onPressed: onAccept,
                  ),
          ),
        ],
      ),
    );
  }
}
