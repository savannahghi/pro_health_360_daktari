// Flutter imports:
import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:flutter/material.dart';

// Project imports:
import 'package:mycarehubpro/domain/core/value_objects/app_widget_keys.dart';

class ErrorAlertBox extends StatelessWidget {
  final String message;
  final TextSpan? actionSpan;
  const ErrorAlertBox({required this.message, required this.actionSpan});

  @override
  Widget build(BuildContext context) {
    return Container(
      key: errorAlertBoxKey,
      width: double.infinity,
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.red.withOpacity(0.3),
        borderRadius: const BorderRadius.all(Radius.circular(4)),
      ),
      child: RichText(
        key: errorAlertBoxTextKey,
        text: TextSpan(
          style: normalSize14Text(Colors.black87),
          children: <TextSpan>[
            TextSpan(text: message, style: boldSize15Text()),
            if (actionSpan != null) actionSpan!,
          ],
        ),
      ),
    );
  }
}
