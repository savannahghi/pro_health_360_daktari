import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:prohealth360_daktari/domain/core/value_objects/app_asset_strings.dart';
import 'package:prohealth360_daktari/presentation/communities/group_info/pages/group_info_page.dart';
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
      appBar: StreamChannelHeader(
        title: GestureDetector(
          onTap: () {
            _navigateToGroupInfoPage(context, channel, channelName);
          },
          child: Text(
            channelName,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        showConnectionStateTile: true,
        actions: <Widget>[
          GestureDetector(
            onTap: () {
              _navigateToGroupInfoPage(context, channel, channelName);
            },
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
        children: const <Widget>[
          Expanded(
            child: StreamMessageListView(),
          ),
          StreamMessageInput(),
        ],
      ),
    );
  }

  Future<dynamic> _navigateToGroupInfoPage(
    BuildContext context,
    Channel channel,
    String channelName,
  ) {
    return Navigator.of(context).push(
      MaterialPageRoute<dynamic>(
        builder: (_) {
          return StreamChannel(
            channel: channel,
            child: GroupInfoPage(channelName: channelName),
          );
        },
      ),
    );
  }
}
