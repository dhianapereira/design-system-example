import 'package:design_system/design_system.dart';
import 'package:design_system/src/components/cards/styles/ds_card_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('should return outlined style when variant is outlined', () {
    final style = DSCardStyle.resolve(
      variant: DSCardVariant.outlined,
      colors: DSColorScheme.light,
    );

    expect(style.backgroundColor, DSColorScheme.light.surface);
    expect(style.borderColor, DSColorScheme.light.border);
    expect(style.elevation, DSElevation.none);
  });

  test('should return elevated style when variant is elevated', () {
    final style = DSCardStyle.resolve(
      variant: DSCardVariant.elevated,
      colors: DSColorScheme.light,
    );

    expect(style.backgroundColor, DSColorScheme.light.surface);
    expect(style.borderColor, Colors.transparent);
    expect(style.elevation, DSElevation.sm);
  });

  test('should return filled style when variant is filled', () {
    final style = DSCardStyle.resolve(
      variant: DSCardVariant.filled,
      colors: DSColorScheme.light,
    );

    expect(style.backgroundColor, DSColorScheme.light.secondary);
    expect(style.borderColor, Colors.transparent);
    expect(style.elevation, DSElevation.none);
  });

  test('should return medium padding by default', () {
    final style = DSCardStyle.resolve(
      variant: DSCardVariant.outlined,
      colors: DSColorScheme.light,
    );

    expect(style.padding, const EdgeInsets.all(DSSpacing.lg));
  });

  test('should return selected padding', () {
    final style = DSCardStyle.resolve(
      variant: DSCardVariant.outlined,
      colors: DSColorScheme.light,
      padding: DSCardPadding.lg,
    );

    expect(style.padding, const EdgeInsets.all(DSSpacing.xl));
  });

  test('should return shape with border when border color is visible', () {
    final style = DSCardStyle.resolve(
      variant: DSCardVariant.outlined,
      colors: DSColorScheme.light,
    );
    final shape = style.shape as RoundedRectangleBorder;

    expect(shape.side.color, DSColorScheme.light.border);
    expect(shape.side.width, DSBorderWidth.thin);
  });
}
