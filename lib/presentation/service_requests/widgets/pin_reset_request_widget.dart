import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:flutter/material.dart';
import 'package:mycarehubpro/application/core/theme/app_themes.dart';
import 'package:mycarehubpro/domain/core/value_objects/app_strings.dart';

class PinResetRequestWidget extends StatelessWidget {
  const PinResetRequestWidget({
    required this.name,
    required this.phoneNumber,
    this.acceptKey,
    this.rejectKey,
    this.clientId,
    this.serviceRequestId,
    this.cccNumber,
    this.isLoading = false,
    this.onAccept,
    this.onReject,
  });

  final String name;
  final String phoneNumber;
  final Key? acceptKey;
  final Key? rejectKey;
  final String? clientId;
  final String? serviceRequestId;
  final String? cccNumber;
  final bool isLoading;
  final VoidCallback? onAccept;
  final VoidCallback? onReject;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: AppColors.primaryColor.withOpacity(0.1),
      ),
      child: Column(
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
                      color: Color(0xFF555555),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    phoneNumber,
                    style: const TextStyle(
                      color: Color(0xFF696979),
                      fontSize: 15,
                    ),
                  )
                ],
              ),
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: AppColors.primaryColor.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Icon(
                  Icons.phone_outlined,
                  color: AppColors.primaryColor,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            children: <Widget>[
              Expanded(
                child: TextButton(
                  key: rejectKey,
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                      AppColors.primaryColor.withOpacity(0.1),
                    ),
                  ),
                  onPressed: onReject,
                  child: const Text(
                    rejectText,
                    style: TextStyle(
                      color: Color(0xFFFF888B),
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: ElevatedButton(
                  key: acceptKey,
                  onPressed: onAccept,
                  child: isLoading
                      ? const PlatformLoader()
                      : const Text(
                          acceptText,
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
