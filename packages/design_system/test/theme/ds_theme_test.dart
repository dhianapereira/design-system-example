import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('DSTheme.light - ', () {
    test('should use Material 3 when theme is light', () {
      expect(DSTheme.light().useMaterial3, isTrue);
    });

    test('should return light brightness when theme is light', () {
      expect(DSTheme.light().brightness, Brightness.light);
    });

    test('should return light background when theme is light', () {
      expect(
        DSTheme.light().scaffoldBackgroundColor,
        DSColorScheme.light.background,
      );
    });

    test('should return light extension when theme is light', () {
      expect(DSTheme.light().extension<DSThemeData>(), DSThemeData.light);
    });

    test('should return bodyMedium font size when theme is light', () {
      expect(
        DSTheme.light().textTheme.bodyMedium?.fontSize,
        DSTypography.bodyMedium.fontSize,
      );
    });

    test('should return labelLarge font size when theme is light', () {
      expect(
        DSTheme.light().textTheme.labelLarge?.fontSize,
        DSTypography.labelLarge.fontSize,
      );
    });
  });

  group('DSTheme.dark - ', () {
    test('should use Material 3 when theme is dark', () {
      expect(DSTheme.dark().useMaterial3, isTrue);
    });

    test('should return dark brightness when theme is dark', () {
      expect(DSTheme.dark().brightness, Brightness.dark);
    });

    test('should return dark background when theme is dark', () {
      expect(
        DSTheme.dark().scaffoldBackgroundColor,
        DSColorScheme.dark.background,
      );
    });

    test('should return dark extension when theme is dark', () {
      expect(DSTheme.dark().extension<DSThemeData>(), DSThemeData.dark);
    });

    test('should return bodyMedium font size when theme is dark', () {
      expect(
        DSTheme.dark().textTheme.bodyMedium?.fontSize,
        DSTypography.bodyMedium.fontSize,
      );
    });

    test('should return labelLarge font size when theme is dark', () {
      expect(
        DSTheme.dark().textTheme.labelLarge?.fontSize,
        DSTypography.labelLarge.fontSize,
      );
    });
  });
}
