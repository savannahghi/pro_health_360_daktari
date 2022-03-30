import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:app_wrapper/app_wrapper.dart';
import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:mycarehubpro/application/core/services/utils.dart';
import 'package:mycarehubpro/application/core/theme/app_themes.dart';
import 'package:mycarehubpro/application/redux/actions/communities/ban_user_action.dart';
import 'package:mycarehubpro/application/redux/actions/communities/unban_user_action.dart';
import 'package:mycarehubpro/application/redux/actions/flags/app_flags.dart';
import 'package:mycarehubpro/application/redux/states/app_state.dart';
import 'package:mycarehubpro/application/redux/view_models/flagged_messages/flagged_messages_view_model.dart';
import 'package:mycarehubpro/domain/core/value_objects/app_strings.dart';
import 'package:shared_themes/spaces.dart';

class FlaggedMessagesListItem extends StatefulWidget {
  const FlaggedMessagesListItem({
    required this.name,
    required this.createdAt,
    required this.textMessage,
    required this.memberID,
    required this.communityId,
    required this.communityName,
    required this.vm,
    this.banUserKey,
    this.deleteMessageKey,
    this.onDeleteMessage,
    this.isDeletingMessage = false,
    this.isBanned,
  });

  final String name;
  final String createdAt;
  final String textMessage;
  final String memberID;
  final String communityId;
  final String communityName;
  final Key? banUserKey;
  final Key? deleteMessageKey;
  final bool isDeletingMessage;
  final bool? isBanned;
  final VoidCallback? onDeleteMessage;
  final FlaggedMessagesViewModel vm;

  @override
  State<FlaggedMessagesListItem> createState() =>
      _FlaggedMessagesListItemState();
}

class _FlaggedMessagesListItemState extends State<FlaggedMessagesListItem> {
  bool isBanned = false;
  @override
  void initState() {
    if (widget.isBanned != null) {
      isBanned = widget.isBanned!;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final bool isBanningUser = widget.vm.wait.isWaitingFor(
      isBanned ? unBanUserFlag : banUserFlag,
    );
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: AppColors.primaryColor.withOpacity(0.1),
        border: Border.all(color: AppColors.primaryColor.withOpacity(0.1)),
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
                  const Text(
                    name,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: Color(0xFF555555),
                    ),
                  ),
                  const SizedBox(height: 2),
                  if (widget.createdAt != UNKNOWN &&
                      widget.createdAt.isNotEmpty)
                    humanizeDate(
                      showTime: true,
                      dateTextStyle: const TextStyle(
                        color: AppColors.lightGrey,
                        fontSize: 15,
                      ),
                      loadedDate: widget.createdAt,
                    )
                ],
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            widget.textMessage,
            style: const TextStyle(
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
                  key: widget.deleteMessageKey,
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                      AppColors.primaryColor,
                    ),
                  ),
                  onPressed:
                      widget.isDeletingMessage ? null : widget.onDeleteMessage,
                  child: widget.isDeletingMessage
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
                child: TextButton(
                  key: widget.banUserKey,
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                      AppColors.primaryColor.withOpacity(0.1),
                    ),
                    shape:
                        MaterialStateProperty.resolveWith<OutlinedBorder>((_) {
                      return RoundedRectangleBorder(
                        side: BorderSide(
                          color: AppColors.primaryColor.withOpacity(0.1),
                        ),
                        borderRadius: BorderRadius.circular(5),
                      );
                    }),
                  ),
                  onPressed: isBanningUser
                      ? null
                      : () {
                          onBanUser();
                        },
                  child: isBanningUser
                      ? const PlatformLoader()
                      : Text(
                          isBanned ? unBanUserText : banUserText,
                          style: const TextStyle(
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

  void onBanUser() {
    StoreProvider.dispatch<AppState>(
      context,
      isBanned
          ? UnBanUserAction(
              client: AppWrapperBase.of(context)!.graphQLClient,
              memberID: widget.memberID,
              communityID: widget.communityId,
              onError: () => ScaffoldMessenger.of(context).showSnackBar(
                snackbar(content: getErrorMessage()),
              ),
              onSuccess: () {
                ScaffoldMessenger.of(context)
                  ..hideCurrentSnackBar()
                  ..showSnackBar(
                    snackbar(
                      content: userBannedMessage(
                        isBanned: true,
                        communityName: widget.communityName,
                      ),
                    ),
                  );
              },
            )
          : BanUserAction(
              client: AppWrapperBase.of(context)!.graphQLClient,
              memberID: widget.memberID,
              communityID: widget.communityId,
              onError: () => ScaffoldMessenger.of(context).showSnackBar(
                snackbar(content: getErrorMessage()),
              ),
              onSuccess: () {
                ScaffoldMessenger.of(context)
                  ..hideCurrentSnackBar()
                  ..showSnackBar(
                    snackbar(
                      content: userBannedMessage(
                        communityName: widget.communityName,
                      ),
                    ),
                  );
                setState(() {
                  isBanned = true;
                });
              },
            ),
    );
  }
}
