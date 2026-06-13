import 'package:design_system/design_system.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('should return zero duration when token is instant', () {
    expect(DSMotion.instant, Duration.zero);
  });

  test('should return 150 milliseconds when token is fast', () {
    expect(DSMotion.fast, const Duration(milliseconds: 150));
  });

  test('should return 250 milliseconds when token is normal', () {
    expect(DSMotion.normal, const Duration(milliseconds: 250));
  });

  test('should return 400 milliseconds when token is slow', () {
    expect(DSMotion.slow, const Duration(milliseconds: 400));
  });

  test('should return easeInOutCubic when token is standard', () {
    expect(DSMotion.standard, Curves.easeInOutCubic);
  });

  test('should return easeOutCubic when token is enter', () {
    expect(DSMotion.enter, Curves.easeOutCubic);
  });

  test('should return easeInCubic when token is exit', () {
    expect(DSMotion.exit, Curves.easeInCubic);
  });
}
