import 'package:design_system/design_system.dart';
import 'package:design_system/src/components/badges/styles/ds_badge_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('DSBadgeStyle.resolve - ', () {
    test('should return surface background when variant is neutral', () {
      final style = DSBadgeStyle.resolve(
        variant: DSBadgeVariant.neutral,
        colors: DSColorScheme.light,
      );

      expect(style.backgroundColor, DSColorScheme.light.surface);
    });

    test('should return textPrimary foreground when variant is neutral', () {
      final style = DSBadgeStyle.resolve(
        variant: DSBadgeVariant.neutral,
        colors: DSColorScheme.light,
      );

      expect(style.foregroundColor, DSColorScheme.light.textPrimary);
    });

    test('should return primary colors when variant is primary', () {
      final style = DSBadgeStyle.resolve(
        variant: DSBadgeVariant.primary,
        colors: DSColorScheme.light,
      );

      expect(style.backgroundColor, DSColorScheme.light.primary);
      expect(style.foregroundColor, DSColorScheme.light.onPrimary);
    });

    test('should return secondary colors when variant is secondary', () {
      final style = DSBadgeStyle.resolve(
        variant: DSBadgeVariant.secondary,
        colors: DSColorScheme.light,
      );

      expect(style.backgroundColor, DSColorScheme.light.secondary);
      expect(style.foregroundColor, DSColorScheme.light.onSecondary);
    });

    test('should return error colors when variant is error', () {
      final style = DSBadgeStyle.resolve(
        variant: DSBadgeVariant.error,
        colors: DSColorScheme.light,
      );

      expect(style.backgroundColor, DSColorScheme.light.error);
      expect(style.foregroundColor, DSColorScheme.light.onError);
    });

    test('should return medium size style when size is omitted', () {
      final style = DSBadgeStyle.resolve(
        variant: DSBadgeVariant.neutral,
        colors: DSColorScheme.light,
      );

      expect(style.sizeStyle.minHeight, 24);
    });

    test('should return small size style when size is sm', () {
      final style = DSBadgeStyle.resolve(
        variant: DSBadgeVariant.neutral,
        colors: DSColorScheme.light,
        size: DSBadgeSize.sm,
      );

      expect(style.sizeStyle.minHeight, 20);
    });

    test('should return large size style when size is lg', () {
      final style = DSBadgeStyle.resolve(
        variant: DSBadgeVariant.neutral,
        colors: DSColorScheme.light,
        size: DSBadgeSize.lg,
      );

      expect(style.sizeStyle.minHeight, 28);
    });
  });

  group('DSBadgeStyle.toDecoration - ', () {
    test('should resolve decoration color', () {
      final decoration = DSBadgeStyle.resolve(
        variant: DSBadgeVariant.primary,
        colors: DSColorScheme.light,
      ).toDecoration();

      expect(decoration.color, DSColorScheme.light.primary);
    });

    test('should resolve border width', () {
      final decoration = DSBadgeStyle.resolve(
        variant: DSBadgeVariant.neutral,
        colors: DSColorScheme.light,
      ).toDecoration();

      expect(decoration.border, isA<Border>());
    });
  });

  test('should return text style with foreground color', () {
    final style = DSBadgeStyle.resolve(
      variant: DSBadgeVariant.primary,
      colors: DSColorScheme.light,
    );

    expect(style.textStyle.color, DSColorScheme.light.onPrimary);
  });
}
