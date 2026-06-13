import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('should return light colors when theme is light', () {
    expect(DSThemeData.light.colors, DSColorScheme.light);
  });

  test('should return dark colors when theme is dark', () {
    expect(DSThemeData.dark.colors, DSColorScheme.dark);
  });

  group('DSThemeData.copyWith - ', () {
    test('should keep current colors when colors is null', () {
      expect(DSThemeData.light.copyWith().colors, DSThemeData.light.colors);
    });

    test('should replace colors when colors is provided', () {
      expect(
        DSThemeData.light.copyWith(colors: DSColorScheme.dark).colors,
        DSColorScheme.dark,
      );
    });
  });

  group('DSThemeData.lerp - ', () {
    test('should return current theme when other is null', () {
      expect(DSThemeData.light.lerp(null, 1), DSThemeData.light);
    });

    test('should return light colors when factor is zero', () {
      expect(
        DSThemeData.light.lerp(DSThemeData.dark, 0).colors.background,
        DSColorScheme.light.background,
      );
    });

    test('should return dark colors when factor is one', () {
      expect(
        DSThemeData.light.lerp(DSThemeData.dark, 1).colors.background,
        DSColorScheme.dark.background,
      );
    });
  });

  group('BuildContext.dsTheme - ', () {
    testWidgets('should return DSThemeData when theme has extension',
        (tester) async {
      late DSThemeData theme;

      await tester.pumpWidget(
        MaterialApp(
          theme: DSTheme.light(),
          home: Builder(
            builder: (context) {
              theme = context.dsTheme;
              return const SizedBox.shrink();
            },
          ),
        ),
      );

      expect(theme, DSThemeData.light);
    });
  });
}
