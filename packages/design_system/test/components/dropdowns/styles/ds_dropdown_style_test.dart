import 'package:design_system/design_system.dart';
import 'package:design_system/src/components/dropdowns/styles/ds_dropdown_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('DSDropdownStyle.resolve - ', () {
    test('should return transparent background when variant is outline', () {
      final style = DSDropdownStyle.resolve(
        variant: DSDropdownVariant.outline,
        colors: DSColorScheme.light,
      );

      expect(style.backgroundColor, Colors.transparent);
    });

    test('should return surface background when variant is filled', () {
      final style = DSDropdownStyle.resolve(
        variant: DSDropdownVariant.filled,
        colors: DSColorScheme.light,
      );

      expect(style.backgroundColor, DSColorScheme.light.surface);
    });

    test('should return border color when style is resolved', () {
      final style = DSDropdownStyle.resolve(
        variant: DSDropdownVariant.outline,
        colors: DSColorScheme.light,
      );

      expect(style.borderColor, DSColorScheme.light.border);
    });

    test('should return focus color when style is resolved', () {
      final style = DSDropdownStyle.resolve(
        variant: DSDropdownVariant.outline,
        colors: DSColorScheme.light,
      );

      expect(style.focusColor, DSColorScheme.light.focus);
    });

    test('should return error color when style is resolved', () {
      final style = DSDropdownStyle.resolve(
        variant: DSDropdownVariant.outline,
        colors: DSColorScheme.light,
      );

      expect(style.errorColor, DSColorScheme.light.error);
    });

    test('should return medium size style when size is omitted', () {
      final style = DSDropdownStyle.resolve(
        variant: DSDropdownVariant.outline,
        colors: DSColorScheme.light,
      );

      expect(style.sizeStyle.minHeight, DSSize.controlMd);
    });
  });

  group('DSDropdownStyle.toInputDecoration - ', () {
    test('should return labelText when label is provided', () {
      final decoration = _decoration(label: 'Country');

      expect(decoration.labelText, 'Country');
    });

    test('should return hintText when hintText is provided', () {
      final decoration = _decoration(hintText: 'Select country');

      expect(decoration.hintText, 'Select country');
    });

    test('should return helperText when helperText is provided', () {
      final decoration = _decoration(helperText: 'Choose your country');

      expect(decoration.helperText, 'Choose your country');
    });

    test('should return errorText when errorText is provided', () {
      final decoration = _decoration(errorText: 'Country is required');

      expect(decoration.errorText, 'Country is required');
    });

    test('should return filled false when variant is outline', () {
      final decoration = _decoration();

      expect(decoration.filled, isFalse);
    });

    test('should return filled true when variant is filled', () {
      final decoration = _decoration(variant: DSDropdownVariant.filled);

      expect(decoration.filled, isTrue);
    });
  });
}

InputDecoration _decoration({
  DSDropdownVariant variant = DSDropdownVariant.outline,
  String? label,
  String? hintText,
  String? helperText,
  String? errorText,
}) {
  return DSDropdownStyle.resolve(
    variant: variant,
    colors: DSColorScheme.light,
  ).toInputDecoration(
    label: label,
    hintText: hintText,
    helperText: helperText,
    errorText: errorText,
    prefixIcon: null,
  );
}
