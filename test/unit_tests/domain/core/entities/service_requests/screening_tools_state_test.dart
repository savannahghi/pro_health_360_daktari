// Package imports:
import 'package:flutter_test/flutter_test.dart';
import 'package:prohealth360_daktari/application/redux/states/service_requests/screening_tools_state.dart';

void main() {
  final Map<String, dynamic> data = <String, dynamic>{
    'violenceState': null,
    'contraceptiveState': null,
    'tbState': null,
    'alcoholSubstanceUseState': null,
  };
  test('ScreeningToolsState fromJson', () {
    expect(
      ScreeningToolsState.fromJson(data),
      isA<ScreeningToolsState>(),
    );
  });
}
