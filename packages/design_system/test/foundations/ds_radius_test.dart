import 'package:design_system/design_system.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('should return 0 when token is none', () {
    expect(DSRadius.none, 0);
  });

  test('should return 4 when token is xs', () {
    expect(DSRadius.xs, 4);
  });

  test('should return 6 when token is sm', () {
    expect(DSRadius.sm, 6);
  });

  test('should return 8 when token is md', () {
    expect(DSRadius.md, 8);
  });

  test('should return 12 when token is lg', () {
    expect(DSRadius.lg, 12);
  });

  test('should return 16 when token is xl', () {
    expect(DSRadius.xl, 16);
  });

  test('should return 999 when token is pill', () {
    expect(DSRadius.pill, 999);
  });
}
