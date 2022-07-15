import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:app_wrapper/app_wrapper.dart';
import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:prohealth360_daktari/application/core/services/helpers.dart';
import 'package:prohealth360_daktari/application/core/theme/app_themes.dart';
import 'package:prohealth360_daktari/application/redux/actions/flags/app_flags.dart';
import 'package:prohealth360_daktari/application/redux/actions/service_requests/fetch_screening_tool_responses_action.dart';
import 'package:prohealth360_daktari/application/redux/actions/service_requests/resolve_screening_tool_service_request_action.dart';
import 'package:prohealth360_daktari/application/redux/states/app_state.dart';
import 'package:prohealth360_daktari/application/redux/states/service_requests/tool_assessment_response.dart';
import 'package:prohealth360_daktari/application/redux/view_models/service_requests/screening_tools_view_model.dart';
import 'package:prohealth360_daktari/domain/core/entities/core/staff_state.dart';
import 'package:prohealth360_daktari/domain/core/value_objects/app_enums.dart';
import 'package:prohealth360_daktari/domain/core/value_objects/app_strings.dart';
import 'package:prohealth360_daktari/domain/core/value_objects/app_widget_keys.dart';
import 'package:prohealth360_daktari/presentation/core/app_bar/custom_app_bar.dart';
import 'package:prohealth360_daktari/presentation/service_requests/widgets/assessment_card.dart';
import 'package:prohealth360_daktari/presentation/service_requests/widgets/reach_out_widget.dart';

class AssessmentCardAnswersPage extends StatefulWidget {
  const AssessmentCardAnswersPage({
    Key? key,
    required this.payload,
  }) : super(key: key);

  final Map<String, dynamic> payload;

  @override
  State<AssessmentCardAnswersPage> createState() =>
      _AssessmentCardAnswersPageState();
}

class _AssessmentCardAnswersPageState extends State<AssessmentCardAnswersPage> {
  Map<String, bool> actionsList = <String, bool>{
    noFurtherActionRequiredString: false,
    followUpVisitBookedString: false,
    referredToCommunityString: false,
  };

  List<String> actionsTaken = <String>[];
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      final ToolAssessmentResponse assessmentResponse =
          widget.payload['assessmentResponse'] as ToolAssessmentResponse;
      final ScreeningToolsType toolsType =
          widget.payload['toolType'] as ScreeningToolsType;
      StoreProvider.dispatch<AppState>(
        context,
        FetchScreeningToolResponsesAction(
          client: AppWrapperBase.of(context)!.graphQLClient,
          toolsType: toolsType,
          clientID: assessmentResponse.clientID ?? '',
          onFailure: () => showTextSnackbar(
            ScaffoldMessenger.of(context),
            content: somethingWentWrongText,
          ),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    final TargetPlatform _platform = Theme.of(context).platform;
    final TextEditingController notesInputController = TextEditingController();
    final ToolAssessmentResponse assessmentResponse =
        widget.payload['assessmentResponse'] as ToolAssessmentResponse;
    final ScreeningToolsType toolsType =
        widget.payload['toolType'] as ScreeningToolsType;
    final StaffState? staffState =
        StoreProvider.state<AppState>(context)?.staffState;
    final String staffFirstName = staffState?.user?.firstName ?? '';
    final String staffLastName = staffState?.user?.lastName ?? '';
    final String facilityName = staffState?.defaultFacilityName ?? '';
    return Scaffold(
      appBar: const CustomAppBar(title: assessmentCardTitle),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: StoreConnector<AppState, ScreeningToolsViewModel>(
          converter: (Store<AppState> store) =>
              ScreeningToolsViewModel.fromStore(store),
          builder: (BuildContext context, ScreeningToolsViewModel vm) {
            final ToolAssessmentResponse? toolResponse =
                vm.toolAssessmentResponses?.firstWhere(
              (ToolAssessmentResponse response) =>
                  response.clientID == assessmentResponse.clientID,
              orElse: () => ToolAssessmentResponse.initial(),
            );
            return SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  RichText(
                    text: TextSpan(
                      children: <TextSpan>[
                        TextSpan(
                          text: hereIsWhatString,
                          style: normalSize14Text(AppColors.greyTextColor),
                        ),
                        TextSpan(
                          text: assessmentResponse.name,
                          style: veryBoldSize14Text(AppColors.greyTextColor),
                        ),
                        TextSpan(
                          text: respondedInString,
                          style: normalSize14Text(AppColors.greyTextColor),
                        ),
                        TextSpan(
                          text: getAssessmentScoreName(
                            screeningToolsType: toolsType,
                          ),
                          style: normalSize14Text(AppColors.greyTextColor),
                        ),
                        TextSpan(
                          text: assessmentToolOnString,
                          style: normalSize14Text(AppColors.greyTextColor),
                        ),
                        TextSpan(
                          text: formatDate(
                            assessmentResponse.date ?? '',
                          ),
                          style: veryBoldSize14Text(AppColors.greyTextColor),
                        ),
                      ],
                    ),
                  ),
                  mediumVerticalSizedBox,
                  Text(
                    assessmentCardString,
                    style: veryBoldSize20Text(AppColors.greyTextColor),
                  ),
                  smallVerticalSizedBox,
                  AssessmentCard(
                    username: '${assessmentResponse.name}',
                    description: '${getAssessmentScorePageTitle(
                      screeningToolsType: toolsType,
                    )} ${assessmentCardString.toLowerCase()}',
                    questionsResponses: toolResponse
                        ?.toolAssessmentRequestResponse?.questionsResponses,
                    isLoading:
                        vm.wait.isWaitingFor(fetchScreeningToolResponsesFlag),
                  ),
                  mediumVerticalSizedBox,
                  ReachOutWidget(
                    platform: _platform,
                    phoneNumber: toolResponse
                            ?.toolAssessmentRequestResponse?.phoneNumber ??
                        '',
                    clientName: assessmentResponse.name ?? '',
                    staffFirstName: staffFirstName,
                    staffLastName: staffLastName,
                    facilityName: facilityName,
                  ),
                  mediumVerticalSizedBox,
                  Text(
                    resolveString,
                    style: veryBoldSize18Text(AppColors.greyTextColor),
                  ),
                  smallVerticalSizedBox,
                  RichText(
                    text: TextSpan(
                      text: ifYouHaveReachedOutString,
                      style: normalSize16Text(AppColors.greyTextColor),
                      children: <TextSpan>[
                        TextSpan(
                          text: assessmentResponse.name,
                          style: veryBoldSize16Text(AppColors.greyTextColor),
                        ),
                        const TextSpan(
                          text: tapTapBelowToResolveString,
                        ),
                      ],
                    ),
                  ),
                  mediumVerticalSizedBox,
                  Text(
                    actionTakenString,
                    style: veryBoldSize18Text(AppColors.greyTextColor),
                  ),
                  ...getActionsCheckBoxes(actionsList),
                  mediumVerticalSizedBox,
                  Text(
                    notesString,
                    style: veryBoldSize18Text(AppColors.greyTextColor),
                  ),
                  smallVerticalSizedBox,
                  TextField(
                    key: serviceRequestNotesTextFieldKey,
                    keyboardType: TextInputType.visiblePassword,
                    controller: notesInputController,
                    style: normalSize14Text(
                      AppColors.greyTextColor,
                    ),
                    maxLines: 9,
                    minLines: 3,
                    decoration: InputDecoration(
                      hintText: describeActionTakenString,
                      hintStyle: normalSize14Text(
                        AppColors.greyTextColor.withOpacity(0.4),
                      ),
                      filled: true,
                      fillColor: AppColors.galleryColor,
                      enabledBorder: const OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.transparent,
                        ),
                        borderRadius: BorderRadius.all(
                          Radius.circular(6),
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: AppColors.primaryColor.withOpacity(0.3),
                        ),
                        borderRadius: const BorderRadius.all(
                          Radius.circular(6),
                        ),
                      ),
                      focusColor: AppColors.greyTextColor,
                    ),
                  ),
                  mediumVerticalSizedBox,
                  SizedBox(
                    width: double.infinity,
                    height: 48,
                    child: vm.wait.isWaitingFor(resolveServiceRequestFlag)
                        ? const PlatformLoader()
                        : ElevatedButton(
                            key: resolveRequestButtonKey,
                            onPressed: actionsTaken.isNotEmpty
                                ? () => StoreProvider.dispatch<AppState>(
                                      context,
                                      ResolveScreeningToolServiceRequestAction(
                                        client: AppWrapperBase.of(context)!
                                            .graphQLClient,
                                        serviceRequestId: toolResponse
                                                ?.toolAssessmentRequestResponse
                                                ?.serviceRequestID ??
                                            '',
                                        screeningToolsType: toolsType,
                                        actionsTaken: actionsTaken.contains(
                                          noFurtherActionRequiredString,
                                        )
                                            ? <String>[]
                                            : actionsTaken,
                                        onSuccess: () {
                                          showTextSnackbar(
                                            ScaffoldMessenger.of(context),
                                            content: requestResolvedSuccessText,
                                          );
                                          Navigator.of(context).pop();
                                        },
                                        onFailure: () => showTextSnackbar(
                                          ScaffoldMessenger.of(context),
                                          content: somethingWentWrongText,
                                        ),
                                      ),
                                    )
                                : null,
                            child: const Text(
                              resolveString,
                            ),
                          ),
                  ),
                  largeVerticalSizedBox,
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  List<Widget> getActionsCheckBoxes(Map<String, bool> actions) {
    final List<Widget> result = <Widget>[];

    actions.forEach((String key, bool value) {
      result.add(
        CheckboxListTile(
          contentPadding: EdgeInsets.zero,
          key: ValueKey<String>(key.replaceAll(' ', '_').toLowerCase()),
          activeColor: Theme.of(context).primaryColor,
          controlAffinity: ListTileControlAffinity.leading,
          title: Text(
            key,
            style: const TextStyle(color: AppColors.grey50),
          ),
          value: value,
          onChanged: (_) {
            setState(() {
              actionsList[key] = !value;
              if (key == noFurtherActionRequiredString) {
                if (actionsList[key] ?? false) {
                  actionsTaken = <String>[noFurtherActionRequiredString];
                  actionsList.forEach((String _key, bool value) {
                    if (_key != key) actionsList[_key] = false;
                  });
                } else {
                  actionsTaken = <String>[];
                }
              } else {
                if (actionsList[key] ?? false) {
                  actionsTaken.add(key);
                  actionsList[noFurtherActionRequiredString] = false;
                } else {
                  actionsTaken.removeWhere((String action) => action == key);
                }
              }
            });
          },
        ),
      );
    });

    return result;
  }
}
