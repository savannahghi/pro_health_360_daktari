// Flutter imports:
// Package imports:
import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:prohealth360_daktari/application/redux/states/app_state.dart';
import 'package:prohealth360_daktari/application/redux/view_models/app_state_view_model.dart';
import 'package:prohealth360_daktari/domain/core/entities/core/user.dart';
// Project imports
import 'package:prohealth360_daktari/domain/core/value_objects/app_widget_keys.dart';
import 'package:prohealth360_daktari/presentation/router/routes.dart';

class AppbarUser extends StatelessWidget {
  const AppbarUser({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: GestureDetector(
        key: appBarUserKey,
        onTap: () {
          Navigator.of(
            context,
          ).pushNamed(AppRoutes.profilePage);
        },
        child: StoreConnector<AppState, AppStateViewModel>(
          converter: (Store<AppState> store) =>
              AppStateViewModel.fromStore(store),
          builder: (BuildContext context, AppStateViewModel vm) {
            final User? user = vm.state.staffState?.user;
            final String photoUrl = user?.avatar ?? UNKNOWN;

            // a sanity check for the photo url
            final bool userHasProfileImage =
                photoUrl.isEmpty || photoUrl == UNKNOWN;

            return Container(
              padding: EdgeInsets.all(photoUrl == UNKNOWN ? 2 : 0),
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
              ),
              child: Container(
                height: 38,
                width: 38,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Theme.of(context).primaryColor,
                ),
                child: Center(
                  child: userHasProfileImage
                      ? Text(
                          extractNamesInitials(name: user?.name ?? 'UU'),
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
