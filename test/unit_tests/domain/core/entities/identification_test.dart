// Package imports:
import 'package:flutter_test/flutter_test.dart';

// Project imports:
import 'package:healthcloud/domain/core/entities/identification.dart';

void main() {
  final Map<String, dynamic> data = <String, String>{
    'type': 'MILITARY',
    'docNumber': '12345',
    'uploadID': 'photoFilename',
  };

  test('Identification  returns an Identification class from json', () {
    expect(
      Identification.fromJson(data),
      isA<Identification>(),
    );
  });
}
