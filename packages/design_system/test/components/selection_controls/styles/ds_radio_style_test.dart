import 'package:design_system/design_system.dart';
import 'package:design_system/src/components/selection_controls/styles/ds_radio_style.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';

void main() {
  test('should return primary active color', () {
    final style = DSRadioStyle.resolve(colors: DSColorScheme.light);

    expect(style.activeColor, DSColorScheme.light.primary);
  });

  test('should return border inactive color', () {
    final style = DSRadioStyle.resolve(colors: DSColorScheme.light);

    expect(style.inactiveColor, DSColorScheme.light.border);
  });

  test('should return error color', () {
    final style = DSRadioStyle.resolve(colors: DSColorScheme.light);

    expect(style.errorColor, DSColorScheme.light.error);
  });

  test('should return medium size style when size is omitted', () {
    final style = DSRadioStyle.resolve(colors: DSColorScheme.light);

    expect(style.sizeStyle.controlSize, DSSize.iconMd);
  });

  test('should return selected fill color', () {
    final style = DSRadioStyle.resolve(colors: DSColorScheme.light);

    expect(
      style.fillColor(hasError: false).resolve({WidgetState.selected}),
      DSColorScheme.light.primary,
    );
  });

  test('should return error fill color when hasError is true', () {
    final style = DSRadioStyle.resolve(colors: DSColorScheme.light);

    expect(
      style.fillColor(hasError: true).resolve({}),
      DSColorScheme.light.error,
    );
  });

  test('should return disabled fill color when disabled', () {
    final style = DSRadioStyle.resolve(colors: DSColorScheme.light);

    expect(
      style.fillColor(hasError: false).resolve({WidgetState.disabled}),
      DSColorScheme.light.border,
    );
  });

  test('should return error side when hasError is true', () {
    final style = DSRadioStyle.resolve(colors: DSColorScheme.light);

    expect(
      style.side(enabled: true, hasError: true).color,
      DSColorScheme.light.error,
    );
  });

  test('should return disabled label color when enabled is false', () {
    final style = DSRadioStyle.resolve(colors: DSColorScheme.light);

    expect(
      style.labelTextStyle(enabled: false).color,
      DSColorScheme.light.textDisabled,
    );
  });

  test('should return error supporting color when hasError is true', () {
    final style = DSRadioStyle.resolve(colors: DSColorScheme.light);

    expect(
      style.supportingTextStyle(enabled: true, hasError: true).color,
      DSColorScheme.light.error,
    );
  });
}
