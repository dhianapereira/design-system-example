import 'package:design_system/design_system.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('should return vertical when value is vertical', () {
    expect(DSRadioGroupAxis.vertical.name, 'vertical');
  });

  test('should return horizontal when value is horizontal', () {
    expect(DSRadioGroupAxis.horizontal.name, 'horizontal');
  });
}
