import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:app_wrapper/app_wrapper.dart';
import 'package:async_redux/async_redux.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mycarehubpro/application/redux/actions/faqs/fetch_faqs_content_action.dart';
import 'package:mycarehubpro/application/redux/actions/flags/app_flags.dart';
import 'package:mycarehubpro/application/redux/states/app_state.dart';
import 'package:mycarehubpro/application/redux/view_model_factories/FAQs/faqs_content_view_model.dart';
import 'package:mycarehubpro/domain/core/value_objects/app_asset_strings.dart';
import 'package:mycarehubpro/domain/core/value_objects/app_strings.dart';
import 'package:mycarehubpro/domain/core/value_objects/app_widget_keys.dart';
import 'package:mycarehubpro/presentation/core/app_bar/custom_app_bar.dart';
import 'package:mycarehubpro/presentation/router/routes.dart';

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
      StoreProvider.dispatch<AppState>(
        context,
        // retrieve the FAQS
        FetchFAQSContentAction(
          client: AppWrapperBase.of(context)!.graphQLClient,
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: faqsText),
      backgroundColor: Theme.of(context).backgroundColor,
      body: SizedBox(
        child: SafeArea(
          child: SingleChildScrollView(
            padding: EdgeInsets.zero,
            child: Container(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  StoreConnector<AppState, FAQsContentViewModel>(
                    converter: (Store<AppState> store) =>
                        FAQsContentViewModel.fromStore(store.state),
                    builder: (BuildContext context, FAQsContentViewModel vm) {
                      if ((vm.wait?.isWaitingFor(getFAQsFlag) ?? false) ||
                          (vm.wait?.isWaitingFor(fetchContentCategoriesFlag) ??
                              false)) {
                        return Container(
                          height: 300,
                          padding: const EdgeInsets.all(20),
                          child: const PlatformLoader(),
                        );
                      } else if (vm.timeoutFetchingFAQs! ||
                          vm.timeoutFetchingContentCategories!) {
                        return GenericErrorWidget(
                          actionKey: helpNoDataWidgetKey,
                          recoverCallback: () async {
                            StoreProvider.dispatch<AppState>(
                              context,
                              FetchFAQSContentAction(
                                client:
                                    AppWrapperBase.of(context)!.graphQLClient,
                              ),
                            );
                          },
                          messageTitle: '',
                          messageBody: <TextSpan>[
                            TextSpan(text: getErrorMessage(fetchingFAQsSting))
                          ],
                        );
                      } else if (vm.errorFetchingFAQs! ||
                          vm.errorFetchingContentCategories!) {
                        return GenericErrorWidget(
                          actionKey: helpNoDataWidgetKey,
                          recoverCallback: () async {
                            StoreProvider.dispatch<AppState>(
                              context,
                              FetchFAQSContentAction(
                                client:
                                    AppWrapperBase.of(context)!.graphQLClient,
                              ),
                            );
                          },
                          messageTitle: '',
                          messageBody: <TextSpan>[
                            TextSpan(text: getErrorMessage(fetchingFAQsSting))
                          ],
                        );
                      } else {
                        final List<Content?>? faqsContent = vm.faqItems;

                        if ((faqsContent?.isNotEmpty ?? false) &&
                            (faqsContent != null)) {
                          return ListView.builder(
                            shrinkWrap: true,
                            itemCount: faqsContent.length,
                            itemBuilder: (BuildContext context, int index) {
                              final Content currentSavedItem =
                                  faqsContent.elementAt(index)!;

                              return Padding(
                                padding: EdgeInsets.only(
                                  top: index == 0 ? 15 : 7.5,
                                ),
                                child: SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height * 0.38,
                                  child: ContentItem(
                                    contentDetails: currentSavedItem,
                                    contentDisplayedType:
                                        ContentDisplayedType.BOOKMARK,
                                        showReactions: false,
                                    onTapPdfCallback: () =>
                                        Navigator.of(context).pushNamed(
                                      AppRoutes.viewDocumentPage,
                                      arguments: <String, dynamic>{
                                        'pdfTitle': currentSavedItem.documents!
                                            .first.documentData!.title,
                                        'pdfUrl': currentSavedItem
                                            .documents!
                                            .first
                                            .documentData!
                                            .documentMetaData!
                                            .documentDownloadUrl,
                                      },
                                    ),
                                    onTapCallback: () =>
                                        Navigator.of(context).pushNamed(
                                      AppRoutes.contentDetailsPage,
                                      arguments: ContentDetails(
                                        content: currentSavedItem,
                                        contentDisplayedType:
                                            ContentDisplayedType.BOOKMARK,
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            },
                          );
                        } else if (faqsContent != null) {
                          return GenericErrorWidget(
                            actionKey: helpNoDataWidgetKey,
                            type: GenericNoDataTypes.noData,
                            headerIconSvgUrl: contentZeroStateImageUrl,
                            recoverCallback: () async {
                              StoreProvider.dispatch<AppState>(
                                context,
                                FetchFAQSContentAction(
                                  client:
                                      AppWrapperBase.of(context)!.graphQLClient,
                                ),
                              );
                            },
                            messageTitle: noFAQsTitle,
                            messageBody: const <TextSpan>[
                              TextSpan(text: noFAQsDescription)
                            ],
                          );
                        }
                      }
                      return const SizedBox();
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
