import 'package:flutter/material.dart';

/// Primitive color tokens used to compose semantic color schemes.
abstract final class DSPalette {
  /// Pure white neutral color.
  static const Color neutral0 = Color(0xFFFFFFFF);

  /// Near-white neutral color used by app backgrounds.
  static const Color neutral50 = Color(0xFFFBFCFE);

  /// Light neutral color used by subtle borders.
  static const Color neutral200 = Color(0xFFD7DCE5);

  /// Mid neutral color used by secondary or disabled text.
  static const Color neutral500 = Color(0xFF6E778A);

  /// Dark neutral color used by primary text in light mode.
  static const Color neutral900 = Color(0xFF172033);

  /// Dark surface color used in dark mode.
  static const Color neutral800 = Color(0xFF1F2937);

  /// Dark background color used in dark mode.
  static const Color neutral950 = Color(0xFF111827);

  /// Dark border color used in dark mode.
  static const Color slate700 = Color(0xFF374151);

  /// Light text color used in dark mode.
  static const Color slate50 = Color(0xFFF9FAFB);

  /// Disabled text color used in dark mode.
  static const Color slate300 = Color(0xFFAAB2C0);

  /// Light blue color used by secondary actions in light mode.
  static const Color blue50 = Color(0xFFE8F1FB);

  /// Soft blue color used by secondary actions in dark mode.
  static const Color blue900 = Color(0xFF263B53);

  /// Dark blue text color used on light blue surfaces.
  static const Color blue950 = Color(0xFF123A63);

  /// Strong blue color used by primary actions in light mode.
  static const Color blue600 = Color(0xFF0B5CAD);

  /// Focus blue color used in light mode.
  static const Color blue650 = Color(0xFF0F68C4);

  /// Light blue color used by primary actions in dark mode.
  static const Color blue300 = Color(0xFF7AB7FF);

  /// Deep blue color used for text on light blue in dark mode.
  static const Color blue1000 = Color(0xFF082340);

  /// Near-white blue color used on dark blue surfaces.
  static const Color blue25 = Color(0xFFE6F2FF);

  /// Strong red color used by error states in light mode.
  static const Color red600 = Color(0xFFB42318);

  /// Light red color used by error states in dark mode.
  static const Color red300 = Color(0xFFF97066);

  /// Near-white red color used on strong red surfaces.
  static const Color red25 = Color(0xFFFFFBFA);

  /// Deep red color used for text on light red surfaces.
  static const Color red1000 = Color(0xFF3B0A06);
}
