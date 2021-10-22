//Flutter imports
import 'package:flutter/material.dart';

// Package Imports
import 'package:afya_moja_core/community_chat_widgets.dart';
import 'package:bewell_pro_core/application/redux/states/user_state.dart';
import 'package:domain_objects/value_objects.dart';
import 'package:afya_moja_core/domain/core/entities/icon_details.dart';

// Project imports:
import 'package:healthcloud/domain/core/entities/notification/notification_details.dart';
import 'package:healthcloud/domain/core/entities/pin_reset_request.dart';
import 'package:healthcloud/domain/core/entities/user_profile_item_obj.dart';
import 'package:healthcloud/domain/core/value_objects/app_asset_strings.dart';
import 'package:healthcloud/domain/core/value_objects/app_enums.dart';
import 'package:healthcloud/domain/core/value_objects/app_strings.dart';
import 'package:healthcloud/presentation/engagement/home/widgets/patient_search_item.dart';
import 'package:healthcloud/presentation/community/chat_screen/widgets/received_message_item.dart';
import 'package:healthcloud/presentation/router/routes.dart';
import 'package:healthcloud/domain/core/entities/request_item.dart';
import 'package:healthcloud/domain/core/entities/red_flag_item.dart';

final List<UserProfileItemObj> userProfileItems = <UserProfileItemObj>[
  UserProfileItemObj(
    iconAssetPath: mySavedIconSvgPath,
    route: kycIntroPageRoute,
    title: 'Surveys',
  ),
  UserProfileItemObj(
    iconAssetPath: appointmentIconSvgPath,
    route: kycIntroPageRoute,
    title: 'Appointments',
  ),
  UserProfileItemObj(
    iconAssetPath: helpCircleIcon,
    route: kycIntroPageRoute,
    title: 'Help/Contact Admin',
  ),
  UserProfileItemObj(
    iconAssetPath: feedbackIconSvgPath,
    route: kycIntroPageRoute,
    title: 'Resolved Requests',
  ),
  UserProfileItemObj(
    iconAssetPath: faqsIconSvgPath,
    route: kycIntroPageRoute,
    title: 'FAQs',
  ),
  UserProfileItemObj(
    iconAssetPath: settingsIconSvgPath,
    route: kycIntroPageRoute,
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
    route: pinResetRequestsPage,
    title: 'Pin Reset',
    imageAssetPath: pinResetImageSvgPath,
    totalNumber: 5,
  ),
  RequestItem(
    route: redFlagsPage,
    title: 'Red Flags',
    imageAssetPath: redFlagImageSvgPath,
    totalNumber: 3,
  ),
  RequestItem(
    route: profileUpdateRequestsPage,
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
