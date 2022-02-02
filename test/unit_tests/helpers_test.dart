// Flutter imports:
import 'package:flutter_config/flutter_config.dart';
import 'package:flutter_test/flutter_test.dart';
// Package imports:
import 'package:app_wrapper/app_wrapper.dart';

// Project imports:
import 'package:healthcloud/application/core/services/helpers.dart';
import 'package:healthcloud/domain/core/value_objects/app_contexts.dart';

void main() {
  FlutterConfig.loadValueForTesting(<String, String>{
    'DEV_SENTRY_DNS': 'test_dev_sentry_dns',
    'PROD_SENTRY_DNS': 'test_prod_sentry_dns',
  });

  test('getAppSetupData should return the correct instance of AppSetupData',
      () async {
    expect(getAppSetupData(testAppContexts.last), devAppSetupData);

    expect(getAppSetupData(demoAppContexts.last), demoAppSetupData);

    expect(getAppSetupData(prodAppContexts.last), prodAppSetupData);

    expect(getAppSetupData(e2eAppContexts.last), devAppSetupData);

    expect(getAppSetupData(AppContext.BewellCONSUMER), devAppSetupData);
  });
}
