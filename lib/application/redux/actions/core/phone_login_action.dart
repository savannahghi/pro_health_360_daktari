import 'dart:convert';

import 'package:afya_moja_core/enums.dart';
import 'package:app_wrapper/app_wrapper.dart';
import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_graphql_client/graph_client.dart';
import 'package:healthcloud/application/core/services/helpers.dart';
import 'package:healthcloud/application/core/services/onboarding.dart';
import 'package:healthcloud/application/core/services/utils.dart';
import 'package:healthcloud/application/redux/actions/core/auth_status_action.dart';
import 'package:healthcloud/application/redux/actions/core/bottom_nav_action.dart';
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
import 'package:healthcloud/domain/core/value_objects/app_enums.dart';
import 'package:healthcloud/domain/core/value_objects/app_strings.dart';
import 'package:http/http.dart' as http;
import 'package:misc_utilities/misc.dart';

/// [PhoneLoginAction] called when the user try to login using their primary phone
class PhoneLoginAction extends ReduxAction<AppState> {
  PhoneLoginAction({required this.context});

  final BuildContext context;

  @override
  Future<void> after() async {
    super.after();
    dispatch(WaitAction<AppState>.remove(phoneLoginStateFlag));
  }

  @override
  void before() {
    super.before();
    dispatch(WaitAction<AppState>.add(phoneLoginStateFlag));
  }

  @override
  Future<AppState?> reduce() async {
    final IGraphQlClient client = AppWrapperBase.of(context)!.graphQLClient;

    final MiscState? miscState = state.miscState;

    final Map<String, String> credentials = <String, String>{
      'phoneNumber': miscState!.phoneNumber!,
      'pin': miscState.pinCode!,
      'flavour': Flavour.pro.name,
    };

    final String phoneLoginEndpoint =
        AppWrapperBase.of(context)!.customContext?.loginByPhoneEndpoint ??
            EndpointContext.loginByPhoneEndpoint(
              AppWrapperBase.of(this.context)!.appContexts,
            );

    final ProcessedResponse processedResponse = processResponse(
      await SimpleCall.callRestAPI(
        endpoint: phoneLoginEndpoint,
        method: AppRequestTypes.POST.name,
        variables: credentials,
        graphClient: client,
        raw: true,
      ) as http.Response,
      context,
    );

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
        AuthStatusAction(
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
