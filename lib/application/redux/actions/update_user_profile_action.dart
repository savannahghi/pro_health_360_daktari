// Package imports:
import 'package:async_redux/async_redux.dart';
import 'package:healthcloud/application/redux/states/app_state.dart';
import 'package:healthcloud/domain/core/entities/core/contact.dart';
import 'package:healthcloud/domain/core/entities/core/staff_state.dart';
import 'package:healthcloud/domain/core/entities/core/user.dart';

class UpdateUserProfileAction extends ReduxAction<AppState> {
  UpdateUserProfileAction({
    this.active,
    this.nickName,
    this.phoneNumber,
    this.name,
    this.avatar,
    this.termsAccepted,
    this.pinChangeRequired,
    this.isPhoneVerified,
  });

  final bool? active;
  final String? nickName;
  final String? name;
  final String? avatar;
  final Contact? phoneNumber;
  final bool? termsAccepted;
  final bool? pinChangeRequired;
  final bool? isPhoneVerified;

  @override
  AppState reduce() {
    final User? userFromState = state.staffState?.user;

    final User? newUserProfile = state.staffState?.user?.copyWith(
      active: this.active ?? userFromState?.active,
      name: name ?? userFromState?.name,
      avatar: avatar ?? userFromState?.avatar,
      username: nickName ?? userFromState?.username,
      termsAccepted: termsAccepted ?? userFromState?.termsAccepted,
      pinChangeRequired: pinChangeRequired ?? userFromState?.pinChangeRequired,
      isPhoneVerified: isPhoneVerified ?? userFromState?.isPhoneVerified,
    );

    final StaffState? newState =
        state.staffState?.copyWith(user: newUserProfile);

    return state.copyWith.call(staffState: newState);
  }
}
