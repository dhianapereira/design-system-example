import 'package:design_system/design_system.dart';
import 'package:design_system/src/components/selection_controls/styles/ds_switch_size_style.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('should return compact values when size is sm', () {
    final style = DSSwitchSizeStyle.resolve(DSSwitchSize.sm);

    expect(style.controlWidth, 44);
    expect(style.gap, DSSpacing.sm);
    expect(style.labelTextStyle.fontSize, DSTypography.bodySmall.fontSize);
  });

  test('should return default values when size is md', () {
    final style = DSSwitchSizeStyle.resolve(DSSwitchSize.md);

    expect(style.controlWidth, 52);
    expect(style.gap, DSSpacing.md);
    expect(style.labelTextStyle.fontSize, DSTypography.bodyMedium.fontSize);
  });

  test('should return larger values when size is lg', () {
    final style = DSSwitchSizeStyle.resolve(DSSwitchSize.lg);

    expect(style.controlWidth, 60);
    expect(style.gap, DSSpacing.md);
    expect(style.labelTextStyle.fontSize, DSTypography.bodyLarge.fontSize);
  });

  test('should calculate scale from default switch visual width', () {
    final style = DSSwitchSizeStyle.resolve(DSSwitchSize.lg);

    expect(style.scale, 60 / 52);
  });
}
