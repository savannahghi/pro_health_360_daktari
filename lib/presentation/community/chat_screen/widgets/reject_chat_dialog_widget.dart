// Flutter imports:
import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:shared_themes/spaces.dart';

// Project imports:
import 'package:healthcloud/application/core/theme/app_themes.dart';
import 'package:healthcloud/domain/core/value_objects/app_strings.dart';

class RejectChatDialogWidget extends StatelessWidget {
  const RejectChatDialogWidget({required this.userName});
  final String userName;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        const Text(rejectChatDialogDescription),
        const CheckboxListTile(
          controlAffinity: ListTileControlAffinity.leading,
          value: false,
          onChanged: null,
          title: Text(banUserText),
        ),
        const CheckboxListTile(
          controlAffinity: ListTileControlAffinity.leading,
          value: false,
          onChanged: null,
          title: Text(reportSpamText),
        ),
        CheckboxListTile(
          controlAffinity: ListTileControlAffinity.leading,
          value: false,
          onChanged: null,
          title: Text(deleteAllMessagesText(userName)),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 20.0, bottom: 5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Text(
                cancelText,
                style: veryHeavySize14Text()
                    .copyWith(color: AppColors.blueBerryColor),
              ),
              size15HorizontalSizedBox,
              Text(
                rejectText,
                style: veryHeavySize14Text().copyWith(color: Colors.red),
              ),
            ],
          ),
        )
      ],
    );
  }
}
