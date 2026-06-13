import 'package:design_system/design_system.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('should return 0 when token is none', () {
    expect(DSElevation.none, 0);
  });

  test('should return 1 when token is sm', () {
    expect(DSElevation.sm, 1);
  });

  test('should return 3 when token is md', () {
    expect(DSElevation.md, 3);
  });

  test('should return 6 when token is lg', () {
    expect(DSElevation.lg, 6);
  });

  test('should return 12 when token is xl', () {
    expect(DSElevation.xl, 12);
  });
}
