// Flutter imports:
import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:app_wrapper/app_wrapper.dart';
import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// Package imports:
import 'package:flutter_svg/flutter_svg.dart';
// Project imports:
import 'package:prohealth360_daktari/application/core/theme/app_themes.dart';
import 'package:prohealth360_daktari/application/redux/actions/flags/app_flags.dart';
import 'package:prohealth360_daktari/application/redux/actions/surveys/send_surveys_action.dart';
import 'package:prohealth360_daktari/application/redux/states/app_state.dart';
import 'package:prohealth360_daktari/application/redux/view_models/app_state_view_model.dart';
import 'package:prohealth360_daktari/application/redux/view_models/register_client/register_client_view_model.dart';
import 'package:prohealth360_daktari/domain/core/entities/surveys/survey.dart';
import 'package:prohealth360_daktari/domain/core/value_objects/app_asset_strings.dart';
import 'package:prohealth360_daktari/domain/core/value_objects/app_enums.dart';
import 'package:prohealth360_daktari/domain/core/value_objects/app_strings.dart';
import 'package:prohealth360_daktari/domain/core/value_objects/app_widget_keys.dart';
import 'package:prohealth360_daktari/presentation/core/app_bar/custom_app_bar.dart';
import 'package:prohealth360_daktari/presentation/onboarding/patient/widgets/patient_details_text_form_field.dart';
import 'package:prohealth360_daktari/presentation/router/routes.dart';
import 'package:prohealth360_daktari/presentation/surveys/widgets/client_configuration_form_manager.dart';
import 'package:prohealth360_daktari/presentation/surveys/widgets/surveys_card.dart';
import 'package:shared_themes/constants.dart';

class SurveysSendConfigurationsPage extends StatefulWidget {
  const SurveysSendConfigurationsPage({required this.survey});

  final Survey survey;

  @override
  State<SurveysSendConfigurationsPage> createState() =>
      _SurveysSendConfigurationsPageState();
}

class _SurveysSendConfigurationsPageState
    extends State<SurveysSendConfigurationsPage> {
  final ClientConfigurationFormManager _formManager =
      ClientConfigurationFormManager();
  bool genderAllValue = false;
  bool clientAllValue = false;

  @override
  void initState() {
    super.initState();

    final Map<ClientType, bool> initialClientTypes =
        Map<ClientType, bool>.fromIterable(
      ClientType.values,
      value: (_) => false,
    );

    final Map<Gender, bool> initialGenders = Map<Gender, bool>.fromIterable(
      Gender.values,
      value: (_) => false,
    );

    initialGenders
        .removeWhere((Gender key, bool value) => key == Gender.unknown);

    _formManager.inClientTypes.add(initialClientTypes);
    _formManager.inGender.add(initialGenders);
    _formManager.inLowerBoundAge.add(minimumAge);
    _formManager.inHigherBoundAge.add(maximumAge);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: surveysString,
        showNotificationIcon: true,
      ),
      backgroundColor: Theme.of(context).backgroundColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              SvgPicture.asset(
                surveysImagePath,
              ),
              mediumVerticalSizedBox,
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  setClientConfigurationsString,
                  style: normalSize14Text(AppColors.greyTextColor),
                ),
              ),
              mediumVerticalSizedBox,
              StoreConnector<AppState, AppStateViewModel>(
                converter: (Store<AppState> store) =>
                    AppStateViewModel.fromStore(store),
                builder: (BuildContext context, AppStateViewModel vm) {
                  return SurveysCard(
                    title: allClientsString,
                    message: tapToSendToAllClientsString,
                    isLoading:
                        vm.state.wait?.isWaitingFor(sendSurveysFlag) ?? false,
                    buttonKey: mentalHealthSurveyButtonKey,
                    buttonText: sendToAllClientsString,
                    onPressButton: () {
                      final String facilityID =
                          StoreProvider.state<AppState>(context)
                                  ?.staffState
                                  ?.defaultFacility ??
                              '';
                      StoreProvider.dispatch(
                        context,
                        SendSurveysAction(
                          client: AppWrapperBase.of(context)!.graphQLClient,
                          onSuccess: () {
                            Navigator.pushReplacementNamed(
                              context,
                              AppRoutes.successfulSurveySubmission,
                            );
                          },
                          onError: (String? message) {
                            if (message?.isNotEmpty ?? false) {
                              ScaffoldMessenger.of(context)
                                ..hideCurrentSnackBar()
                                ..showSnackBar(
                                  SnackBar(
                                    content: Text(message!),
                                    duration: const Duration(
                                      seconds: kShortSnackBarDuration,
                                    ),
                                    action: dismissSnackBar(
                                      closeString,
                                      AppColors.whiteColor,
                                      context,
                                    ),
                                  ),
                                );
                            }
                          },
                          variables: <String, dynamic>{
                            'facilityID': facilityID,
                            'formID': widget.survey.xmlFormId,
                            'projectID': widget.survey.projectId,
                          },
                        ),
                      );
                    },
                  );
                },
              ),
              mediumVerticalSizedBox,
              Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: Text(
                    ageGroupText,
                    style: veryBoldSize16Text(AppColors.lightBlackTextColor),
                  ),
                ),
              ),
              smallVerticalSizedBox,
              Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: RichText(
                    text: TextSpan(
                      style: normalSize14Text(AppColors.greyTextColor),
                      children: <TextSpan>[
                        const TextSpan(
                          text: enterAgeFromString,
                        ),
                        TextSpan(
                          text: ageConstraintsString,
                          style: veryBoldSize14Text(AppColors.greyTextColor),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              verySmallVerticalSizedBox,
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    // Lower bound
                    Flexible(
                      child: StreamBuilder<String>(
                        stream: _formManager.lowerBoundAge,
                        builder: (
                          BuildContext context,
                          AsyncSnapshot<String> snapshot,
                        ) {
                          return PatientDetailsTextFormField(
                            textFieldKey: lowerBoundKey,
                            initialValue: minimumAge,
                            keyboardType: TextInputType.number,
                            inputFormatters: <TextInputFormatter>[
                              FilteringTextInputFormatter.digitsOnly,
                              LengthLimitingTextInputFormatter(2),
                            ],
                            label: fromString,
                            onChanged: (String? value) {
                              _formManager.inLowerBoundAge.add(value ?? '');
                            },
                            validator: (String? value) {
                              if (snapshot.hasError) {
                                return (snapshot.error! as UserException).msg;
                              }
                              return null;
                            },
                          );
                        },
                      ),
                    ),
                    const SizedBox(width: 20),
                    // Higher bound
                    Flexible(
                      child: StreamBuilder<String>(
                        stream: _formManager.higherBoundAge,
                        builder: (
                          BuildContext context,
                          AsyncSnapshot<String> snapshot,
                        ) {
                          return PatientDetailsTextFormField(
                            textFieldKey: higherBoundKey,
                            initialValue: maximumAge,
                            label: toString,
                            keyboardType: TextInputType.number,
                            inputFormatters: <TextInputFormatter>[
                              FilteringTextInputFormatter.digitsOnly,
                              LengthLimitingTextInputFormatter(10),
                            ],
                            onChanged: (String? value) {
                              _formManager.inHigherBoundAge.add(value ?? '');
                            },
                            validator: (String? value) {
                              if (snapshot.hasError) {
                                return (snapshot.error! as UserException).msg;
                              }
                              return null;
                            },
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
              mediumVerticalSizedBox,
              Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: Text(
                    genderText,
                    style: veryBoldSize16Text(AppColors.lightBlackTextColor),
                  ),
                ),
              ),
              StreamBuilder<Map<Gender, bool>>(
                stream: _formManager.gender,
                builder: (
                  BuildContext context,
                  AsyncSnapshot<Map<Gender, bool>> snapshot,
                ) {
                  final Map<Gender, bool> genders =
                      snapshot.data ?? <Gender, bool>{};

                  return GridView(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 1 / .4,
                    ),
                    children: getGenderCheckBoxes(genders),
                  );
                },
              ),
              Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: Text(
                    clientTypeText,
                    style: veryBoldSize16Text(AppColors.lightBlackTextColor),
                  ),
                ),
              ),
              StreamBuilder<Map<ClientType, bool>>(
                stream: _formManager.clientTypes,
                builder: (
                  BuildContext context,
                  AsyncSnapshot<Map<ClientType, bool>> snapshot,
                ) {
                  final Map<ClientType, bool> clientTypes =
                      snapshot.data ?? <ClientType, bool>{};

                  return GridView(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 1 / .4,
                    ),
                    children: getClientTypeCheckBoxes(clientTypes),
                  );
                },
              ),
              mediumVerticalSizedBox,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  // Submit button
                  SizedBox(
                    width: double.infinity,
                    child: StreamBuilder<bool>(
                      stream: _formManager.isFormValid,
                      builder: (
                        BuildContext context,
                        AsyncSnapshot<bool> snapshot,
                      ) {
                        final bool hasData =
                            snapshot.hasData && snapshot.data != null;

                        return StoreConnector<AppState,
                            RegisterClientViewModel>(
                          converter: (Store<AppState> store) =>
                              RegisterClientViewModel.fromStore(
                            store,
                          ),
                          builder: (
                            BuildContext context,
                            RegisterClientViewModel vm,
                          ) {
                            if (vm.wait.isWaitingFor(sendSurveysFlag)) {
                              return const PlatformLoader();
                            }

                            return SizedBox(
                              height: 48,
                              child: ElevatedButton(
                                key: sendSurveyButtonKey,
                                onPressed: hasData && snapshot.data!
                                    ? () => _processAndNavigate(
                                          vm.hasConnection,
                                        )
                                    : null,
                                child: const Text(sendSurveyText),
                              ),
                            );
                          },
                        );
                      },
                    ),
                  )
                ],
              ),
              largeVerticalSizedBox,
            ],
          ),
        ),
      ),
    );
  }

  List<Widget> getClientTypeCheckBoxes(Map<ClientType, bool> clientTypes) {
    final List<Widget> result = <Widget>[];
    final Map<ClientType, bool> clientTypesCopy = clientTypes;

    result.add(
      CheckboxListTile(
        key: const ValueKey<String>(allText),
        activeColor: AppColors.primaryColor,
        title: const Text(
          allText,
          style: TextStyle(color: AppColors.grey50),
        ),
        value: clientAllValue,
        onChanged: (_) {
          setState(() {
            clientAllValue = !clientAllValue;
          });
          if (clientAllValue) {
            clientTypesCopy.forEach((ClientType key, bool value) {
              clientTypesCopy[key] = true;
            });
          } else {
            clientTypesCopy.forEach((ClientType key, bool value) {
              clientTypesCopy[key] = false;
            });
          }
          _formManager.inClientTypes.add(clientTypesCopy);
        },
      ),
    );

    clientTypes.forEach((ClientType key, bool value) {
      result.add(
        CheckboxListTile(
          key: ValueKey<String>(key.name),
          activeColor: AppColors.primaryColor,
          title: Text(
            key.name.replaceAll('_', ' '),
            style: const TextStyle(color: AppColors.grey50),
          ),
          value: value,
          onChanged: (_) {
            clientTypesCopy[key] = !value;
            _formManager.inClientTypes.add(clientTypesCopy);
          },
        ),
      );
    });

    return result;
  }

  List<Widget> getGenderCheckBoxes(Map<Gender, bool> genders) {
    final List<Widget> result = <Widget>[];
    final Map<Gender, bool> gendersCopy = genders;

    result.add(
      CheckboxListTile(
        key: const ValueKey<String>(allText),
        activeColor: AppColors.primaryColor,
        title: const Text(
          allText,
          style: TextStyle(color: AppColors.grey50),
        ),
        value: genderAllValue,
        onChanged: (_) {
          setState(() {
            genderAllValue = !genderAllValue;
          });
          if (genderAllValue) {
            gendersCopy.forEach((Gender key, bool value) {
              gendersCopy[key] = true;
            });
          } else {
            gendersCopy.forEach((Gender key, bool value) {
              gendersCopy[key] = false;
            });
          }
          _formManager.inGender.add(gendersCopy);
        },
      ),
    );

    gendersCopy.forEach((Gender key, bool value) {
      result.add(
        CheckboxListTile(
          key: ValueKey<String>(key.name),
          activeColor: AppColors.primaryColor,
          title: Text(
            key.name.toUpperCase(),
            style: const TextStyle(color: AppColors.grey50),
          ),
          value: value,
          onChanged: (_) {
            gendersCopy[key] = !value;
            _formManager.inGender.add(gendersCopy);
          },
        ),
      );
    });

    return result;
  }

  void _processAndNavigate(bool hasConnection) {
    if (!hasConnection) {
      ScaffoldMessenger.of(context)
        ..hideCurrentSnackBar()
        ..showSnackBar(
          SnackBar(
            content: const Text(
              connectionLostText,
            ),
            duration: const Duration(seconds: 5),
            action: dismissSnackBar(
              closeString,
              Colors.white,
              context,
            ),
          ),
        );

      return;
    }
    final String facilityID =
        StoreProvider.state<AppState>(context)?.staffState?.defaultFacility ??
            '';
    StoreProvider.dispatch(
      context,
      SendSurveysAction(
        client: AppWrapperBase.of(context)!.graphQLClient,
        onSuccess: () {
          Navigator.pushReplacementNamed(
            context,
            AppRoutes.successfulSurveySubmission,
          );
        },
        onError: (String? message) {
          if (message?.isNotEmpty ?? false) {
            ScaffoldMessenger.of(context)
              ..hideCurrentSnackBar()
              ..showSnackBar(
                SnackBar(
                  content: Text(message!),
                  duration: const Duration(
                    seconds: kShortSnackBarDuration,
                  ),
                  action: dismissSnackBar(
                    closeString,
                    AppColors.whiteColor,
                    context,
                  ),
                ),
              );
          }
        },
        variables: <String, dynamic>{
          'facilityID': facilityID,
          'formID': widget.survey.xmlFormId,
          'projectID': widget.survey.projectId,
          'filterParams': _formManager.submit().toJson()
        },
      ),
    );
  }
}
