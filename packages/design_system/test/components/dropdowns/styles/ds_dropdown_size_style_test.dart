import 'package:design_system/design_system.dart';
import 'package:design_system/src/components/dropdowns/styles/ds_dropdown_size_style.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('should return controlSm when size is sm', () {
    final style = DSDropdownSizeStyle.resolve(DSDropdownSize.sm);

    expect(style.minHeight, DSSize.controlSm);
  });

  test('should return controlMd when size is md', () {
    final style = DSDropdownSizeStyle.resolve(DSDropdownSize.md);

    expect(style.minHeight, DSSize.controlMd);
  });

  test('should return controlLg when size is lg', () {
    final style = DSDropdownSizeStyle.resolve(DSDropdownSize.lg);

    expect(style.minHeight, DSSize.controlLg);
  });

  test('should return iconSm when size is sm', () {
    final style = DSDropdownSizeStyle.resolve(DSDropdownSize.sm);

    expect(style.iconSize, DSSize.iconSm);
  });

  test('should return iconMd when size is md', () {
    final style = DSDropdownSizeStyle.resolve(DSDropdownSize.md);

    expect(style.iconSize, DSSize.iconMd);
  });

  test('should return iconLg when size is lg', () {
    final style = DSDropdownSizeStyle.resolve(DSDropdownSize.lg);

    expect(style.iconSize, DSSize.iconLg);
  });
}
