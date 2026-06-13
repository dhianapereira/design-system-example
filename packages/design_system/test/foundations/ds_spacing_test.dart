import 'package:design_system/design_system.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('should return 0 when token is none', () {
    expect(DSSpacing.none, 0);
  });

  test('should return 2 when token is xxs', () {
    expect(DSSpacing.xxs, 2);
  });

  test('should return 4 when token is xs', () {
    expect(DSSpacing.xs, 4);
  });

  test('should return 8 when token is sm', () {
    expect(DSSpacing.sm, 8);
  });

  test('should return 12 when token is md', () {
    expect(DSSpacing.md, 12);
  });

  test('should return 16 when token is lg', () {
    expect(DSSpacing.lg, 16);
  });

  test('should return 24 when token is xl', () {
    expect(DSSpacing.xl, 24);
  });

  test('should return 32 when token is xxl', () {
    expect(DSSpacing.xxl, 32);
  });

  test('should return 40 when token is xxxl', () {
    expect(DSSpacing.xxxl, 40);
  });

  test('should return 64 when token is huge', () {
    expect(DSSpacing.huge, 64);
  });
}
