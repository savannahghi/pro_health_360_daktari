import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:flutter/material.dart';

class NoBorderButton extends StatelessWidget {
  const NoBorderButton({
    this.buttonKey,
    required this.onPressed,
    required this.text,
    this.onLongPress,
    this.textColor,
    this.customChild,
  }) : assert(onPressed != null && text != null);
  final Key? buttonKey;
  final Widget? customChild;
  final void Function()? onLongPress;
  final void Function()? onPressed;
  final String? text;
  final Color? textColor;
  @override
  Widget build(BuildContext context) {
    return TextButton(
      key: buttonKey,
      onPressed: () {
        onPressed!();
      },
      onLongPress: onLongPress,
      child: customChild ??
          Text(
            text ?? '',
            style:
                veryBoldSize15Text(textColor ?? Theme.of(context).primaryColor),
          ),
    );
  }
}
