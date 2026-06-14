import 'package:design_system/design_system.dart';
import 'package:design_system/src/components/selection_controls/styles/ds_checkbox_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('should return primary active color', () {
    final style = DSCheckboxStyle.resolve(colors: DSColorScheme.light);

    expect(style.activeColor, DSColorScheme.light.primary);
  });

  test('should return onPrimary check color', () {
    final style = DSCheckboxStyle.resolve(colors: DSColorScheme.light);

    expect(style.checkColor, DSColorScheme.light.onPrimary);
  });

  test('should return error color', () {
    final style = DSCheckboxStyle.resolve(colors: DSColorScheme.light);

    expect(style.errorColor, DSColorScheme.light.error);
  });

  test('should return medium size style when size is omitted', () {
    final style = DSCheckboxStyle.resolve(colors: DSColorScheme.light);

    expect(style.sizeStyle.controlSize, DSSize.iconMd);
  });

  test('should return selected fill color', () {
    final style = DSCheckboxStyle.resolve(colors: DSColorScheme.light);

    expect(
      style.fillColor(hasError: false).resolve({WidgetState.selected}),
      DSColorScheme.light.primary,
    );
  });

  test('should return selected error fill color', () {
    final style = DSCheckboxStyle.resolve(colors: DSColorScheme.light);

    expect(
      style.fillColor(hasError: true).resolve({WidgetState.selected}),
      DSColorScheme.light.error,
    );
  });

  test('should return transparent fill color when unselected', () {
    final style = DSCheckboxStyle.resolve(colors: DSColorScheme.light);

    expect(style.fillColor(hasError: false).resolve({}), Colors.transparent);
  });

  test('should return disabled fill color when disabled and selected', () {
    final style = DSCheckboxStyle.resolve(colors: DSColorScheme.light);

    expect(
      style.fillColor(hasError: false).resolve({
        WidgetState.disabled,
        WidgetState.selected,
      }),
      DSColorScheme.light.border,
    );
  });

  test('should return error border when hasError is true', () {
    final style = DSCheckboxStyle.resolve(colors: DSColorScheme.light);

    expect(
      style.side(enabled: true, hasError: true).color,
      DSColorScheme.light.error,
    );
  });

  test('should return disabled label color when enabled is false', () {
    final style = DSCheckboxStyle.resolve(colors: DSColorScheme.light);

    expect(
      style.labelTextStyle(enabled: false).color,
      DSColorScheme.light.textDisabled,
    );
  });

  test('should return error supporting color when hasError is true', () {
    final style = DSCheckboxStyle.resolve(colors: DSColorScheme.light);

    expect(
      style.supportingTextStyle(enabled: true, hasError: true).color,
      DSColorScheme.light.error,
    );
  });
}
