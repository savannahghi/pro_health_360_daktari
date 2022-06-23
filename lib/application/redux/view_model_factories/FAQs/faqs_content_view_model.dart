import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:async_redux/async_redux.dart';
import 'package:prohealth360_daktari/application/redux/states/app_state.dart';

class FAQsContentViewModel extends Vm {
  FAQsContentViewModel({
    this.wait,
    this.errorFetchingFAQs,
    this.timeoutFetchingFAQs,
    this.faqItems,
    this.errorFetchingContentCategories,
    this.timeoutFetchingContentCategories,
  }) : super(
          equals: <Object?>[
            wait,
            errorFetchingFAQs,
            timeoutFetchingFAQs,
            faqItems,
            errorFetchingContentCategories,
            timeoutFetchingContentCategories,
          ],
        );

  factory FAQsContentViewModel.fromStore(AppState state) {
    return FAQsContentViewModel(
      wait: state.wait,
      errorFetchingFAQs:
          state.miscState?.profileFAQsContentState?.errorFetchingFAQs ?? false,
      timeoutFetchingFAQs:
          state.miscState?.profileFAQsContentState?.timeoutFetchingFAQs ??
              false,
      faqItems: state.miscState!.profileFAQsContentState!.profileFAQs,
      errorFetchingContentCategories:
          state.miscState?.categoriesList?.errorFetchingContentCategories ??
              false,
      timeoutFetchingContentCategories:
          state.miscState?.categoriesList?.timeoutFetchingContentCategories ??
              false,
    );
  }

  final bool? errorFetchingFAQs;
  final bool? timeoutFetchingFAQs;
  final List<Content?>? faqItems;
  final bool? errorFetchingContentCategories;
  final bool? timeoutFetchingContentCategories;
  final Wait? wait;
}
