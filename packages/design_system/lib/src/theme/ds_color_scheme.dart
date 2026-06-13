import 'package:flutter/material.dart';
import 'package:design_system/src/foundations/ds_palette.dart';

/// Semantic colors consumed by Design System components.
@immutable
class DSColorScheme {
  /// Creates a color scheme with semantic slots instead of raw palette names.
  const DSColorScheme({
    required this.background,
    required this.surface,
    required this.textPrimary,
    required this.textDisabled,
    required this.border,
    required this.focus,
    required this.primary,
    required this.onPrimary,
    required this.secondary,
    required this.onSecondary,
  });

  final Color background;
  final Color surface;
  final Color textPrimary;
  final Color textDisabled;
  final Color border;

  /// Color used to communicate keyboard or input focus.
  final Color focus;
  final Color primary;
  final Color onPrimary;
  final Color secondary;
  final Color onSecondary;

  /// Default color scheme for light mode.
  static const light = DSColorScheme(
    background: DSPalette.neutral50,
    surface: DSPalette.neutral0,
    textPrimary: DSPalette.neutral900,
    textDisabled: DSPalette.neutral500,
    border: DSPalette.neutral200,
    focus: DSPalette.blue650,
    primary: DSPalette.blue600,
    onPrimary: DSPalette.neutral0,
    secondary: DSPalette.blue50,
    onSecondary: DSPalette.blue950,
  );

  /// Default color scheme for dark mode.
  static const dark = DSColorScheme(
    background: DSPalette.neutral950,
    surface: DSPalette.neutral800,
    textPrimary: DSPalette.slate50,
    textDisabled: DSPalette.slate300,
    border: DSPalette.slate700,
    focus: DSPalette.blue300,
    primary: DSPalette.blue300,
    onPrimary: DSPalette.blue1000,
    secondary: DSPalette.blue900,
    onSecondary: DSPalette.blue25,
  );

  /// Returns a copy of this color scheme with selected slots replaced.
  DSColorScheme copyWith({
    Color? background,
    Color? surface,
    Color? textPrimary,
    Color? textDisabled,
    Color? border,
    Color? focus,
    Color? primary,
    Color? onPrimary,
    Color? secondary,
    Color? onSecondary,
  }) {
    return DSColorScheme(
      background: background ?? this.background,
      surface: surface ?? this.surface,
      textPrimary: textPrimary ?? this.textPrimary,
      textDisabled: textDisabled ?? this.textDisabled,
      border: border ?? this.border,
      focus: focus ?? this.focus,
      primary: primary ?? this.primary,
      onPrimary: onPrimary ?? this.onPrimary,
      secondary: secondary ?? this.secondary,
      onSecondary: onSecondary ?? this.onSecondary,
    );
  }

  /// Interpolates between two Design System color schemes.
  static DSColorScheme lerp(DSColorScheme a, DSColorScheme b, double t) {
    return DSColorScheme(
      background: Color.lerp(a.background, b.background, t)!,
      surface: Color.lerp(a.surface, b.surface, t)!,
      textPrimary: Color.lerp(a.textPrimary, b.textPrimary, t)!,
      textDisabled: Color.lerp(a.textDisabled, b.textDisabled, t)!,
      border: Color.lerp(a.border, b.border, t)!,
      focus: Color.lerp(a.focus, b.focus, t)!,
      primary: Color.lerp(a.primary, b.primary, t)!,
      onPrimary: Color.lerp(a.onPrimary, b.onPrimary, t)!,
      secondary: Color.lerp(a.secondary, b.secondary, t)!,
      onSecondary: Color.lerp(a.onSecondary, b.onSecondary, t)!,
    );
  }
}
