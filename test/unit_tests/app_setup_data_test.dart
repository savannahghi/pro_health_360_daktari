// Package imports:
import 'package:app_wrapper/app_wrapper.dart';
import 'package:flutter_test/flutter_test.dart';

// Project imports:
import 'package:healthcloud/application/core/services/app_setup_data.dart';

void main() {
  test('AppSetupData creates a valid object', () {
    final AppSetupData appSetup = AppSetupData(
      appContexts: <AppContext>[AppContext.BewellPRO],
      sentryDNS: 'some sentryDNS',
    );

    expect(appSetup.sentryDNS, 'some sentryDNS');
    expect(appSetup.appContexts.first, AppContext.BewellPRO);

    final AppSetupData sameSetup = AppSetupData(
      appContexts: <AppContext>[AppContext.BewellPRO],
      sentryDNS: 'some sentryDNS',
    );

    expect(appSetup, sameSetup);
    expect(appSetup.hashCode, sameSetup.hashCode);
  });
}
