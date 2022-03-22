import 'dart:async';

import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:app_wrapper/app_wrapper.dart';
import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:mycarehubpro/application/redux/actions/create_pin_action.dart';
import 'package:mycarehubpro/application/redux/actions/onboarding/update_onboarding_state_action.dart';
import 'package:mycarehubpro/application/redux/actions/user_state_actions/logout_action.dart';
import 'package:mycarehubpro/application/redux/states/app_state.dart';
import 'package:mycarehubpro/domain/core/entities/core/onboarding_path_info.dart';
import 'package:mycarehubpro/domain/core/entities/notification/notification_details.dart';
import 'package:mycarehubpro/domain/core/entities/red_flag_item.dart';
import 'package:mycarehubpro/domain/core/entities/user_profile_item_obj.dart';
import 'package:mycarehubpro/domain/core/value_objects/app_asset_strings.dart';
import 'package:mycarehubpro/domain/core/value_objects/app_enums.dart';
import 'package:mycarehubpro/domain/core/value_objects/app_strings.dart';
import 'package:mycarehubpro/domain/core/value_objects/app_widget_keys.dart';
import 'package:mycarehubpro/presentation/client_details/widgets/add_profile_entry_row_item.dart';
import 'package:mycarehubpro/presentation/profile/widgets/edit_information_item.dart';
import 'package:mycarehubpro/presentation/router/routes.dart';
import 'package:shared_themes/spaces.dart';

List<NotificationDetails> notifications = <NotificationDetails>[
  NotificationDetails(
    icon: IconDetails(iconUrlSvgPath: surveyCollectionNotificationIcon),
    description: 'Your Survey is collecting responses',
    date: customDate,
  ),
  NotificationDetails(
    icon: IconDetails(iconUrlSvgPath: teleConsultVideoNotificationIcon),
    description: 'Upcoming teleconsult with Dennis Smith at 2.00pm.',
    date: customDate,
  ),
  NotificationDetails(
    icon: IconDetails(iconUrlSvgPath: teleConsultNotificationIcon),
    description: 'New teleconsult request',
    date: customDate,
  ),
];

final List<RedFlagItem> reFlagItems = <RedFlagItem>[
  RedFlagItem(clientName: 'John', feelingDescription: 'Feeling suicidal'),
  RedFlagItem(clientName: 'Kevin', feelingDescription: 'Feeling depressed'),
  RedFlagItem(clientName: 'John', feelingDescription: 'Feeling Hopeless'),
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
                  textStyle: boldSize14Text(Colors.white),
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

Role roleFromJson(String? roleString) {
  if (roleString == null || roleString.isEmpty || roleString == UNKNOWN) {
    return Role.CONTENT_MANAGEMENT;
  }

  return Role.values.where((Role role) {
    return role.name.toLowerCase() == roleString.toLowerCase();
  }).first;
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
  } else if (currentOnboardingStage == CurrentOnboardingStage.PINExpired) {
    // check whether the phone is verified
    if (!isPhoneVerified) {
      return OnboardingPathInfo(
        previousRoute: '',
        nextRoute: AppRoutes.verifyPhonePage,
      );
    }

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

Future<void> setUserPIN({
  required BuildContext context,
  required String newPIN,
  required String confirmPIN,
  required String flavour,
}) async {
  // this is the Redux Action that store the PINs user enters
  StoreProvider.dispatch(
    context,
    UpdateOnboardingStateAction(pin: newPIN, confirmPIN: confirmPIN),
  );

  // this is the Redux Action that handles set PIN for an existing user
  await StoreProvider.dispatch<AppState>(
    context,
    CreatePINAction(
      client: AppWrapperBase.of(context)!.graphQLClient,
      successCallback: () {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text(pinSuccessString),
            duration: Duration(seconds: 2),
          ),
        );
      },
      // scaffold that handles a mismatch in the just entered PINs by the user
      pinMismatchCallback: () => ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(pinMustMatchString),
          duration: Duration(seconds: 2),
        ),
      ),
    ),
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

// Parses date then converts it to the format 18 May 2021 at 12:00 AM
Widget humanizeDate({
  required TextStyle dateTextStyle,
  required String loadedDate,
  bool showTime = false,
  bool showYear = true,
}) {
  if (loadedDate != UNKNOWN && loadedDate.isNotEmpty) {
    final DateTime parsedDate =
        DateTime.tryParse(loadedDate)?.toLocal() ?? DateTime.now();

    final String postDayTime = DateFormat.jm().format(parsedDate);
    final String postDay = DateFormat.d().format(parsedDate);
    final String postMonth = DateFormat.MMM().format(parsedDate);
    final String postYear = DateFormat.y().format(parsedDate);

    return Row(
      children: <Widget>[
        Text(
          '$postDay $postMonth ${showYear ? postYear : ''}${showTime ? ' at $postDayTime' : ''}',
          style: dateTextStyle,
        ),
      ],
    );
  }

  return const SizedBox();
}
