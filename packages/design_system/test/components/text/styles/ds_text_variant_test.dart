import 'package:design_system/design_system.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('should return displayLarge style when token is displayLarge', () {
    expect(DSTextVariant.displayLarge.style, DSTypography.displayLarge);
  });

  test('should return displayMedium style when token is displayMedium', () {
    expect(DSTextVariant.displayMedium.style, DSTypography.displayMedium);
  });

  test('should return displaySmall style when token is displaySmall', () {
    expect(DSTextVariant.displaySmall.style, DSTypography.displaySmall);
  });

  test('should return headlineLarge style when token is headlineLarge', () {
    expect(DSTextVariant.headlineLarge.style, DSTypography.headlineLarge);
  });

  test('should return headlineMedium style when token is headlineMedium', () {
    expect(DSTextVariant.headlineMedium.style, DSTypography.headlineMedium);
  });

  test('should return headlineSmall style when token is headlineSmall', () {
    expect(DSTextVariant.headlineSmall.style, DSTypography.headlineSmall);
  });

  test('should return titleLarge style when token is titleLarge', () {
    expect(DSTextVariant.titleLarge.style, DSTypography.titleLarge);
  });

  test('should return titleMedium style when token is titleMedium', () {
    expect(DSTextVariant.titleMedium.style, DSTypography.titleMedium);
  });

  test('should return titleSmall style when token is titleSmall', () {
    expect(DSTextVariant.titleSmall.style, DSTypography.titleSmall);
  });

  test('should return labelLarge style when token is labelLarge', () {
    expect(DSTextVariant.labelLarge.style, DSTypography.labelLarge);
  });

  test('should return labelMedium style when token is labelMedium', () {
    expect(DSTextVariant.labelMedium.style, DSTypography.labelMedium);
  });

  test('should return labelSmall style when token is labelSmall', () {
    expect(DSTextVariant.labelSmall.style, DSTypography.labelSmall);
  });

  test('should return bodyLarge style when token is bodyLarge', () {
    expect(DSTextVariant.bodyLarge.style, DSTypography.bodyLarge);
  });

  test('should return bodyMedium style when token is bodyMedium', () {
    expect(DSTextVariant.bodyMedium.style, DSTypography.bodyMedium);
  });

  test('should return bodySmall style when token is bodySmall', () {
    expect(DSTextVariant.bodySmall.style, DSTypography.bodySmall);
  });
}
