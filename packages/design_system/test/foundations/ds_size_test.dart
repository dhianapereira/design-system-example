import 'package:design_system/design_system.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('should return 48 when token is minTouchTarget', () {
    expect(DSSize.minTouchTarget, 48);
  });

  test('should be accessible when token is minTouchTarget', () {
    expect(DSSize.minTouchTarget, greaterThanOrEqualTo(48));
  });

  test('should return 32 when token is controlSm', () {
    expect(DSSize.controlSm, 32);
  });

  test('should return 40 when token is controlMd', () {
    expect(DSSize.controlMd, 40);
  });

  test('should return 48 when token is controlLg', () {
    expect(DSSize.controlLg, 48);
  });

  test('should return 12 when token is iconXs', () {
    expect(DSSize.iconXs, 12);
  });

  test('should return 16 when token is iconSm', () {
    expect(DSSize.iconSm, 16);
  });

  test('should return 20 when token is iconMd', () {
    expect(DSSize.iconMd, 20);
  });

  test('should return 24 when token is iconLg', () {
    expect(DSSize.iconLg, 24);
  });

  test('should return 32 when token is iconXl', () {
    expect(DSSize.iconXl, 32);
  });

  test('should return 1200 when token is maxContentWidth', () {
    expect(DSSize.maxContentWidth, 1200);
  });
}
