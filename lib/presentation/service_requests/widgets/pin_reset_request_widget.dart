import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:flutter/material.dart';
import 'package:mycarehubpro/application/core/theme/app_themes.dart';
import 'package:mycarehubpro/domain/core/value_objects/app_strings.dart';
import 'package:url_launcher/url_launcher.dart';

class PinResetRequestWidget extends StatelessWidget {
  const PinResetRequestWidget({
    required this.name,
    required this.phoneNumber,
    this.acceptKey,
    this.rejectKey,
    this.clientId,
    this.serviceRequestId,
    this.cccNumber,
    this.onAccept,
    this.onReject,
    this.isAccepting = false,
    this.isRejecting = false,
    this.isCccNumberVerified = false,
  });

  final String name;
  final String phoneNumber;
  final Key? acceptKey;
  final Key? rejectKey;
  final String? clientId;
  final String? serviceRequestId;
  final String? cccNumber;
  final VoidCallback? onAccept;
  final VoidCallback? onReject;
  final bool isAccepting;
  final bool isRejecting;
  final bool isCccNumberVerified;

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
                    launch(launchUri.toString());
                  },
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          RichText(
            text: TextSpan(
              style: const TextStyle(color: AppColors.lightGrey, fontSize: 15),
              children: <TextSpan>[
                const TextSpan(text: cccNoShortText),
                TextSpan(
                  text: cccNumber,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          CccNumberVerifiedWidget(cccNumberVerified: isCccNumberVerified),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Expanded(
                child: TextButton(
                  key: rejectKey,
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                      AppColors.primaryColor.withOpacity(0.1),
                    ),
                  ),
                  onPressed: isAccepting ? null : onReject,
                  child: isRejecting
                      ? const PlatformLoader()
                      : const Text(
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
                  onPressed: isRejecting ? null : onAccept,
                  child: isAccepting
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

class CccNumberVerifiedWidget extends StatelessWidget {
  const CccNumberVerifiedWidget({
    Key? key,
    required this.cccNumberVerified,
  }) : super(key: key);

  final bool cccNumberVerified;

  @override
  Widget build(BuildContext context) {
    final IconData icon = cccNumberVerified ? Icons.check : Icons.close;
    final String text =
        cccNumberVerified ? cccNumberVerifiedText : cccNumberUnverifiedText;
    final Color infoColor =
        cccNumberVerified ? AppColors.malachiteColor : AppColors.warningColor;

    return Row(
      children: <Widget>[
        Container(
          padding: const EdgeInsets.all(4),
          decoration: BoxDecoration(
            color: infoColor,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Icon(icon, color: Colors.white),
        ),
        const SizedBox(width: 8),
        Flexible(
          child: Text(
            text,
            style: TextStyle(color: infoColor, fontSize: 15),
          ),
        )
      ],
    );
  }
}
