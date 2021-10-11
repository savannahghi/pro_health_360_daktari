// Project imports:
import 'package:healthcloud/application/core/services/init_app.dart';
import 'package:healthcloud/domain/core/value_objects/app_contexts.dart';

Future<void> main() async {
  return initApp(prodAppContexts);
}
