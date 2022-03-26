import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:flutter/material.dart';
import 'package:mycarehubpro/application/core/theme/app_themes.dart';
import 'package:mycarehubpro/domain/core/value_objects/app_strings.dart';
import 'package:shared_themes/spaces.dart';

class FlaggedMessagesListItem extends StatelessWidget {
  const FlaggedMessagesListItem({
    required this.name,
    required this.timeStamp,
    this.muteUserKey,
    this.deleteMessageKey,
    this.onMuteUser,
    this.onDeleteMessage,
    this.isMutingUser = false,
    this.isDeletingMessage = false,
  });

  final String name;
  final String timeStamp;
  final Key? muteUserKey;
  final Key? deleteMessageKey;
  final VoidCallback? onMuteUser;
  final VoidCallback? onDeleteMessage;
  final bool isMutingUser;
  final bool isDeletingMessage;

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
            children: <Widget>[
              Container(
                height: 45,
                width: 45,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.primaryColor.withOpacity(0.1),
                  border: Border.all(color: AppColors.primaryColor),
                ),
                child: Center(
                  child: Text(
                    name.trim()[0].toUpperCase(),
                    style: boldSize14Text(AppColors.primaryColor),
                  ),
                ),
              ),
              smallHorizontalSizedBox,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    name,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: Color(0xFF555555),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    timeStamp,
                    style: const TextStyle(
                      color: AppColors.lightGrey,
                      fontSize: 15,
                    ),
                  )
                ],
              ),
            ],
          ),
          const SizedBox(height: 8),
          const Text(
            flaggedMessageText,
            style: TextStyle(
              color: AppColors.lightGrey,
              fontSize: 15,
            ),
          ),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Expanded(
                child: TextButton(
                  key: deleteMessageKey,
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                      AppColors.primaryColor,
                    ),
                  ),
                  onPressed: isDeletingMessage ? null : onDeleteMessage,
                  child: isDeletingMessage
                      ? const PlatformLoader()
                      : const Text(
                          deleteMessageString,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: ElevatedButton(
                  key: muteUserKey,
                  style: ElevatedButton.styleFrom(
                    side: const BorderSide(
                      color: AppColors.primaryColor,
                    ),
                  ),
                  onPressed: isMutingUser ? null : onMuteUser,
                  child: isMutingUser
                      ? const PlatformLoader()
                      : const Text(
                          muteUserString,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.normal,
                            color: AppColors.primaryColor,
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
