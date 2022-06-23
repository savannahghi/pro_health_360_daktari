import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:prohealth360_daktari/application/core/theme/app_themes.dart';
import 'package:prohealth360_daktari/application/redux/actions/communities/delete_group_action.dart';
import 'package:prohealth360_daktari/application/redux/actions/flags/app_flags.dart';
import 'package:prohealth360_daktari/application/redux/states/app_state.dart';
import 'package:prohealth360_daktari/domain/core/value_objects/app_strings.dart';
import 'package:prohealth360_daktari/presentation/communities/pages/community_list_page.dart';
import 'package:prohealth360_daktari/presentation/communities/view_models/group_info_view_model.dart';
import 'package:stream_chat_flutter/stream_chat_flutter.dart';

class DeleteGroupBanner extends StatelessWidget {
  const DeleteGroupBanner({
    Key? key,
    required this.channel,
  }) : super(key: key);

  final Channel channel;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: warningColor.withOpacity(0.14),
        borderRadius: BorderRadius.circular(10),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            deleteGroupText,
            style: boldSize18Text(warningColor),
          ),
          const SizedBox(height: 8),
          Text(
            deleteGroupWarning,
            style: normalSize14Text(AppColors.grey50),
          ),
          const SizedBox(height: 14),
          SizedBox(
            width: double.infinity,
            child: OutlinedButton(
              style: OutlinedButton.styleFrom(
                backgroundColor: warningColor,
                primary: warningColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: StoreConnector<AppState, GroupInfoViewModel>(
                converter: (Store<AppState> store) {
                  return GroupInfoViewModel.fromStore(store);
                },
                builder: (BuildContext context, GroupInfoViewModel vm) {
                  if (vm.wait.isWaitingFor(deleteGroupFlag)) {
                    return const PlatformLoader();
                  }

                  return const Text(
                    deleteGroupText,
                    style: TextStyle(color: Colors.white),
                  );
                },
              ),
              onPressed: () {
                StoreProvider.dispatch(
                  context,
                  DeleteGroupAction(
                    channel: channel,
                    onSuccess: () {
                      Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute<void>(
                          builder: (_) {
                            return const CommunityListPage();
                          },
                        ),
                        ModalRoute.withName('/'),
                      );
                    },
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
