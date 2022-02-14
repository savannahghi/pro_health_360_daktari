// Flutter imports:
import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shared_themes/spaces.dart';

class ActionCard extends StatelessWidget {
  ///
  /// [ActionCard] provides a clickable card to perform the action diplayed.
  ///
  final String iconUrl;
  final String title;
  final String counter;
  final VoidCallback? onTap;
  final Color backgroundColor;

  const ActionCard({
    Key? key,
    this.counter = '0',
    required this.iconUrl,
    required this.title,
    required this.onTap,
    this.backgroundColor = Colors.white,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Stack(
        children: <Widget>[
          Container(
            padding: const EdgeInsets.all(8),
            child: Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: backgroundColor,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8),
                    child: SvgPicture.asset(
                      iconUrl,
                      height: 140,
                      width: 140,
                    ),
                  ),
                  smallVerticalSizedBox,
                  Text(title, style: boldSize16Text()),
                  smallVerticalSizedBox,
                ],
              ),
            ),
          ),
          if (counter != '0')
            // The counter
            Positioned(
              right: 20,
              child: Container(
                padding: const EdgeInsets.all(2),
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(50),
                ),
                constraints: const BoxConstraints(
                  minWidth: 28,
                  minHeight: 28,
                ),
                child: Align(
                  child: Text(
                    counter,
                    style: const TextStyle(color: Colors.white, fontSize: 12),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            )
        ],
      ),
    );
  }
}
