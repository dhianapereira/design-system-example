import 'package:design_system/design_system.dart';
import 'package:design_system/src/components/selection_controls/styles/ds_radio_size_style.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('should return compact values when size is sm', () {
    final style = DSRadioSizeStyle.resolve(DSRadioSize.sm);

    expect(style.controlSize, DSSize.iconSm);
    expect(style.gap, DSSpacing.sm);
    expect(style.labelTextStyle.fontSize, DSTypography.bodySmall.fontSize);
  });

  test('should return default values when size is md', () {
    final style = DSRadioSizeStyle.resolve(DSRadioSize.md);

    expect(style.controlSize, DSSize.iconMd);
    expect(style.gap, DSSpacing.md);
    expect(style.labelTextStyle.fontSize, DSTypography.bodyMedium.fontSize);
  });

  test('should return larger values when size is lg', () {
    final style = DSRadioSizeStyle.resolve(DSRadioSize.lg);

    expect(style.controlSize, DSSize.iconLg);
    expect(style.gap, DSSpacing.md);
    expect(style.labelTextStyle.fontSize, DSTypography.bodyLarge.fontSize);
  });

  test('should calculate scale from default radio visual size', () {
    final style = DSRadioSizeStyle.resolve(DSRadioSize.md);

    expect(style.scale, DSSize.iconMd / 20);
  });
}
