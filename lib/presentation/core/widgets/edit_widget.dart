import 'package:flutter/material.dart';

class EditWidget extends StatelessWidget {
  const EditWidget({
    this.color = Colors.black,
    this.onTap,
    this.icon,
    this.buttonKey,
  });

  final Color color;
  final VoidCallback? onTap;
  final Widget? icon;
  final Key? buttonKey;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        key: buttonKey,
        borderRadius: BorderRadius.circular(50),
        splashColor: Theme.of(context).colorScheme.secondary.withOpacity(0.3),
        onTap: onTap,
        child: Padding(
          padding:
              const EdgeInsets.only(left: 15, top: 10, bottom: 10, right: 15),
          child: icon,
        ),
      ),
    );
  }
}
