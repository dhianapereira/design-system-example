import 'package:design_system/design_system.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('should return outlined when value is outlined', () {
    expect(DSCardVariant.outlined.name, 'outlined');
  });

  test('should return elevated when value is elevated', () {
    expect(DSCardVariant.elevated.name, 'elevated');
  });

  test('should return filled when value is filled', () {
    expect(DSCardVariant.filled.name, 'filled');
  });
}
