// Flutter imports:
import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// Package imports:
import 'package:flutter_svg/flutter_svg.dart';
// Project imports:
import 'package:mycarehubpro/application/core/theme/app_themes.dart';
import 'package:mycarehubpro/domain/core/value_objects/app_asset_strings.dart';
import 'package:mycarehubpro/domain/core/value_objects/app_enums.dart';
import 'package:mycarehubpro/domain/core/value_objects/app_strings.dart';
import 'package:mycarehubpro/domain/core/value_objects/app_widget_keys.dart';
import 'package:mycarehubpro/presentation/core/app_bar/custom_app_bar.dart';
import 'package:mycarehubpro/presentation/router/routes.dart';
import 'package:mycarehubpro/presentation/surveys/widgets/client_configuration_form_manager.dart';
import 'package:mycarehubpro/presentation/surveys/widgets/surveys_card.dart';
import 'package:shared_themes/spaces.dart';

class SurveysSendConfigurationsPage extends StatefulWidget {
  const SurveysSendConfigurationsPage();

  @override
  State<SurveysSendConfigurationsPage> createState() =>
      _SurveysSendConfigurationsPageState();
}

class _SurveysSendConfigurationsPageState
    extends State<SurveysSendConfigurationsPage> {
  final ClientConfigurationFormManager _formManager =
      ClientConfigurationFormManager();
  bool genderAllValue = false;

  @override
  void initState() {
    super.initState();

    final Map<ClientType, bool> initialClientTypes =
        Map<ClientType, bool>.fromIterable(
      ClientType.values,
      value: (_) => false,
    );

    final Map<String, bool> initialAgeGroups = Map<String, bool>.fromIterable(
      ageGroups,
      value: (_) => false,
    );

    final Map<Gender, bool> initialGenders = Map<Gender, bool>.fromIterable(
      Gender.values,
      value: (_) => false,
    );

    initialGenders
        .removeWhere((Gender key, bool value) => key == Gender.unknown);

    _formManager.inClientTypes.add(initialClientTypes);
    _formManager.inAgeGroups.add(initialAgeGroups);
    _formManager.inGender.add(initialGenders);
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
                  textAlign: TextAlign.center,
                  style: normalSize14Text(AppColors.greyTextColor),
                ),
              ),
              mediumVerticalSizedBox,
              const SurveysCard(
                title: allClientsString,
                message: tapToSendToAllClientsString,
                buttonKey: mentalHealthSurveyButtonKey,
                buttonText: sendToAllClientsString,
              ),
              mediumVerticalSizedBox,
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
              StreamBuilder<Map<String, bool>>(
                stream: _formManager.ageGroups,
                builder: (
                  BuildContext context,
                  AsyncSnapshot<Map<String, bool>> snapshot,
                ) {
                  final Map<String, bool> ageGroups =
                      snapshot.data ?? <String, bool>{};

                  return GridView(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 1 / .4,
                    ),
                    children: getAgeGroupCheckBoxes(ageGroups),
                  );
                },
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
              mediumVerticalSizedBox,
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

                    return SizedBox(
                      height: 48,
                      child: MyAfyaHubPrimaryButton(
                        buttonKey: sendSurveyButtonKey,
                        text: sendSurveyText,
                        onPressed: hasData && snapshot.data!
                            ? () => _processAndNavigate()
                            : null,
                      ),
                    );
                  },
                ),
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

  List<String> ageGroups = <String>[
    '14 - 16 yrs',
    '16 - 18 yrs',
    '18 - 20 yrs',
    '20 - 22 yrs',
    '22 - 24 yrs'
  ];

  List<Widget> getAgeGroupCheckBoxes(Map<String, bool> ageGroups) {
    final List<Widget> result = <Widget>[];
    final Map<String, bool> ageGroupsCopy = ageGroups;

    ageGroups.forEach((String key, bool value) {
      result.add(
        CheckboxListTile(
          key: ValueKey<String>(key),
          activeColor: AppColors.primaryColor,
          title: Text(
            key,
            style: const TextStyle(color: AppColors.grey50),
          ),
          value: value,
          onChanged: (_) {
            ageGroupsCopy[key] = !value;
            _formManager.inAgeGroups.add(ageGroupsCopy);
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

  void _processAndNavigate() {
    _formManager.submit();

    Navigator.pushNamed(
      context,
      AppRoutes.successfulSurveySubmission,
    );
  }
}
