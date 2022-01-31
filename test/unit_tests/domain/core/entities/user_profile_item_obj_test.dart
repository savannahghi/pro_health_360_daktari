// Package imports:
import 'package:flutter_test/flutter_test.dart';
// Project imports:
import 'package:healthcloud/domain/core/entities/user_profile_item_obj.dart';
import 'package:healthcloud/domain/core/value_objects/app_asset_strings.dart';
import 'package:healthcloud/presentation/router/routes.dart';

void main() {
  final Map<String, dynamic> data = <String, dynamic>{
    'iconAssetPath': emailIconSvgPath,
    'title': 'Red Flags',
    'route': AppRoutes.redFlagsPage,
  };
  test('UserProfileItemObj toJson', () {
    expect(
      UserProfileItemObj(
        iconAssetPath: emailIconSvgPath,
        title: 'Red Flags',
        route: AppRoutes.redFlagsPage,
      ).toJson(),
      data,
    );
  });

  test('UserProfileItemObj fromJson', () {
    expect(
      UserProfileItemObj.fromJson(data),
      isA<UserProfileItemObj>(),
    );
  });
}
