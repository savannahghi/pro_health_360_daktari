import 'package:healthcloud/domain/core/entities/supporting_documents.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final Map<String, dynamic> data = <String, String>{
    'title': 'Title',
    'description': 'description',
    'upload': 'photoFilename',
  };

  test('SupportingDocument returns SupportingDocument object from json', () {
    expect(
      SupportingDocument.fromJson(data),
      isA<SupportingDocument>(),
    );
  });
}
