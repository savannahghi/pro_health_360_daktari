// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:afya_moja_core/text_themes.dart';
import 'package:async_redux/async_redux.dart';
import 'package:domain_objects/value_objects.dart';
import 'package:misc_utilities/misc.dart';

// Project imports:
import 'package:healthcloud/application/core/services/utils.dart';
import 'package:healthcloud/application/core/theme/app_themes.dart';
import 'package:healthcloud/application/redux/states/app_state.dart';
import 'package:healthcloud/application/redux/states/user_state.dart';
import 'package:healthcloud/application/redux/view_models/user_state_view_model.dart';
import 'package:healthcloud/domain/core/value_objects/app_widget_keys.dart';
import 'package:healthcloud/presentation/router/routes.dart';

class AppbarUser extends StatelessWidget {
  const AppbarUser({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: GestureDetector(
        key: appBarUserKey,
        onTap: () {
          Navigator.of(
            context,
          ).pushNamed(AppRoutes.profilePage);
        },
        child: StoreConnector<AppState, UserStateViewModel>(
          converter: (Store<AppState> store) =>
              UserStateViewModel.fromStore(store),
          builder: (BuildContext context, UserStateViewModel vm) {
            final UserState userState = vm.userState;
            final String? photoUrl = userState.userProfile!.photoUploadID;

            // a sanity check for the photo url
            final bool isUploadUrlInvalid =
                photoUrl!.isEmpty || photoUrl == UNKNOWN;

            return Container(
              padding: EdgeInsets.all(photoUrl == UNKNOWN ? 2 : 0),
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
              ),
              child: Container(
                height: 38,
                width: 38,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.malachiteColor,
                ),
                child: Center(
                  child: isUploadUrlInvalid
                      ? Text(
                          extractNamesInitials(
                            name: getDisplayName(userState),
                          ),
                          style: boldSize14Text(Colors.white),
                        )
                      : CircleAvatar(
                          backgroundImage: AssetImage(photoUrl),
                        ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
