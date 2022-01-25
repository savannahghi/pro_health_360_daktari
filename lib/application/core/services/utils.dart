//Flutter imports
import 'package:afya_moja_core/buttons.dart';
// Package Imports
import 'package:afya_moja_core/community_chat_widgets.dart';
import 'package:afya_moja_core/domain/core/entities/icon_details.dart';
import 'package:domain_objects/value_objects.dart';
import 'package:flutter/material.dart';
import 'package:healthcloud/application/redux/states/user_state.dart';
// Project imports:
import 'package:healthcloud/domain/core/entities/notification/notification_details.dart';
import 'package:healthcloud/domain/core/entities/pin_reset_request.dart';
import 'package:healthcloud/domain/core/entities/red_flag_item.dart';
import 'package:healthcloud/domain/core/entities/request_item.dart';
import 'package:healthcloud/domain/core/entities/user_profile_item_obj.dart';
import 'package:healthcloud/domain/core/value_objects/app_asset_strings.dart';
import 'package:healthcloud/domain/core/value_objects/app_enums.dart';
import 'package:healthcloud/domain/core/value_objects/app_strings.dart';
import 'package:healthcloud/domain/core/value_objects/app_widget_keys.dart';
import 'package:healthcloud/presentation/client_details/widgets/add_profile_entry_row_item.dart';
import 'package:healthcloud/presentation/community/chat_screen/widgets/received_message_item.dart';
import 'package:healthcloud/presentation/engagement/home/widgets/patient_search_item.dart';
import 'package:healthcloud/presentation/router/routes.dart';
import 'package:shared_themes/spaces.dart';
import 'package:shared_themes/text_themes.dart';

final List<UserProfileItemObj> userProfileItems = <UserProfileItemObj>[
  UserProfileItemObj(
    iconAssetPath: mySavedIconSvgPath,
    route: AppRoutes.surveysPage,
    title: 'Surveys',
  ),
  UserProfileItemObj(
    iconAssetPath: appointmentIconSvgPath,
    route: AppRoutes.surveysPage,
    title: 'Appointments',
  ),
  UserProfileItemObj(
    iconAssetPath: helpCircleIcon,
    route: AppRoutes.surveysPage,
    title: 'Help/Contact Admin',
  ),
  UserProfileItemObj(
    iconAssetPath: feedbackIconSvgPath,
    route: AppRoutes.surveysPage,
    title: 'Resolved Requests',
  ),
  UserProfileItemObj(
    iconAssetPath: faqsIconSvgPath,
    route: AppRoutes.surveysPage,
    title: 'FAQs',
  ),
  UserProfileItemObj(
    iconAssetPath: settingsIconSvgPath,
    route: AppRoutes.surveysPage,
    title: 'Settings',
  ),
];

String getDisplayName(UserState state) {
  final String firstName =
      state.userProfile?.userBioData?.firstName?.getValue() ?? UNKNOWN;
  final String formattedFirstName = firstName.replaceAll(' ', '');

  final String lastName =
      state.userProfile?.userBioData?.lastName?.getValue() ?? UNKNOWN;
  final String formattedLastName = lastName.replaceAll(' ', '');

  return '$formattedFirstName $formattedLastName';
}

Alignment placeMessage(dynamic message) {
  /// [placeMessage] is used to align the messages whether to the left or right
  /// depending on whether is is a sent or received message
  if (message is TimeClassificationWidget) {
    return Alignment.topCenter;
  } else if (message is ReceivedMessageItem) {
    return Alignment.topLeft;
  }
  return Alignment.topRight;
}

final List<RequestItem> serviceRequestItems = <RequestItem>[
  RequestItem(
    route: AppRoutes.pinResetRequestsPage,
    title: 'Pin Reset',
    imageAssetPath: pinResetImageSvgPath,
    totalNumber: 5,
  ),
  RequestItem(
    route: AppRoutes.redFlagsPage,
    title: 'Red Flags',
    imageAssetPath: redFlagImageSvgPath,
    totalNumber: 3,
  ),
  RequestItem(
    route: AppRoutes.profileUpdateRequestsPage,
    title: 'Profile Update',
    imageAssetPath: profileUpdateImageSvgPath,
    totalNumber: 4,
  ),
];

String? userPinValidator(dynamic val) {
  final String value = val as String;
  if (value.isEmpty) {
    return 'A PIN is required';
  }
  if (!RegExp(r'^-?[0-9]+$').hasMatch(value)) {
    return 'Only digits are allowed, 0-9';
  }
  if (value.length < 4) {
    return 'Enter a four digit PIN';
  }
  return null;
}

bool confirmPinValidator(String pin, String confirmPin) {
  if (pin != confirmPin) {
    return false;
  }
  return true;
}

List<NotificationDetails> notifications = <NotificationDetails>[
  NotificationDetails(
    icon: IconDetails(iconUrlSvgPath: surveyCollectionNotificationIcon),
    description: 'Your Survey is collecting responses',
    date: customDate,
  ),
  NotificationDetails(
    icon: IconDetails(iconUrlSvgPath: teleConsultVideoNotificationIcon),
    description: 'Upcoming tele-consult with Dennis Kilonzo at 2.00pm.',
    date: customDate,
  ),
  NotificationDetails(
    icon: IconDetails(iconUrlSvgPath: teleConsultNotificationIcon),
    description: 'New tele-consult request',
    date: customDate,
  ),
];

final List<PINResetRequest> pinResetRequests = <PINResetRequest>[
  PINResetRequest(
    clientName: 'James Doe Kinyanjui',
    phoneNumber: '0712345678',
  ),
  PINResetRequest(
    clientName: 'James Doe Kinyanjui',
    phoneNumber: '0712345678',
  ),
  PINResetRequest(
    clientName: 'James Doe Kinyanjui',
    phoneNumber: '0712345678',
  ),
  PINResetRequest(
    clientName: 'James Doe Kinyanjui',
    phoneNumber: '0712345678',
  ),
  PINResetRequest(
    clientName: 'James Doe Kinyanjui',
    phoneNumber: '0712345678',
  ),
  PINResetRequest(
    clientName: 'James Doe Kinyanjui',
    phoneNumber: '0712345678',
  ),
];

final List<RedFlagItem> reFlagItems = <RedFlagItem>[
  RedFlagItem(clientName: 'John', feelingDescription: 'Feeling suicidal'),
  RedFlagItem(clientName: 'Kevin', feelingDescription: 'Feeling depressed'),
  RedFlagItem(clientName: 'John', feelingDescription: 'Feeling Hopeless'),
];

const List<Widget> patientSearchResults = <Widget>[
  PatientSearchItem(username: 'Dennis Kilonzo Musau', cccNumber: '12345678'),
  PatientSearchItem(username: 'Dennis Kplangas Koech', cccNumber: '12345678'),
  PatientSearchItem(username: 'Dennis Kigongo Kairo', cccNumber: '12345678'),
  PatientSearchItem(username: 'Dennis Lailonte Koros', cccNumber: '12345678'),
  PatientSearchItem(username: 'Dennis Kilonzo Musau', cccNumber: '12345678'),
  PatientSearchItem(username: 'Dennis Kplangas Koech', cccNumber: '12345678'),
  PatientSearchItem(username: 'Dennis Kigongo Kairo', cccNumber: '12345678'),
  PatientSearchItem(username: 'Dennis Lailonte Koros', cccNumber: '12345678'),
];

List<String> communityChatScreenMenuOptions = <String>[
  'Group Info',
  'Group Media',
  'Search',
  'Exit Group'
];

const List<Widget> messages = <Widget>[
  TimeClassificationWidget(time: 'Today'),
  Align(
    alignment: Alignment.topLeft,
    child: ReceivedMessageItem(
      senderName: 'Wanjiku',
      message: 'Am I at risk if my VL is 600/ml',
      time: '12:00pm',
      status: ChatStatus.Accept,
    ),
  ),
  ReceivedMessageItem(
    senderName: 'Wanjiku',
    message: 'Even after adhering to my regimen ?',
    status: ChatStatus.Accept,
    time: '12:00pm',
  ),
  SentMessageItem(
    message: 'That is a very good question Wanjiku',
    time: '12:00pm',
  ),
  SentMessageItem(
    message: 'There is no cause for alarm',
    time: '12:00pm',
  ),
  SentMessageItem(
    message: 'It may take some time for suppression ...',
    time: '12:00pm',
    highlightedMessage: QuotedMessageWidget(
      senderName: 'Wanjiku',
      message: 'Even after adhering to my regimen ?',
    ),
  ),
  ReceivedMessageItem(
    senderName: 'Wanjiku',
    message: 'Phewks!.... Good to know. Ahsante',
    time: '12:00pm',
    status: ChatStatus.Unknown,
    quotedMessageWidget: QuotedMessageWidget(
      senderName: 'Doctor',
      message: 'It may take some time for suppression ...',
    ),
  ),
  ReceivedMessageItem(
    senderName: 'Wanjiku',
    message: 'Phewks!.... Good to know. Ahsante',
    time: '12:00pm',
    status: ChatStatus.Accept,
    quotedMessageWidget: QuotedMessageWidget(
      senderName: 'Doctor',
      message: 'It may take some time for suppression ...',
    ),
  ),
];

final List<UserProfileItemObj> clientProfileItems = <UserProfileItemObj>[
  UserProfileItemObj(
    iconAssetPath: clientProfileIcon,
    route: AppRoutes.surveysPage,
    title: 'Relations',
  ),
  UserProfileItemObj(
    iconAssetPath: teleConsultNotificationIcon,
    route: AppRoutes.surveysPage,
    title: 'Medical data',
  ),
  UserProfileItemObj(
    iconAssetPath: clinicIcon,
    route: AppRoutes.surveysPage,
    title: 'Clinic information',
  ),
];

Future<void> addNewProfileEntryBottomSheet(BuildContext context) {
  return showModalBottomSheet<void>(
    backgroundColor: Colors.transparent,
    context: context,
    builder: (BuildContext context) {
      return Container(
        height: 340,
        margin: const EdgeInsets.symmetric(
          horizontal: 10.0,
        ),
        padding: const EdgeInsets.all(
          20.0,
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(2.0),
        ),
        child: Stack(
          children: <Widget>[
            Column(
              children: <Widget>[
                const AddProfileEntryRowItem(
                  leadingText: 'Weight',
                  trailingText: 'BMI',
                ),
                smallVerticalSizedBox,
                const AddProfileEntryRowItem(
                  leadingText: 'VL',
                  trailingText: 'CD4',
                ),
                smallVerticalSizedBox,
                const AddProfileEntryRowItem(
                  leadingText: 'Regimen Type',
                  trailingText: 'Regimen',
                ),
                smallVerticalSizedBox,
                const AddProfileEntryRowItem(
                  leadingText: 'TPT Status',
                  trailingText: 'Next Appointment',
                ),
              ],
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: SizedBox(
                height: 50,
                width: MediaQuery.of(context).size.width,
                child: MyAfyaHubPrimaryButton(
                  buttonKey: addButtonKey,
                  onPressed: () => Navigator.of(context).pop(),
                  buttonColor: Theme.of(context).colorScheme.secondary,
                  text: 'Add',
                  textStyle: TextThemes.boldSize14Text(Colors.white),
                ),
              ),
            )
          ],
        ),
      );
    },
  );
}

Gender genderFromJson(String? genderString) {
  if (genderString == null || genderString.isEmpty || genderString == UNKNOWN) {
    return Gender.unknown;
  }
  return Gender.values.where((Gender gender) {
    return gender.name.toLowerCase() == genderString.toLowerCase();
  }).first;
}

String genderToJson(Gender? gender) {
  return gender?.name ?? Gender.unknown.name;
}

bool isNumeric(String? s) {
  if (s == null) {
    return false;
  }
  return int.tryParse(s) != null;
}
