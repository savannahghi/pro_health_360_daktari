import 'package:app_wrapper/app_wrapper.dart';
import 'package:healthcloud/application/core/services/app_setup_data.dart';
import 'package:healthcloud/application/core/services/helpers.dart';
import 'package:bewell_pro_core/domain/core/value_objects/app_contexts.dart';
import 'package:flutter_config/flutter_config.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  FlutterConfig.loadValueForTesting(<String, String>{
    'DEV_SENTRY_DNS': 'test_dev_sentry_dns',
    'PROD_SENTRY_DNS': 'test_prod_sentry_dns',
  });

  test('getAppSetupData should return the correct instance of AppSetupData',
      () async {
    expect(
      getAppSetupData(testAppContexts.last),
      AppSetupData(
        appContexts: testAppContexts,
        sentryDNS: 'test_dev_sentry_dns',
      ),
    );

    expect(
      getAppSetupData(demoAppContexts.last),
      AppSetupData(
        appContexts: demoAppContexts,
        sentryDNS: 'test_prod_sentry_dns',
      ),
    );

    expect(
      getAppSetupData(prodAppContexts.last),
      AppSetupData(
        appContexts: prodAppContexts,
        sentryDNS: 'test_prod_sentry_dns',
      ),
    );

    expect(
      getAppSetupData(e2eAppContexts.last),
      AppSetupData(
        appContexts: e2eAppContexts,
        sentryDNS: 'test_dev_sentry_dns',
      ),
    );

    expect(
      getAppSetupData(AppContext.BewellCONSUMER),
      AppSetupData(
        appContexts: testAppContexts,
        sentryDNS: 'test_dev_sentry_dns',
      ),
    );
  });
}
