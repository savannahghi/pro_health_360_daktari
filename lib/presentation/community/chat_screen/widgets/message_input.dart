// Flutter imports:
import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:flutter/material.dart';
// Package imports:
import 'package:flutter_svg/svg.dart';
// Project imports:
import 'package:healthcloud/domain/core/value_objects/app_asset_strings.dart';
import 'package:healthcloud/domain/core/value_objects/app_strings.dart';
import 'package:shared_themes/spaces.dart';

class MessageInput extends StatelessWidget {
  /// [MessageInput] used within the community chat screen to take input of messages
  /// to send.
  ///
  /// [onChanged] is required.
  ///
  const MessageInput({
    required this.onChanged,
    this.sendIconColor,
  });

  final ValueChanged<String> onChanged;
  final Color? sendIconColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: whiteColor,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Expanded(
            child: TextField(
              decoration: const InputDecoration(
                hintText: typeYourMessageHereString,
                hintStyle: TextStyle(color: darkGreyTextColor),
                border: InputBorder.none,
              ),
              onChanged: onChanged,
            ),
          ),
          Row(
            children: <Widget>[
              GestureDetector(
                onTap: () {
                  ScaffoldMessenger.of(context)
                      .showSnackBar(snackbar(content: comingSoonText));
                },
                child: Container(
                  padding: const EdgeInsets.all(10),
                  decoration: const BoxDecoration(),
                  child: SvgPicture.asset(
                    attachFileIcon,
                    width: 18,
                    height: 18,
                  ),
                ),
              ),
              smallHorizontalSizedBox,
              GestureDetector(
                onTap: () {
                  ScaffoldMessenger.of(context)
                      .showSnackBar(snackbar(content: comingSoonText));
                },
                child: Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: sendIconColor ??
                        Theme.of(context).colorScheme.secondary,
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: SvgPicture.asset(
                    sendTextIcon,
                    color: Colors.white,
                    width: 18,
                    height: 18,
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
