import 'dart:convert';

import 'package:app_wrapper/app_wrapper.dart';
import 'package:async_redux/async_redux.dart';
import 'package:domain_objects/entities.dart';
import 'package:domain_objects/value_objects.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_graphql_client/graph_client.dart';
import 'package:healthcloud/application/core/services/helpers.dart';
import 'package:healthcloud/application/core/services/onboarding.dart';
import 'package:healthcloud/application/redux/actions/core/batch_update_misc_state_action.dart';
import 'package:healthcloud/application/redux/actions/core/batch_update_user_state_action.dart'
    as local_actions;
import 'package:healthcloud/application/redux/actions/core/bottom_nav_action.dart';
import 'package:healthcloud/application/redux/actions/flags/app_flags.dart';
import 'package:healthcloud/application/redux/states/app_state.dart';
import 'package:healthcloud/domain/core/entities/core/onboarding_path_config.dart';
import 'package:healthcloud/domain/core/entities/core/processed_response.dart';
import 'package:healthcloud/domain/core/value_objects/app_enums.dart';
import 'package:healthcloud/domain/core/value_objects/app_strings.dart';
import 'package:healthcloud/domain/core/value_objects/events.dart';
import 'package:healthcloud/domain/core/value_objects/login_constants.dart';
import 'package:http/http.dart' as http;
import 'package:misc_utilities/misc.dart';
import 'package:user_feed/user_feed.dart';

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
      'flavour': Flavour.PRO.name,
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

      final UserResponse responseAsObject = UserResponse.fromJson(responseMap);

      dispatch(
        local_actions.BatchUpdateUserStateAction(
          userProfile: responseAsObject.profile,
          communicationSettings: responseAsObject.communicationSettings,
          auth: responseAsObject.auth,
          isSignedIn: true,
          inActivitySetInTime: DateTime.now().toIso8601String(),
          signedInTime: DateTime.now().toIso8601String(),
          tokenExpiryTime: DateTime.now()
              .add(const Duration(seconds: kTokenExpiryDuration))
              .toIso8601String(),
        ),
      );

      dispatch(
        BottomNavAction(
          currentBottomNavIndex: 1,
        ),
      );

      // Clear the misc state
      dispatch(
        BatchUpdateMiscStateAction(
          phoneNumber: UNKNOWN,
          pinCode: UNKNOWN,
          invalidCredentials: false,
          unKnownPhoneNo: false,
        ),
      );

      if (!responseAsObject.auth!.isChangePin!) {
        triggerEvent(loginEvent, context);

        final OnboardingPathConfig path = onboardingPath(state: state);
        dispatch(
          NavigateAction<AppState>.pushNamedAndRemoveAll(
            path.route,
            arguments: path.arguments,
          ),
        );
      }

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
