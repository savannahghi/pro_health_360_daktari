import 'package:flutter/material.dart';
import 'package:healthcloud/domain/core/value_objects/app_strings.dart';
import 'package:healthcloud/presentation/communities/channel_page.dart';
import 'package:healthcloud/presentation/communities/community_utils.dart';
import 'package:healthcloud/presentation/core/app_bar/custom_app_bar.dart';
import 'package:healthcloud/presentation/core/bottom_nav/bottom_nav_bar.dart';
import 'package:stream_chat_flutter/stream_chat_flutter.dart' as stream;

class CommunityListPage extends StatelessWidget {
  const CommunityListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        showBackButton: false,
        title: communitiesTitle,
      ),
      body: stream.StreamChat(
        client: stream.StreamChat.of(context).client,
        child: stream.ChannelsBloc(
          child: stream.ChannelListView(
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
      ),
      bottomNavigationBar: const BottomNavBar(),
    );
  }
}
