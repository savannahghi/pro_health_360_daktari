import 'dart:async';

import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:async_redux/async_redux.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart'
    as local_notifications;
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:prohealth360_daktari/application/core/theme/app_themes.dart';
import 'package:prohealth360_daktari/application/redux/actions/user_state_actions/logout_action.dart';
import 'package:prohealth360_daktari/application/redux/states/app_state.dart';
import 'package:prohealth360_daktari/domain/core/entities/core/onboarding_path_info.dart';
import 'package:prohealth360_daktari/domain/core/entities/health_diary/mood_item_data.dart';
import 'package:prohealth360_daktari/domain/core/value_objects/app_asset_strings.dart';
import 'package:prohealth360_daktari/domain/core/value_objects/app_enums.dart';
import 'package:prohealth360_daktari/domain/core/value_objects/app_strings.dart';
import 'package:prohealth360_daktari/domain/core/value_objects/app_widget_keys.dart';
import 'package:prohealth360_daktari/presentation/profile/widgets/edit_information_item.dart';
import 'package:prohealth360_daktari/presentation/router/routes.dart';

ClientType clientTypeFromJson(String? clientString) {
  if (clientString == null || clientString.isEmpty || clientString == UNKNOWN) {
    return ClientType.YOUTH;
  }

  return ClientType.values.where((ClientType clientType) {
    return clientType.name.toLowerCase() == clientString.toLowerCase();
  }).first;
}

String dobToJson(DateTime? dateTime) {
  if (dateTime != null) {
    return DateFormat('yyyy-MM-dd').format(DateUtils.dateOnly(dateTime));
  }

  return DateFormat('yyyy-MM-dd').format(DateUtils.dateOnly(DateTime.now()));
}

// converts role sting from 'CLIENT_MANAGEMENT' to 'Client management'
String roleToString(String role) {
  return capitalizeFirst(role.split('_').join(' '));
}

/// checks where user has reached in their onboarding and returns the
/// appropriate route
OnboardingPathInfo getOnboardingPath({required AppState state}) {
  final CurrentOnboardingStage? currentOnboardingStage =
      state.onboardingState?.currentOnboardingStage;

  final bool isSignedIn = state.credentials?.isSignedIn ?? false;
  final bool isPhoneVerified = state.onboardingState?.isPhoneVerified ?? false;
  final bool termsAccepted = state.staffState?.user?.termsAccepted ?? false;
  final bool hasSetSecurityQuestions =
      state.onboardingState?.hasSetSecurityQuestions ?? false;
  final bool hasVerifiedSecurityQuestions =
      state.onboardingState?.hasVerifiedSecurityQuestions ?? false;
  final bool hasSetPin = state.onboardingState?.hasSetPin ?? false;
  final bool hasSetNickName = state.onboardingState?.hasSetNickName ?? false;

  if (currentOnboardingStage == CurrentOnboardingStage.Login) {
    if (!isSignedIn) {
      return OnboardingPathInfo(
        previousRoute: '',
        nextRoute: AppRoutes.loginPage,
      );
    } else if (!isPhoneVerified) {
      return OnboardingPathInfo(
        previousRoute: '',
        nextRoute: AppRoutes.verifyPhonePage,
      );
    } else if (!termsAccepted) {
      return OnboardingPathInfo(
        previousRoute: AppRoutes.verifyPhonePage,
        nextRoute: AppRoutes.termsAndConditions,
      );
    } else if (!hasSetSecurityQuestions) {
      return OnboardingPathInfo(
        previousRoute: AppRoutes.termsAndConditions,
        nextRoute: AppRoutes.securityQuestionsPage,
      );
    } else if (!hasSetPin) {
      return OnboardingPathInfo(
        previousRoute: AppRoutes.securityQuestionsPage,
        nextRoute: AppRoutes.setPinPage,
      );
    } else if (!hasSetNickName) {
      return OnboardingPathInfo(
        previousRoute: AppRoutes.setPinPage,
        nextRoute: AppRoutes.setNicknamePage,
      );
    }

    return OnboardingPathInfo(
      previousRoute: '',
      nextRoute: AppRoutes.homePage,
    );

    /// The PIN expiry workflow
  } else if (currentOnboardingStage == CurrentOnboardingStage.PINExpired ||
      currentOnboardingStage == CurrentOnboardingStage.PINUpdate) {
    // check whether the phone is verified
    if (!isPhoneVerified) {
      return OnboardingPathInfo(
        previousRoute: AppRoutes.pinExpiredPage,
        nextRoute: AppRoutes.verifyPhonePage,
      );
    }

    // check whether the PIN has been changed
    if (!hasSetPin) {
      return OnboardingPathInfo(
        previousRoute: AppRoutes.verifyPhonePage,
        nextRoute: AppRoutes.setPinPage,
      );
    }

    if (currentOnboardingStage == CurrentOnboardingStage.PINUpdate &&
        !hasSetSecurityQuestions) {
      return OnboardingPathInfo(
        previousRoute: AppRoutes.termsAndConditions,
        nextRoute: AppRoutes.securityQuestionsPage,
      );
    }

    // Reset the state and navigate to the login page
    return OnboardingPathInfo(
      nextRoute: AppRoutes.loginPage,
      previousRoute: '',
    );

    // This means it is the [CurrentOnboardingStage.ResetPIN] that is in play
  } else {
    // check whether the phone is verified
    if (!isPhoneVerified) {
      return OnboardingPathInfo(
        previousRoute: '',
        nextRoute: AppRoutes.verifyPhonePage,
      );
    }

    // (optional) set new security questions
    if (!hasVerifiedSecurityQuestions) {
      return OnboardingPathInfo(
        previousRoute: AppRoutes.termsAndConditions,
        nextRoute: AppRoutes.securityQuestionsPage,
      );
    }

    // change the PIN
    // check whether the PIN has been changed
    // check whether the PIN has been changed
    if (!hasSetPin) {
      return OnboardingPathInfo(
        previousRoute: AppRoutes.securityQuestionsPage,
        nextRoute: AppRoutes.setPinPage,
      );
    }

    // Reset the state and navigate to the login page
    return OnboardingPathInfo(
      nextRoute: AppRoutes.loginPage,
      previousRoute: '',
    );
  }
}

Function() logoutUser({required BuildContext context}) {
  return () async {
    StoreProvider.dispatch(context, LogoutAction());
  };
}

String returnCurrentYear() {
  final DateTime now = DateTime.now();
  return DateFormat('y').format(now);
}

String? securityQuestionValidator(String? value) {
  if (value != null && (value.isEmpty || value == UNKNOWN)) {
    return 'A Response is required';
  }
  return null;
}

String formatSecurityQuestionDate(
  dynamic dateValue, {
  String? format = datePickerFormat,
}) {
  late String date;
  if (dateValue.toString().contains(' ')) {
    final String _d = dateValue.toString();
    date = DateFormat.yMMMMd('en_GB')
        .parseLoose(_d.replaceAll(',', ''))
        .toString();
  } else {
    date = dateValue.toString();
  }
  return DateFormat(format).format(DateTime.parse(date));
}

Future<dynamic> feedbackBottomSheet({
  required BuildContext context,
  required String modalContent,
  required String imageAssetPath,
}) async {
  return showModalBottomSheet(
    context: context,
    backgroundColor: Colors.transparent,
    barrierColor: Colors.transparent,
    isScrollControlled: true,
    builder: (BuildContext context) {
      return Container(
        key: feedbackBottomSheetKey,
        padding: MediaQuery.of(context).viewInsets,
        child: Container(
          decoration: BoxDecoration(
            color: whiteColor,
            borderRadius: const BorderRadius.all(Radius.circular(20)),
            boxShadow: <BoxShadow>[
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 2,
                blurRadius: 5,
                offset: const Offset(0, 3), // changes position of shadow
              ),
            ],
          ),
          constraints: const BoxConstraints(
            maxWidth: 420,
          ),
          padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
          margin: const EdgeInsets.all(20),
          child: SingleChildScrollView(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Flexible(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      SvgPicture.asset(
                        imageAssetPath,
                        height: 34.0,
                        width: 34.0,
                      ),
                      mediumHorizontalSizedBox,
                      Flexible(
                        child: Text(
                          modalContent,
                          style: normalSize14Text(),
                        ),
                      ),
                    ],
                  ),
                ),
                smallHorizontalSizedBox,
                Container(
                  margin: const EdgeInsets.only(top: 4),
                  child: GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: const Image(
                      key: feedbackBottomSheetCloseIconKey,
                      image: AssetImage(closeIconUrl),
                      color: Colors.black54,
                      height: 16.0,
                      width: 16.0,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    },
  );
}

String removeTailingComma(String word) {
  final String str = word.trim();
  if (str.endsWith(',') && str.isNotEmpty) {
    return str.replaceAll(',', '');
  } else {
    return str;
  }
}

String capitalizeFirst(String input) {
  return '${input[0].toUpperCase()}${input.substring(1).toLowerCase()}';
}

EditInformationInputItem nickNameInputItem(String userNickName) =>
    EditInformationInputItem(
      fieldName: nickNameFieldName,
      hintText: userNickName,
      inputType: EditInformationInputType.Text,
      inputController: TextEditingController(),
    );

EditInformationItem nickNameEditInfo(String userNickName) =>
    EditInformationItem(
      title: nickNameString,
      editInformationInputItem: <EditInformationInputItem>[
        nickNameInputItem(userNickName)
      ],
    );

final EditInformationItem careGiverEditInfo = EditInformationItem(
  title: myProfileCaregiverText,
  description: myProfileCaregiverDescriptionText,
  editInformationInputItem: <EditInformationInputItem>[
    EditInformationInputItem(
      fieldName: firstName,
      hintText: janeDoe,
      inputType: EditInformationInputType.Text,
      inputController: TextEditingController(),
      apiFieldValue: 'firstName',
    ),
    EditInformationInputItem(
      fieldName: lastName,
      hintText: janeDoe,
      inputType: EditInformationInputType.Text,
      inputController: TextEditingController(),
      apiFieldValue: 'lastName',
    ),
    phoneInputItem,
    relationInputItem,
  ],
);

final EditInformationInputItem phoneInputItem = EditInformationInputItem(
  fieldName: dummyPhoneNumber,
  hintText: hotlineNumberString,
  inputType: EditInformationInputType.Text,
  inputController: TextEditingController(),
  apiFieldValue: 'phoneNumber',
);

final EditInformationInputItem relationInputItem = EditInformationInputItem(
  fieldName: relationText,
  hintText: relationText,
  inputType: EditInformationInputType.DropDown,
  inputController: TextEditingController(),
  dropDownOptionList: CaregiverType.values
      .map<String>((CaregiverType type) => type.name)
      .toList(),
  apiFieldValue: 'caregiverType',
);

MoodItemData getMoodColor(String? mood) {
  if (mood == null) {
    return MoodItemData.initial();
  }

  switch (mood) {
    case veryHappyString:
      return MoodItemData(
        color: AppColors.greenHappyColor,
        svgIconUrl: excitedIconSvgPath,
      );
    case happyString:
      return MoodItemData(
        color: AppColors.greenHappyColor,
        svgIconUrl: happyIconSvgPath,
      );
    case neutralString:
      return MoodItemData(
        color: AppColors.mehMoodColor,
        svgIconUrl: mehIconSvgPath,
      );
    case sadString:
      return MoodItemData(
        color: AppColors.warningColor,
        svgIconUrl: sadIconSvgPath,
      );
    case verySadString:
      return MoodItemData(
        color: AppColors.verySadColor,
        svgIconUrl: verySadIconSvgPath,
      );
    default:
      return MoodItemData.initial();
  }
}

String getServiceRequestName(ServiceRequestType? requestType) {
  switch (requestType) {
    case ServiceRequestType.PIN_RESET:
      return 'PIN Reset';
    case ServiceRequestType.RED_FLAG:
      return 'Red Flag';
    case ServiceRequestType.STAFF_PIN_RESET:
      return 'Staff PIN Reset';
    case ServiceRequestType.SCREENING_TOOLS_RED_FLAG:
      return 'Screening Tool';
    default:
      return UNKNOWN;
  }
}

bool resumeWithPIN(AppState appState) {
  final bool isSignedIn = appState.credentials?.isSignedIn ?? false;

  final String inactiveTime = appState.miscState?.inactiveTime ?? UNKNOWN;
  final DateTime now = DateTime.now();
  final int timeDifference = inactiveTime == UNKNOWN
      ? 0
      : now.difference(DateTime.parse(inactiveTime)).inMinutes;
  final OnboardingPathInfo navConfig = getOnboardingPath(state: appState);
  return isSignedIn &&
      navConfig.nextRoute.compareTo(AppRoutes.homePage) == 0 &&
      timeDifference > 5;
}

NotificationActionInfo getNotificationInfo(NotificationType notificationType) {
  switch (notificationType) {
    case NotificationType.COMMUNITIES:
      return NotificationActionInfo(
        actionTitle: 'View Conversations',
        route: AppRoutes.communityPage,
      );
    case NotificationType.SERVICE_REQUEST:
      return NotificationActionInfo(
        actionTitle: 'View Service requests',
        route: AppRoutes.serviceRequestsPage,
      );
    default:
      return NotificationActionInfo(actionTitle: null, route: null);
  }
}

String? encodeQueryParameters(Map<String, String> params) {
  return params.entries
      .map(
        (MapEntry<String, String> e) =>
            '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}',
      )
      .join('&');
}

void initializeFCMListener(
  local_notifications.FlutterLocalNotificationsPlugin localNotificationsPlugin,
) {
  const local_notifications.AndroidInitializationSettings androidInit =
      local_notifications.AndroidInitializationSettings(
          '@mipmap/ic_launcher',); //for logo
  const local_notifications.IOSInitializationSettings iosInit =
      local_notifications.IOSInitializationSettings();
  const local_notifications.InitializationSettings initSetting =
      local_notifications.InitializationSettings(
    android: androidInit,
    iOS: iosInit,
  );
  localNotificationsPlugin.initialize(initSetting);
  const local_notifications.AndroidNotificationDetails androidDetails =
      local_notifications.AndroidNotificationDetails(
    '1',
    'channelName',
    channelDescription: 'channel Description',
  );
  const local_notifications.IOSNotificationDetails iosDetails =
      local_notifications.IOSNotificationDetails();

  const local_notifications.NotificationDetails generalNotificationDetails =
      local_notifications.NotificationDetails(
          android: androidDetails, iOS: iosDetails,);

  FirebaseMessaging.onMessage.listen((RemoteMessage message) {
    final RemoteNotification? notification = message.notification;
    final AndroidNotification? android = message.notification?.android;
    final AppleNotification? apple = message.notification?.apple;
    if (notification != null && (android != null || apple != null)) {
      localNotificationsPlugin.show(
        notification.hashCode,
        notification.title,
        notification.body,
        generalNotificationDetails,
      );
    }
  });
}
