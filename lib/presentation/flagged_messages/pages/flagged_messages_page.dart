import 'package:flutter/material.dart';
import 'package:mycarehubpro/domain/core/value_objects/app_strings.dart';
import 'package:mycarehubpro/presentation/core/app_bar/custom_app_bar.dart';
import 'package:mycarehubpro/presentation/flagged_messages/widgets/flagged_messages_list_item.dart';

class FlaggedMessagesPage extends StatefulWidget {
  const FlaggedMessagesPage({Key? key}) : super(key: key);

  @override
  State<FlaggedMessagesPage> createState() => _FlaggedMessagesPageState();
}

class _FlaggedMessagesPageState extends State<FlaggedMessagesPage> {
  List<Widget> flaggedMessages = const <Widget>[
    FlaggedMessagesListItem(
      name: 'John Ngugi',
      timeStamp: '31 March 2022 at 7:59AM',
    ),
    SizedBox(height: 20),
    FlaggedMessagesListItem(
      name: 'Ombuds Nyakimincha',
      timeStamp: '31 March 2022 at 7:59AM',
    ),
    SizedBox(height: 20),
    FlaggedMessagesListItem(
      name: 'Doe John',
      timeStamp: '31 March 2022 at 7:59AM',
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: flaggedMessagesString,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              const Align(
                alignment: Alignment.topLeft,
                child: Text(
                  groupTitle,
                  style: TextStyle(
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
              ...flaggedMessages,
            ],
          ),
        ),
      ),
    );
  }
}
