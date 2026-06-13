import 'package:design_system/design_system.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('DSButtonVariant', () {
    test('should return primary when value is primary', () {
      expect(DSButtonVariant.primary.name, 'primary');
    });

    test('should return secondary when value is secondary', () {
      expect(DSButtonVariant.secondary.name, 'secondary');
    });

    test('should return outline when value is outline', () {
      expect(DSButtonVariant.outline.name, 'outline');
    });
  });
}
