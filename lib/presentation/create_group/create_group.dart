import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:healthcloud/application/core/theme/app_themes.dart';
import 'package:healthcloud/domain/core/value_objects/app_asset_strings.dart';
import 'package:healthcloud/domain/core/value_objects/app_strings.dart';
import 'package:healthcloud/domain/core/value_objects/app_widget_keys.dart';
import 'package:healthcloud/presentation/core/app_bar/custom_app_bar.dart';
import 'package:shared_themes/spaces.dart';

class CreateGroupPage extends StatefulWidget {
  const CreateGroupPage({Key? key}) : super(key: key);

  @override
  State<CreateGroupPage> createState() => _CreateGroupPageState();
}

class _CreateGroupPageState extends State<CreateGroupPage> {
  final TextEditingController dobTextController = TextEditingController();
  final TextEditingController enrollmentDateTextController =
      TextEditingController();
  RangeValues _currentRangeValues = const RangeValues(15, 25);

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
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const CustomAppBar(
        title: 'Create group',
        showShadow: false,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                SvgPicture.asset(
                  addNewGroupImage,
                  height: 180,
                ),
                const SizedBox(height: 24),
                Row(
                  children: <Widget>[
                    // Age
                    Flexible(
                      child: Column(
                        children: <Widget>[
                          const Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              'Age group',
                              style: TextStyle(
                                fontSize: 14,
                                color: AppColors.greyTextColor,
                              ),
                            ),
                          ),
                          smallVerticalSizedBox,
                          RangeSlider(
                            key: ageRangeSlider,
                            values: _currentRangeValues,
                            min: 15,
                            max: 25,
                            divisions: 10,
                            labels: RangeLabels(
                              _currentRangeValues.start.toString(),
                              _currentRangeValues.end.toString(),
                            ),
                            onChanged: (RangeValues values) {
                              setState(() {
                                _currentRangeValues = values;
                              });
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 24),
                Column(
                  children: <Widget>[
                    const Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        'Genders allowed',
                        style: TextStyle(
                          fontSize: 14,
                          color: AppColors.greyTextColor,
                        ),
                      ),
                    ),
                    smallVerticalSizedBox,
                    CheckboxListTile(
                      title: const Text(maleText),
                      value: true,
                      onChanged: (bool? value) {},
                    ),
                    CheckboxListTile(
                      title: const Text(femaleText),
                      value: true,
                      onChanged: (bool? value) {},
                    ),
                  ],
                ),
                const SizedBox(height: 24),
                Column(
                  children: <Widget>[
                    const Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        inviteOnlyText,
                        style: TextStyle(
                          fontSize: 14,
                          color: AppColors.greyTextColor,
                        ),
                      ),
                    ),
                    CheckboxListTile(
                      key: inviteOnlyKey,
                      title: const Text(inviteOnlyText),
                      value: true,
                      onChanged: (bool? value) {},
                    )
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
                              child: ElevatedButton(
                                key: createGroupBtnKey,
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                  primary: AppColors.secondaryColor,
                                ),
                                child: const Padding(
                                  padding: EdgeInsets.all(16.0),
                                  child: Text(createGroupText),
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
}
