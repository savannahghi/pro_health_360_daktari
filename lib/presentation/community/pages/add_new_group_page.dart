import 'package:flutter/material.dart';
import 'package:healthcloud/application/core/theme/app_themes.dart';
import 'package:healthcloud/domain/community/entities/add_group_data_config.dart';
import 'package:healthcloud/domain/community/entities/dropdown_item.dart';
import 'package:healthcloud/domain/core/value_objects/app_strings.dart';
import 'package:healthcloud/domain/core/value_objects/app_widget_keys.dart';
import 'package:healthcloud/presentation/community/widgets/add_new_group_app_bar.dart';
import 'package:healthcloud/presentation/community/widgets/group_dropdown_item.dart';

class AddNewGroupPage extends StatefulWidget {
  const AddNewGroupPage({Key? key}) : super(key: key);

  @override
  State<AddNewGroupPage> createState() => _AddNewGroupPageState();
}

class _AddNewGroupPageState extends State<AddNewGroupPage> {
  String? _bandFieldValue = data.band.first.value;
  String? _ageFieldValue = data.age.first.value;
  String? _locationFieldValue = data.location.first.value;
  String? _clinicFieldValue = data.clinic.first.value;
  bool moderationSwitchValue = false;

  @override
  Widget build(BuildContext context) {
    const Color groupMemberMessageColor = Color(0xFFBFBFBF);
    const Color activeModerationTitleColor = Color(0xFF16134A);

    return Scaffold(
      appBar: const AddNewGroupAppBar(),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(24.0),
          color: AppColors.lightGreyBackgroundColor,
          child: Center(
            child: Column(
              children: <Widget>[
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Column(
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Expanded(
                            child: GroupDropdownItem(
                              key: bandDropdownKey,
                              label: bandLabelText,
                              hint: chooseOneHintText,
                              value: _bandFieldValue,
                              items: data.band,
                              onChanged: (String? value) {
                                setState(() {
                                  _bandFieldValue = value;
                                });
                              },
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 12),
                      Row(
                        children: <Widget>[
                          Expanded(
                            child: GroupDropdownItem(
                              key: ageDropdownKey,
                              label: ageLabelText,
                              value: _ageFieldValue,
                              items: data.age,
                              onChanged: (String? value) {
                                setState(() {
                                  _ageFieldValue = value;
                                });
                              },
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 12),
                      Row(
                        children: <Widget>[
                          Expanded(
                            child: GroupDropdownItem(
                              key: locationDropdownKey,
                              label: locationLabelText,
                              value: _locationFieldValue,
                              items: data.location,
                              onChanged: (String? value) {
                                setState(() {
                                  _locationFieldValue = value;
                                });
                              },
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 12),
                      Row(
                        children: <Widget>[
                          Expanded(
                            child: GroupDropdownItem(
                              key: clinicDropdownKey,
                              label: clinicLabelText,
                              value: _clinicFieldValue,
                              items: data.clinic,
                              onChanged: (String? value) {
                                setState(() {
                                  _clinicFieldValue = value;
                                });
                              },
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Column(
                    children: <Widget>[
                      Row(
                        children: const <Widget>[
                          Text(
                            aboutGroupText,
                            style: TextStyle(
                              fontSize: 16,
                              color: AppColors.newGroupLabelColor,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      const TextField(
                        maxLines: 8,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          filled: true,
                          fillColor: AppColors.galleryColor,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          const Text(
                            activeModerationLabelText,
                            style: TextStyle(
                              fontSize: 12,
                              color: activeModerationTitleColor,
                            ),
                          ),
                          Switch(
                            key: moderationActiveSwitchKey,
                            activeColor: AppColors.malachiteColor,
                            value: moderationSwitchValue,
                            onChanged: (bool value) {
                              setState(() {
                                moderationSwitchValue = value;
                              });
                            },
                          ),
                        ],
                      ),
                      const Text(
                        approvalNoteText,
                        style: TextStyle(
                          fontSize: 12,
                          color: groupMemberMessageColor,
                          fontStyle: FontStyle.italic,
                        ),
                      )
                    ],
                  ),
                ),
                const Align(
                  alignment: Alignment.bottomRight,
                  child: CircleAvatar(
                    backgroundColor: AppColors.newGroupLabelColor,
                    radius: 30,
                    child: Icon(
                      Icons.done,
                      color: Colors.white,
                      size: 30,
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

final AddGroupDataConfig data = AddGroupDataConfig(
  band: <DropdownItem>[
    DropdownItem(description: 'All', value: 'All'),
    DropdownItem(description: 'Male', value: 'Male'),
    DropdownItem(description: 'Female', value: 'Female'),
    DropdownItem(description: 'Male + Female', value: 'MF'),
    DropdownItem(description: 'PMTCT', value: 'PMTCT'),
    DropdownItem(description: 'OTZ', value: 'OTZ'),
    DropdownItem(description: 'OTZ Plus', value: 'OTZ+'),
  ],
  age: <DropdownItem>[
    DropdownItem(description: '15-19 yo', value: '15-19'),
    DropdownItem(description: '20-25 yo', value: '20-25'),
    DropdownItem(description: '26-30 yo', value: '26-30'),
  ],
  location: <DropdownItem>[
    DropdownItem(description: 'Ruiru', value: 'Ruiru'),
    DropdownItem(description: 'Kiambu', value: 'Kiambu'),
    DropdownItem(description: 'Nairobi', value: 'Nairobi'),
  ],
  clinic: <DropdownItem>[
    DropdownItem(description: 'Ruiru level iv Hospital', value: '1'),
    DropdownItem(description: 'Kiambu level iv Hospital', value: '2'),
  ],
);
