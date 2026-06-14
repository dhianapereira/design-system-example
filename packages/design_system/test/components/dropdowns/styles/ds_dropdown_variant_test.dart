import 'package:design_system/design_system.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('should return outline when value is outline', () {
    expect(DSDropdownVariant.outline.name, 'outline');
  });

  test('should return filled when value is filled', () {
    expect(DSDropdownVariant.filled.name, 'filled');
  });
}
