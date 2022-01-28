import 'package:bewell_pro_core/domain/core/value_objects/app_widget_keys.dart';
import 'package:flutter/material.dart';
import 'package:shared_themes/text_themes.dart';

class ErrorAlertBox extends StatelessWidget {
  final String message;
  final TextSpan? actionSpan;
  const ErrorAlertBox({required this.message, required this.actionSpan});

  @override
  Widget build(BuildContext context) {
    return Container(
      key: AppWidgetKeys.errorAlertBoxKey,
      width: double.infinity,
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.red.withOpacity(0.3),
        borderRadius: const BorderRadius.all(Radius.circular(4)),
      ),
      child: RichText(
        key: AppWidgetKeys.errorAlertBoxTextKey,
        text: TextSpan(
          style: TextThemes.normalSize14Text(Colors.black87),
          children: <TextSpan>[
            TextSpan(text: message, style: TextThemes.boldSize15Text()),
            if (actionSpan != null) actionSpan!,
          ],
        ),
      ),
    );
  }
}
