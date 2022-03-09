import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:app_wrapper/app_wrapper.dart';
import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:myharehubpro/application/core/services/custom_client.dart';
import 'package:myharehubpro/application/redux/actions/core/connect_get_stream_user_action.dart';
import 'package:myharehubpro/application/redux/actions/flags/app_flags.dart';
import 'package:myharehubpro/application/redux/states/app_state.dart';
import 'package:myharehubpro/domain/core/value_objects/app_asset_strings.dart';
import 'package:myharehubpro/domain/core/value_objects/app_strings.dart';
import 'package:myharehubpro/presentation/communities/channel_page.dart';
import 'package:myharehubpro/presentation/communities/community_list_view_model.dart';
import 'package:myharehubpro/presentation/communities/community_utils.dart';
import 'package:myharehubpro/presentation/core/app_bar/custom_app_bar.dart';
import 'package:myharehubpro/presentation/core/bottom_nav/bottom_nav_bar.dart';
import 'package:stream_chat_flutter/stream_chat_flutter.dart' as stream;

class CommunityListPage extends StatefulWidget {
  const CommunityListPage({Key? key}) : super(key: key);

  @override
  State<CommunityListPage> createState() => _CommunityListPageState();
}

class _CommunityListPageState extends State<CommunityListPage> {
  late String clientId;
  late stream.StreamChatClient streamChatClient;

  final stream.ChannelListController channelListController =
      stream.ChannelListController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance?.addPostFrameCallback((_) {
      clientId = StoreProvider.state<AppState>(context)!.staffState!.id!;
      streamChatClient = stream.StreamChat.of(context).client;
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

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
  void dispose() {
    streamChatClient.disconnectUser();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        showBackButton: false,
        title: conversationsTitle,
        showNotificationIcon: true,
      ),
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
            child: stream.ChannelsBloc(
              child: stream.ChannelListView(
                channelListController: channelListController,
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
                      channelListController.loadData!();
                    },
                  );
                },
                filter: stream.Filter.in_(
                  'members',
                  <String>[stream.StreamChat.of(context).currentUser?.id ?? ''],
                ),
                channelPreviewBuilder: channelPreviewBuilder,
                sort: const <stream.SortOption<stream.ChannelModel>>[
                  stream.SortOption<stream.ChannelModel>('last_message_at')
                ],
                limit: 20,
                channelWidget: const ChannelPage(),
              ),
            ),
          );
        },
      ),
      bottomNavigationBar: const BottomNavBar(),
    );
  }
}
