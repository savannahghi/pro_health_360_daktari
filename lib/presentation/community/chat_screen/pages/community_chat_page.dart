// Flutter imports:
import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:misc_utilities/misc.dart';

// Project imports:
import 'package:healthcloud/application/core/services/utils.dart';
import 'package:healthcloud/application/core/theme/app_themes.dart';
import 'package:healthcloud/domain/core/value_objects/app_strings.dart';
import 'package:healthcloud/presentation/core/app_bar/custom_app_bar.dart';

class CommunityChatPage extends StatelessWidget {
  const CommunityChatPage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.lightSkyBlueColor,
      appBar: CustomAppBar(
        title: communityChatScreenPageTitle,
        trailingWidget: PopupMenuButton<dynamic>(
          itemBuilder: (BuildContext context) {
            return communityChatScreenMenuOptions.map((String choice) {
              return PopupMenuItem<String>(
                value: choice,
                child: Text(choice),
              );
            }).toList();
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Stack(
          children: <Widget>[
            ListView.builder(
              itemCount: messages.length,
              shrinkWrap: true,
              padding: const EdgeInsets.only(top: 5, bottom: 5),
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  padding: const EdgeInsets.only(
                    left: 14,
                    right: 14,
                    top: 10,
                    bottom: 10,
                  ),
                  child: Align(
                    alignment: placeMessage(messages[index]),
                    child: messages[index],
                  ),
                );
              },
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: MessageInput(
                sendIconColor: AppColors.buttonAltColor,
                onChanged: (String value) {
                  ScaffoldMessenger.of(context)
                      .showSnackBar(snackbar(content: value));
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
