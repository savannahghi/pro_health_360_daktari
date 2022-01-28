import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:healthcloud/application/redux/states/user_state.dart';

part 'staff_state.freezed.dart';
part 'staff_state.g.dart';

@freezed
class StaffState with _$StaffState {
  factory StaffState({
    UserState? userState,
  }) = _StaffState;

  factory StaffState.fromJson(Map<String, dynamic> json) =>
      _$StaffStateFromJson(json);

  factory StaffState.initial() => StaffState(
        ///TODO(paul) extract UserState
        /// Code
        /// Message
        /// Credentials
        /// User
        userState: UserState.initial(),
      );
}
