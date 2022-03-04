import 'package:flutter/src/material/theme_data.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:myharehubpro/application/core/theme/app_themes.dart';

void main() {
  group('AppTheme', () {
    test('returns correct theme', () {
      final ThemeData theme = AppTheme.getAppTheme();

      expect(theme.primaryColor, AppColors.themeColors.primaryColor);
    });
  });
}
