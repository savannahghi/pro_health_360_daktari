import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:app_wrapper/app_wrapper.dart';
import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:mycarehubpro/application/core/services/custom_client.dart';
import 'package:mycarehubpro/application/redux/actions/communities/connect_get_stream_user_action.dart';
import 'package:mycarehubpro/application/redux/actions/flags/app_flags.dart';
import 'package:mycarehubpro/application/redux/states/app_state.dart';
import 'package:mycarehubpro/domain/core/value_objects/app_asset_strings.dart';
import 'package:mycarehubpro/domain/core/value_objects/app_strings.dart';
import 'package:mycarehubpro/presentation/communities/channel_page.dart';
import 'package:mycarehubpro/presentation/communities/community_list_view_model.dart';
import 'package:mycarehubpro/presentation/communities/community_utils.dart';
import 'package:mycarehubpro/presentation/core/app_bar/custom_app_bar.dart';
import 'package:mycarehubpro/presentation/core/bottom_nav/bottom_nav_bar.dart';
import 'package:stream_chat_flutter/stream_chat_flutter.dart' as stream;

class CommunityListPage extends StatefulWidget {
  const CommunityListPage({Key? key}) : super(key: key);

  @override
  State<CommunityListPage> createState() => _CommunityListPageState();
}

class _CommunityListPageState extends State<CommunityListPage> {
  final stream.ChannelListController channelListController =
      stream.ChannelListController();

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

          final stream.Filter channelsFilter = stream.Filter.or(
            <stream.Filter>[
              stream.Filter.equal('invite', 'accepted'),
              stream.Filter.in_(
                'members',
                <String>[stream.StreamChat.of(context).currentUser?.id ?? ''],
              ),
            ],
          );

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
                filter: channelsFilter,
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
