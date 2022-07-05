import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:app_wrapper/app_wrapper.dart';
import 'package:async_redux/async_redux.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:prohealth360_daktari/application/core/services/custom_client.dart';
import 'package:prohealth360_daktari/application/redux/actions/communities/connect_get_stream_user_action.dart';
import 'package:prohealth360_daktari/application/redux/actions/flags/app_flags.dart';
import 'package:prohealth360_daktari/application/redux/states/app_state.dart';
import 'package:prohealth360_daktari/domain/core/value_objects/app_asset_strings.dart';
import 'package:prohealth360_daktari/domain/core/value_objects/app_strings.dart';
import 'package:prohealth360_daktari/presentation/communities/channel_page.dart';
import 'package:prohealth360_daktari/presentation/communities/community_list_view_model.dart';
import 'package:prohealth360_daktari/presentation/communities/widgets/empty_conversations_widget.dart';
import 'package:prohealth360_daktari/presentation/core/app_bar/custom_app_bar.dart';
import 'package:prohealth360_daktari/presentation/core/bottom_nav/bottom_nav_bar.dart';
import 'package:prohealth360_daktari/presentation/core/bottom_nav/bottom_nav_items.dart';
import 'package:stream_chat_flutter/stream_chat_flutter.dart' as stream;

class CommunityListPage extends StatefulWidget {
  const CommunityListPage({Key? key}) : super(key: key);

  @override
  State<CommunityListPage> createState() => _CommunityListPageState();
}

class _CommunityListPageState extends State<CommunityListPage> {
  late stream.StreamChannelListController _listController;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    final stream.Filter channelsFilter = stream.Filter.and(
      <stream.Filter>[
        stream.Filter.equal('invite', 'accepted'),
        stream.Filter.in_(
          'members',
          <String>[stream.StreamChat.of(context).currentUser?.id ?? ''],
        ),
      ],
    );

    _listController = stream.StreamChannelListController(
      client: stream.StreamChat.of(context).client,
      filter: channelsFilter,
      sort: const <stream.SortOption<stream.ChannelModel>>[
        stream.SortOption<stream.ChannelModel>('last_message_at')
      ],
      limit: 20,
    );
    final AppState state = StoreProvider.state<AppState>(context)!;
    if (state != AppState.initial()) {
      StoreProvider.dispatch(
        context,
        ConnectGetStreamUserAction(
          client: AppWrapperBase.of(context)!.graphQLClient as CustomClient,
          streamClient: stream.StreamChat.of(context).client,
          endpoint: AppWrapperBase.of(context)!
              .customContext!
              .refreshStreamTokenEndpoint,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          const CustomAppBar(showBackButton: false, title: conversationsTitle),
      body: StoreConnector<AppState, CommunityListViewModel>(
        converter: (Store<AppState> store) {
          return CommunityListViewModel.fromStore(store);
        },
        builder: (BuildContext context, CommunityListViewModel vm) {
          if (vm.wait.isWaitingFor(connectionFlag)) {
            return const PlatformLoader();
          }

          return stream.StreamChat(
            client: stream.StreamChat.of(context).client,
            child: stream.StreamChannelListView(
              controller: _listController,
              itemBuilder: _channelTileBuilder,
              emptyBuilder: (BuildContext context) {
                return const EmptyConversationsWidget();
              },
              errorBuilder: (BuildContext context, Object error) {
                return GenericErrorWidget(
                  messageTitle: emptyConversationTitle,
                  messageBody: const <TextSpan>[
                    TextSpan(
                      text: emptyConversationBody,
                    )
                  ],
                  headerIconSvgUrl: emptyChatsSvg,
                  recoverCallback: () {
                    _listController.refresh();
                  },
                );
              },
              onChannelTap: (stream.Channel channel) {
                Navigator.of(context).push(
                  MaterialPageRoute<Route<dynamic>>(
                    builder: (BuildContext context) {
                      return stream.StreamChannel(
                        channel: channel,
                        child: const ChannelPage(),
                      );
                    },
                  ),
                );
              },
            ),
          );
        },
      ),
      bottomNavigationBar: BottomNavBar(
        bottomNavIndex: BottomNavIndex.communities.index,
      ),
    );
  }

  Widget _channelTileBuilder(
    BuildContext context,
    List<stream.Channel> channels,
    int index,
    stream.StreamChannelListTile defaultChannelTile,
  ) {
    final stream.Channel channel = channels[index];
    final stream.Message? lastMessage =
        channel.state?.messages.reversed.firstWhereOrNull(
      (stream.Message message) => !message.isDeleted,
    );

    String channelName = noTitleText;

    if (channel.extraData.containsKey('Name')) {
      channelName = channel.extraData['Name']! as String;
    }

    final String subtitle =
        lastMessage == null ? 'nothing yet' : lastMessage.text!;
    final double opacity = (channel.state?.unreadCount ?? 0) > 0 ? 1.0 : 0.5;

    final stream.StreamChatThemeData theme = stream.StreamChatTheme.of(context);

    return ListTile(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute<Route<dynamic>>(
            builder: (_) => stream.StreamChannel(
              channel: channel,
              child: const ChannelPage(),
            ),
          ),
        );
      },
      leading: stream.StreamChannelAvatar(
        channel: channel,
      ),
      title: Text(
        channelName,
        style: theme.channelPreviewTheme.titleStyle!.copyWith(
          color: theme.colorTheme.textHighEmphasis.withOpacity(opacity),
        ),
      ),
      subtitle: Text(subtitle),
      trailing: channel.state!.unreadCount > 0
          ? CircleAvatar(
              radius: 10,
              child: Text(channel.state!.unreadCount.toString()),
            )
          : const SizedBox(),
    );
  }
}
