import 'package:design_system/design_system.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('should return Roboto when token is fontFamily', () {
    expect(DSTypography.fontFamily, 'Roboto');
  });

  test('should return displayLarge style when token is displayLarge', () {
    expectTextStyle(
      DSTypography.displayLarge,
      fontSize: 57,
      fontWeight: FontWeight.w400,
      height: 1.12,
    );
  });

  test('should return displayMedium style when token is displayMedium', () {
    expectTextStyle(
      DSTypography.displayMedium,
      fontSize: 45,
      fontWeight: FontWeight.w400,
      height: 1.16,
    );
  });

  test('should return displaySmall style when token is displaySmall', () {
    expectTextStyle(
      DSTypography.displaySmall,
      fontSize: 36,
      fontWeight: FontWeight.w400,
      height: 1.22,
    );
  });

  test('should return headlineLarge style when token is headlineLarge', () {
    expectTextStyle(
      DSTypography.headlineLarge,
      fontSize: 32,
      fontWeight: FontWeight.w600,
      height: 1.25,
    );
  });

  test('should return headlineMedium style when token is headlineMedium', () {
    expectTextStyle(
      DSTypography.headlineMedium,
      fontSize: 28,
      fontWeight: FontWeight.w600,
      height: 1.29,
    );
  });

  test('should return headlineSmall style when token is headlineSmall', () {
    expectTextStyle(
      DSTypography.headlineSmall,
      fontSize: 24,
      fontWeight: FontWeight.w600,
      height: 1.33,
    );
  });

  test('should return titleLarge style when token is titleLarge', () {
    expectTextStyle(
      DSTypography.titleLarge,
      fontSize: 22,
      fontWeight: FontWeight.w600,
      height: 1.27,
    );
  });

  test('should return titleMedium style when token is titleMedium', () {
    expectTextStyle(
      DSTypography.titleMedium,
      fontSize: 16,
      fontWeight: FontWeight.w600,
      height: 1.5,
    );
  });

  test('should return titleSmall style when token is titleSmall', () {
    expectTextStyle(
      DSTypography.titleSmall,
      fontSize: 14,
      fontWeight: FontWeight.w600,
      height: 1.43,
    );
  });

  test('should return labelLarge style when token is labelLarge', () {
    expectTextStyle(
      DSTypography.labelLarge,
      fontSize: 16,
      fontWeight: FontWeight.w600,
      height: 1.25,
    );
  });

  test('should return labelMedium style when token is labelMedium', () {
    expectTextStyle(
      DSTypography.labelMedium,
      fontSize: 14,
      fontWeight: FontWeight.w600,
      height: 1.43,
    );
  });

  test('should return labelSmall style when token is labelSmall', () {
    expectTextStyle(
      DSTypography.labelSmall,
      fontSize: 12,
      fontWeight: FontWeight.w600,
      height: 1.33,
    );
  });

  test('should return bodyLarge style when token is bodyLarge', () {
    expectTextStyle(
      DSTypography.bodyLarge,
      fontSize: 16,
      fontWeight: FontWeight.w400,
      height: 1.5,
    );
  });

  test('should return bodyMedium style when token is bodyMedium', () {
    expectTextStyle(
      DSTypography.bodyMedium,
      fontSize: 14,
      fontWeight: FontWeight.w400,
      height: 1.4,
    );
  });

  test('should return bodySmall style when token is bodySmall', () {
    expectTextStyle(
      DSTypography.bodySmall,
      fontSize: 12,
      fontWeight: FontWeight.w400,
      height: 1.33,
    );
  });
}

void expectTextStyle(
  TextStyle style, {
  required double fontSize,
  required FontWeight fontWeight,
  required double height,
}) {
  expect(
    style,
    isA<TextStyle>()
        .having(
          (style) => style.fontFamily,
          'fontFamily',
          DSTypography.fontFamily,
        )
        .having((style) => style.fontSize, 'fontSize', fontSize)
        .having((style) => style.fontWeight, 'fontWeight', fontWeight)
        .having((style) => style.height, 'height', height),
  );
}
