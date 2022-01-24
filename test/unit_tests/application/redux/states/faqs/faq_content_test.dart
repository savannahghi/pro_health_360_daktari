// Package imports:
import 'package:flutter_test/flutter_test.dart';
import 'package:healthcloud/application/redux/states/faqs/faq_content.dart';

// Project imports:
import '../../../../../mocks/mocks.dart';

void main() {
  group('FAQContent', () {
    test('FAQContent fromJson works correctly', () {
      final FAQContent mockFAQContent = FAQContent.fromJson(helpCenterFAQMock);

      expect(mockFAQContent, isA<FAQContent>());
    });

    test('FAQTag fromJson works correctly', () {
      final FAQTag mockFAQTag = FAQTag.fromJson(mockFAQtag);

      expect(mockFAQTag, isA<FAQTag>());
    });
  });
}
