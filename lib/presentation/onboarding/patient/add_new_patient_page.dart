import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:app_wrapper/app_wrapper.dart';
import 'package:async_redux/async_redux.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:myharehubpro/application/core/services/utils.dart';
import 'package:myharehubpro/application/core/theme/app_themes.dart';
import 'package:myharehubpro/application/redux/actions/flags/app_flags.dart';
import 'package:myharehubpro/application/redux/actions/register_client/register_client_action.dart';
import 'package:myharehubpro/application/redux/states/app_state.dart';
import 'package:myharehubpro/application/redux/view_models/register_client/register_client_view_model.dart';
import 'package:myharehubpro/domain/core/value_objects/app_asset_strings.dart';
import 'package:myharehubpro/domain/core/value_objects/app_enums.dart';
import 'package:myharehubpro/domain/core/value_objects/app_strings.dart';
import 'package:myharehubpro/domain/core/value_objects/app_widget_keys.dart';
import 'package:myharehubpro/presentation/core/app_bar/custom_app_bar.dart';
import 'package:myharehubpro/presentation/onboarding/patient/register_client_form_manager.dart';
import 'package:myharehubpro/presentation/onboarding/patient/widgets/facility_dropdown.dart';
import 'package:myharehubpro/presentation/onboarding/patient/widgets/patient_details_text_form_field.dart';
import 'package:intl/intl.dart';
import 'package:shared_themes/spaces.dart';

class AddNewPatientPage extends StatefulWidget {
  const AddNewPatientPage({Key? key}) : super(key: key);

  @override
  State<AddNewPatientPage> createState() => _AddNewPatientPageState();
}

class _AddNewPatientPageState extends State<AddNewPatientPage> {
  final RegisterClientFormManager _formManager = RegisterClientFormManager();
  final TextEditingController dobTextController = TextEditingController();
  final TextEditingController enrollmentDateTextController =
      TextEditingController();

  final InputDecoration dropdownDecoration = InputDecoration(
    filled: true,
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
    ),
    enabledBorder: const UnderlineInputBorder(
      borderSide: BorderSide(color: Color(0x00eeeeee)),
    ),
  );

  @override
  void initState() {
    super.initState();
    _formManager.inGender.add(Gender.other);
    _formManager.inClientType.add(ClientType.PMTCT);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const CustomAppBar(
        title: addNewPatientTitleText,
        showShadow: false,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: SingleChildScrollView(
            child: Column(
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
                Row(
                  children: <Widget>[
                    Flexible(
                      child: FacilityDropdown(
                        dropdownInputKey: facilitySelectOptionFieldKey,
                        label: preferredFacilityLabel,
                        stream: _formManager.facility,
                        onChanged: (String? value) {
                          if (value != null) {
                            _formManager.inFacility.add(value);
                          }
                        },
                      ),
                    )
                  ],
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
                    const SizedBox(width: 10),
                    Flexible(
                      child: Column(
                        children: <Widget>[
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
                          const SizedBox(height: 10),
                          StreamBuilder<ClientType>(
                            stream: _formManager.clientType,
                            builder: (
                              BuildContext context,
                              AsyncSnapshot<ClientType> snapshot,
                            ) {
                              final ClientType? data = snapshot.data;
                              return SelectOptionField(
                                decoration: dropdownDecoration,
                                dropDownInputKey: clientTypeField,
                                value: data != null
                                    ? describeEnum(data)
                                    : describeEnum(ClientType.PMTCT),
                                options: getClientTypeList(),
                                onChanged: (String? value) {
                                  if (value != null) {
                                    _formManager.inClientType
                                        .add(clientTypeFromJson(value));
                                  }
                                },
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 28),
                Row(
                  children: <Widget>[
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        const Text(
                          appAccessText,
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
                                  onChanged: (bool? value) {
                                    if (value != null) {
                                      _formManager.inInviteClient.add(value);
                                    }
                                  },
                                );
                              },
                            ),
                            const Text(myCareHubInviteText),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 24),
                Row(
                  children: <Widget>[
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        // Submit button
                        Row(
                          children: <Widget>[
                            Container(
                              padding: const EdgeInsets.only(left: 24),
                              width: MediaQuery.of(context).size.width * 0.8,
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
                                      if (vm.wait
                                          .isWaitingFor(registerClientFlag)) {
                                        return const PlatformLoader();
                                      }

                                      return ElevatedButton(
                                        key: patientRegisterBtnKey,
                                        onPressed: hasData && snapshot.data!
                                            ? () => _processAndNavigate(
                                                  vm.hasConnection,
                                                )
                                            : null,
                                        style: ElevatedButton.styleFrom(
                                          primary: AppColors.secondaryColor,
                                        ),
                                        child: const Padding(
                                          padding: EdgeInsets.all(16.0),
                                          child: Text(registerBtnText),
                                        ),
                                      );
                                    },
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  List<String> getClientTypeList() {
    final List<String> result = <String>[];

    for (final ClientType clientType in ClientType.values) {
      if (clientType != ClientType.YOUTH) {
        result.add(describeEnum(clientType));
      }
    }

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
