// Package imports:
import 'package:flutter_test/flutter_test.dart';
import 'package:mycarehubpro/application/redux/states/service_requests/violence_state.dart';

void main() {
  final Map<String, dynamic> data = <String, dynamic>{
    'screeningQuestionItems': <dynamic>[],
  };
  test('ViolenceState fromJson', () {
    expect(
      ViolenceState.fromJson(data),
      isA<ViolenceState>(),
    );
  });
}
