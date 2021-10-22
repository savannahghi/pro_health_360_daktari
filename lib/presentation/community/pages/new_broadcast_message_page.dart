import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:healthcloud/application/core/theme/app_themes.dart';
import 'package:healthcloud/domain/community/entities/add_group_data_config.dart';
import 'package:healthcloud/domain/community/entities/dropdown_item.dart';
import 'package:healthcloud/domain/core/value_objects/app_asset_strings.dart';
import 'package:healthcloud/domain/core/value_objects/app_strings.dart';
import 'package:healthcloud/domain/core/value_objects/app_widget_keys.dart';
import 'package:healthcloud/presentation/community/widgets/community_page_app_bar.dart';
import 'package:healthcloud/presentation/community/widgets/group_dropdown_item.dart';

class NewBroadcastMessagePage extends StatefulWidget {
  const NewBroadcastMessagePage({Key? key}) : super(key: key);

  @override
  State<NewBroadcastMessagePage> createState() =>
      _NewBroadcastMessagePageState();
}

class _NewBroadcastMessagePageState extends State<NewBroadcastMessagePage> {
  String? _bandFieldValue = data.band.first.value;
  String? _ageFieldValue = data.age.first.value;
  String? _locationFieldValue = data.location.first.value;
  String? _clinicFieldValue = data.clinic.first.value;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CommunityPageAppBar(
        title: newBroadcastText,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(24.0),
          color: AppColors.lightGreyBackgroundColor,
          child: Center(
            child: Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    SvgPicture.asset(
                      addUserIconPath,
                    ),
                    const SizedBox(width: 10),
                    const Text(broadcastToText),
                  ],
                ),
                const SizedBox(height: 24),
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
                const SizedBox(height: 20),
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
                            broadcastNameText,
                            style: TextStyle(
                              fontSize: 16,
                              color: AppColors.newGroupLabelColor,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      TextField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide.none,
                          ),
                          filled: true,
                          fillColor: AppColors.galleryColor,
                        ),
                        style: const TextStyle(color: AppColors.greyTextColor),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
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
