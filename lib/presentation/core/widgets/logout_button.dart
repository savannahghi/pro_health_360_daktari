// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:async_redux/async_redux.dart';
import 'package:mycarehubpro/application/core/services/utils.dart';
import 'package:mycarehubpro/application/redux/states/app_state.dart';
import 'package:mycarehubpro/domain/core/value_objects/app_strings.dart';
import 'package:mycarehubpro/domain/core/value_objects/app_widget_keys.dart';
import 'package:mycarehubpro/presentation/core/widgets/no_border_button.dart';
import 'package:shared_themes/colors.dart';

// Project imports:

class LogoutButton extends StatelessWidget {
  const LogoutButton({Key? key, this.addBorder = false}) : super(key: key);

  final bool addBorder;

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, VoidCallback>(
      converter: (Store<AppState> store) => logoutUser(context: context),
      builder: (BuildContext context, void Function() callback) {
        return Center(
          child: NoBorderButton(
            buttonKey: logoutButtonKey,
            onPressed: callback,
            text: logoutButtonText,
            textColor: red,
          ),
        );
      },
    );
  }
}
