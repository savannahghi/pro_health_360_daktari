// Package imports:
import 'package:flutter_test/flutter_test.dart';

// Project imports:
import 'package:healthcloud/domain/core/entities/request_item.dart';
import 'package:healthcloud/domain/core/value_objects/app_asset_strings.dart';
import 'package:healthcloud/presentation/router/routes.dart';

void main() {
  final Map<String, dynamic> data = <String, dynamic>{
    'title': 'Red flags',
    'route': AppRoutes.redFlagsPage,
    'imageAssetPath': emailIconSvgPath,
    'totalNumber': 6
  };
  test('RequestItem toJson', () {
    expect(
      RequestItem(
        title: 'Red flags',
        route: AppRoutes.redFlagsPage,
        imageAssetPath: emailIconSvgPath,
        totalNumber: 6,
      ).toJson(),
      data,
    );
  });

  test('RequestItem fromJson', () {
    expect(
      RequestItem.fromJson(data),
      isA<RequestItem>(),
    );
  });
}
