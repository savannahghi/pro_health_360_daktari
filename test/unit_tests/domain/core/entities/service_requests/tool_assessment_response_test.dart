// Package imports:
import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mycarehubpro/application/redux/states/service_requests/tool_assessment_response.dart';

void main() {
  final Map<String, dynamic> data = <String, dynamic>{
    'clientName': UNKNOWN,
    'dateAnswered': UNKNOWN,
    'clientID': UNKNOWN,
  };
  test('ScreeningQuestionsList toJson', () {
    expect(
      ToolAssessmentResponse.initial().toJson(),
      data,
    );
  });

  test('ScreeningQuestion fromJson', () {
    expect(
      ToolAssessmentResponse.fromJson(data),
      isA<ToolAssessmentResponse>(),
    );
  });
}
