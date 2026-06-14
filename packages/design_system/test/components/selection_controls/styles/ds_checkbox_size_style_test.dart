import 'package:design_system/design_system.dart';
import 'package:design_system/src/components/selection_controls/styles/ds_checkbox_size_style.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('should return compact values when size is sm', () {
    final style = DSCheckboxSizeStyle.resolve(DSCheckboxSize.sm);

    expect(style.controlSize, DSSize.iconSm);
    expect(style.gap, DSSpacing.sm);
    expect(style.labelTextStyle.fontSize, DSTypography.bodySmall.fontSize);
  });

  test('should return default values when size is md', () {
    final style = DSCheckboxSizeStyle.resolve(DSCheckboxSize.md);

    expect(style.controlSize, DSSize.iconMd);
    expect(style.gap, DSSpacing.md);
    expect(style.labelTextStyle.fontSize, DSTypography.bodyMedium.fontSize);
  });

  test('should return larger values when size is lg', () {
    final style = DSCheckboxSizeStyle.resolve(DSCheckboxSize.lg);

    expect(style.controlSize, DSSize.iconLg);
    expect(style.gap, DSSpacing.md);
    expect(style.labelTextStyle.fontSize, DSTypography.bodyLarge.fontSize);
  });

  test('should calculate scale from default checkbox visual size', () {
    final style = DSCheckboxSizeStyle.resolve(DSCheckboxSize.md);

    expect(style.scale, DSSize.iconMd / 18);
  });
}
