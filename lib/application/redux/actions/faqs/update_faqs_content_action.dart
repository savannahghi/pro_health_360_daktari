import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:async_redux/async_redux.dart';
import 'package:prohealth360_daktari/application/redux/states/app_state.dart';
import 'package:prohealth360_daktari/application/redux/states/misc_state.dart';

class UpdateFAQsContentAction extends ReduxAction<AppState> {
  UpdateFAQsContentAction({
    this.profileFAQs,
    this.errorFetchingFAQs,
    this.timeoutFetchingFAQs,
  });

  final List<Content?>? profileFAQs;
  final bool? errorFetchingFAQs;
  final bool? timeoutFetchingFAQs;

  @override
  AppState reduce() {
    final FAQsContentState? newFAQsContentState =
        state.miscState?.profileFAQsContentState?.copyWith(
      profileFAQs:
          profileFAQs ?? state.miscState?.profileFAQsContentState?.profileFAQs,
      errorFetchingFAQs: errorFetchingFAQs ??
          state.miscState?.profileFAQsContentState?.errorFetchingFAQs,
      timeoutFetchingFAQs: timeoutFetchingFAQs ??
          state.miscState?.profileFAQsContentState?.timeoutFetchingFAQs,
    );
    final MiscState? miscState = state.miscState?.copyWith(
      profileFAQsContentState: newFAQsContentState,
    );
    return state.copyWith(
      miscState: miscState,
    );
  }
}
