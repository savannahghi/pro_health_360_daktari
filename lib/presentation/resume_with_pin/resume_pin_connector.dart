import 'package:app_wrapper/app_wrapper.dart';
import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_graphql_client/graph_client.dart';
import 'package:mycarehubpro/application/core/services/utils.dart';
import 'package:mycarehubpro/application/redux/actions/user_state_actions/logout_action.dart';
import 'package:mycarehubpro/application/redux/states/app_state.dart';
import 'package:mycarehubpro/domain/core/entities/core/onboarding_path_info.dart';
import 'package:mycarehubpro/presentation/resume_with_pin/resume_pin_view_model.dart';
import 'package:mycarehubpro/presentation/resume_with_pin/resume_pin_view_model_factory.dart';
import 'package:mycarehubpro/presentation/resume_with_pin/resume_with_pin_page.dart';

class ResumePinConnector extends StatelessWidget {
  const ResumePinConnector({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final IGraphQlClient client = AppWrapperBase.of(context)!.graphQLClient;
    final String endpoint =
        AppWrapperBase.of(context)!.customContext!.loginByPhoneEndpoint;

    return StoreConnector<AppState, ResumePinViewModel>(
      vm: () => ResumePinFactory(
        client: client,
        endpoint: endpoint,
        successCallback: () {
          if (Navigator.canPop(context)) {
            Navigator.pop(context);
          } else {
            final AppState? appState = StoreProvider.state<AppState>(context);
            final OnboardingPathInfo navConfig =
                getOnboardingPath(state: appState ?? AppState.initial());
            Navigator.of(context).pushReplacementNamed(navConfig.nextRoute);
          }
        },
      ),
      builder: (BuildContext context, ResumePinViewModel vm) {
        return WillPopScope(
          onWillPop: () async {
            SystemNavigator.pop();
            return true;
          },
          child: ResumeWithPinPage(
            username: vm.username,
            onSubmit: vm.onSubmit,
            isLoading: vm.isLoading,
            logoutCallback: () {
              StoreProvider.dispatch(
                context,
                LogoutAction(),
              );
            },
          ),
        );
      },
    );
  }
}
