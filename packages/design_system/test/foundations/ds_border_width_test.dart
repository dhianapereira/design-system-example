import 'package:design_system/design_system.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('should return 0 when token is none', () {
    expect(DSBorderWidth.none, 0);
  });

  test('should return 1 when token is thin', () {
    expect(DSBorderWidth.thin, 1);
  });

  test('should return 2 when token is medium', () {
    expect(DSBorderWidth.medium, 2);
  });

  test('should return 4 when token is thick', () {
    expect(DSBorderWidth.thick, 4);
  });
}
