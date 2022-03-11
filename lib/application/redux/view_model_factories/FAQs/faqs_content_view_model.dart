import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:async_redux/async_redux.dart';
import 'package:mycarehubpro/application/redux/states/app_state.dart';

class FAQsContentViewModel extends Vm {
  FAQsContentViewModel({
    this.wait,
    this.errorFetchingFAQs,
    this.timeoutFetchingFAQs,
    this.faqItems,
  }) : super(
          equals: <Object?>[
            wait,
            errorFetchingFAQs,
            timeoutFetchingFAQs,
            faqItems,
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
      faqItems: state.miscState?.profileFAQsContentState?.profileFAQs,
    );
  }

  final bool? errorFetchingFAQs;
  final bool? timeoutFetchingFAQs;
  final List<FAQContent?>? faqItems;
  final Wait? wait;
}
