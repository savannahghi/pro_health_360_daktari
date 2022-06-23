import 'package:flutter/material.dart';
import 'package:prohealth360_daktari/domain/core/value_objects/app_strings.dart';

class ErrorDialog extends StatelessWidget {
  const ErrorDialog({
    Key? key,
    this.title = defaultUserFriendlyMessage,
    this.buttonText = actionTextGenericNoData,
    required this.buttonAction,
    this.subTitle,
  }) : super(key: key);

  final String title;
  final String buttonText;
  final VoidCallback buttonAction;
  final String? subTitle;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            const SizedBox(height: 18),
            Text(
              title,
              style: const TextStyle(
                color: Color(0xFF2F3946),
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            if (subTitle != null) ...<Widget>[
              const SizedBox(height: 16),
              Text(
                subTitle!,
                style: const TextStyle(
                  fontSize: 16,
                  color: Color(0xFF697489),
                ),
              ),
            ],
            const SizedBox(height: 28),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: buttonAction,
                child: Text(buttonText),
              ),
            )
          ],
        ),
      ),
    );
  }
}
