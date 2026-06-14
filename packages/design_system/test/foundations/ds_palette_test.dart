import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('should return FFFFFFFF when token is neutral0', () {
    expect(DSPalette.neutral0, const Color(0xFFFFFFFF));
  });

  test('should return FBFCFE when token is neutral50', () {
    expect(DSPalette.neutral50, const Color(0xFFFBFCFE));
  });

  test('should return D7DCE5 when token is neutral200', () {
    expect(DSPalette.neutral200, const Color(0xFFD7DCE5));
  });

  test('should return 6E778A when token is neutral500', () {
    expect(DSPalette.neutral500, const Color(0xFF6E778A));
  });

  test('should return 172033 when token is neutral900', () {
    expect(DSPalette.neutral900, const Color(0xFF172033));
  });

  test('should return 1F2937 when token is neutral800', () {
    expect(DSPalette.neutral800, const Color(0xFF1F2937));
  });

  test('should return 111827 when token is neutral950', () {
    expect(DSPalette.neutral950, const Color(0xFF111827));
  });

  test('should return 374151 when token is slate700', () {
    expect(DSPalette.slate700, const Color(0xFF374151));
  });

  test('should return F9FAFB when token is slate50', () {
    expect(DSPalette.slate50, const Color(0xFFF9FAFB));
  });

  test('should return AAB2C0 when token is slate300', () {
    expect(DSPalette.slate300, const Color(0xFFAAB2C0));
  });

  test('should return E8F1FB when token is blue50', () {
    expect(DSPalette.blue50, const Color(0xFFE8F1FB));
  });

  test('should return 263B53 when token is blue900', () {
    expect(DSPalette.blue900, const Color(0xFF263B53));
  });

  test('should return 123A63 when token is blue950', () {
    expect(DSPalette.blue950, const Color(0xFF123A63));
  });

  test('should return 0B5CAD when token is blue600', () {
    expect(DSPalette.blue600, const Color(0xFF0B5CAD));
  });

  test('should return 0F68C4 when token is blue650', () {
    expect(DSPalette.blue650, const Color(0xFF0F68C4));
  });

  test('should return 7AB7FF when token is blue300', () {
    expect(DSPalette.blue300, const Color(0xFF7AB7FF));
  });

  test('should return 082340 when token is blue1000', () {
    expect(DSPalette.blue1000, const Color(0xFF082340));
  });

  test('should return E6F2FF when token is blue25', () {
    expect(DSPalette.blue25, const Color(0xFFE6F2FF));
  });

  test('should return B42318 when token is red600', () {
    expect(DSPalette.red600, const Color(0xFFB42318));
  });

  test('should return F97066 when token is red300', () {
    expect(DSPalette.red300, const Color(0xFFF97066));
  });

  test('should return FFFBFA when token is red25', () {
    expect(DSPalette.red25, const Color(0xFFFFFBFA));
  });

  test('should return 3B0A06 when token is red1000', () {
    expect(DSPalette.red1000, const Color(0xFF3B0A06));
  });
}
