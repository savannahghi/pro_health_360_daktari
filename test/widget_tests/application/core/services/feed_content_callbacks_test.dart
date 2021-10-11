// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:async_redux/async_redux.dart';
import 'package:bewell_pro_core/application/redux/actions/user_state_actions/batch_update_user_state_action.dart';
import 'package:bewell_pro_core/application/redux/states/core_state.dart';
import 'package:bewell_pro_core/domain/core/entities/common_behavior_object.dart';
import 'package:bewell_pro_core/domain/core/value_objects/asset_strings.dart';
import 'package:bewell_pro_core/presentation/onboarding/profile/profile_contact_details.dart';
import 'package:domain_objects/entities.dart';
import 'package:domain_objects/value_objects.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail_image_network/mocktail_image_network.dart';
import 'package:shared_ui_components/buttons.dart';
import 'package:user_feed/user_feed.dart';

// Project imports:
import 'package:healthcloud/application/core/services/feed_content_callbacks.dart';
import 'package:healthcloud/application/redux/actions/core/update_user_state_action.dart';
import 'package:healthcloud/application/redux/actions/kyc_state_actions/update_kyc_submission_status.dart';
import 'package:healthcloud/application/redux/states/app_state.dart';
import 'package:healthcloud/presentation/onboarding/practitioner_kyc/common/widgets/kyc_intro_page.dart';
import 'package:healthcloud/presentation/onboarding/practitioner_kyc/individual/individual_practitioner_step_one.dart';
import '../../../../mocks/test_helpers.dart';

void main() {
  const Key key = Key('test_navigation_button');

  group('getAfyaMojaFeedActionCallbacks function', () {
    late Store<CoreState> store;

    setUp(() {
      store = Store<CoreState>(initialState: AppState.initial());
    });

    testWidgets('navigates to ProfileContactDetails',
        (WidgetTester tester) async {
      await store.dispatch(BatchUpdateUserStateAction(
          userProfile: UserProfile(
        primaryPhoneNumber: PhoneNumber.withValue('+2547123455678'),
      )));

      await mockNetworkImages(() async {
        await buildTestWidget(
            tester: tester,
            store: store,
            widget: Builder(builder: (BuildContext context) {
              final Map<String, Function> callbacks =
                  getAfyaMojaFeedActionCallbacks(context: context);
              final Function callback = callbacks[kVerifyEmail]!;
              return Center(
                child: ElevatedButton(
                  key: key,
                  onPressed: () => callback(),
                  child: const Text(''),
                ),
              );
            }));
        await tester.tap(find.byKey(key));
        await tester.pumpAndSettle();

        expect(find.byType(ProfileContactDetails), findsOneWidget);
      });
    });

    testWidgets('displays Snackbar', (WidgetTester tester) async {
      await buildTestWidget(
          tester: tester,
          store: store,
          widget: Builder(builder: (BuildContext context) {
            final Map<String, Function> callbacks =
                getAfyaMojaFeedActionCallbacks(context: context);
            final Function callback = callbacks[kCompleteProfile]!;
            return Center(
              child: ElevatedButton(
                key: key,
                onPressed: () => callback(),
                child: const Text(''),
              ),
            );
          }));

      await tester.tap(find.byKey(key));
      await tester.pumpAndSettle();

      expect(find.text('Coming soon'), findsOneWidget);
    });

    testWidgets('and then to IndividualPractitionerKYCStepOne',
        (WidgetTester tester) async {
      AppBrand().appLogo.add(cameraIconUrl);
      store.dispatch(
        UpdateUserStateAction(
          userProfile: UserProfile(
            primaryEmailAddress: EmailAddress.withValue('test@gmail.com'),
          ),
        ),
      );

      store.dispatch(
        UpdateKYCSubmissionStatusAction(kycSubmitted: false),
      );

      mockNetworkImages(() async {
        await buildTestWidget(
            tester: tester,
            store: store,
            widget: Builder(builder: (BuildContext context) {
              final Map<String, Function> callbacks =
                  getAfyaMojaFeedActionCallbacks(context: context);
              final Function callback =
                  callbacks[kCompleteIndividualPractitionerKYC]!;
              return Center(
                child: ElevatedButton(
                  key: key,
                  onPressed: () => callback(),
                  child: const Text(''),
                ),
              );
            }));

        await tester.tap(find.byKey(key));
        await tester.pumpAndSettle();

        expect(find.byType(KYCIntroPage), findsOneWidget);
        expect(find.byType(SILPrimaryButton), findsOneWidget);

        await tester.tap(find.byType(SILPrimaryButton));
        await tester.pumpAndSettle();

        expect(find.byType(KYCIntroPage), findsNothing);
        expect(find.byType(IndividualPractitionerKYCStepOne), findsOneWidget);
      });
    });
  });
}
