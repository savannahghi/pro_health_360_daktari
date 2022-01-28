import 'package:flutter_test/flutter_test.dart';
import 'package:healthcloud/application/redux/states/survey_state.dart';

void main() {
  group('SurveyState', () {
    test('fromJson', () {
      // SurveyState is empty for now. Test should probably change once
      // class is implemented
      expect(
        SurveyState.fromJson(<String, dynamic>{}),
        isA<SurveyState>(),
      );
    });
  });
}
