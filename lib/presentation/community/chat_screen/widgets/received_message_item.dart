// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:afya_moja_core/colors.dart';
import 'package:afya_moja_core/community_chat_widgets.dart';
import 'package:shared_themes/spaces.dart';
import 'package:shared_themes/text_themes.dart';

// Project imports:
import 'package:healthcloud/application/core/theme/app_themes.dart';
import 'package:healthcloud/domain/core/value_objects/app_enums.dart';
import 'package:healthcloud/domain/core/value_objects/app_strings.dart';
import 'package:healthcloud/presentation/community/chat_screen/widgets/reject_chat_dialog_widget.dart';

/// [ReceivedMessageItem] used within the community chat screen to show received messages.
class ReceivedMessageItem extends StatefulWidget {
  /// [ReceivedMessageItem] used within the community chat screen to show received messages.
  ///
  /// [senderName], [message], [status] and [time] are all required.
  ///
  /// [senderType] shows whether user is i.e. Moderator or Doctor.
  ///
  /// [highlightedMessage] adds a highlighted message.
  ///
  const ReceivedMessageItem({
    required this.senderName,
    required this.message,
    required this.time,
    required this.status,
    this.senderType,
    this.quotedMessageWidget,
  });

  final String senderName;
  final String message;
  final String time;
  final ChatStatus status;
  final SenderTypeWidget? senderType;
  final QuotedMessageWidget? quotedMessageWidget;

  @override
  State<ReceivedMessageItem> createState() => _ReceivedMessageItemState();
}

class _ReceivedMessageItemState extends State<ReceivedMessageItem> {
  @override
  Widget build(BuildContext context) {
    final ChatStatus status = widget.status;
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: <Widget>[
        Container(
          width: MediaQuery.of(context).size.width / 1.8,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(5.0),
              topRight: Radius.circular(5.0),
              bottomRight: Radius.circular(5.0),
            ),
            color: AppColors.userDetailsCardBackgroundColor,
          ),
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: Column(
              children: <Widget>[
                Align(
                  alignment: Alignment.topLeft,
                  child: Row(
                    children: <Widget>[
                      Text(
                        widget.senderName,
                        style: TextThemes.normalSize10Text()
                            .copyWith(color: userInitialsColor),
                      ),
                      smallHorizontalSizedBox,
                      widget.senderType ?? smallHorizontalSizedBox,
                    ],
                  ),
                ),
                widget.quotedMessageWidget ?? smallVerticalSizedBox,
                Align(
                  alignment: Alignment.bottomLeft,
                  child: Text(
                    widget.message,
                    style: TextThemes.normalSize12Text()
                        .copyWith(color: whiteColor),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: Text(
                    widget.time,
                    style: TextThemes.normalSize10Text()
                        .copyWith(color: userInitialsColor),
                  ),
                ),
              ],
            ),
          ),
        ),
        if (status == ChatStatus.Unknown)
          Flexible(
            child: Align(
              alignment: Alignment.bottomRight,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Flexible(
                    child: GestureDetector(
                      child: Text(
                        approveText,
                        style: TextThemes.heavySize12Text()
                            .copyWith(color: Colors.green),
                      ),
                    ),
                  ),
                  Flexible(
                    child: GestureDetector(
                      onTap: () async {
                        await showDialog(
                          context: context,
                          useRootNavigator: false,
                          builder: (BuildContext context) {
                            return SimpleDialog(
                              title: const Text(rejectChatDialogTitle),
                              elevation: 0,
                              shape: const RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(8.0)),
                              ),
                              titlePadding: const EdgeInsets.all(10),
                              children: <Widget>[
                                RejectChatDialogWidget(
                                  userName: widget.senderName,
                                )
                              ],
                            );
                          },
                        );
                      },
                      child: Text(
                        rejectText,
                        style: TextThemes.heavySize12Text()
                            .copyWith(color: Colors.red),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
      ],
    );
  }
}
