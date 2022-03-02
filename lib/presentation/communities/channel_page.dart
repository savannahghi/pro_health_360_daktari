import 'package:flutter/material.dart';
import 'package:healthcloud/presentation/communities/thread_page.dart';
import 'package:healthcloud/presentation/router/routes.dart';
import 'package:stream_chat_flutter/stream_chat_flutter.dart';

class ChannelPage extends StatelessWidget {
  const ChannelPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ChannelHeader(
        title: const ChannelName(),
        showConnectionStateTile: true,
        actions: <Widget>[
          PopupMenuButton<ChannelOptions>(
            onSelected: (ChannelOptions value) {
              switch (value) {
                case ChannelOptions.invite_client:
                  Navigator.of(context).pushNamed(AppRoutes.inviteMembersPage);
                  break;
                default:
              }
            },
            itemBuilder: (BuildContext context) {
              return <PopupMenuItem<ChannelOptions>>[
                const PopupMenuItem<ChannelOptions>(
                  value: ChannelOptions.invite_client,
                  child: Text('Invite members'),
                )
              ];
            },
            child: const Icon(
              Icons.more_vert,
              color: Colors.black,
            ),
          ),
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
