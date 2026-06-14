import 'package:design_system/design_system.dart';
import 'package:design_system/src/components/text_fields/styles/ds_text_field_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('DSTextFieldStyle.resolve - ', () {
    test('should return transparent background when variant is outline', () {
      final style = DSTextFieldStyle.resolve(
        variant: DSTextFieldVariant.outline,
        colors: DSColorScheme.light,
      );

      expect(style.backgroundColor, Colors.transparent);
    });

    test('should return surface background when variant is filled', () {
      final style = DSTextFieldStyle.resolve(
        variant: DSTextFieldVariant.filled,
        colors: DSColorScheme.light,
      );

      expect(style.backgroundColor, DSColorScheme.light.surface);
    });

    test('should return border color when style is resolved', () {
      final style = DSTextFieldStyle.resolve(
        variant: DSTextFieldVariant.outline,
        colors: DSColorScheme.light,
      );

      expect(style.borderColor, DSColorScheme.light.border);
    });

    test('should return focus color when style is resolved', () {
      final style = DSTextFieldStyle.resolve(
        variant: DSTextFieldVariant.outline,
        colors: DSColorScheme.light,
      );

      expect(style.focusColor, DSColorScheme.light.focus);
    });

    test('should return error color when style is resolved', () {
      final style = DSTextFieldStyle.resolve(
        variant: DSTextFieldVariant.outline,
        colors: DSColorScheme.light,
      );

      expect(style.errorColor, DSColorScheme.light.error);
    });

    test('should return medium size style when size is omitted', () {
      final style = DSTextFieldStyle.resolve(
        variant: DSTextFieldVariant.outline,
        colors: DSColorScheme.light,
      );

      expect(style.sizeStyle.minHeight, DSSize.controlMd);
    });

    test('should return small size style when size is sm', () {
      final style = DSTextFieldStyle.resolve(
        variant: DSTextFieldVariant.outline,
        colors: DSColorScheme.light,
        size: DSTextFieldSize.sm,
      );

      expect(style.sizeStyle.minHeight, DSSize.controlSm);
    });
  });

  group('DSTextFieldStyle.toInputDecoration - ', () {
    test('should return labelText when label is provided', () {
      final decoration = _decoration(label: 'Name');

      expect(decoration.labelText, 'Name');
    });

    test('should return hintText when hintText is provided', () {
      final decoration = _decoration(hintText: 'Type your name');

      expect(decoration.hintText, 'Type your name');
    });

    test('should return helperText when helperText is provided', () {
      final decoration = _decoration(helperText: 'Use your full name');

      expect(decoration.helperText, 'Use your full name');
    });

    test('should return errorText when errorText is provided', () {
      final decoration = _decoration(errorText: 'Name is required');

      expect(decoration.errorText, 'Name is required');
    });

    test('should return filled false when variant is outline', () {
      final decoration = _decoration();

      expect(decoration.filled, isFalse);
    });

    test('should return filled true when variant is filled', () {
      final decoration = _decoration(variant: DSTextFieldVariant.filled);

      expect(decoration.filled, isTrue);
    });

    test('should return design system padding when style is resolved', () {
      final decoration = _decoration();

      expect(
        decoration.contentPadding,
        const EdgeInsets.symmetric(
          horizontal: DSSpacing.lg,
          vertical: DSSpacing.sm,
        ),
      );
    });
  });
}

InputDecoration _decoration({
  DSTextFieldVariant variant = DSTextFieldVariant.outline,
  String? label,
  String? hintText,
  String? helperText,
  String? errorText,
}) {
  return DSTextFieldStyle.resolve(
    variant: variant,
    colors: DSColorScheme.light,
  ).toInputDecoration(
    label: label,
    hintText: hintText,
    helperText: helperText,
    errorText: errorText,
    prefixIcon: null,
    suffixIcon: null,
  );
}
