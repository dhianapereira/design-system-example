import 'package:design_system/design_system.dart';
import 'package:design_system/src/components/selection_controls/styles/ds_switch_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('should return primary active track color', () {
    final style = DSSwitchStyle.resolve(colors: DSColorScheme.light);

    expect(style.activeTrackColor, DSColorScheme.light.primary);
  });

  test('should return onPrimary active thumb color', () {
    final style = DSSwitchStyle.resolve(colors: DSColorScheme.light);

    expect(style.activeThumbColor, DSColorScheme.light.onPrimary);
  });

  test('should return error track color', () {
    final style = DSSwitchStyle.resolve(colors: DSColorScheme.light);

    expect(style.errorTrackColor, DSColorScheme.light.error);
  });

  test('should return medium size style when size is omitted', () {
    final style = DSSwitchStyle.resolve(colors: DSColorScheme.light);

    expect(style.sizeStyle.controlWidth, 52);
  });

  test('should return selected track color', () {
    final style = DSSwitchStyle.resolve(colors: DSColorScheme.light);

    expect(
      style.trackColor(hasError: false).resolve({WidgetState.selected}),
      DSColorScheme.light.primary,
    );
  });

  test('should return selected error track color', () {
    final style = DSSwitchStyle.resolve(colors: DSColorScheme.light);

    expect(
      style.trackColor(hasError: true).resolve({WidgetState.selected}),
      DSColorScheme.light.error,
    );
  });

  test('should return inactive track color when unselected', () {
    final style = DSSwitchStyle.resolve(colors: DSColorScheme.light);

    expect(
      style.trackColor(hasError: false).resolve({}),
      DSColorScheme.light.surface,
    );
  });

  test('should return disabled track color when disabled', () {
    final style = DSSwitchStyle.resolve(colors: DSColorScheme.light);

    expect(
      style.trackColor(hasError: false).resolve({WidgetState.disabled}),
      DSColorScheme.light.border,
    );
  });

  test('should return selected thumb color', () {
    final style = DSSwitchStyle.resolve(colors: DSColorScheme.light);

    expect(
      style.thumbColor(hasError: false).resolve({WidgetState.selected}),
      DSColorScheme.light.onPrimary,
    );
  });

  test('should return error outline when hasError is true', () {
    final style = DSSwitchStyle.resolve(colors: DSColorScheme.light);

    expect(
      style.trackOutlineColor(hasError: true).resolve({}),
      DSColorScheme.light.error,
    );
  });

  test('should return disabled label color when enabled is false', () {
    final style = DSSwitchStyle.resolve(colors: DSColorScheme.light);

    expect(
      style.labelTextStyle(enabled: false).color,
      DSColorScheme.light.textDisabled,
    );
  });

  test('should return error supporting color when hasError is true', () {
    final style = DSSwitchStyle.resolve(colors: DSColorScheme.light);

    expect(
      style.supportingTextStyle(enabled: true, hasError: true).color,
      DSColorScheme.light.error,
    );
  });
}
