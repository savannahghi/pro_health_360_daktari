// Flutter imports:
import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:app_wrapper/app_wrapper.dart';
import 'package:async_redux/async_redux.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// Package imports:
import 'package:flutter_svg/flutter_svg.dart';
// Project imports:
import 'package:mycarehubpro/application/core/theme/app_themes.dart';
import 'package:mycarehubpro/application/redux/actions/flags/app_flags.dart';
import 'package:mycarehubpro/application/redux/actions/surveys/fetch_surveys_action.dart';
import 'package:mycarehubpro/application/redux/states/app_state.dart';
import 'package:mycarehubpro/application/redux/view_models/surveys/surveys_view_model.dart';
import 'package:mycarehubpro/domain/core/entities/surveys/survey.dart';
import 'package:mycarehubpro/domain/core/value_objects/app_asset_strings.dart';
import 'package:mycarehubpro/domain/core/value_objects/app_strings.dart';
import 'package:mycarehubpro/domain/core/value_objects/app_widget_keys.dart';
import 'package:mycarehubpro/presentation/core/app_bar/custom_app_bar.dart';
import 'package:mycarehubpro/presentation/router/routes.dart';
import 'package:mycarehubpro/presentation/surveys/widgets/surveys_card.dart';
import 'package:shared_themes/spaces.dart';

class SurveysPage extends StatelessWidget {
  const SurveysPage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: surveysString,
        showNotificationIcon: true,
      ),
      backgroundColor: Theme.of(context).backgroundColor,
      body: StoreConnector<AppState, SurveysViewModel>(
        onInit: (Store<AppState> store) {
          store.dispatch(
            FetchSurveysAction(
              client: AppWrapperBase.of(context)!.graphQLClient,
            ),
          );
        },
        converter: (Store<AppState> store) => SurveysViewModel.fromStore(store),
        builder: (BuildContext context, SurveysViewModel vm) {
          final List<Survey?> surveys = vm.surveys ?? <Survey>[];
          final bool isLoading =
              vm.wait?.isWaitingFor(fetchSurveysFlag) ?? false;
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  if (vm.errorFetchingSurveys ?? false)
                    GenericErrorWidget(
                      actionKey: helpNoDataWidgetKey,
                      recoverCallback: () => StoreProvider.dispatch<AppState>(
                        context,
                        FetchSurveysAction(
                          client: AppWrapperBase.of(context)!.graphQLClient,
                        ),
                      ),
                      messageTitle: '',
                      messageBody: <TextSpan>[
                        TextSpan(
                          text: getErrorMessage(fetchingSurveysString),
                          style: normalSize16Text(
                            AppColors.greyTextColor,
                          ),
                        ),
                      ],
                    )
                  else if (isLoading || surveys.isNotEmpty) ...<Widget>{
                    SvgPicture.asset(
                      surveysImagePath,
                    ),
                    mediumVerticalSizedBox,
                    if (isLoading)
                      const Padding(
                        padding: EdgeInsets.only(top: 30.0),
                        child: PlatformLoader(),
                      )
                    else ...<Widget>{
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Text(
                          surveysInvitedToString,
                          textAlign: TextAlign.center,
                          style: normalSize14Text(AppColors.greyTextColor),
                        ),
                      ),
                      mediumVerticalSizedBox,
                      ListView.builder(
                        shrinkWrap: true,
                        physics: const BouncingScrollPhysics(),
                        itemCount: surveys.length,
                        itemBuilder: (_, int index) {
                          final String surveyTitle = surveys[index]?.name ?? '';
                          return SurveysCard(
                            title: surveyTitle,
                            buttonKey: mentalHealthSurveyButtonKey,
                            onPressButton: () => Navigator.of(context)
                                .pushNamed(AppRoutes.surveysSenderListPage),
                          );
                        },
                      ),
                    }
                  } else
                    GenericErrorWidget(
                      actionKey: helpNoDataWidgetKey,
                      type: GenericNoDataTypes.noData,
                      headerIconSvgUrl: surveysImagePath,
                      messageTitle: noSurveysTitle,
                      messageBody: <TextSpan>[
                        TextSpan(
                          text: noSurveysDescription,
                          style: normalSize16Text(
                            AppColors.greyTextColor,
                          ),
                        ),
                      ],
                      recoverCallback: () {
                        if (Navigator.canPop(context)) {
                          Navigator.pop(context);
                        } else {
                          Navigator.pushReplacementNamed(
                            context,
                            AppRoutes.homePage,
                          );
                        }
                      },
                      actionText: thanksText,
                    )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
