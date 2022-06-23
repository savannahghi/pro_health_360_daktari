import 'package:flutter/src/material/theme_data.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:prohealth360_daktari/application/core/theme/app_themes.dart';

void main() {
  group('AppTheme', () {
    test('returns correct theme', () {
      final ThemeData theme = AppTheme.getAppTheme();

      expect(theme.primaryColor, AppColors.themeColors.primaryColor);
    });
  });
}
