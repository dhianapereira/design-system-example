import 'package:design_system/design_system.dart';
import 'package:design_system/src/components/buttons/styles/ds_button_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('DSButtonStyle.resolve', () {
    test('should return primary background when variant is primary', () {
      final style = DSButtonStyle.resolve(
        variant: DSButtonVariant.primary,
        colors: DSColorScheme.light,
      );

      expect(style.backgroundColor, DSColorScheme.light.primary);
    });

    test('should return onPrimary foreground when variant is primary', () {
      final style = DSButtonStyle.resolve(
        variant: DSButtonVariant.primary,
        colors: DSColorScheme.light,
      );

      expect(style.foregroundColor, DSColorScheme.light.onPrimary);
    });

    test('should return secondary background when variant is secondary', () {
      final style = DSButtonStyle.resolve(
        variant: DSButtonVariant.secondary,
        colors: DSColorScheme.light,
      );

      expect(style.backgroundColor, DSColorScheme.light.secondary);
    });

    test('should return onSecondary foreground when variant is secondary', () {
      final style = DSButtonStyle.resolve(
        variant: DSButtonVariant.secondary,
        colors: DSColorScheme.light,
      );

      expect(style.foregroundColor, DSColorScheme.light.onSecondary);
    });

    test('should return transparent background when variant is outline', () {
      final style = DSButtonStyle.resolve(
        variant: DSButtonVariant.outline,
        colors: DSColorScheme.light,
      );

      expect(style.backgroundColor, Colors.transparent);
    });

    test('should return primary border when variant is outline', () {
      final style = DSButtonStyle.resolve(
        variant: DSButtonVariant.outline,
        colors: DSColorScheme.light,
      );

      expect(style.borderColor, DSColorScheme.light.primary);
    });

    test('should return border disabled background when variant is primary',
        () {
      final style = DSButtonStyle.resolve(
        variant: DSButtonVariant.primary,
        colors: DSColorScheme.light,
      );

      expect(style.disabledBackgroundColor, DSColorScheme.light.border);
    });

    test(
        'should return textDisabled disabled foreground when variant is primary',
        () {
      final style = DSButtonStyle.resolve(
        variant: DSButtonVariant.primary,
        colors: DSColorScheme.light,
      );

      expect(style.disabledForegroundColor, DSColorScheme.light.textDisabled);
    });
  });

  group('DSButtonStyle.toFilledButtonStyle', () {
    testWidgets('should resolve minimum size when style is filled', (
      tester,
    ) async {
      final buttonStyle = DSButtonStyle.resolve(
        variant: DSButtonVariant.primary,
        colors: DSColorScheme.light,
      ).toFilledButtonStyle();

      expect(
        buttonStyle.minimumSize?.resolve({}),
        const Size(DSSize.minTouchTarget, DSSize.minTouchTarget),
      );
    });

    testWidgets('should resolve padding when style is filled', (tester) async {
      final buttonStyle = DSButtonStyle.resolve(
        variant: DSButtonVariant.primary,
        colors: DSColorScheme.light,
      ).toFilledButtonStyle();

      expect(
        buttonStyle.padding?.resolve({}),
        const EdgeInsets.symmetric(
          horizontal: DSSpacing.lg,
          vertical: DSSpacing.md,
        ),
      );
    });

    testWidgets('should resolve textStyle when style is filled',
        (tester) async {
      final buttonStyle = DSButtonStyle.resolve(
        variant: DSButtonVariant.primary,
        colors: DSColorScheme.light,
      ).toFilledButtonStyle();

      expect(
        buttonStyle.textStyle?.resolve({})?.fontSize,
        DSTypography.labelLarge.fontSize,
      );
    });
  });

  group('DSButtonStyle.toOutlinedButtonStyle', () {
    testWidgets('should resolve minimum size when style is outlined', (
      tester,
    ) async {
      final buttonStyle = DSButtonStyle.resolve(
        variant: DSButtonVariant.outline,
        colors: DSColorScheme.light,
      ).toOutlinedButtonStyle();

      expect(
        buttonStyle.minimumSize?.resolve({}),
        const Size(DSSize.minTouchTarget, DSSize.minTouchTarget),
      );
    });

    testWidgets('should resolve border side when style is outlined', (
      tester,
    ) async {
      final buttonStyle = DSButtonStyle.resolve(
        variant: DSButtonVariant.outline,
        colors: DSColorScheme.light,
      ).toOutlinedButtonStyle();

      expect(
        buttonStyle.side?.resolve({})?.width,
        DSBorderWidth.thin,
      );
    });

    testWidgets('should resolve textStyle when style is outlined', (
      tester,
    ) async {
      final buttonStyle = DSButtonStyle.resolve(
        variant: DSButtonVariant.outline,
        colors: DSColorScheme.light,
      ).toOutlinedButtonStyle();

      expect(
        buttonStyle.textStyle?.resolve({})?.fontSize,
        DSTypography.labelLarge.fontSize,
      );
    });
  });

  group('DSButtonStyle.toIconButtonStyle', () {
    testWidgets('should resolve fixed size when style is icon button', (
      tester,
    ) async {
      final buttonStyle = DSButtonStyle.resolve(
        variant: DSButtonVariant.primary,
        colors: DSColorScheme.light,
      ).toIconButtonStyle();

      expect(
        buttonStyle.fixedSize?.resolve({}),
        const Size.square(DSSize.minTouchTarget),
      );
    });

    testWidgets('should resolve minimum size when style is icon button', (
      tester,
    ) async {
      final buttonStyle = DSButtonStyle.resolve(
        variant: DSButtonVariant.primary,
        colors: DSColorScheme.light,
      ).toIconButtonStyle();

      expect(
        buttonStyle.minimumSize?.resolve({}),
        const Size.square(DSSize.minTouchTarget),
      );
    });

    testWidgets('should resolve side when style is outline icon button', (
      tester,
    ) async {
      final buttonStyle = DSButtonStyle.resolve(
        variant: DSButtonVariant.outline,
        colors: DSColorScheme.light,
      ).toIconButtonStyle();

      expect(
        buttonStyle.side?.resolve({})?.width,
        DSBorderWidth.thin,
      );
    });
  });
}
