import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:async_redux/async_redux.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:myharehubpro/application/core/theme/app_themes.dart';
import 'package:myharehubpro/application/redux/actions/faqs/fetch_faqs_content_action.dart';
import 'package:myharehubpro/application/redux/actions/flags/app_flags.dart';
import 'package:myharehubpro/application/redux/states/app_state.dart';
import 'package:myharehubpro/application/redux/view_model_factories/FAQs/faqs_content_view_model.dart';
import 'package:myharehubpro/domain/core/value_objects/app_strings.dart';
import 'package:myharehubpro/domain/core/value_objects/app_widget_keys.dart';
import 'package:myharehubpro/presentation/core/app_bar/custom_app_bar.dart';
import 'package:myharehubpro/presentation/profile/faqs/widgets/faq_item.dart';
import 'package:myharehubpro/presentation/router/routes.dart';
import 'package:shared_themes/spaces.dart';

class ProfileFaqsPage extends StatefulWidget {
  const ProfileFaqsPage();

  @override
  _ProfileFaqsPageState createState() => _ProfileFaqsPageState();
}

class _ProfileFaqsPageState extends State<ProfileFaqsPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      final FAQsContentState? state = StoreProvider.state<AppState>(context)
          ?.miscState
          ?.profileFAQsContentState;

      if (state?.profileFAQs?.isEmpty ?? true) {
        StoreProvider.dispatch<AppState>(
          context,
          // retrieve the FAQS
          FetchFAQSContentAction(
            context: context,
          ),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: faqsString,
        showNotificationIcon: true,
      ),
      backgroundColor: Theme.of(context).backgroundColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
        ),
        child: StoreConnector<AppState, FAQsContentViewModel>(
          converter: (Store<AppState> store) =>
              FAQsContentViewModel.fromStore(store.state),
          builder: (BuildContext context, FAQsContentViewModel vm) {
            if (vm.wait?.isWaitingFor(getFAQsFlag) ?? false) {
              return Container(
                height: 300,
                padding: const EdgeInsets.all(20),
                child: const PlatformLoader(),
              );
            } else if (vm.errorFetchingFAQs ?? false) {
              return GenericErrorWidget(
                actionKey: helpNoDataWidgetKey,
                recoverCallback: () async {
                  StoreProvider.dispatch<AppState>(
                    context,
                    FetchFAQSContentAction(context: context),
                  );
                },
                messageBody: <TextSpan>[
                  TextSpan(
                    text: getErrorMessage(fetchingFAQsFlagString),
                    style: normalSize16Text(
                      AppColors.greyTextColor,
                    ),
                  ),
                ],
              );
            } else {
              final List<FAQContent?>? faqsContent = vm.faqItems;

              if ((faqsContent?.isNotEmpty ?? false) && (faqsContent != null)) {
                return SizedBox(
                  child: SafeArea(
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.all(20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              frequentlyAskedQuestions,
                              style: normalSize32Text(
                                Theme.of(context).primaryColor,
                              ),
                            ),
                            mediumVerticalSizedBox,
                            ListView.builder(
                              shrinkWrap: true,
                              physics: const BouncingScrollPhysics(),
                              itemCount: faqsContent.length,
                              itemBuilder: (_, int index) {
                                return GestureDetector(
                                  onTap: () {
                                    Navigator.pushNamed(
                                      context,
                                      AppRoutes.faqDetailViewPage,
                                      arguments: faqsContent[index],
                                    );
                                  },
                                  child: FAQItem(
                                    faqContent: FAQContent(
                                      title:
                                          faqsContent[index]?.title ?? UNKNOWN,
                                      body: loremIpsumText,
                                    ),
                                  ),
                                );
                              },
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              } else if (faqsContent != null) {
                return GenericErrorWidget(
                  actionKey: helpNoDataWidgetKey,
                  recoverCallback: () async {
                    StoreProvider.dispatch<AppState>(
                      context,
                      FetchFAQSContentAction(
                        context: context,
                      ),
                    );
                  },
                  messageBody: <TextSpan>[
                    TextSpan(
                      text: getErrorMessage(fetchingFAQsFlagString),
                      style: normalSize16Text(
                        AppColors.greyTextColor,
                      ),
                    ),
                  ],
                );
              }
            }
            return const SizedBox();
          },
        ),
      ),
    );
  }
}
