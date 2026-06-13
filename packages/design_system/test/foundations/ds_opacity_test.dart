import 'package:design_system/design_system.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('should return 0 when token is transparent', () {
    expect(DSOpacity.transparent, 0);
  });

  test('should return 0.38 when token is disabled', () {
    expect(DSOpacity.disabled, 0.38);
  });

  test('should return 0.08 when token is subtle', () {
    expect(DSOpacity.subtle, 0.08);
  });

  test('should return 0.12 when token is hover', () {
    expect(DSOpacity.hover, 0.12);
  });

  test('should return 0.16 when token is pressed', () {
    expect(DSOpacity.pressed, 0.16);
  });

  test('should return 1 when token is opaque', () {
    expect(DSOpacity.opaque, 1);
  });

  test('should stay between 0 and 1 when token is transparent', () {
    expect(DSOpacity.transparent, inInclusiveRange(0, 1));
  });

  test('should stay between 0 and 1 when token is disabled', () {
    expect(DSOpacity.disabled, inInclusiveRange(0, 1));
  });

  test('should stay between 0 and 1 when token is subtle', () {
    expect(DSOpacity.subtle, inInclusiveRange(0, 1));
  });

  test('should stay between 0 and 1 when token is hover', () {
    expect(DSOpacity.hover, inInclusiveRange(0, 1));
  });

  test('should stay between 0 and 1 when token is pressed', () {
    expect(DSOpacity.pressed, inInclusiveRange(0, 1));
  });

  test('should stay between 0 and 1 when token is opaque', () {
    expect(DSOpacity.opaque, inInclusiveRange(0, 1));
  });
}
