import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mycarehubpro/application/core/services/utils.dart';
import 'package:mycarehubpro/application/core/theme/app_themes.dart';
import 'package:mycarehubpro/application/redux/actions/service_requests/update_service_requests_state_action.dart';
import 'package:mycarehubpro/application/redux/states/app_state.dart';
import 'package:mycarehubpro/application/redux/states/service_requests/alcohol_substance_use_state.dart';
import 'package:mycarehubpro/application/redux/states/service_requests/contraceptive_state.dart';
import 'package:mycarehubpro/application/redux/states/service_requests/screening_questions_list.dart';
import 'package:mycarehubpro/application/redux/states/service_requests/screening_tools_state.dart';
import 'package:mycarehubpro/application/redux/states/service_requests/tb_state.dart';
import 'package:mycarehubpro/application/redux/states/service_requests/violence_state.dart';
import 'package:mycarehubpro/application/redux/view_models/service_requests/service_requests_view_model.dart';
import 'package:mycarehubpro/domain/core/value_objects/app_asset_strings.dart';
import 'package:mycarehubpro/domain/core/value_objects/app_enums.dart';
import 'package:mycarehubpro/domain/core/value_objects/app_strings.dart';
import 'package:mycarehubpro/presentation/core/app_bar/custom_app_bar.dart';
import 'package:mycarehubpro/presentation/service_requests/widgets/assessment_request_item_widget.dart';
import 'package:shared_themes/spaces.dart';

class AssessmentToolsCategoryPage extends StatefulWidget {
  const AssessmentToolsCategoryPage({
    Key? key,
    required this.screeningToolsType,
  }) : super(key: key);

  final ScreeningToolsType screeningToolsType;

  @override
  State<AssessmentToolsCategoryPage> createState() =>
      _AssessmentToolsCategoryPageState();
}

class _AssessmentToolsCategoryPageState
    extends State<AssessmentToolsCategoryPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance?.addPostFrameCallback((_) async {
      StoreProvider.dispatch(
        context,
        UpdateServiceRequestsStateAction(
          screeningToolsState: ScreeningToolsState(
            alcoholSubstanceUseState: AlcoholSubstanceUseState(
              screeningQuestionItems: screeningQuestionItems,
            ),
            violenceState: ViolenceState(
              screeningQuestionItems: screeningQuestionItems,
            ),
            contraceptiveState: ContraceptiveState(
              screeningQuestionItems: screeningQuestionItems,
            ),
            tbState: TBState.initial(),
          ),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: getAssessmentScorePageTitle(
          screeningToolsType: widget.screeningToolsType,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: ListView(
          shrinkWrap: true,
          children: <Widget>[
            smallVerticalSizedBox,
            SvgPicture.asset(
              screeningToolsImage,
              height: 150,
            ),
            smallVerticalSizedBox,
            Center(
              child: Text(
                screeningToolsPageLongDescription,
                style: normalSize14Text(
                  AppColors.greyTextColor.withOpacity(0.5),
                ),
              ),
            ),
            smallVerticalSizedBox,
            StoreConnector<AppState, ServiceRequestsViewModel>(
              converter: (Store<AppState> store) =>
                  ServiceRequestsViewModel.fromStore(store),
              builder: (BuildContext context, ServiceRequestsViewModel vm) {
                final List<ScreeningQuestionsList>? screeningQuestions =
                    getScreeningQuestions(
                          toolsType: widget.screeningToolsType,
                          screeningToolsState: vm.screeningToolsState,
                        );
                return ListView(
                        shrinkWrap: true,
                        children: <Widget>[
                          ListView.builder(
                            shrinkWrap: true,
                            itemCount: screeningQuestions!.length,
                            itemBuilder: (BuildContext context, int index) {
                              return AssessmentRequestItemWidget(
                                screeningQuestionsList:
                                    screeningQuestions[index],
                              );
                            },
                          )
                        ],
                      );
              },
            ),
          ],
        ),
      ),
    );
  }
}
