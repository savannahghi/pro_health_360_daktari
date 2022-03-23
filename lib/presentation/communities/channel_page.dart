import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mycarehubpro/domain/core/value_objects/app_asset_strings.dart';
import 'package:mycarehubpro/presentation/communities/thread_page.dart';
import 'package:mycarehubpro/presentation/router/routes.dart';
import 'package:shared_themes/spaces.dart';
import 'package:stream_chat_flutter/stream_chat_flutter.dart';

class ChannelPage extends StatelessWidget {
  const ChannelPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Channel channel = StreamChannel.of(context).channel;
    String channelName = 'No title';
    String channelImage = '';

    if (channel.extraData.containsKey('Name')) {
      channelName = channel.extraData['Name']! as String;
    }

    if (channel.extraData.containsKey('image')) {
      channelImage = channel.extraData['image']! as String;
    }

    return Scaffold(
      appBar: ChannelHeader(
        title: GestureDetector(
          onTap: () {
            final Channel channelDetails = StreamChannel.of(context).channel;

            Navigator.of(context).pushNamed(
              AppRoutes.groupInfoPage,
              arguments: <String, dynamic>{
                'channelId': channelDetails.id,
                'memberCount': channelDetails.memberCount,
                'channelName': channelDetails.extraData['Name'],
              },
            );
          },
          child: Text(
            channelName,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        showConnectionStateTile: true,
        actions: <Widget>[
          GestureDetector(
            onTap: () => Navigator.of(context).pushNamed(
              AppRoutes.groupInfoPage,
              arguments: <String, dynamic>{
                'channelId': StreamChannel.of(context).channel.id,
                'memberCount': StreamChannel.of(context).channel.memberCount,
                'channelName':
                    StreamChannel.of(context).channel.extraData['Name'],
              },
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ClipOval(
                child: channelImage.isNotEmpty
                    ? Image.network(
                        channelImage,
                        fit: BoxFit.cover,
                      )
                    : SvgPicture.asset(
                        groupInfoImage,
                        height: 30,
                        width: 30,
                      ),
              ),
            ),
          ),
          size15HorizontalSizedBox,
        ],
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: MessageListView(
              threadBuilder: (_, Message? parentMessage) => ThreadPage(
                parent: parentMessage,
              ),
              pinPermissions: const <String>['admin', 'user', 'owner'],
            ),
          ),
          const MessageInput(),
        ],
      ),
    );
  }
}

enum ChannelOptions { invite_client }
