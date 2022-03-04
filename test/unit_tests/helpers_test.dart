// Flutter imports:
import 'package:flutter_config/flutter_config.dart';
import 'package:flutter_test/flutter_test.dart';
// Package imports:
import 'package:app_wrapper/app_wrapper.dart';

// Project imports:
import 'package:myharehubpro/application/core/services/helpers.dart';
import 'package:myharehubpro/domain/core/value_objects/app_contexts.dart';

void main() {
  FlutterConfig.loadValueForTesting(<String, String>{
    'DEV_SENTRY_DNS': 'test_dev_sentry_dns',
    'PROD_SENTRY_DNS': 'test_prod_sentry_dns',
    'DEV_STREAM_API_KEY': 'dev_stream_api_key',
    'DEMO_STREAM_API_KEY': 'demo_stream_api_key',
    'PROD_STREAM_API_KEY': 'prod_stream_api_key',
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
