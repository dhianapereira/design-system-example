import 'package:design_system/design_system.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('should return none when value is none', () {
    expect(DSCardPadding.none.name, 'none');
  });

  test('should return sm when value is sm', () {
    expect(DSCardPadding.sm.name, 'sm');
  });

  test('should return md when value is md', () {
    expect(DSCardPadding.md.name, 'md');
  });

  test('should return lg when value is lg', () {
    expect(DSCardPadding.lg.name, 'lg');
  });
}
