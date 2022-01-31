// Package imports:
import 'package:flutter_test/flutter_test.dart';

// Project imports:
import 'package:healthcloud/domain/core/entities/pin_reset_request.dart';

void main() {
  final Map<String, dynamic> data = <String, dynamic>{
    'clientName': 'Eugene',
    'phoneNumber': '0712345678',
    'approvalStatus': true
  };
  test('PINResetRequest toJson', () {
    expect(
      PINResetRequest(
        clientName: 'Eugene',
        phoneNumber: '0712345678',
        approvalStatus: true,
      ).toJson(),
      data,
    );
  });

  test('PINResetRequest fromJson', () {
    expect(
      PINResetRequest.fromJson(data),
      isA<PINResetRequest>(),
    );
  });
}
