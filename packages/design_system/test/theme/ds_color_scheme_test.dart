import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('DSColorScheme.light - ', () {
    test('should return neutral50 when color is background', () {
      expect(DSColorScheme.light.background, DSPalette.neutral50);
    });

    test('should return neutral0 when color is surface', () {
      expect(DSColorScheme.light.surface, DSPalette.neutral0);
    });

    test('should return neutral900 when color is textPrimary', () {
      expect(DSColorScheme.light.textPrimary, DSPalette.neutral900);
    });

    test('should return neutral500 when color is textDisabled', () {
      expect(DSColorScheme.light.textDisabled, DSPalette.neutral500);
    });

    test('should return neutral200 when color is border', () {
      expect(DSColorScheme.light.border, DSPalette.neutral200);
    });

    test('should return blue650 when color is focus', () {
      expect(DSColorScheme.light.focus, DSPalette.blue650);
    });

    test('should return blue600 when color is primary', () {
      expect(DSColorScheme.light.primary, DSPalette.blue600);
    });

    test('should return neutral0 when color is onPrimary', () {
      expect(DSColorScheme.light.onPrimary, DSPalette.neutral0);
    });

    test('should return blue50 when color is secondary', () {
      expect(DSColorScheme.light.secondary, DSPalette.blue50);
    });

    test('should return blue950 when color is onSecondary', () {
      expect(DSColorScheme.light.onSecondary, DSPalette.blue950);
    });

    test('should return red600 when color is error', () {
      expect(DSColorScheme.light.error, DSPalette.red600);
    });

    test('should return red25 when color is onError', () {
      expect(DSColorScheme.light.onError, DSPalette.red25);
    });
  });

  group('DSColorScheme.dark - ', () {
    test('should return neutral950 when color is background', () {
      expect(DSColorScheme.dark.background, DSPalette.neutral950);
    });

    test('should return neutral800 when color is surface', () {
      expect(DSColorScheme.dark.surface, DSPalette.neutral800);
    });

    test('should return slate50 when color is textPrimary', () {
      expect(DSColorScheme.dark.textPrimary, DSPalette.slate50);
    });

    test('should return slate300 when color is textDisabled', () {
      expect(DSColorScheme.dark.textDisabled, DSPalette.slate300);
    });

    test('should return slate700 when color is border', () {
      expect(DSColorScheme.dark.border, DSPalette.slate700);
    });

    test('should return blue300 when color is focus', () {
      expect(DSColorScheme.dark.focus, DSPalette.blue300);
    });

    test('should return blue300 when color is primary', () {
      expect(DSColorScheme.dark.primary, DSPalette.blue300);
    });

    test('should return blue1000 when color is onPrimary', () {
      expect(DSColorScheme.dark.onPrimary, DSPalette.blue1000);
    });

    test('should return blue900 when color is secondary', () {
      expect(DSColorScheme.dark.secondary, DSPalette.blue900);
    });

    test('should return blue25 when color is onSecondary', () {
      expect(DSColorScheme.dark.onSecondary, DSPalette.blue25);
    });

    test('should return red300 when color is error', () {
      expect(DSColorScheme.dark.error, DSPalette.red300);
    });

    test('should return red1000 when color is onError', () {
      expect(DSColorScheme.dark.onError, DSPalette.red1000);
    });
  });

  group('DSColorScheme.copyWith - ', () {
    test('should keep current background when background is null', () {
      expect(DSColorScheme.light.copyWith().background,
          DSColorScheme.light.background);
    });

    test('should replace background when background is provided', () {
      expect(DSColorScheme.light.copyWith(background: Colors.red).background,
          Colors.red);
    });

    test('should replace surface when surface is provided', () {
      expect(DSColorScheme.light.copyWith(surface: Colors.red).surface,
          Colors.red);
    });

    test('should replace textPrimary when textPrimary is provided', () {
      expect(
        DSColorScheme.light.copyWith(textPrimary: Colors.red).textPrimary,
        Colors.red,
      );
    });

    test('should replace textDisabled when textDisabled is provided', () {
      expect(
        DSColorScheme.light.copyWith(textDisabled: Colors.red).textDisabled,
        Colors.red,
      );
    });

    test('should replace border when border is provided', () {
      expect(
          DSColorScheme.light.copyWith(border: Colors.red).border, Colors.red);
    });

    test('should replace focus when focus is provided', () {
      expect(DSColorScheme.light.copyWith(focus: Colors.red).focus, Colors.red);
    });

    test('should replace primary when primary is provided', () {
      expect(DSColorScheme.light.copyWith(primary: Colors.red).primary,
          Colors.red);
    });

    test('should replace onPrimary when onPrimary is provided', () {
      expect(
        DSColorScheme.light.copyWith(onPrimary: Colors.red).onPrimary,
        Colors.red,
      );
    });

    test('should replace secondary when secondary is provided', () {
      expect(
        DSColorScheme.light.copyWith(secondary: Colors.red).secondary,
        Colors.red,
      );
    });

    test('should replace onSecondary when onSecondary is provided', () {
      expect(
        DSColorScheme.light.copyWith(onSecondary: Colors.red).onSecondary,
        Colors.red,
      );
    });

    test('should replace error when error is provided', () {
      expect(DSColorScheme.light.copyWith(error: Colors.red).error, Colors.red);
    });

    test('should replace onError when onError is provided', () {
      expect(
        DSColorScheme.light.copyWith(onError: Colors.red).onError,
        Colors.red,
      );
    });
  });

  group('DSColorScheme.lerp - ', () {
    test('should return first background when factor is zero', () {
      expect(
        DSColorScheme.lerp(DSColorScheme.light, DSColorScheme.dark, 0)
            .background,
        DSColorScheme.light.background,
      );
    });

    test('should return second background when factor is one', () {
      expect(
        DSColorScheme.lerp(DSColorScheme.light, DSColorScheme.dark, 1)
            .background,
        DSColorScheme.dark.background,
      );
    });
  });
}
