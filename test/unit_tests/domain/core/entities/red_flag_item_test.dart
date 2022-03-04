// Package imports:
import 'package:flutter_test/flutter_test.dart';

// Project imports:
import 'package:myharehubpro/domain/core/entities/red_flag_item.dart';

void main() {
  final Map<String, dynamic> data = <String, dynamic>{
    'clientName': 'Kinuthia',
    'feelingDescription': 'Feeling suicidal',
  };
  test('RequestItem toJson', () {
    expect(
      RedFlagItem(
        clientName: 'Kinuthia',
        feelingDescription: 'Feeling suicidal',
      ).toJson(),
      data,
    );
  });

  test('RedFlagItem fromJson', () {
    expect(
      RedFlagItem.fromJson(data),
      isA<RedFlagItem>(),
    );
  });
}
