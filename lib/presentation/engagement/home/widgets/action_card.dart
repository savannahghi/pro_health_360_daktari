// Flutter imports:
import 'package:flutter/material.dart';

// Package imports
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

  const ActionCard({
    Key? key,
    this.counter = '0',
    required this.iconUrl,
    required this.title,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(2),
        child: Stack(
          children: <Widget>[
            Container(
              padding: const EdgeInsets.all(10),
              child: Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  children: <Widget>[
                    Container(
                      padding: const EdgeInsets.only(
                        top: 8.0,
                        left: 8.0,
                        right: 8.0,
                      ),
                      height: 80,
                      width: 120,
                      child: SvgPicture.asset(
                        iconUrl,
                      ),
                    ),
                    smallVerticalSizedBox,
                    Text(title)
                  ],
                ),
              ),
            ),
            if (counter != '0')
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
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              )
          ],
        ),
      ),
    );
  }
}
