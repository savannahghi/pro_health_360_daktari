import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:app_wrapper/app_wrapper.dart';
import 'package:async_redux/async_redux.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:prohealth360_daktari/application/core/services/utils.dart';
import 'package:prohealth360_daktari/application/core/theme/app_themes.dart';
import 'package:prohealth360_daktari/application/redux/actions/flags/app_flags.dart';
import 'package:prohealth360_daktari/application/redux/actions/register_client/register_client_action.dart';
import 'package:prohealth360_daktari/application/redux/states/app_state.dart';
import 'package:prohealth360_daktari/application/redux/view_models/register_client/register_client_view_model.dart';
import 'package:prohealth360_daktari/domain/core/value_objects/app_asset_strings.dart';
import 'package:prohealth360_daktari/domain/core/value_objects/app_enums.dart';
import 'package:prohealth360_daktari/domain/core/value_objects/app_strings.dart';
import 'package:prohealth360_daktari/domain/core/value_objects/app_widget_keys.dart';
import 'package:prohealth360_daktari/presentation/core/app_bar/custom_app_bar.dart';
import 'package:prohealth360_daktari/presentation/onboarding/core/widgets/search_facility_field.dart';
import 'package:prohealth360_daktari/presentation/onboarding/patient/register_client_form_manager.dart';
import 'package:prohealth360_daktari/presentation/onboarding/patient/widgets/patient_details_text_form_field.dart';

class RegisterClientPage extends StatefulWidget {
  const RegisterClientPage({Key? key}) : super(key: key);

  @override
  State<RegisterClientPage> createState() => _RegisterClientPageState();
}

class _RegisterClientPageState extends State<RegisterClientPage> {
  final RegisterClientFormManager _formManager = RegisterClientFormManager();
  final TextEditingController dobTextController = TextEditingController();
  final TextEditingController enrollmentDateTextController =
      TextEditingController();

  final InputDecoration dropdownDecoration = InputDecoration(
    filled: true,
    border: UnderlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: BorderSide.none,
    ),
  );

  @override
  void initState() {
    super.initState();
    _formManager.inGender.add(Gender.other);

    final Map<ClientType, bool> initialClientTypes =
        Map<ClientType, bool>.fromIterable(
      ClientType.values,
      value: (_) => false,
    );
    _formManager.inClientTypes.add(initialClientTypes);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const CustomAppBar(
        title: addNewClientTitleText,
        showShadow: false,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                SvgPicture.asset(
                  addNewUserIconSvg,
                  height: 180,
                ),
                const SizedBox(height: 24),
                Row(
                  children: <Widget>[
                    // CCC number
                    Flexible(
                      child: StreamBuilder<String>(
                        stream: _formManager.cccNumber,
                        builder: (
                          BuildContext context,
                          AsyncSnapshot<String> snapshot,
                        ) {
                          return PatientDetailsTextFormField(
                            textFieldKey: cccFieldKey,
                            hintText: cccNumberHint,
                            keyboardType: TextInputType.number,
                            inputFormatters: <TextInputFormatter>[
                              FilteringTextInputFormatter.digitsOnly,
                              LengthLimitingTextInputFormatter(10),
                            ],
                            label: CCCNumberLabel,
                            onChanged: (String value) {
                              _formManager.inCccNumber.add(value);
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
                const SizedBox(height: 24),
                // Facilities
                Flexible(
                  child: SearchFacilityField(
                    onChanged: (String facilityName) =>
                        _formManager.inFacility.add(facilityName),
                    onFieldCleared: () => _formManager.inFacility.add(''),
                  ),
                ),
                const SizedBox(height: 24),
                Row(
                  children: <Widget>[
                    // First name
                    Flexible(
                      child: StreamBuilder<String>(
                        stream: _formManager.firstName,
                        builder: (
                          BuildContext context,
                          AsyncSnapshot<String> snapshot,
                        ) {
                          return PatientDetailsTextFormField(
                            textFieldKey: firstNameKey,
                            label: firstNameLabel,
                            onChanged: (String value) {
                              _formManager.inFirstName.add(value);
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
                    const SizedBox(width: 10),
                    // Last name
                    Flexible(
                      child: StreamBuilder<String>(
                        stream: _formManager.lastName,
                        builder: (
                          BuildContext context,
                          AsyncSnapshot<String> snapshot,
                        ) {
                          return PatientDetailsTextFormField(
                            textFieldKey: lastNameKey,
                            label: lastNameLabel,
                            onChanged: (String value) {
                              _formManager.inLastName.add(value);
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
                const SizedBox(height: 24),
                Row(
                  children: <Widget>[
                    // Birth date
                    Flexible(
                      child: Column(
                        children: <Widget>[
                          const Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              birthDateLabel,
                              style: TextStyle(
                                fontSize: 14,
                                color: AppColors.greyTextColor,
                              ),
                            ),
                          ),
                          smallVerticalSizedBox,
                          DatePickerField(
                            allowCurrentYear: true,
                            gestureDateKey: dobKey,
                            controller: dobTextController,
                            decoration: InputDecoration(
                              suffixIcon: const Icon(Icons.date_range),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide: BorderSide.none,
                              ),
                              filled: true,
                              contentPadding: const EdgeInsets.all(8.0),
                            ),
                            style:
                                const TextStyle(color: AppColors.greyTextColor),
                            onChanged: (String? value) {
                              if (value != null) {
                                final DateTime date =
                                    DateFormat(datePickerFormat)
                                        .parseLoose(value);
                                _formManager.inDateOfBirth.add(date);
                              }
                            },
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 10),

                    // Gender dropdown

                    Flexible(
                      child: Column(
                        children: <Widget>[
                          const Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              genderLabel,
                              style: TextStyle(
                                fontSize: 14,
                                color: AppColors.greyTextColor,
                              ),
                            ),
                          ),
                          smallVerticalSizedBox,
                          StreamBuilder<Gender>(
                            stream: _formManager.gender,
                            builder: (
                              BuildContext context,
                              AsyncSnapshot<Gender> snapshot,
                            ) {
                              final Gender? data = snapshot.data;

                              return SelectOptionField(
                                decoration: dropdownDecoration,
                                dropDownInputKey: genderOptionFieldKey,
                                value: data == null
                                    ? capitalizeFirst(
                                        describeEnum(Gender.other),
                                      )
                                    : capitalizeFirst(data.name),
                                options: getGenderList(),
                                onChanged: (String? value) {
                                  if (value != null) {
                                    _formManager.inGender
                                        .add(genderFromJson(value));
                                  }
                                },
                              );
                            },
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 24),

                // Phone number
                Row(
                  children: <Widget>[
                    Flexible(
                      child: StreamBuilder<String>(
                        stream: _formManager.phoneNumber,
                        builder: (
                          BuildContext context,
                          AsyncSnapshot<String> snapshot,
                        ) {
                          return MyAfyaHubPhoneInput(
                            textFormFieldKey: patientNumberField,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide: BorderSide.none,
                              ),
                              filled: true,
                              contentPadding: const EdgeInsets.all(8.0),
                            ),
                            style:
                                const TextStyle(color: AppColors.greyTextColor),
                            onChanged: (String? value) {
                              if (value != null) {
                                _formManager.inPhoneNumber.add(value);
                              }
                            },
                            phoneNumberFormatter: formatPhoneNumber,
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                          );
                        },
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 24),

                // Enrollment date
                Row(
                  children: <Widget>[
                    Flexible(
                      child: Column(
                        children: <Widget>[
                          const Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              enrollmentDateLabel,
                              style: TextStyle(
                                fontSize: 14,
                                color: AppColors.greyTextColor,
                              ),
                            ),
                          ),
                          smallVerticalSizedBox,
                          DatePickerField(
                            allowCurrentYear: true,
                            gestureDateKey: enrollmentFieldKey,
                            controller: enrollmentDateTextController,
                            decoration: InputDecoration(
                              suffixIcon: const Icon(Icons.date_range),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide: BorderSide.none,
                              ),
                              filled: true,
                              contentPadding: const EdgeInsets.all(8.0),
                            ),
                            style:
                                const TextStyle(color: AppColors.greyTextColor),
                            onChanged: (String? value) {
                              if (value != null) {
                                final DateTime date =
                                    DateFormat(datePickerFormat)
                                        .parseLoose(value);
                                _formManager.inEnrollmentDate.add(date);
                              }
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 24),
                const Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    clientTypeLabel,
                    style: TextStyle(
                      fontSize: 14,
                      color: AppColors.greyTextColor,
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
                      children: getCheckBoxes(clientTypes),
                    );
                  },
                ),
                const SizedBox(height: 28),
                Row(
                  children: <Widget>[
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        const Text(
                          appInviteText,
                          style: TextStyle(
                            fontSize: 14,
                            color: AppColors.greyTextColor,
                          ),
                        ),
                        Row(
                          children: <Widget>[
                            StreamBuilder<bool>(
                              stream: _formManager.inviteClient,
                              builder: (
                                BuildContext context,
                                AsyncSnapshot<bool> snapshot,
                              ) {
                                final bool? data = snapshot.data;

                                return Checkbox(
                                  key: myAfyaHubInviteKey,
                                  value: data ?? false,
                                  fillColor: MaterialStateProperty.all<Color>(
                                    AppColors.primaryColor,
                                  ),
                                  onChanged: (bool? value) {
                                    if (value != null) {
                                      _formManager.inInviteClient.add(value);
                                    }
                                  },
                                );
                              },
                            ),
                            const Text(appInviteText),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 24),
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
                              if (vm.wait.isWaitingFor(registerClientFlag)) {
                                return const PlatformLoader();
                              }

                              return SizedBox(
                                height: 48,
                                child: ElevatedButton(
                                  key: patientRegisterBtnKey,
                                  onPressed: hasData && snapshot.data!
                                      ? () => _processAndNavigate(
                                            vm.hasConnection,
                                          )
                                      : null,
                                  child: const Text(registerBtnText),
                                ),
                              );
                            },
                          );
                        },
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  List<Widget> getCheckBoxes(Map<ClientType, bool> clientTypes) {
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

  List<String> getGenderList() {
    final List<String> result = <String>[];

    for (final Gender gender in Gender.values) {
      if (gender != Gender.unknown) {
        result.add(capitalizeFirst(describeEnum(gender)));
      }
    }

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

    StoreProvider.dispatch(
      context,
      RegisterClientAction(
        registerClientPayload: _formManager.submit(),
        client: AppWrapperBase.of(context)!.graphQLClient,
        onSuccess: () {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text(registerClientSuccess),
              duration: Duration(seconds: 5),
            ),
          );

          Navigator.of(context).pop();
        },
      ),
    );
  }
}
