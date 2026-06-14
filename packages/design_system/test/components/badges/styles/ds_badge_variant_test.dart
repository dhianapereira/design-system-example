import 'package:design_system/design_system.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('should return neutral when value is neutral', () {
    expect(DSBadgeVariant.neutral.name, 'neutral');
  });

  test('should return primary when value is primary', () {
    expect(DSBadgeVariant.primary.name, 'primary');
  });

  test('should return secondary when value is secondary', () {
    expect(DSBadgeVariant.secondary.name, 'secondary');
  });

  test('should return error when value is error', () {
    expect(DSBadgeVariant.error.name, 'error');
  });
}
