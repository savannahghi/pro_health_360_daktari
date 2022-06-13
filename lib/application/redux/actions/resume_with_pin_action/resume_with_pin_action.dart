import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:async_redux/async_redux.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_graphql_client/graph_client.dart';
import 'package:http/http.dart';
import 'package:mycarehubpro/application/core/graphql/queries.dart';
import 'package:mycarehubpro/application/core/services/analytics_service.dart';
import 'package:mycarehubpro/application/core/services/utils.dart';
import 'package:mycarehubpro/application/redux/actions/core/batch_update_misc_state_action.dart';
import 'package:mycarehubpro/application/redux/actions/flags/app_flags.dart';
import 'package:mycarehubpro/application/redux/states/app_state.dart';
import 'package:mycarehubpro/domain/core/entities/core/onboarding_path_info.dart';
import 'package:mycarehubpro/domain/core/value_objects/app_enums.dart';
import 'package:mycarehubpro/domain/core/value_objects/app_events.dart';
import 'package:mycarehubpro/domain/core/value_objects/app_strings.dart';
import 'package:mycarehubpro/presentation/router/routes.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

class ResumeWithPinAction extends ReduxAction<AppState> {
  ResumeWithPinAction({
    required this.httpClient,
    required this.endpoint,
    required this.pin,
    this.wrongPinCallback,
  });

  final String endpoint;
  final IGraphQlClient httpClient;
  final String pin;
  final VoidCallback? wrongPinCallback;

  @override
  void after() {
    dispatch(WaitAction<AppState>.remove(resumeWithPinFlag));
    super.after();
  }

  @override
  void before() {
    super.before();
    dispatch(WaitAction<AppState>.add(resumeWithPinFlag));
  }

  @override
  Future<AppState?> reduce() async {
    final String? userID = state.staffState?.user?.userId;

    final Map<String, dynamic> variables = <String, dynamic>{
      'userID': userID,
      'flavour': Flavour.pro.name,
      'pin': pin,
    };

    final Response result = await httpClient.query(verifyPinQuery, variables);

    final ProcessedResponse processedResponse = processHttpResponse(result);
    httpClient.close();

    if (processedResponse.ok) {
      final Map<String, dynamic> body =
          httpClient.toMap(processedResponse.response);

      final String? error = httpClient.parseError(body);

      if (error != null) {
        if (error.contains('48: pin expired')) {
          dispatch(
            NavigateAction<AppState>.pushNamedAndRemoveUntil(
              AppRoutes.pinExpiredPage,
              (Route<dynamic> route) => false,
            ),
          );
        } else if (error.contains('8: wrong PIN')) {
          wrongPinCallback?.call();
          throw const UserException(wrongPINText);
        } else {
          Sentry.captureException(
            error,
            hint: 'Error while verifying user PIN',
          );
          throw UserException(getErrorMessage());
        }
      }

      if (body['data']?['verifyPIN'] != null) {
        final bool pinVerified = body['data']['verifyPIN'] as bool;
        if (pinVerified) {
          final OnboardingPathInfo navConfig = getOnboardingPath(state: state);
          dispatch(
            BatchUpdateMiscStateAction(resumeWithPin: false),
          );

          await AnalyticsService().logEvent(
            name: resumeWithPINEvent,
            eventType: AnalyticsEventType.AUTH,
          );
          
          dispatch(
            NavigateAction<AppState>.pushReplacementNamed(navConfig.nextRoute),
          );
        }
      }
    } else {
      Sentry.captureException(
        processedResponse.message,
        hint: 'Error while verifying user PIN',
      );
      throw UserException(getErrorMessage());
    }

    return null;
  }
}
