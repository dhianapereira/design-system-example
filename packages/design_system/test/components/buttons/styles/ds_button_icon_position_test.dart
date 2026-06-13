import 'package:design_system/design_system.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('DSButtonIconPosition', () {
    test('should return start when value is start', () {
      expect(DSButtonIconPosition.start.name, 'start');
    });

    test('should return end when value is end', () {
      expect(DSButtonIconPosition.end.name, 'end');
    });

    test('should return top when value is top', () {
      expect(DSButtonIconPosition.top.name, 'top');
    });

    test('should return bottom when value is bottom', () {
      expect(DSButtonIconPosition.bottom.name, 'bottom');
    });
  });
}
