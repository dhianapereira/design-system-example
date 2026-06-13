import 'package:flutter/material.dart';
import 'package:design_system/src/foundations/ds_typography.dart';
import 'package:design_system/src/theme/ds_color_scheme.dart';
import 'package:design_system/src/theme/ds_theme_data.dart';

/// Factory for Flutter themes configured with Design System foundations.
abstract final class DSTheme {
  /// Builds the default light theme.
  static ThemeData light() {
    return _theme(
      brightness: Brightness.light,
      colorScheme: DSColorScheme.light,
      extension: DSThemeData.light,
    );
  }

  /// Builds the default dark theme.
  static ThemeData dark() {
    return _theme(
      brightness: Brightness.dark,
      colorScheme: DSColorScheme.dark,
      extension: DSThemeData.dark,
    );
  }

  static ThemeData _theme({
    required Brightness brightness,
    required DSColorScheme colorScheme,
    required DSThemeData extension,
  }) {
    return ThemeData(
      useMaterial3: true,
      brightness: brightness,
      scaffoldBackgroundColor: colorScheme.background,
      colorScheme: ColorScheme.fromSeed(
        seedColor: colorScheme.primary,
        brightness: brightness,
      ),
      textTheme: const TextTheme(
        bodyMedium: DSTypography.bodyMedium,
        labelLarge: DSTypography.labelLarge,
      ),
      extensions: [extension],
    );
  }
}
