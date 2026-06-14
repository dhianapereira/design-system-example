import 'package:design_system/design_system.dart';
import 'package:design_system/src/components/badges/styles/ds_badge_size_style.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('should return compact values when size is sm', () {
    final style = DSBadgeSizeStyle.resolve(DSBadgeSize.sm);

    expect(style.minHeight, 20);
    expect(style.horizontalPadding, DSSpacing.sm);
    expect(style.iconSize, DSSize.iconXs);
    expect(style.textStyle.fontSize, DSTypography.labelSmall.fontSize);
  });

  test('should return default values when size is md', () {
    final style = DSBadgeSizeStyle.resolve(DSBadgeSize.md);

    expect(style.minHeight, 24);
    expect(style.horizontalPadding, DSSpacing.md);
    expect(style.iconSize, DSSize.iconSm);
    expect(style.textStyle.fontSize, DSTypography.labelSmall.fontSize);
  });

  test('should return larger values when size is lg', () {
    final style = DSBadgeSizeStyle.resolve(DSBadgeSize.lg);

    expect(style.minHeight, 28);
    expect(style.horizontalPadding, DSSpacing.md);
    expect(style.iconSize, DSSize.iconSm);
    expect(style.textStyle.fontSize, DSTypography.labelMedium.fontSize);
  });
}
