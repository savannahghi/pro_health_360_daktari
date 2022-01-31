// Package imports:
import 'package:flutter_test/flutter_test.dart';

Future<void> fireEvent(WidgetTester tester) async {
  await tester.pump(Duration.zero);
}
