import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:app_wrapper/app_wrapper.dart';
import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:mycarehubpro/application/core/services/helpers.dart';
import 'package:mycarehubpro/application/core/theme/app_themes.dart';
import 'package:mycarehubpro/application/redux/actions/flagged_messages/delete_community_message_action.dart';
import 'package:mycarehubpro/application/redux/actions/flagged_messages/fetch_flagged_messages_action.dart';
import 'package:mycarehubpro/application/redux/actions/flags/app_flags.dart';
import 'package:mycarehubpro/application/redux/states/app_state.dart';
import 'package:mycarehubpro/application/redux/view_models/flagged_messages/flagged_messages_view_model.dart';
import 'package:mycarehubpro/domain/core/entities/flagged_messages/flagged_message.dart';
import 'package:mycarehubpro/domain/core/value_objects/app_asset_strings.dart';
import 'package:mycarehubpro/domain/core/value_objects/app_strings.dart';
import 'package:mycarehubpro/domain/core/value_objects/app_widget_keys.dart';
import 'package:mycarehubpro/presentation/core/app_bar/custom_app_bar.dart';
import 'package:mycarehubpro/presentation/flagged_messages/widgets/flagged_messages_list_item.dart';

class FlaggedMessagesPage extends StatefulWidget {
  const FlaggedMessagesPage({
    required this.communityName,
    required this.communityId,
    Key? key,
  }) : super(key: key);

  final String communityName;
  final String communityId;

  @override
  State<FlaggedMessagesPage> createState() => _FlaggedMessagesPageState();
}

class _FlaggedMessagesPageState extends State<FlaggedMessagesPage> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    StoreProvider.dispatch(
      context,
      FetchFlaggedMessagesAction(
        client: AppWrapperBase.of(context)!.graphQLClient,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: flaggedMessagesString,
      ),
      body: StoreConnector<AppState, FlaggedMessagesViewModel>(
        converter: (Store<AppState> store) =>
            FlaggedMessagesViewModel.fromStore(store),
        builder: (BuildContext context, FlaggedMessagesViewModel vm) {
          if (vm.wait.isWaitingFor(fetchFlaggedMessagesFlag)) {
            return Container(
              height: 300,
              padding: const EdgeInsets.all(20),
              child: const PlatformLoader(),
            );
          }

          final List<FlaggedMessage?> flaggedMessages =
              vm.flaggedMessages ?? <FlaggedMessage>[];

          if (flaggedMessages.isEmpty) {
            return GenericErrorWidget(
              actionKey: helpNoDataWidgetKey,
              headerIconSvgUrl: emptyChatsSvg,
              recoverCallback: () {
                StoreProvider.dispatch<AppState>(
                  context,
                  FetchFlaggedMessagesAction(
                    client: AppWrapperBase.of(context)!.graphQLClient,
                    onFailure: (String message) {
                      showTextSnackbar(
                        ScaffoldMessenger.of(context),
                        content: message,
                      );
                    },
                  ),
                );
              },
              messageTitle: getNoDataTile(availableFlaggedMessagesText),
              messageBody: <TextSpan>[
                TextSpan(
                  text: noAvailableFlaggedMessagesDescription,
                  style: normalSize16Text(
                    AppColors.greyTextColor,
                  ),
                ),
              ],
            );
          }

          return Padding(
            padding: const EdgeInsets.all(20.0),
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      widget.communityName,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    flaggedMessagesDescription,
                    style: TextStyle(color: Color(0xFF7A7B8E)),
                  ),
                  const SizedBox(height: 20),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: const BouncingScrollPhysics(),
                    itemCount: flaggedMessages.length,
                    itemBuilder: (_, int index) {
                      final String name =
                          flaggedMessages[index]?.message?.user?.name ??
                              UNKNOWN;
                      final String createdAt =
                          flaggedMessages[index]?.message?.createdAt ?? UNKNOWN;

                      final String textMessage =
                          flaggedMessages[index]?.message?.text ?? UNKNOWN;
                      final String messageID =
                          flaggedMessages[index]?.message?.messageID ?? UNKNOWN;

                      final String memberID =
                          flaggedMessages[index]?.message?.user?.userID ??
                              UNKNOWN;

                      return Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: FlaggedMessagesListItem(
                          name: name.isEmpty ? UNKNOWN : name,
                          createdAt: createdAt,
                          textMessage: textMessage,
                          memberID: memberID,
                          communityId: widget.communityId,
                          communityName: widget.communityName,
                          deleteMessageKey: Key('delete_message_${index}_key'),
                          banUserKey: Key('ban_user_${index}_key'),
                          vm: vm,
                          isDeletingMessage: vm.wait.isWaitingFor(
                            '${deleteCommunityMessageFlag}_$messageID',
                          ),
                          onDeleteMessage: () {
                            StoreProvider.dispatch<AppState>(
                              context,
                              DeleteCommunityMessageAction(
                                client:
                                    AppWrapperBase.of(context)!.graphQLClient,
                                messageID: messageID,
                                onFailure: (String message) {
                                  showTextSnackbar(
                                    ScaffoldMessenger.of(context),
                                    content: message,
                                  );
                                },
                                onSuccess: () {
                                  ScaffoldMessenger.of(context)
                                    ..hideCurrentSnackBar()
                                    ..showSnackBar(
                                      snackbar(
                                        content: messageDeletedText,
                                      ),
                                    );
                                },
                              ),
                            );
                          },
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
