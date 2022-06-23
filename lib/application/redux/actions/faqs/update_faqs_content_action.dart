import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:async_redux/async_redux.dart';
import 'package:prohealth360_daktari/application/redux/states/app_state.dart';
import 'package:prohealth360_daktari/application/redux/states/misc_state.dart';

class UpdateFAQsContentAction extends ReduxAction<AppState> {
  UpdateFAQsContentAction({
    this.profileFAQs,
    this.errorFetchingFAQs,
    this.timeoutFetchingFAQs,
    this.errorFetchingContentCategories,
    this.timeoutFetchingContentCategories,
    this.contentCategories,
  });

  final List<Content?>? profileFAQs;
  final bool? errorFetchingFAQs;
  final bool? timeoutFetchingFAQs;
  final List<ContentCategory?>? contentCategories;
  final bool? errorFetchingContentCategories;
  final bool? timeoutFetchingContentCategories;

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
      categoriesList: state.miscState?.categoriesList?.copyWith(
        errorFetchingContentCategories: errorFetchingContentCategories ??
            state.miscState?.categoriesList?.errorFetchingContentCategories,
        timeoutFetchingContentCategories: timeoutFetchingContentCategories ??
            state.miscState?.categoriesList?.timeoutFetchingContentCategories,
        contentCategories: contentCategories ??
            state.miscState?.categoriesList?.contentCategories,
      ),
      profileFAQsContentState: newFAQsContentState,
    );
    return state.copyWith(
      miscState: miscState,
    );
  }
}
