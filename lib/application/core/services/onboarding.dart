// Dart imports:
import 'dart:convert';

// Package imports:
import 'package:async_redux/async_redux.dart';
// Flutter imports:
import 'package:flutter/material.dart';
// Project imports:
import 'package:healthcloud/application/redux/actions/core/batch_update_misc_state_action.dart';
import 'package:healthcloud/application/redux/actions/update_onboarding_state.dart';
import 'package:healthcloud/application/redux/states/app_state.dart';
import 'package:healthcloud/domain/core/entities/core/onboarding_path_config.dart';
import 'package:healthcloud/domain/core/entities/core/processed_response.dart';
import 'package:healthcloud/domain/core/value_objects/app_strings.dart';
import 'package:healthcloud/presentation/router/routes.dart';
import 'package:http/http.dart' as http;
import 'package:misc_utilities/misc.dart';
import 'package:shared_themes/constants.dart';

/// Processes all non-authenticated HTTP api calls made in the app
ProcessedResponse processResponse(
  http.Response response,
  BuildContext context,
) {
  if (<int>[200, 201, 202].contains(response.statusCode)) {
    return ProcessedResponse(ok: true, response: response, message: '');
  }

  final Map<String, dynamic> body =
      json.decode(response.body) as Map<String, dynamic>;

  final int code = unMarshallErrorResponse(body);

  if (response.statusCode == 400) {
    if (code == 4) {
      toggleUserExists(value: true, context: context);
    }
    if (code == 7 || code == 10) {
      StoreProvider.dispatch<AppState>(
        context,
        UpdateOnboardingStateAction(unKnownPhoneNo: true),
      );

      ScaffoldMessenger.of(context).showSnackBar(snackbar(content: noAccount));
    }
    if (code == 8) {
      StoreProvider.dispatch<AppState>(
        context,
        UpdateOnboardingStateAction(invalidCredentials: true),
      );
    }
    return ProcessedResponse(
      ok: false,
      response: response,
      message: getUserFriendlyMsg(code),
    );
  }

  if (response.statusCode == 500) {
    return ProcessedResponse(
      ok: false,
      response: response,
      message: getUserFriendlyMsg(code),
    );
  }
  if (response.statusCode == 408) {
    return ProcessedResponse(
      ok: false,
      response: response,
      message: getUserFriendlyMsg(0),
    );
  }

  return ProcessedResponse(
    ok: false,
    response: response,
    message: UserFeedBackTexts.getErrorMessage(),
  );
}

/// Does a check on user profile on whether logged in user has bio data and partnerType and
/// redirects accordingly
OnboardingPathConfig onboardingPath({required AppState state}) {
  return OnboardingPathConfig(AppRoutes.homePage);
}

/// Extracts the code from the body of the response
int unMarshallErrorResponse(Map<String, dynamic>? body) {
  if (body != null && body.containsKey('code')) {
    final String code = body['code']?.toString() ?? '';
    return int.tryParse(code) ?? 11;
  } else {
    return 11;
  }
}

void toggleUserExists({required BuildContext context, required bool value}) {
  StoreProvider.dispatch<AppState>(
    context,
    BatchUpdateMiscStateAction(accountExists: value),
  );
}

/// returns a user friendly message based on the [code].
///
/// PARAMS
///
/// [code] - an int representing the code from the response body
///
/// This is used
String getUserFriendlyMsg(int code) {
  switch (code) {
    case 0:
      return checkConnectionText;

    case 4:
      return userPhoneExistsText;

    case 5:
      return userEmailExistsText;

    case 6:
      return usernameExistsText;

    case 7:
    case 10:
      return noUserFoundText;

    case 8:
      return wrongCredentialsText;

    case 9:
      return noPINFoundText;

    case 2:
    case 3:
    case 11:
    default:
      return contactSupport(kBewellSupportPhoneNumber);
  }
}
