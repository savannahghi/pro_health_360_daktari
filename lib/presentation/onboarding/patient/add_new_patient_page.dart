import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:healthcloud/application/core/theme/app_themes.dart';
import 'package:healthcloud/domain/core/value_objects/app_asset_strings.dart';
import 'package:healthcloud/domain/core/value_objects/app_strings.dart';
import 'package:healthcloud/domain/core/value_objects/app_widget_keys.dart';
import 'package:healthcloud/presentation/core/app_bar/custom_app_bar.dart';
import 'package:healthcloud/presentation/onboarding/patient/widgets/patient_details_text_form_field.dart';

class AddNewPatientPage extends StatefulWidget {
  const AddNewPatientPage({
    Key? key,
    this.onRegisterPatient,
  }) : super(key: key);

  final void Function()? onRegisterPatient;

  @override
  State<AddNewPatientPage> createState() => _AddNewPatientPageState();
}

class _AddNewPatientPageState extends State<AddNewPatientPage> {
  bool myAfyaHubInvite = false;

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
                  newEntriesImage,
                ),
                const SizedBox(height: 24),
                Row(
                  children: const <Widget>[
                    Flexible(
                      child: PatientDetailsTextFormField(
                        label: CCCNumberLabel,
                      ),
                    ),
                    SizedBox(width: 10),
                    Flexible(
                      child: PatientDetailsTextFormField(
                        label: preferredClinicLabel,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 24),
                Row(
                  children: const <Widget>[
                    Flexible(
                      child: PatientDetailsTextFormField(
                        label: firstNameLabel,
                      ),
                    ),
                    SizedBox(width: 10),
                    Flexible(
                      child: PatientDetailsTextFormField(
                        label: lastNameLabel,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 24),
                Row(
                  children: const <Widget>[
                    Flexible(
                      child: PatientDetailsTextFormField(
                        label: birthDateLabel,
                      ),
                    ),
                    SizedBox(width: 10),
                    Flexible(
                      child: PatientDetailsTextFormField(
                        label: genderLabel,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 24),
                Row(
                  children: const <Widget>[
                    Flexible(
                      child: PatientDetailsTextFormField(
                        label: idNoLabel,
                      ),
                    ),
                    SizedBox(width: 10),
                    Flexible(
                      child: PatientDetailsTextFormField(
                        label: phoneNoLabel,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 24),
                Row(
                  children: const <Widget>[
                    Flexible(
                      child: PatientDetailsTextFormField(
                        label: physicalLocationLabel,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 24),
                Row(
                  children: const <Widget>[
                    Flexible(
                      child: PatientDetailsTextFormField(
                        label: nextOfKinLabel,
                      ),
                    ),
                    SizedBox(width: 10),
                    Flexible(
                      child: PatientDetailsTextFormField(
                        label: relationLabel,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 24),
                Row(
                  children: const <Widget>[
                    Flexible(
                      child: PatientDetailsTextFormField(
                        label: phoneNoLabel,
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
                        const Text(appAccessText),
                        Row(
                          children: <Widget>[
                            Checkbox(
                              key: myAfyaHubInviteKey,
                              value: myAfyaHubInvite,
                              onChanged: (bool? value) {
                                setState(() {
                                  myAfyaHubInvite = !myAfyaHubInvite;
                                });
                              },
                            ),
                            const Text(myAfyaHubInviteText),
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
                        const Text(groupsLabel),
                        ...getGroups(),
                        const SizedBox(height: 24),
                        Row(
                          children: <Widget>[
                            Container(
                              padding: const EdgeInsets.only(left: 24),
                              width: MediaQuery.of(context).size.width * 0.8,
                              child: ElevatedButton(
                                key: patientRegisterBtnKey,
                                onPressed: widget.onRegisterPatient,
                                style: ElevatedButton.styleFrom(
                                  primary: AppColors.secondaryColor,
                                ),
                                child: const Padding(
                                  padding: EdgeInsets.all(16.0),
                                  child: Text(registerBtnText),
                                ),
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

  List<Widget> getGroups() {
    final List<Widget> results = <Widget>[];

    for (int i = 0; i < groups.length; i++) {
      final Group group = groups[i];

      results.add(
        Row(
          children: <Widget>[
            Checkbox(
              key: ValueKey<int>(group.id),
              value: group.isMemberOf,
              onChanged: (bool? value) {
                setState(() {
                  groups[i] = Group(
                    id: group.id,
                    name: group.name,
                    isMemberOf: !group.isMemberOf,
                  );
                });
              },
            ),
            Text(group.name),
          ],
        ),
      );
    }

    return results;
  }
}

final List<Group> groups = <Group>[
  Group(id: 1, name: 'Ruaka Questions Group', isMemberOf: false),
  Group(id: 2, name: 'Ruaka Announcements Group', isMemberOf: false),
  Group(id: 3, name: 'My Afya Guide', isMemberOf: false),
  Group(id: 4, name: 'Ruaka CCC Clinic', isMemberOf: false),
];

class Group {
  final int id;
  final String name;
  final bool isMemberOf;

  Group({
    required this.id,
    required this.name,
    required this.isMemberOf,
  });
}
