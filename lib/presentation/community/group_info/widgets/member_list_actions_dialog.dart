import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:app_wrapper/app_wrapper.dart';
import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:mycarehubpro/application/core/theme/app_themes.dart';
import 'package:mycarehubpro/application/redux/actions/communities/remove_from_group_action.dart';
import 'package:mycarehubpro/application/redux/actions/flags/app_flags.dart';
import 'package:mycarehubpro/application/redux/states/app_state.dart';
import 'package:mycarehubpro/application/redux/view_models/app_state_view_model.dart';
import 'package:mycarehubpro/domain/core/value_objects/app_strings.dart';
import 'package:mycarehubpro/domain/core/value_objects/app_widget_keys.dart';

import 'package:shared_themes/spaces.dart';

class MemberListActionsDialog extends StatelessWidget {
  const MemberListActionsDialog({
    required this.memberID,
    required this.communityID,
    required this.memberName,
  });
  final String memberID;
  final String communityID;
  final String memberName;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      elevation: 1,
      backgroundColor: Colors.white,
      child: Container(
        padding: const EdgeInsets.all(30),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              actionsText,
              style: boldSize20Text(AppColors.blackColor),
            ),
            smallVerticalSizedBox,
            SizedBox(
              width: double.infinity,
              height: 48,
              child: MyAfyaHubPrimaryButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  ScaffoldMessenger.of(context)
                      .showSnackBar(snackbar(content: comingSoonText));
                },
                buttonKey: promoteButtonKey,
                text: promoteToModeratorText,
                buttonColor: Theme.of(context).primaryColor.withOpacity(0.2),
                textColor: AppColors.blackColor,
                borderColor: AppColors.primaryColor.withOpacity(0.3),
                textStyle: normalSize14Text(),
              ),
            ),
            smallVerticalSizedBox,
            SizedBox(
              width: double.infinity,
              height: 48,
              child: MyAfyaHubPrimaryButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  ScaffoldMessenger.of(context)
                      .showSnackBar(snackbar(content: comingSoonText));
                },
                buttonKey: banButtonKey,
                text: banUserText,
                buttonColor: AppColors.lightRedColor.withOpacity(0.6),
                textColor: AppColors.blackColor,
                borderColor: AppColors.lightRedColor.withOpacity(0.9),
                textStyle: boldSize14Text(AppColors.redColor),
              ),
            ),
            smallVerticalSizedBox,
            SizedBox(
              width: double.infinity,
              height: 48,
              child: StoreConnector<AppState, AppStateViewModel>(
                converter: (Store<AppState> store) =>
                    AppStateViewModel.fromStore(store),
                builder: (BuildContext context, AppStateViewModel vm) {
                  return MyAfyaHubPrimaryButton(
                    buttonColor: AppColors.lightRedColor.withOpacity(0.6),
                    borderColor: AppColors.lightRedColor.withOpacity(0.9),
                    buttonKey: removeButtonKey,
                    customChild:
                        (vm.state.wait!.isWaitingFor(removeFromGroupFlag))
                            ? const PlatformLoader()
                            : Text(
                                removeFromGroupText,
                                style: boldSize14Text(AppColors.redColor),
                              ),
                    onPressed: () {
                      StoreProvider.dispatch(
                        context,
                        RemoveFromGroupAction(
                          client: AppWrapperBase.of(context)!.graphQLClient,
                          memberID: memberID,
                          communityID: communityID,
                          memberName: memberName,
                          onFailure: (String name) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text('$name $unableToRemove'),
                              ),
                            );
                            Navigator.of(context).pop();
                          },
                          onSuccess: (String name) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text('$name $removedFromGroup'),
                              ),
                            );
                            Navigator.of(context).pop();
                          },
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
