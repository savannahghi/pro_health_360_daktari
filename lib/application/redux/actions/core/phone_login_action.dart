// Dart imports:
import 'dart:convert';

// Package imports:
import 'package:afya_moja_core/enums.dart';
import 'package:app_wrapper/app_wrapper.dart';
import 'package:async_redux/async_redux.dart';
// Flutter imports:
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_graphql_client/graph_client.dart';
// Project imports:
import 'package:healthcloud/application/core/services/helpers.dart';
import 'package:healthcloud/application/core/services/onboarding.dart';
import 'package:healthcloud/application/core/services/utils.dart';
import 'package:healthcloud/application/redux/actions/core/bottom_nav_action.dart';
import 'package:healthcloud/application/redux/actions/core/update_credentials_action.dart';
import 'package:healthcloud/application/redux/actions/core/update_staff_profile_action.dart';
import 'package:healthcloud/application/redux/actions/core/update_user_action.dart';
import 'package:healthcloud/application/redux/actions/flags/app_flags.dart';
import 'package:healthcloud/application/redux/states/app_state.dart';
import 'package:healthcloud/application/redux/states/misc_state.dart';
import 'package:healthcloud/domain/core/entities/core/auth_credentials.dart';
import 'package:healthcloud/domain/core/entities/core/onboarding_path_config.dart';
import 'package:healthcloud/domain/core/entities/core/processed_response.dart';
import 'package:healthcloud/domain/core/entities/core/user.dart';
import 'package:healthcloud/domain/core/entities/login/phone_login_response.dart';
import 'package:healthcloud/domain/core/value_objects/app_strings.dart';
import 'package:http/http.dart';
import 'package:misc_utilities/misc.dart';

/// [PhoneLoginAction] called when the user try to login using their primary phone
class PhoneLoginAction extends ReduxAction<AppState> {
  PhoneLoginAction({required this.context});

  final BuildContext context;

  @override
  void before() {
    super.before();
    dispatch(WaitAction<AppState>.add(phoneLoginStateFlag));
  }

  @override
  Future<void> after() async {
    dispatch(WaitAction<AppState>.remove(phoneLoginStateFlag));
    super.after();
  }

  @override
  Future<AppState?> reduce() async {
    final IGraphQlClient httpClient = AppWrapperBase.of(context)!.graphQLClient;

    final MiscState? miscState = state.miscState;

    final Map<String, String> variables = <String, String>{
      'phoneNumber': miscState!.phoneNumber!,
      'pin': miscState.pinCode!,
      'flavour': Flavour.pro.name,
    };

    final String phoneLoginEndpoint =
        AppWrapperBase.of(context)!.customContext!.loginByPhoneEndpoint;

    final Response httpResponse = await httpClient.callRESTAPI(
      endpoint: phoneLoginEndpoint,
      method: httpPOST,
      variables: variables,
    );

    final ProcessedResponse processedResponse =
        processResponse(httpResponse, context);

    if (processedResponse.ok) {
      final Map<String, dynamic> responseMap =
          json.decode(processedResponse.response.body) as Map<String, dynamic>;

      final PhoneLoginResponse loginResponse =
          PhoneLoginResponse.fromJson(responseMap);

      final DateTime now = DateTime.now();
      AuthCredentials? authCredentials = loginResponse.credentials?.copyWith(
        signedInTime: now.toIso8601String(),
        isSignedIn: true,
      );

      final String? expiresIn = loginResponse.credentials?.expiresIn;
      if (expiresIn != null && expiresIn.isNotEmpty && isNumeric(expiresIn)) {
        final DateTime tokenExpiryTimestamp =
            now.add(Duration(seconds: int.tryParse(expiresIn) ?? 0));

        authCredentials = authCredentials?.copyWith(
          tokenExpiryTimestamp: tokenExpiryTimestamp.toIso8601String(),
        );
      }

      dispatch(
        UpdateCredentialsAction(
          idToken: authCredentials?.idToken,
          refreshToken: authCredentials?.refreshToken,
          expiresIn: authCredentials?.expiresIn,
          isSignedIn: true,
          signedInTime: authCredentials?.signedInTime,
          tokenExpiryTimestamp: authCredentials?.tokenExpiryTimestamp,
        ),
      );

      final User? user =
          loginResponse.staffState?.user?.copyWith(pinChangeRequired: false);

      dispatch(UpdateUserAction(user: user));

      dispatch(UpdateStaffProfileAction(id: loginResponse.staffState?.id));

      final OnboardingPathConfig path = onboardingPath(state: state);
      dispatch(
        NavigateAction<AppState>.pushNamedAndRemoveAll(
          path.route,
          arguments: path.arguments,
        ),
      );
      dispatch(
        BottomNavAction(currentBottomNavIndex: 0),
      );

      return state;
    } else {
      await captureException(
        errorPhoneLogin,
        error: processedResponse.message,
        response: processedResponse.response.body,
      );
      throw UserException(processedResponse.message);
    }
  }

  @override
  Object? wrapError(dynamic error) {
    if (error.runtimeType == UserException) {
      ScaffoldMessenger.of(context)
          .showSnackBar(snackbar(content: (error as UserException).msg));

      return null;
    }

    return error;
  }
}
