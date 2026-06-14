import 'package:design_system/design_system.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('should return sm when value is sm', () {
    expect(DSRadioSize.sm.name, 'sm');
  });

  test('should return md when value is md', () {
    expect(DSRadioSize.md.name, 'md');
  });

  test('should return lg when value is lg', () {
    expect(DSRadioSize.lg.name, 'lg');
  });
}
