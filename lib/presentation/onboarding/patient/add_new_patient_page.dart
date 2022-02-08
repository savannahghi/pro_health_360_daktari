// Flutter imports:
import 'package:app_wrapper/app_wrapper.dart';
import 'package:async_redux/async_redux.dart';
import 'package:domain_objects/value_objects.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
// Package imports:
import 'package:flutter_svg/flutter_svg.dart';
import 'package:healthcloud/application/core/services/utils.dart';
// Project imports:
import 'package:healthcloud/application/core/theme/app_themes.dart';
import 'package:healthcloud/application/redux/actions/register_client/register_client_action.dart';
import 'package:healthcloud/domain/core/value_objects/app_asset_strings.dart';
import 'package:healthcloud/domain/core/value_objects/app_enums.dart';
import 'package:healthcloud/domain/core/value_objects/app_strings.dart';
import 'package:healthcloud/domain/core/value_objects/app_widget_keys.dart';
import 'package:healthcloud/presentation/core/app_bar/custom_app_bar.dart';
import 'package:healthcloud/presentation/onboarding/patient/date_picker.dart';
import 'package:healthcloud/presentation/onboarding/patient/widgets/facility_dropdown.dart';
import 'package:healthcloud/presentation/onboarding/patient/register_client_form_manager.dart';
import 'package:healthcloud/presentation/onboarding/patient/widgets/patient_details_text_form_field.dart';
import 'package:healthcloud/presentation/surveys/widgets/selection_option_field.dart';
import 'package:intl/intl.dart';
import 'package:shared_themes/spaces.dart';

class AddNewPatientPage extends StatefulWidget {
  const AddNewPatientPage({Key? key}) : super(key: key);

  @override
  State<AddNewPatientPage> createState() => _AddNewPatientPageState();
}

class _AddNewPatientPageState extends State<AddNewPatientPage> {
  bool myAfyaHubInvite = false;

  final RegisterClientFormManager _formManager = RegisterClientFormManager();
  final TextEditingController dobTextController = TextEditingController();
  final TextEditingController enrollmentDateTextController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: addNewPatientTitleText),
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
                    const SizedBox(width: 10),
                    // Facilities
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
                    ),
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
                              'Gender',
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
                                dropDownInputKey: genderOptionFieldKey,
                                value: data == null
                                    ? capitalizeFirst(
                                        describeEnum(Gender.unknown),
                                      )
                                    : capitalizeFirst(data.name),
                                options: Gender.values
                                    .map<String>(
                                      (Gender gender) =>
                                          capitalizeFirst(describeEnum(gender)),
                                    )
                                    .toList(),
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
                          return PatientDetailsTextFormField(
                            textFieldKey: phoneNumberFieldKey,
                            label: phoneNoLabel,
                            onChanged: (String value) {
                              _formManager.inPhoneNumber.add(value);
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

                // Enrollment date
                Row(
                  children: <Widget>[
                    Flexible(
                      child: Column(
                        children: <Widget>[
                          const Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              'Enrollment Date',
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
                              'Client Type',
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
                                dropDownInputKey: clientTypeField,
                                value: data != null
                                    ? describeEnum(data)
                                    : describeEnum(ClientType.YOUTH),
                                options: ClientType.values
                                    .map(
                                      (ClientType clientType) =>
                                          describeEnum(clientType),
                                    )
                                    .toList(),
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
                // TODO: Not yet implemented
                // Row(
                //   children: <Widget>[
                //     Column(
                //       crossAxisAlignment: CrossAxisAlignment.start,
                //       children: <Widget>[
                //         const Text(appAccessText),
                //         Row(
                //           children: <Widget>[
                //             Checkbox(
                //               key: myAfyaHubInviteKey,
                //               value: myAfyaHubInvite,
                //               onChanged: (bool? value) {
                //                 setState(() {
                //                   myAfyaHubInvite = !myAfyaHubInvite;
                //                 });
                //               },
                //             ),
                //             const Text(myCareHubInviteText),
                //           ],
                //         ),
                //       ],
                //     ),
                //   ],
                // ),
                // const SizedBox(height: 24),
                Row(
                  children: <Widget>[
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        // TODO: not yet implemented

                        // const Text(groupsLabel),
                        // ...getGroups(),
                        // const SizedBox(height: 24),

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

                                  return ElevatedButton(
                                    key: patientRegisterBtnKey,
                                    onPressed: hasData && snapshot.data!
                                        ? () => _processAndNavigate()
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

  void _processAndNavigate() {
    StoreProvider.dispatch(
      context,
      RegisterClientAction(
        registerClientPayload: _formManager.submit(),
        client: AppWrapperBase.of(context)!.graphQLClient,
        onSuccess: () {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Successfully registered client'),
              duration: Duration(seconds: 5),
            ),
          );

          Navigator.of(context).pop();
        },
      ),
    );
  }
}
