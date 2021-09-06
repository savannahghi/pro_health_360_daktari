import 'package:async_redux/async_redux.dart';
import 'package:bewell_pro_core/application/redux/states/core_state.dart';
import 'package:bewell_pro_core/presentation/onboarding/profile/profile_contact_details.dart';
import 'package:domain_objects/entities.dart';
import 'package:domain_objects/value_objects.dart';

import 'package:flutter_test/flutter_test.dart';
import 'package:healthcloud/application/redux/actions/core/update_user_state_action.dart';
import 'package:healthcloud/application/redux/actions/kyc_state_actions/update_kyc_submission_status.dart';

import 'package:healthcloud/application/redux/states/app_state.dart';
import 'package:healthcloud/domain/core/value_objects/app_strings.dart';
import 'package:healthcloud/domain/core/value_objects/app_widget_keys.dart';
import 'package:healthcloud/presentation/onboarding/practitioner_kyc/common/widgets/kyc_pre_check.dart';
import 'package:healthcloud/presentation/onboarding/practitioner_kyc/common/widgets/kyc_pre_check_error_banner.dart';
import 'package:mocktail_image_network/mocktail_image_network.dart';

import '../../../../../../mocks/mocks.dart';
import '../../../../../../mocks/test_helpers.dart';

void main() {
  group('KYCPreCheck', () {
    late Store<CoreState> store;

    setUp(() {
      store = Store<CoreState>(initialState: AppState.initial());
    });

    testWidgets(
        'should show error banner when a KYC has already been submitted',
        (WidgetTester tester) async {
      store.dispatch(
        UpdateUserStateAction(
          userProfile: UserProfile.initial()
              .copyWith
              .call(primaryEmailAddress: testEmailAddress),
        ),
      );

      store.dispatch(
        UpdateKYCSubmissionStatusAction(kycSubmitted: true),
      );

      await buildTestWidget(
        tester: tester,
        store: store,
        widget: KYCPreCheck(continueFunc: () {}),
      );

      await tester.pumpAndSettle();

      expect(find.byType(KYCPreCheckErrorBanner), findsOneWidget);
      expect(find.text(kycAlreadySubmitted), findsOneWidget);

      // Close the page
      await tester.tap(find.byKey(kycDoItLaterButtonKey));
      await tester.pumpAndSettle();
    });

    testWidgets(
        'should prompt the user to fill in their email address if they have not'
        ' done so', (WidgetTester tester) async {
      mockNetworkImages(() async {
        store.dispatch(
          UpdateUserStateAction(
            userProfile: UserProfile.initial().copyWith.call(
                  primaryEmailAddress: EmailAddress.withValue(UNKNOWNEMAIL),
                ),
          ),
        );

        await buildTestWidget(
          tester: tester,
          store: store,
          widget: KYCPreCheck(continueFunc: () {}),
        );

        final Finder addEmailAddressBtn = find.text('Add Email Address');

        expect(addEmailAddressBtn, findsOneWidget);

        await tester.tap(addEmailAddressBtn);
        await tester.pumpAndSettle();

        expect(find.byType(ProfileContactDetails), findsOneWidget);
      });
    });
  });
}
